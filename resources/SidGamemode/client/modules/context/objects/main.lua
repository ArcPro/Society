Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity)) then
		return
	end

	if Entity(hitEntity).state.isPlacedByPlayer then
		Context:AddItem(0, "Déplacer", function()

			if Math.Distance(player:position(), GetEntityCoords(hitEntity, true)) > 1.5 then
				return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
			end

			Events.Trigger("gizmo", hitEntity)
		end, true)
	end

	if Entity(hitEntity).state.pickupItem then
		Context:AddItem(0, ("Ramasser %s x%d"):format(Item.Get(Entity(hitEntity).state.pickupItem).label, Entity(hitEntity).state.pickupQuantity or 1), function()
			if Math.Distance(player:position(), GetEntityCoords(hitEntity, true)) > (Entity(hitEntity).state.pickupDistance or 1.5) then
				return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
			end

			if Entity(hitEntity).state.jammerId then
				ClientModules.Misc.Animations:Play("pickup")

				exports.fd_radio:deleteJammer(Entity(hitEntity).state.jammerId)
				player:inventory():addItem(Item.Create("radio_jammer", {}, 1))
			else
				Events.TriggerServer("pickup:take", NetworkGetNetworkIdFromEntity(hitEntity))
			end

		end, true)
	end
end)
