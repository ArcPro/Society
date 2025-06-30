BankAccounts = {}
---@type table<number, BankAccount>
BankAccounts._list = {}

---@return BankAccount | nil
BankAccounts.Get = function(id)
    if BankAccounts._list[id] == nil then
        return DB.BankAccount.Get(id)
    end
    return BankAccounts._list[id]
end

BankAccounts.SaveAll = function()
	for _, bankAccount in pairs(BankAccounts._list) do
		bankAccount:save()
		Citizen.Wait(0)
	end
end

Callbacks.Register("bank:register", function(source, code)
    local player = Players.Get(source)

    if not player then
        return Events.TriggerClient("player:notify", source, 'basic', "~r~Une erreur est survenue", "info", 3000)
    end

    if player:bank_account_id() ~= nil then
        return Events.TriggerClient("player:notify", source, 'basic', "~r~Vous avez déjà un compte bancaire", "info", 3000)
    end

    local accountId = DB.BankAccount.Create("personnal", code)

    player:bank_account_id(accountId)

	SharedModules.Log:Create(source, "bank", "account_create", {
		["IBAN"] = accountId,
		["Code"] = code,
	})

    return accountId
end)

Callbacks.Register("bank:getAccount", function(source, id)
    return BankAccounts.Get(id)
end)

Callbacks.Register("bank:all", function(source, filter)
    local player = Players.Get(source)

    if not player then
        return false
    end

    if player:permissions() < Config.Permissions.MOD then
        return false
    end

    return DB.BankAccount.All(filter)
end)

Callbacks.Register("bank:create", function(source, code)
    local player = Players.Get(source)

    if not player then
        return false
    end

    if player:permissions() < Config.Permissions.MOD then
        return false
    end

	local id = DB.BankAccount.Create("society", code)

	SharedModules.Log:Create(source, "bank", "account_create", {
		["IBAN"] = accountId,
		["Code"] = code,
		["Type"] = "Société"
	})

    return id
end)

Callbacks.Register("bank:deposit", function(source, account_id, amount)
    local account = BankAccounts.Get(account_id)
	local player = Players.Get(source)

    if not account then
        return false
    end

	if not player then
        return false
    end

	SharedModules.Log:Create(source, "bank", "deposit", {
		["IBAN"] = accountId,
		["Montant"] = amount,
	})

    if account:deposit(amount) then
		SharedModules.Log:Create(source, "bank", "deposit", {
			["IBAN"] = account_id,
			["Montant"] = amount,
		})

		return true
	else
		return false
	end
end)

Callbacks.Register("bank:withdraw", function(source, account_id, amount, phoneLog, reason)
    local account = BankAccounts.Get(account_id)

    if not account then
        return false
    end

	if account:withdraw(amount, phoneLog, reason) then
		SharedModules.Log:Create(source, "bank", "withdraw", {
			["IBAN"] = account_id,
			["Montant"] = amount,
		})
		return true
	else
		return false
	end
end)

Callbacks.Register("bank:send", function(source, account_id, amount, target, reason)
    local account = BankAccounts.Get(account_id)

    if not account then
        return false
    end

    if account:send(amount, target, reason) then
		SharedModules.Log:Create(source, "bank", "transfer", {
			["IBAN"] = account_id,
			["IBAN Cible"] = target,
			["Montant"] = amount,
		})
		return true
	else
		return false
	end
end)

Callbacks.Register("bank:addBill", function(source, account_id, amount, name, target)
    local account = BankAccounts.Get(account_id)

    if not account then
        return false
    end

	if account:addBill(amount, name, target) then
		SharedModules.Log:Create(source, "bank", "add_bill", {
			["IBAN"] = account_id,
			["IBAN Cible"] = target,
			["Montant"] = amount,
			["Motif"] = name,
		})
		return true
	else
		return false
	end
end)

Callbacks.Register("bank:removeBill", function(source, account_id, bill_id)
    local account = BankAccounts.Get(account_id)

    if not account then
        return false
    end

	if account:removeBill(bill_id) then
		SharedModules.Log:Create(source, "bank", "add_bill", {
			["IBAN"] = account_id,
			["ID Facture"] = bill_id,
		})
		return true
	else
		return false
	end
end)

Events.Register("bank:bill", function(source, target, billData)
    local player = Players.Get(source)

    if not player then
        return false
    end

    local society = DB.Society.Get(player:job().id)

    local targetPlayer = Players.Find(function(ply)
        return ply:source() == target
    end)

    if not targetPlayer then
        Events.TriggerClient("player:notify", source, 'basic', "~r~Le joueur n'est pas connecté~s~", "info", 3000)
        return false
    end

    if not society then
        Events.TriggerClient("player:notify", source, 'basic', "~r~L'entreprise n'existe pas~s~", "info", 3000)
        return false
    end

    local account = BankAccounts.Get(society:bank_account_id())

    if not account then
        Events.TriggerClient("player:notify", source, 'basic', "~r~L'entreprise n'a pas de compte en banque~s~", "info", 3000)
        return false
    end

    local targetAccount = BankAccounts.Get(targetPlayer:bank_account_id())

    if not targetAccount then
        Events.TriggerClient("player:notify", source, 'basic', "~r~Le joueur n'a pas de compte en banque~s~", "info", 3000)
        return false
    end

    Events.TriggerClient("bank:bill", targetPlayer:source(), billData, player:source())
end)

Events.Register("bill:sign_response", function(src, target, bill_data, status)
	target = Players.Get(target)

	if target == nil then return end

	local inventory = Inventories.Get(target:inventory_id())

	Events.TriggerClient("player:notify", target:source(), "basic", ("La personne %s payé~s~ sa facture"):format(status == true and "~b~a" or "~r~n'a pas"), "info", 5000)

	if inventory == nil then return end

	inventory:addItem(Item.Create("bill", bill_data, 1))
end)

Events.Register("bank:update", function(source, updatedAccount)
    local player = Players.Get(source)

    if not player then
        return false
    end

    if player:permissions() < Config.Permissions.MOD then
        return false
    end

    local account = BankAccounts.Get(updatedAccount._id)

    if not account then
        return false
    end

    account:code(updatedAccount._code)
    account:balance(updatedAccount._balance)
    account:type(updatedAccount._type)

	SharedModules.Log:Create(source, "bank", "update", {
		["IBAN"] = updatedAccount._id,
		["Code"] = updatedAccount._code,
		["Montant"] = updatedAccount._balance,
		["Type"] = updatedAccount._type
	})

    DB.BankAccount.Update(account)
end)

Events.Register("bank:delete", function(source, id)
    local player = Players.Get(source)

    if not player then
        return false
    end

    if player:permissions() < Config.Permissions.MOD then
        return false
    end

	SharedModules.Log:Create(source, "bank", "delete", {
		["IBAN"] = id,
	})

    DB.BankAccount.Delete(id)
    BankAccounts._list[id] = nil
end)
