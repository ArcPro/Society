local outro = exports["SidGamemode"]

if Config.Framework ~= "standalone" then
    return
end

---@param itemName string
---@return boolean
function HasItem(itemName)
    return outro:hasItem(itemName)
end
