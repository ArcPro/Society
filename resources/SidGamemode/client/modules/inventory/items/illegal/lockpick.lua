Item.RegisterUsable("lockpick", function(item, entity)
    if not entity then
        entity = ClientModules.Vehicles:GetClosest()
    end

	if DoesEntityExist(GetPedInVehicleSeat(entity, -1)) then
		UI:AddNotification("basic", "~r~Le véhicule n'est pas vide.~s~", "info", 5000)
	end

    if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 2.5 then
        UI:AddNotification("basic", "~r~Vous êtes trop loin du véhicule.~s~", "info", 5000)
        return false
    end

    TaskTurnPedToFaceEntity(PlayerPedId(), entity, 1000)
    Utils.RealWait(1000)

    ClientModules.Misc.Animations:Play("picklock")

	ClientModules.Illegal.QuicktimeEvents:Lockpick(function(success)
		if success then
			UI:AddNotification("basic", "~b~Crochetage réussi !~s~", "info", 5000)
			ClientModules.Vehicles.Actions:Call("lock_doors", entity, { Config.VehicleDoors.OPEN })
			ClientModules.Vehicles:Register(entity, "Inconnu")

			SharedModules.Log:Create(player:source(), "illegal", "carjack", {
				["Plaque"] = SharedModules.Vehicles:GetRealPlate(entity),
				["Modèle"] = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(entity)))
			})
		else
			UI:AddNotification("basic", "~r~Crochetage échoué...~s~", "info", 5000)
		end
	end)

    ClientModules.Misc.Animations:Stop()
	ClientModules.Vehicles.Actions:Call("alarm", entity)
	ClientModules.Illegal:AlertPolice(("Vol de véhicule (%s %s)"):format(GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(entity))), GetVehicleNumberPlateText(entity)))

	return true
end, "vehicle")
