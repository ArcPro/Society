Citizen.CreateThread(function()
	Citizen.Wait(500)
	Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
		local submenuDev = Context:AddSubmenu(0, "Outils de dev")
		local coords = worldPosition
		local rotation = nil

		Context:AddItem(submenuDev, ("Pos: %.1f, %.1f, %.1f"):format(table.unpack(coords)), function()
			UI:AddNotification("basic", "Coordonnées copiées dans le presse papiers !", "info", 5000)
			UI:CopyToClipboard(("vector3(%.1f, %.1f, %.1f)"):format(table.unpack(coords)))
		end, true)

		if (DoesEntityExist(hitEntity) and (IsEntityAVehicle(hitEntity) or IsEntityAPed(hitEntity) or IsEntityAnObject(hitEntity))) then
			local hash = GetEntityModel(hitEntity)

			coords = GetEntityCoords(hitEntity, true)
			rotation = GetEntityRotation(hitEntity, 0)

			Context:AddItem(submenuDev, ("Rot: %.1f, %.1f, %.1f"):format(table.unpack(rotation)), function()
				UI:CopyToClipboard(("vector3(%.1f, %.1f, %.1f)"):format(table.unpack(rotation)))
				UI:AddNotification("basic", "Rotation copiée dans le presse papiers !", "info", 5000)
			end, true)

			Context:AddItem(submenuDev, ("Modèle: %s"):format(Lists.Objects[hash] or hash), function()
				UI:AddNotification("basic", "Modèle copié dans le presse papiers !", "info", 5000)
				UI:CopyToClipboard(Lists.Objects[hash] or hash)
			end, true)

			if NetworkGetEntityIsNetworked(hitEntity) then
				Context:AddItem(submenuDev, ("NetworkID %d"):format(NetworkGetNetworkIdFromEntity(hitEntity)), function()
					UI:AddNotification("basic", "NetworkID copié dans le presse papiers !", "info", 5000)
					UI:CopyToClipboard(tostring(NetworkGetNetworkIdFromEntity(hitEntity)))
				end, true)
			end

			Context:AddItem(submenuDev, ("EntityID %d"):format(hitEntity), function()
				UI:AddNotification("basic", "EntityID copié dans le presse papiers !", "info", 5000)
				UI:CopyToClipboard(tostring(hitEntity))
			end, true)

			if player:permissions() >= Config.Permissions.MOD then
				Context:AddItem(submenuDev, "Supprimer", function()
					DeleteEntity(hitEntity)
				end, true)
			end
		end
	end)
end)
