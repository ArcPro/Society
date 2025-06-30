local models = {
	`bkr_prop_weed_plantpot_stack_01b`,
	`bkr_prop_weed_01_small_01b`,
	`bkr_prop_weed_med_01b`,
	`bkr_prop_weed_lrg_01b`
}

local function isWeedPot(model)
    for _, v in pairs(models) do
        if v == model then
            return true
        end
    end
    return false
end

Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then
        return
    end

    if not isWeedPot(GetEntityModel(hitEntity)) then
        return
    end

	local state = Entity(hitEntity).state

    if state.advancementState == nil then return end

	if state.advancementState == 0 then
		Context:AddItem(0, "Ramasser", function ()
			ClientModules.Misc.Animations:Play("pickup")
			if player:inventory():addItem(Item.Create("weed_pot", {}, 1)) then
				SharedModules.Entities:Delete(hitEntity)
			end
		end, true)

		Context:AddItem(0, "Planter les graines", function ()
			local seeds = player:inventory():findItem(function(item)
				return item.name == "weed_seeds" and item.quantity >= 1
			end)

			if Math.Distance(player:position(), GetEntityCoords(hitEntity, false)) > 2.0 then
				UI:AddNotification("basic", "~r~Trop loin.~s~", "basic", 5000)
			end

			if seeds == nil then
				UI:AddNotification("basic", "~r~Vous n'avez pas de graines~s~", "info", 5000)
				return
			end

			seeds.quantity = 1
			player:inventory():removeItem(seeds)

			ClientModules.Misc.Animations:Play("pickup")
			SharedModules.Entities:SetStatebag(hitEntity, "advancementState", 1)
		end, true)
	elseif state.advancementState == 1 then
		Context:AddItem(0, "Mettre l'engrais", function ()
			local fertilizer = player:inventory():findItem(function(item)
				return item.name == "fertilizer" and item.quantity >= 1
			end)

			if Math.Distance(player:position(), GetEntityCoords(hitEntity, false)) > 2.0 then
				UI:AddNotification("basic", "~r~Trop loin.~s~", "basic", 5000)
			end

			if fertilizer == nil then
				UI:AddNotification("basic", "~r~Vous n'avez pas d'engrais~s~", "info", 5000)
				return
			end

			fertilizer.quantity = 1
			player:inventory():removeItem(fertilizer)
			if math.random(10) == 1 then
				ClientModules.Illegal:AlertPolice("Plantation de drogue")
			end

			ClientModules.Misc.Animations:Play("pickup")
			Events.TriggerServer("weed:startGrowing", NetworkGetNetworkIdFromEntity(hitEntity))
		end, true)
	elseif (state.advancementState == 2 or state.advancementState == 3) and state.growEndDate ~= nil then
		local remaining = state.growEndDate - Date
		local minutes, seconds = math.floor(remaining / 60), remaining % 60
		Context:AddItem(0, ("Temps de pousse restant: %d:%d"):format(minutes, seconds))
	elseif state.advancementState == 4 then
		Context:AddItem(0, "Couper les têtes de weed", function()
			if Math.Distance(player:position(), GetEntityCoords(hitEntity, false)) > 2.0 then
				UI:AddNotification("basic", "~r~Trop loin.~s~", "basic", 5000)
			end

			UI:Progress(5)
			ClientModules.Misc.Animations:Play("mechanic5")
			Utils.RealWait(5000)

			Events.TriggerServer("weed:harvest", NetworkGetNetworkIdFromEntity(hitEntity))

			ClientModules.Misc.Animations:Stop()
		end, true)
	end
end)
