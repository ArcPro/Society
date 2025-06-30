---@class BankAccount
---@field private _id number | nil
---@field private _balance number
---@field private _limits { deposit: integer, transfer: integer }
---@field private _type string | nil
---@field private _created_at string | nil
---@field private _logs table
---@field private _pending_bills table
---@field private _code string | nil
BankAccount = {
    _id = nil,
    _balance = 0,
	_limits = { deposit = 0, transfer = 0 },
    _type = nil,
    _created_at = nil,
    _logs = {},
    _pending_bills = {},
    _code = nil,
}
BankAccount.__index = BankAccount

---@param data { id: number, balance: number, type: string, created_at: string, logs: table, pending_bills: table, code: string, limits: { deposit: integer, transfer: integer } }
---@return BankAccount
function BankAccount:new(data)

    local self = setmetatable({}, BankAccount)

    self:id(data.id)
    self:balance(data.balance)
    self:type(data.type)
    self:createdAt(data.created_at)
    self:logs(data.logs)
    self:pendingBills(data.pending_bills)
    self:code(data.code)
	self:limits(data.limits)

    if Config.Env == "server" then
        BankAccounts._list[self:id()] = self
    end

    return self
end

if Config.Env == "server" then
    function BankAccount:remove()
        BankAccounts._list[self:id()] = nil
    end

    function BankAccount:save()
        DB.BankAccount.Update(self)
    end
end

---@param id number | nil
---@return number
function BankAccount:id(id)
    if id ~= nil then
        self._id = id
    end

    return self._id
end

---@param balance number | nil
---@return number
function BankAccount:balance(balance)
    if balance ~= nil then
        assert(type(balance) == "number", "BankAccount:balance() must be a number")
        self._balance = balance
    end

    return self._balance
end

---@param limits { deposit: integer, transfer: integer } | nil
---@return { deposit: integer, transfer: integer }
function BankAccount:limits(limits)
    if limits ~= nil then
        self._limits = limits
    end

    return self._limits
end

---@param _type string | nil
---@return string
function BankAccount:type(_type)
    if _type ~= nil then
        assert(type(_type) == "string", "BankAccount:type() must be a string")
        self._type = _type
    end

    return self._type
end

---@param created_at string | nil
---@return string
function BankAccount:createdAt(created_at)
    if created_at ~= nil then
        assert(type(created_at) == "string", "BankAccount:createdAt() must be a string")
        self._created_at = created_at
    end

    return self._created_at
end

---@param logs table | nil
---@return table
function BankAccount:logs(logs)
    if logs ~= nil then
        assert(type(logs) == "table", "BankAccount:logs() must be a table")
        self._logs = logs
    end

    return self._logs
end

---@param pending_bills table | nil
---@return table
function BankAccount:pendingBills(pending_bills)
    if pending_bills ~= nil then
        assert(type(pending_bills) == "table", "BankAccount:pendingBills() must be a table")
        self._pending_bills = pending_bills
    end

    return self._pending_bills
end

---@param code string | nil
---@return string
function BankAccount:code(code)
    if code ~= nil then
        assert(type(code) == "string", "BankAccount:code() must be a string")
        self._code = code
    end

    return self._code
end

---@param log table
---@param addPhoneLog boolean
function BankAccount:addLog(log, addPhoneLog)

    table.insert(self:logs(), log)

	DB.BankAccount.AddLog(self:id(), log.type, log.iban, log.amount, log.date)

	if addPhoneLog ~= true then return end

    local player = Players.Find(function(player)
        return player:bank_account_id() == self:id()
    end)

    if player then
		local number = exports["lb-phone"]:GetEquippedPhoneNumber(player:source())

		if number == nil then return end

        local title = "";
        if log.type == "deposit" then
            title = "Dépôt"
        elseif log.type == "withdraw" then
            title = "Retrait"
            log.amount = -(log.amount)
        elseif log.type == "transfer" then
            title = "Transfert"
        elseif log.type == "card" then
            log.amount = -(log.amount)
            title = ("Carte (%s)"):format(log.iban)
        elseif log.type == "salary" then
            title = "Salaire"
        elseif log.type == "state_aid" then
            title = "Aide de l'état"
        elseif log.type == "bill" then
            title = ("Facture - %s"):format(log.iban)
        end

        exports["lb-phone"]:AddTransaction(number, log.amount, title, nil)
    end

end

---@param amount number
---@param phoneLog boolean
---@return boolean
function BankAccount:deposit(amount, phoneLog, reason)
    local amount = tonumber(amount)
    if amount <= 0 then
        return false
    end

    if Config.Env == "client" and Callbacks.Trigger("bank:deposit", self:id(), amount) ~= true then
        return false
    end

    if Config.Env == "server" then

		if self:type() == "personnal" and self:limits().deposit + amount > SharedModules.Variables:Get("global", "bank_deposit") then
			return false
		end

		self:limits({ deposit = self:limits().deposit + amount, transfer = self:limits().transfer })

        self:addLog({
            type = reason ~= nil and reason or "deposit",
            amount = amount,
            date = Date.timestamp(),
        }, phoneLog == nil and true or phoneLog)
    end

    self:balance(self:balance() + amount)

    return true
end

---@param amount number
---@param phoneLog? boolean
---@return boolean
function BankAccount:withdraw(amount, phoneLog, reason)

    if amount <= 0 then
        return false
    end

    if Config.Env == "client" and Callbacks.Trigger("bank:withdraw", self:id(), amount, phoneLog, reason) ~= true then
        return false
    end

    if self:balance() - amount < 0 then
        return false
    end

    self:balance(self:balance() - amount)

    if Config.Env == "server" then
        self:addLog({
            type = (reason ~= nil and reason.type ~= nil) and reason.type or "withdraw",
            amount = amount,
            iban = (reason ~= nil and reason.type ~= nil) and reason.iban or "",
            date = Date.timestamp(),
        }, phoneLog == nil and true or phoneLog)
    end

    return true
end

---@param amount number
---@param target number
---@return boolean
function BankAccount:send(amount, target, reason)
    if amount <= 0 then
        return false
    end

    if Config.Env == "server" then
        local targetAccount = BankAccounts.Get(target)

        if not targetAccount then
            return false
        end

        print(self:balance())

        if self:balance() - amount < 0 then
            return false
        end

        self:balance(self:balance() - amount)

        targetAccount:balance(targetAccount:balance() + amount)

        self:addLog({
            type = (reason ~= nil and reason.type ~= nil) and reason.type or "transfer",
            amount = -(amount),
            date = Date.timestamp(),
            iban = (reason ~= nil and reason.type ~= nil) and (reason.iban ~= nil and reason.iban or "X") .. " - (IBAN : " .. targetAccount:id().. ")" or targetAccount:id()
        }, true)

        targetAccount:addLog({
            type = "transfer",
            amount = amount,
            date = Date.timestamp(),
            iban = self:id()
        }, true)

        return true
    else
        if Callbacks.Trigger("bank:send", self:id(), amount, target, reason) ~= true then
            return false
        end

        self:balance(self:balance() - amount)
    end


    return true
end

---@param amount number
---@param name string
---@param target string
---@return boolean
function BankAccount:addBill(amount, name, target)
    if amount <= 0 then
        return false
    end

    if Config.Env == "client" then
        return Callbacks.Trigger("bank:addBill", self:id(), amount, name, target) == true
    end

    table.insert(self:pendingBills(), {
        id = math.random(10, 999999),
        amount = amount,
        name = name,
        date = Date.timestamp(),
        target = target
    })

    return true
end

---@param id number
---@return boolean
function BankAccount:removeBill(id)
    if Config.Env == "client" then
        return Callbacks.Trigger("bank:removeBill", self:id(), id) == true
    end

    for i, bill in pairs(self:pendingBills()) do
        if bill.id == id then
            table.remove(self:pendingBills(), i)
            return true
        end
    end

    return false
end
