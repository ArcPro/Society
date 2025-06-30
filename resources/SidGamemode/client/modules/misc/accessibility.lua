Events.Register("tts:play", function(_, text)
	UI:TTS(text)
end)

Events.Register("whiteboard:write", function(source, text, origin)
    local target = GetPlayerFromServerId(origin)
	local targetPed = nil
    local coords = nil

	if target == -1 and origin ~= GetPlayerServerId(PlayerId()) then return end

	targetPed = GetPlayerPed(target)

	while IsEntityPlayingAnim(targetPed, "mp_character_creation@customise@male_a", "loop", 51) do
		coords = GetPedBoneCoords(targetPed, 58868, 0.1, 0.25, 0.0)
		Utils.Draw3DText(vector3(coords.x, coords.y, coords.z - 0.9), text, 0.4, 5.0, true)
		Citizen.Wait(0)
	end
end)
