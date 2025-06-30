GameEvents = {
    _handlers = {}
}

GameEvents.OnPlayerDamage = function(func)
    GameEvents._handlers["OnPlayerDamage"] = func
end

GameEvents.OnEnteringVehicle = function(func)
    GameEvents._handlers["OnEnteringVehicle"] = func
end

GameEvents.OnPlayerShoot = function(func)
    GameEvents._handlers["OnPlayerShoot"] = func
end

AddEventHandler("gameEventTriggered", function (name, args)
    if name == "CEventNetworkEntityDamage" then
        if args[1] == PlayerPedId() then
            GameEvents._handlers["OnPlayerDamage"](args)
        end
    elseif name == "CEventNetworkPlayerEnteredVehicle" then
        if args[1] == PlayerId() then
            GameEvents._handlers["OnEnteringVehicle"](args)
			Events.TriggerServer("player:enteredVehicle", NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(PlayerPedId(), false)))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsPedArmed(PlayerPedId(), 4) then
            local ped = PlayerPedId()
            local _, weapon = GetCurrentPedWeapon(ped, true)

            if IsPedShooting(ped) then
                GameEvents._handlers["OnPlayerShoot"]({
                    ammoInClip = GetAmmoInPedWeapon(ped, weapon),
                    weapon = weapon,
                })
            end
        end
    end
end)
