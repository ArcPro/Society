Item.RegisterUsable("mechanic_toolbox", function(item, entity)
    if not entity then
        entity = ClientModules.Vehicles:GetClosest()
    end

    if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 4.0 then
        UI:AddNotification("basic", "~r~Vous êtes trop loin du véhicule", "info", 5000)
        return false
    end

    if player:job().name:find("mechanic_") == nil then
        UI:AddNotification("basic", "~r~Vous ne savez comment pas utiliser cet item~s~", "info", 5000)
        return false
    end

    TaskTurnPedToFaceEntity(PlayerPedId(), entity, 1000)
    Utils.RealWait(1000)

    ClientModules.Misc.Animations:Play("mechanic2")
	UI:Progress(30)
    Utils.RealWait(30000)
    ClientModules.Misc.Animations:Stop()

	ClientModules.Vehicles.Actions:Call("repair", entity, { false })
    return false
end, "vehicle")
