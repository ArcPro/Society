AddStateBagChangeHandler("handcuffed", ("player:%d"):format(GetPlayerServerId(PlayerId())), function(bag, key, value, reserved, replicated)
	local ped = PlayerPedId()

	if LocalPlayer.state.handcuffed == value then
		return
	end

	if value then
		GiveWeaponToPed(ped, `WEAPON_UNARMED`, 0, false, true)
		SetEnableHandcuffs(ped, true)
		ClientModules.Inventory:Close()
	else
		SetEnableHandcuffs(ped, false)
		return
	end

	Citizen.CreateThread(function()
		ClientModules.Misc.Animations:Play("cuffedback")

		while LocalPlayer.state.handcuffed == true do
			Citizen.Wait(0)

			DisableControlAction(0, 140, true)
			DisableControlAction(0, 141, true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 263, true)
			DisableControlAction(0, 264, true)
			DisableControlAction(0, 24, true)
			DisableControlAction(0, 25, true)

		end

		ClientModules.Misc.Animations:Stop()
	end)
end)
