if Config.Framework ~= "standalone" then
    return
end

local outro = exports["SidGamemode"]

---Get the bank balance of a player
---@param source number
---@return integer
function GetBalance(source)
    return outro:getBalance(source)
end

---Add money to a player's bank account
---@param source number
---@param amount integer
---@return boolean success
function AddMoney(source, amount)
    return outro:addMoney(source, amount)
end

---@param identifier string
---@param amount number
---@return boolean success
function AddMoneyOffline(identifier, amount)
    if amount <= 0 then
        return false
    end

    return true
end

---Remove money from a player's bank account
---@param source number
---@param amount integer
---@return boolean success
function RemoveMoney(source, amount)
    return outro:removeMoney(source, amount)
end
