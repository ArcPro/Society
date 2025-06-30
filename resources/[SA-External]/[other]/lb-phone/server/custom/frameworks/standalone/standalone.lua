if Config.Framework ~= "standalone" then
    return
end

local outro = exports["SidGamemode"]

function IsAdmin(source)
    return outro:isAdmin(source)
end

---@param source number
---@return string | nil
function GetIdentifier(source)
    ---@diagnostic disable-next-line: param-type-mismatch
    return outro:getIdentifier(source)
end

---@param identifier string
---@return number?
function GetSourceFromIdentifier(identifier)
    local players = GetPlayers()

    for i = 1, #players do
        if GetPlayerIdentifierByType(players[i], "license") == identifier then
            ---@diagnostic disable-next-line: return-type-mismatch
            return players[i]
        end
    end
end

---@param source number
---@param itemName string
function HasItem(source, itemName)
    return outro:hasItem(source, itemName)
end

---Get a player's character name
---@param source number
---@return string # Firstname
---@return string # Lastname
function GetCharacterName(source)
    return outro:getCharacterName(source)
end
