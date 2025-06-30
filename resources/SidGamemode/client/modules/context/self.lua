local combat_disabled = false

Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or PlayerPedId() ~= hitEntity) then
		return
	end

	local combatCheckbox = Context:AddCheckboxItem(0, "Désactiver le combat", combat_disabled)

	Context:OnActivate(combatCheckbox, function()
		combat_disabled = not combat_disabled

		if combat_disabled == false then return end

		Citizen.CreateThread(function()
			while combat_disabled == true do
				DisablePlayerFiring(PlayerPedId(), true)
				Citizen.Wait(0)
			end
		end)
	end)

	Context:AddItem(0, "Débuguer le personnage", function()
		player:skin():model(player:skin():model())
		player:skin():applyTo(PlayerPedId())
		ClientModules.Misc.Animations:LoadMetadata()
	end, true)

	Context:AddItem(0, "/me (...)", function()
		local text = Utils.KeyboardInput("/me ...", 100, "")

		if (not text or text == "") then return end

		Events.TriggerServer("me", text)
	end, true)

	Context:AddItem(0, "/do (...)", function()
		local text = Utils.KeyboardInput("/do ...", 100, "")

		if (not text or text == "") then return end

		Events.TriggerServer("do", text)
	end, true)
end)
