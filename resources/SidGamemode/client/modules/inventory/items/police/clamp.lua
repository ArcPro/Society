Item.RegisterUsable("clamp", function(item, entity)
    if not entity then
        entity = ClientModules.Vehicles:GetClosest()
    end

    if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 2.5 then
        UI:AddNotification("basic", "~r~Vous êtes trop loin du véhicule", "info", 5000)
        return false
    end

    TaskTurnPedToFaceEntity(PlayerPedId(), entity, 1000)
    Utils.RealWait(1000)
    ClientModules.Misc.Animations:Play("mechanic4")
	UI:Progress(5)
    Utils.RealWait(5000)
    Events.TriggerServer("police:clampVehicle", SharedModules.Vehicles:GetRealPlate(entity), NetworkGetNetworkIdFromEntity(entity))
    ClientModules.Misc.Animations:Stop()

    return true
end, "vehicle")

Item.RegisterUsable("clamp_keys", function(item, entity)
    if not entity then
        entity = ClientModules.Vehicles:GetClosest()
    end

    if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 2.5 then
        UI:AddNotification("basic", "~r~Vous êtes trop loin du véhicule", "info", 5000)
        return false
    end

    if not Entity(entity).state.clamp then
        UI:AddNotification("basic", "~r~Le véhicule n'est pas immobilisé", "info", 5000)
        return false
    end

    TaskTurnPedToFaceEntity(PlayerPedId(), entity, 1000)
    Utils.RealWait(1000)
    ClientModules.Misc.Animations:Play("mechanic4")
	UI:Progress(5)
    Utils.RealWait(5000)

    Events.TriggerServer("police:unclampVehicle", SharedModules.Vehicles:GetRealPlate(entity), NetworkGetNetworkIdFromEntity(entity), Entity(entity).state.clamp)
    ClientModules.Misc.Animations:Stop()

	player:inventory():addItem(Item.Create("clamp", {}, 1))

    return false
end, "vehicle")
