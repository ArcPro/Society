if Config.Item.Inventory ~= "outro_inventory" or not Config.Item.Unique or not Config.Item.Require or Config.Framework ~= "standalone" then
    return
end

---Function to check if a player has a phone with a specific number
---@param source any
---@param phoneNumber string
---@return boolean
function HasPhoneNumber(source, phoneNumber)
    return exports["SidGamemode"]:hasPhone(source, phoneNumber)
end

---Function to set a phone number to a player's empty phone item
---@param source number
---@param phoneNumber string
---@return boolean success
function SetPhoneNumber(source, phoneNumber)
    return exports["SidGamemode"]:setPhoneNumber(source, phoneNumber)
end

function SetItemName(source, phoneNumber, name)
    return false
end
