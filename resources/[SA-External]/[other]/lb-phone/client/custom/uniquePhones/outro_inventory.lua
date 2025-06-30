if Config.Item.Inventory ~= "outro_inventory" or not Config.Item.Unique or not Config.Item.Require or Config.Framework ~= "standalone" then
    return
end

function GetFirstNumber()
    return exports["SidGamemode"]:getFirstNumber()
end

function HasPhoneNumber(number)
    return exports["SidGamemode"]:hasPhone(number)
end

RegisterNetEvent("lb-phone:usePhoneItem", function(data)
    local number = data.metadata.number

    if number ~= currentPhone or number == nil then
        SetPhone(number, true)
    end

    ToggleOpen(not phoneOpen)
end)

RegisterNetEvent("lb-phone:itemRemoved", function()
    Wait(500)
    if currentPhone and not HasPhoneItem(currentPhone) and Config.Item.Unique then
        SetPhone()
    end
end)

local waitingAdded = false
RegisterNetEvent("lb-phone:itemAdded", function(number)
    Wait(500)
    if currentPhone or waitingAdded or number == nil then
        return
    end
    waitingAdded = true
    SetPhone(number, true)
    waitingAdded = false
end)
