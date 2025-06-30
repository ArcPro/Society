
RegisterNetEvent("VT:vehicleAttached", function(vehicleNetworkId, transportNetworkId)
	local vehicle = NetworkGetEntityFromNetworkId(vehicleNetworkId)
	local transport = NetworkGetEntityFromNetworkId(transportNetworkId)
	if (not DoesEntityExist(vehicle) or not DoesEntityExist(transport)) then
		return
	end

	LogDebug("Attaching vehicle \"%s\" to transport \"%s\"", GetVehicleNumberPlateText(vehicle), GetVehicleNumberPlateText(transport))

	TriggerClientEvent("VT:vehicleAttached", -1, vehicleNetworkId, transportNetworkId)
end)

RegisterNetEvent("VT:vehicleDetached", function(vehicleNetworkId)
	local vehicle = NetworkGetEntityFromNetworkId(vehicleNetworkId)
	if (not DoesEntityExist(vehicle)) then
		return
	end

	LogDebug("Detaching vehicle \"%s\"", GetVehicleNumberPlateText(vehicle))

	TriggerClientEvent("VT:vehicleDetached", -1, vehicleNetworkId)
end)

RegisterNetEvent("VT:toggleDoorNet", function(networkId, doorIndex)
	local vehicle = NetworkGetEntityFromNetworkId(networkId)
	if (DoesEntityExist(vehicle)) then
		TriggerClientEvent("VT:toggleDoorNet", NetworkGetEntityOwner(vehicle), networkId, doorIndex)
	end
end)



-- commands for the transport creator
RegisterCommand("transport", function(src, args, raw)
	if (args[1]) then
		LogDebug("Creating new transport \"%s\"", args[1])

		TriggerClientEvent("VT:create", src, "new", args[1])
	else
		LogError("You need to give a name for the new transport!")
	end
end, true)

RegisterCommand("min", function(src, args, raw)
	LogDebug("Setting min value")

	TriggerClientEvent("VT:create", src, "min")
end, true)

RegisterCommand("max", function(src, args, raw)
	LogDebug("Setting max value")

	TriggerClientEvent("VT:create", src, "max")
end, true)

RegisterCommand("rampmodel", function(src, args, raw)
	if (args[1]) then
		LogDebug("Setting ramp model to \"%s\"", args[1])

		TriggerClientEvent("VT:create", src, "rampmodel", args[1])
	else
		LogError("You need to give a model for the ramp for the new transport!")
	end
end, true)

RegisterCommand("door", function(src, args, raw)
	if (args[1]) then
		LogDebug("Setting door index")

		TriggerClientEvent("VT:create", src, "door", args[1])
	else
		LogError("You need to give a door index as an argument!")
	end
end, true)

RegisterCommand("save", function(src, args, raw)
	LogDebug("Saving transport")

	TriggerClientEvent("VT:create", src, "save")
end, true)
