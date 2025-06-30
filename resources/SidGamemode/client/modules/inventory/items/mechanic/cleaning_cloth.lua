Item.RegisterUsable("cleaning_cloth", function(item, entity)
    if not entity then
        entity = ClientModules.Vehicles:GetClosest()
    end

    if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 2.5 then
        UI:AddNotification("basic", "~r~Vous êtes trop loin du véhicule", "info", 5000)
        return false
    end

    TaskTurnPedToFaceEntity(PlayerPedId(), entity, 1000)
    Utils.RealWait(1000)

    ClientModules.Misc.Animations:Play("clean2")
	UI:Progress(30)
    Utils.RealWait(30000)
    ClientModules.Misc.Animations:Stop()
	ClientModules.Vehicles.Actions:Call("clean", entity)

	return false
end, "vehicle")

