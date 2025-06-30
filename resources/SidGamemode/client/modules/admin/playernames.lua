local function DrawGamerTag(playerId)
	local ped = GetPlayerPed(playerId)
	local vehicle = GetVehiclePedIsIn(ped, false)
	local statebag = OnesyncPlayer(GetPlayerServerId(playerId)).state
	local name = ("[%s] %s | %s"):format(GetPlayerServerId(playerId), statebag.name, GetPlayerName(playerId))

	if not IsMpGamerTagActive(playerId) then
		CreateMpGamerTagWithCrewColor(playerId, name, false, true, "", 0, 1, 0, 0)
	elseif statebag.vanish == true then
		RemoveMpGamerTag(playerId)
	end

	if statebag.vanish == true then return end

	-- [ID] Character name | Playername 
	SetMpGamerTagColour(playerId, 0, Config.PermissionColors[statebag.permissions])
	print(Config.PermissionColors[statebag.permissions])
	SetMpGamerTagVisibility(playerId, 0, true)

	-- Microphone icon if player is talking
	SetMpGamerTagVisibility(playerId, 4, true)
	SetMpGamerTagAlpha(playerId, 4, NetworkIsPlayerTalking(playerId) and 255 or 120)

	-- Healthbar
	SetMpGamerTagVisibility(playerId, 2, true)
	SetMpGamerTagAlpha(playerId, 2, 255)

	-- Steering wheel icon if player is in car, bike icon if player is on bike
	SetMpGamerTagVisibility(playerId, 8, DoesEntityExist(vehicle) and not IsThisModelABike(GetEntityModel(vehicle)))
	SetMpGamerTagVisibility(playerId, 20, DoesEntityExist(vehicle) and IsThisModelABike(GetEntityModel(vehicle)))

	-- Typing icon if player is typing in chat
	SetMpGamerTagVisibility(playerId, 16, statebag.typingInChat)

	-- Wanted stars if player has names
	SetMpGamerTagVisibility(playerId, 5, statebag.player_names)

end

Events.Register("admin:toggleNames", function(src, toggle)
	LocalPlayer.state:set("player_names", toggle, true)

	Citizen.CreateThread(function()
		while LocalPlayer.state.player_names == true do
			for _, id in pairs(GetActivePlayers()) do
				DrawGamerTag(id)
			end

			Citizen.Wait(250)
		end

		for _, id in pairs(GetActivePlayers()) do
			RemoveMpGamerTag(id)
		end
	end)
end)
