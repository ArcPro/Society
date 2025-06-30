DB = DB or {}
DB.BankAccount = {}

DB.BankAccount.Get = function(id)
    if BankAccounts._list[id] then
        return BankAccounts._list[id]
    end

    local result = MySQL.single.await("SELECT * FROM `bank_accounts` WHERE `id` = ?", { id })

    if not result then
        return nil
    end

	local logs = MySQL.query.await("SELECT type, iban, amount, date FROM `bank_logs` WHERE `account` = ? ORDER BY `date` DESC LIMIT 100", { id })

	if type(logs) == "string" then
        logs = json.decode(logs)
    end

    if type(result.pending_bills) == "string" then
        result.pending_bills = json.decode(result.pending_bills)
    end

	for idx, _ in pairs(logs) do
		logs[idx].date = logs[idx].date / 1000
	end

    return BankAccount:new({
        id = result.id,
        balance = result.balance,
        type = result.type,
        created_at = Date.format("%d/%m/%Y", result.created_at / 1000),
        logs = logs,
        pending_bills = result.pending_bills,
        code = result.code
    })
end

DB.BankAccount.All = function(filter)
    return MySQL.query.await("SELECT `id`, `type` FROM `bank_accounts` WHERE `id` LIKE ? ORDER BY `id` LIMIT 100", { ("%%%s%%"):format(filter or "") })
end

DB.BankAccount.Create = function(type, code)
    return MySQL.insert.await("INSERT INTO `bank_accounts` (`type`, `code`, `pending_bills`) VALUES (?, ?, '[]')", { type, code })
end

DB.BankAccount.Update = function(bankAccount)
    return MySQL.update.await("UPDATE `bank_accounts` SET `balance` = ?, `code` = ?, `type` = ?, `pending_bills` = ? WHERE `id` = ?", {
        bankAccount:balance(),
        bankAccount:code(),
        bankAccount:type(),
        json.encode(bankAccount:pendingBills()),
        bankAccount:id()
    })
end

DB.BankAccount.AddLog = function(id, type, iban, amount, date)
    return MySQL.insert.await("INSERT INTO `bank_logs` (`account`, `type`, `iban`, `amount`, `date`) VALUES (?, ?, ?, ?, ?)", {
        id,
        type,
        iban,
        amount,
		Date.format('%Y-%m-%d %H:%M:%S', date)
    })
end

DB.BankAccount.Delete = function(bankAccount)

    local id;

    if type(bankAccount) == "number" then
        id = bankAccount
    else
        id = bankAccount:id()
    end

    return MySQL.query.await("DELETE FROM `bank_accounts` WHERE `id` = ?", { id })
end
