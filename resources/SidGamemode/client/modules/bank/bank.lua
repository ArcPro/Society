---@type BankAccount | nil
local bankAccount = nil;
local creditCard = nil;
local isDoingOperation = false

Bank = {}

---@param id number
---@return BankAccount | nil
Bank.GetAccount = function (id)
    local account = Callbacks.Trigger("bank:getAccount", id)

    if not account then
        return nil
    end

    return BankAccount:new(Functions.RemoveUnderscores(account))
end

Bank.OpenUI = function(card)

    creditCard = card

    if not card then
        creditCard = player:inventory():findItem(function (item)
            return item.name == "credit_card"
        end)
    end

    if not creditCard then
        return UI:AddNotification("basic", "~r~Vous n'avez pas de carte bancaire~s~", "info", 5000)
    end

    bankAccount = Bank.GetAccount(creditCard.metadata.linkedAccount)

    if not bankAccount then
        return UI:AddNotification("basic", "~r~Ce compte n'existe pas~s~", "info", 5000)
    end

    local bills = {}
	local society = nil

    for _, bill in pairs(Functions.DeepCopy(bankAccount:pendingBills())) do
		society = ClientModules.Societies:Find(tonumber(bill.target))
        bill.target = society and society:label() or "Inconnu"
        table.insert(bills, bill)
    end

    UI:Toggle("bank", true, {
        balance = bankAccount:balance(),
        iban = bankAccount:id(),
        name = player:fullname(),
        createdAt = bankAccount:createdAt(),
        type = bankAccount:type() == "personnal" and "Personnel" or "Entreprise",
        transactions = bankAccount:logs(),
        pendingBills = bills,
    }, true, false, true)

    ToggleRadar(false)
end

UI:RegisterCallback("bank:checkCode", function(code, cb)
    if bankAccount == nil or creditCard == nil then
        return cb(false)
    end

	local updatedCreditCard = Functions.DeepCopy(creditCard)

    if bankAccount:code() ~= code then
		updatedCreditCard.metadata.failedAttempts = (updatedCreditCard.metadata.failedAttempts or 0) + 1
        cb(false)

        if updatedCreditCard.metadata.failedAttempts >= 3 then
            if player:inventory():removeItem(creditCard) then
                UI:AddNotification("basic", "L'ATM a avalé la carte", "info", 5000)
            else
                UI:AddNotification("basic", "~r~Une erreur est survenue", "info", 5000)
            end
        else
            player:inventory():updateItem(creditCard, updatedCreditCard)
        end
        UI:AddNotification("basic", "~r~Code incorrect " .. tostring(updatedCreditCard.metadata.failedAttempts or  0) .. "/3 ~s~", "info", 5000)
        UI:Toggle("bank", false, {}, false, false)
        ToggleRadar(true)
    else

        updatedCreditCard.metadata.failedAttempts = 0
        player:inventory():updateItem(creditCard, updatedCreditCard)
        cb(true)
    end
end)

UI:RegisterCallback("bank:closed", function()
    bankAccount = nil
    creditCard = nil
    TriggerScreenblurFadeOut(250.0)
    ToggleRadar(true)
end)

UI:RegisterCallback("bank:deposit", function(data, cb)

	if isDoingOperation == true then
		return UI:AddNotification("basic", "~r~Vous faites cela trop vite.~s~", "info", 5000)
	end

	isDoingOperation = true

	local function release(success)
		isDoingOperation = false
		cb(success)
	end

    if bankAccount == nil then
        return release(false)
    end

    data.amount = tonumber(data.amount)

    if data.amount == nil or data.amount <= 0 then
        return UI:AddNotification("basic", "~r~Montant invalide", "info", 5000)
    end

	local money = player:inventory():findItem(function(item)
		return item.name == "money"
	end)

	if money == nil then
        UI:AddNotification("basic", "~r~Vous ne pouvez pas constituer cette somme", "info", 5000)
        return release(false)
	end

	money.quantity = data.amount
    if player:inventory():removeItem(money) == false then
        UI:AddNotification("basic", "~r~Vous ne pouvez pas constituer cette somme", "info", 5000)
        return release(false)
    end

    if bankAccount:deposit(data.amount) == false then
        UI:AddNotification("basic", "~r~Une erreur est survenue", "info", 5000)
		player:inventory():addItem(Item.Create("money", {}, data.amount))
        return release(false)
    end

    release(true)
    ClientModules.Misc.Animations:Play("give")

    UI:SendMessage("bank:update", {
        balance = bankAccount:balance(),
        transactions = bankAccount:logs(),
    })
end)

UI:RegisterCallback("bank:withdraw", function(data, cb)
	if isDoingOperation == true then
		return UI:AddNotification("basic", "~r~Vous faites cela trop vite.~s~", "info", 5000)
	end

	isDoingOperation = true

	local function release(success)
		isDoingOperation = false
		cb(success)
	end

    if bankAccount == nil then
        return cb(false)
    end

    data.amount = tonumber(data.amount)

    if data.amount == nil or data.amount <= 0 then
        return UI:AddNotification("basic", "~r~Montant invalide", "info", 5000)
    end

    if bankAccount:withdraw(data.amount) then
		player:inventory():addItem(Item.Create("money", {}, data.amount))
        bankAccount = Bank.GetAccount(bankAccount:id())

        if not bankAccount then
            return UI:AddNotification("basic", "~r~Ce compte n'existe plus", "info", 5000)
        end

        ClientModules.Misc.Animations:Play("give")

        UI:SendMessage("bank:update", {
            balance = bankAccount:balance(),
            transactions = bankAccount:logs(),
        })

        release(true)
    else
        UI:AddNotification("basic", "~r~Il n'y a pas assez d'argent sur ce compte", "info", 5000)
        release(false)
    end
end)

UI:RegisterCallback("bank:transfer", function(data, cb)
	if isDoingOperation == true then
		return UI:AddNotification("basic", "~r~Vous faites cela trop vite.~s~", "info", 5000)
	end

	isDoingOperation = true

	local function release(success)
		isDoingOperation = false
		cb(success)
	end

    if bankAccount == nil then
        return release(false)
    end

    data.amount = tonumber(data.amount)
    data.iban = tonumber(data.iban)

    if data.iban == bankAccount:id() then
		UI:AddNotification("basic", "~r~Vous ne pouvez pas vous envoyer de l'argent à vous même", "info", 5000)
		return release(false)
    end

    if data.amount == nil or data.amount <= 0 then
        UI:AddNotification("basic", "~r~Montant invalide", "info", 5000)
		return release(false)
    end

    if data.iban == nil or data.iban < 0 then
		UI:AddNotification("basic", "~r~IBAN invalide", "info", 5000)
		return release(false)
    end

    if bankAccount:send(data.amount, data.iban) then
        bankAccount = Bank.GetAccount(bankAccount:id())
        if not bankAccount then
            return UI:AddNotification("basic", "~r~Ce compte n'existe plus", "info", 5000)
        end
        print()
        UI:SendMessage("bank:update", {
            balance = bankAccount:balance(),
            transactions = bankAccount:logs(),
        })

		release(true)
    else
        UI:AddNotification("basic", "~r~Ce compte n'existe pas", "info", 5000)
        release(false)
    end
end)

UI:RegisterCallback("bank:payBill", function(data, cb)
	if isDoingOperation == true then
		return UI:AddNotification("basic", "~r~Vous faites cela trop vite.~s~", "info", 5000)
	end

	isDoingOperation = true

	local function release(success)
		isDoingOperation = false
		cb(success)
	end

    if bankAccount == nil then
        return release(false)
    end

    local bill = nil;

    for _, v in pairs(bankAccount:pendingBills()) do
        if v.id == data then
            bill = v
            break
        end
    end

    if not bill then
        return release(false)
    end

    local society = ClientModules.Societies:Find(tonumber(bill.target))

    if bankAccount:send(bill.amount, bill.target, {type = "bill", reason = society ~= nil and ("%s"):format(society) or bill.target}) then

        if not bankAccount:removeBill(bill.id) then
            return UI:AddNotification("basic", "~r~Une erreur s'est produite 1", "info", 5000)
        end

        bankAccount = Bank.GetAccount(bankAccount:id())

        if not bankAccount then
            return UI:AddNotification("basic", "~r~Ce compte n'existe plus", "info", 5000)
        end

        UI:SendMessage("bank:update", {
            balance = bankAccount:balance(),
            transactions = bankAccount:logs(),
            pendingBills = bankAccount:pendingBills(),
        })

        UI:AddNotification("basic", "Vous avez payé la facture de ~b~" .. bill.amount .. "$~s~", "info", 5000)
        release(true)
    else
        UI:AddNotification("basic", "~r~Une erreur s'est produite 2~s~", "info", 5000)
        release(false)
    end
end)
