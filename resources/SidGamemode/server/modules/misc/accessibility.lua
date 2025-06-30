Events.Register("tts:play", function(source, text, radioAndPhonePlayers, range)
	local player = Players.Get(source)
	local playersInRange = Players.GetInRange(source, range)
	local targets = {}

	if player == nil then return end

	local vehicle = GetVehiclePedIsIn(GetPlayerPed(player:source()), false)

	if vehicle ~= nil then
		local current_player = nil

		for i=-1, 6 do
			current_player = Players.GetFromPed(GetPedInVehicleSeat(vehicle, i))

			if current_player ~= nil then
				table.insert(targets, current_player:source())
			end
		end
	end

	for k, v in pairs(radioAndPhonePlayers.radioData or {}) do
		if v ~= nil and Table.has(targets, k) ~= true then
			table.insert(targets, k)
		end
	end

	for k, v in pairs(radioAndPhonePlayers.callData) do
		if v ~= nil and Table.has(targets, k) ~= true then
			table.insert(targets, k)
		end
	end

	for k, v in pairs(playersInRange) do
		if v ~= nil and Table.has(targets, v:source()) ~= true then
			table.insert(targets, v:source())
		end
	end

	for k, v in pairs(targets) do
		Events.TriggerClient("tts:play", v, text)
	end
end)

Events.Register("whiteboard:write", function(source, text)
	local player = Players.Get(source)

	if player == nil then return end

	Events.TriggerClient("whiteboard:write", -1, text, source)
end)
