if Config.Framework ~= "standalone" then
    return
end

local outro = exports["SidGamemode"]

---@param source number
---@return VehicleData[] vehicles # An array of vehicles that the player owns. You can view the data in lb-phone/server/apps/framework/garage.lua
function GetPlayerVehicles(source)
    return outro:getPlayerVehicles(source)
end

---@param source number
---@param plate string
---@return table? vehicleData
function GetVehicle(source, plate)
    return outro:getVehicle(plate)
end
