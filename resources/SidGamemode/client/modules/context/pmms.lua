Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or (not IsEntityAnObject(hitEntity) and not IsEntityAVehicle(hitEntity))) then
        return
    end

    if not PMMS:IsMediaPlayableProp(hitEntity) then
        return
    end

    Context:AddItem(0, "Média", function()
		if Math.Distance(player:position(), GetEntityCoords(hitEntity, false)) > 5.0 then
			return UI:AddNotification("basic", "~r~Trop loin.~s~", "info", 5000)
		end

		if IsEntityAVehicle(hitEntity) and GetVehiclePedIsIn(PlayerPedId(), false) ~= hitEntity then
			return UI:AddNotification("basic", "~r~Vous devez être dans le véhicule.~s~", "info", 5000)
		end

        PMMS:OpenUIForEntity(hitEntity)
    end, true)
end)
