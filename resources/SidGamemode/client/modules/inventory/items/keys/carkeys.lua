Item.RegisterUsable("carkeys", function(item, entity)
	if entity == nil then
		entity = ClientModules.Vehicles:GetByPlate(item.metadata.plate)
	end

	if entity == nil then
		UI:AddNotification("basic", "~r~Ce véhicule n'existe pas~s~", "info", 5000)
		return false
	end

    if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 50.0 then
		UI:AddNotification("basic", "~r~Vous êtes trop loin du véhicule", "info", 5000)
		return false
	end

	ClientModules.Misc.Animations:Play("keyfob")

	if (SharedModules.Vehicles:GetRealPlate(entity) == item.metadata.plate) then
		if (ClientModules.Vehicles:IsLocked(entity)) then
			ClientModules.Vehicles.Actions:Call("lock_doors", entity, { Config.VehicleDoors.OPEN })
			UI:AddNotification("basic", "Véhicule déverrouillé", "info", 5000)
		else
			ClientModules.Vehicles.Actions:Call("lock_doors", entity, { Config.VehicleDoors.CLOSED })
			UI:AddNotification("basic", "Véhicule verrouillé", "info", 5000)
		end
	else
		UI:AddNotification("basic", "~r~Ce ne sont pas les bonnes clés", "info", 5000)
	end

    return false
end)
