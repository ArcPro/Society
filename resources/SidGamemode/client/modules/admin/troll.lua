local unicornObject = nil

AddStateBagChangeHandler("blackscreen", ("player:%d"):format(GetPlayerServerId(PlayerId())), function(bag, key, value, reserved, replicated)
	if value == true then
		DoScreenFadeOut(0)
	else
		DoScreenFadeIn(0)
	end
end)

AddStateBagChangeHandler("burning", ("player:%d"):format(GetPlayerServerId(PlayerId())), function(bag, key, value, reserved, replicated)
	if value == false then return end

	Citizen.CreateThread(function()
		while LocalPlayer.state.burning == true do
			StartEntityFire(PlayerPedId())
			Citizen.Wait(500)
		end

		StopEntityFire(PlayerPedId())
	end)
end)

AddStateBagChangeHandler("unicorn", ("player:%d"):format(GetPlayerServerId(PlayerId())), function(bag, key, value, reserved, replicated)
	if value == true then
		unicornObject = SharedModules.Entities:Create('prop_cs_dildo_01', player:position())

		SharedModules.Entities:AttachToEntityClientSided(
			unicornObject,
			PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 12844),
			vector3(0.15, 0.15, 0.0), vector3(-90.0, 30.0, 0.0),
			false, false
		)
	elseif unicornObject and DoesEntityExist(unicornObject) then
		SharedModules.Entities:Delete(unicornObject)
	end
end)

Events.Register("soundboard", function (_, sound)
	UI:PlaySound(sound)
end)

Events.Register("fly", function (_, sound)
	Citizen.CreateThread(function()
		ApplyForceToEntity(PlayerPedId(), 3, 0.0, 0.0, 500.0, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
	end)
end)
