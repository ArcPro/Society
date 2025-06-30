Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then
        return
    end

	if player:inventory():findItem(function(item)
		return item.name == "grinder"
	end) == nil then return end

	local container = ClientModules.Illegal.Containers:GetContainerIDFromEntity(hitEntity)

    if container == nil then return end

	if GetEntityModel(hitEntity) == ClientModules.Illegal.Containers.models.container then
		Context:AddItem(0, "Forcer le conteneur", function()
			if Math.Distance(player:position(), GetEntityCoords(hitEntity, false)) > 3.5 then
				UI:AddNotification("basic", "~r~Trop loin.~s~", "info", 5000)
				return
			end

			ClientModules.Illegal.Containers:Open(container)
		end, true)
	end

	if GetEntityModel(hitEntity) == ClientModules.Illegal.Containers.models.crate then
		Context:AddItem(0, "Voir le contenu", function()
			if Math.Distance(player:position(), GetEntityCoords(hitEntity, false)) > 3.5 then
				UI:AddNotification("basic", "~r~Trop loin.~s~", "info", 5000)
				return
			end

			TaskTurnPedToFaceEntity(PlayerPedId(), hitEntity, 1000)
			Citizen.Wait(1000)
			Events.TriggerServer("me", "fouille")
			ClientModules.Misc.Animations:Play("search3")
			ClientModules.Inventory:Open(("container_%d"):format(container), "Conteneur", hitEntity)
		end, true)
	end

end)
