Item.RegisterUsable("bidonessence", function(item, entity)
    if not entity then
        entity = ClientModules.Vehicles:GetClosest()
    end

    if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 2.5 then
        UI:AddNotification("basic", "~r~Vous êtes trop loin du véhicule", "info", 5000)
        return false
    end

    TaskTurnPedToFaceEntity(PlayerPedId(), entity, 1000)
    Utils.RealWait(1000)

    ClientModules.Misc.Animations:Play("fuel")

	UI:Progress(15)
    Utils.RealWait(15000)

	ClientModules.Vehicles.Actions:Call("refill", entity, { ClientModules.Vehicles.Fuel:Get(entity) + 30.0 })
    ClientModules.Misc.Animations:Stop()

    return true
end, "vehicle")
