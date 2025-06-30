if Config.Framework ~= "standalone" then
    return
end

local outro = exports["SidGamemode"]
---Check if a player has a phone with a specific number
---@param source number
---@param number string
---@return boolean
function HasPhoneItem(source, number)
    return outro:hasPhone(source, number)
end

exports("HasPhoneItem", HasPhoneItem)
