Security = Security or {}
Security.Checkers = Security.Checkers or {}

Security.Checkers.SpeedModifier = function()
    local playerPed = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerPed, false)

    if playerVehicle ~= 0 and GetVehicleCheatPowerIncrease(playerVehicle) > 2 then
        return Events.TriggerServer("security:flag", "Speed Modifier", ("GetVehicleCheatPowerIncrease: %.2f"):format(GetVehicleCheatPowerIncrease(playerVehicle)))
    end
end
