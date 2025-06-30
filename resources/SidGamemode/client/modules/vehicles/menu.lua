local menuOpened = false

Events.Register("vehicle:toggleManagementMenu", function(source, toggle)
	menuOpened = toggle

	UI:Toggle("vehicle", menuOpened, {
		headlights = 0,
		limiter = 0,
		engine = 0,
		doors = {},
		windows = {}
	}, true, true)

	ToggleRadar(not menuOpened)

	Citizen.CreateThread(function()
		while menuOpened do
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			local doors = {}
			local windows = {}
			for i = 1, 6, 1 do
				doors[i] = GetVehicleDoorAngleRatio(vehicle, i - 1) > 0.1
			end

			for i = 0, 3, 1 do
				windows[i] = (not IsVehicleWindowIntact(vehicle, i))
			end

			if not DoesEntityExist(vehicle) or not GetIsVehicleEngineRunning(vehicle) then
				menuOpened = false

				UI:Toggle("vehicle", menuOpened, {}, false, false)

				return
			end

			UI:SendMessage("vehicle:update", {
				engine = GetIsVehicleEngineRunning(vehicle) and 1 or 0,
				limiter = (Entity(vehicle).state.limiter or 0) * 3.6,
				windows = windows,
				doors = doors,
			})

			Citizen.Wait(500)
		end
	end)

	Citizen.CreateThread(function()
		while menuOpened do
			Utils.DisableControlsForUI()
			Citizen.Wait(0)
		end
	end)
end)

UI:RegisterCallback("vehicle:update", function(data, cb)
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

	if not DoesEntityExist(vehicle) then return end

	if data.key == "engine" then
		if data.value == 1 then
			if ClientModules.Vehicles:HasKey(vehicle) == true then
				ClientModules.Vehicles.Actions:Call("toggle_engine", vehicle, { true })
			end
		else
			ClientModules.Vehicles.Actions:Call("toggle_engine", vehicle, { false })
		end
	elseif data.key == "doors" then
		if GetVehicleDoorAngleRatio(vehicle, data.value) > 0.1 then
			ClientModules.Vehicles.Actions:Call("toggle_door", vehicle, { data.value, false })
		else
			ClientModules.Vehicles.Actions:Call("toggle_door", vehicle, { data.value, true })
		end
	elseif data.key == "windows" then
		if IsVehicleWindowIntact(vehicle, data.value) then
			ClientModules.Vehicles.Actions:Call("toggle_window", vehicle, { data.value, false })
		else
			ClientModules.Vehicles.Actions:Call("toggle_window", vehicle, { data.value, true })
		end
	elseif data.key == "limiter" then
		SharedModules.Entities:SetStatebag(vehicle, "limiter", data.value / 3.6)
	end
	cb(true)
end)

UI:RegisterCallback("vehicle:closed", function(data, cb)
	Citizen.Wait(100)
	menuOpened = false
	ToggleRadar(true)
	cb(true)
end)
