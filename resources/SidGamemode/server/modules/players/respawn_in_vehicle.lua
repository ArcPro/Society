local lastVehicleBeforeDrop = {}

Events.Register("player:enteredVehicle", function(source, netVehicle)
	local player = Players.Get(source)

	if not player then return end

    lastVehicleBeforeDrop[player:id()] = NetworkGetEntityFromNetworkId(netVehicle)
end)

Events.Register("player:leftVehicle", function(source)
	local player = Players.Get(source)

	if not player then return end

    lastVehicleBeforeDrop[player:id()] = nil
end)

Callbacks.Register("player:getLastVehicle", function(source)
	local player = Players.Get(source)

	if not player then return end

	if lastVehicleBeforeDrop[player:id()] == nil or DoesEntityExist(lastVehicleBeforeDrop[player:id()]) == false then
		return nil
	end

	return {
		netId = NetworkGetNetworkIdFromEntity(lastVehicleBeforeDrop[player:id()]),
		coords = GetEntityCoords(lastVehicleBeforeDrop[player:id()], false),
	}
end)
