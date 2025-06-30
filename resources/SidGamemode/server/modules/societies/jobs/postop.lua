Callbacks.Register("postop:createOrder", function(source, data)
    local player = Players.Get(source)
    if player == nil then return end

    local totalPrice = 0
    local postop = DB.Society.Get('postop')
    local sender = DB.Society.Get(player:job().id or 1)

    if postop == nil or sender == nil then
        return nil
    end

    local postopBankAccount = BankAccounts.Get(postop:bank_account_id())
    local senderBankAccount = BankAccounts.Get(sender:bank_account_id())

    if postopBankAccount == nil or senderBankAccount == nil then
        return nil
    end

    for name, quantity in pairs(data) do
        totalPrice = totalPrice + SharedModules.Variables:Get("items", name) * quantity
    end

    if senderBankAccount:send(totalPrice, postopBankAccount:id(), {type = "order", iban = "Commande PostOP"}) == false then
        return nil
    end

    postopBankAccount:withdraw(totalPrice * 0.75)

    return DB.PostOPOrder.Create(sender:id(), data)
end)

Callbacks.Register("postop:allOrders", function(source)
    local player = Players.Get(source)

    if player == nil or player:job().name ~= 'postop' then return end

    return DB.PostOPOrder.All()
end)

Callbacks.Register("postop:getOrder", function(source, id)
    local player = Players.Get(source)

    if id == nil or player == nil or player:job().name ~= 'postop' then return end

    local order = DB.PostOPOrder.Get(id)

    if order == nil then
        return nil
    end

    order.created_at = Date.format('%d/%m/%Y %H:%M:%S', order.created_at / 1000)
    order.content = json.decode(order.content)

    return order
end)

Events.Register("postop:deleteOrder", function(source, id)
    local player = Players.Get(source)

    if id == nil or player == nil or player:job().name ~= 'postop' then return end

    DB.PostOPOrder.Delete(id)
end)
