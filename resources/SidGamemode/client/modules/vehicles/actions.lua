ClientModules = ClientModules or {}
ClientModules.Vehicles = ClientModules.Vehicles or {}
ClientModules.Vehicles.Actions = {}
ClientModules.Vehicles.Actions.Initialized = false
ClientModules.Vehicles.Actions.List = {}

---@param action string
---@param fn fun(entity: integer, ...: any[])
function ClientModules.Vehicles.Actions:Register(action, fn)
	self.List[action] = function(entity, ...)
		fn(entity, ...)
		Utils.RealWait(500)
		exports["AdvancedParking"]:UpdateVehicle(entity)
	end
end

function ClientModules.Vehicles.Actions:Call(action, entity, params)
	Events.TriggerServer("vehicle:action", action, NetworkGetNetworkIdFromEntity(entity), params)
end

function ClientModules.Vehicles.Actions:Initialize()
	if self.Initialized == true then return end

	Events.Register("vehicle:action", function(source, netId, action, params)
		local vehicle = NetworkGetEntityFromNetworkId(netId)

		if DoesEntityExist(vehicle) == false then return end
		if self.List[action] == nil then return end

		self.List[action](vehicle, table.unpack(params or {}))
	end)

	AddStateBagChangeHandler("anchor", "", function(bagName, key, value, _unused, replicated)
		if (bagName:find("entity") == nil or value == nil) then
			return
		end

		local networkIdString = bagName:gsub("entity:", "")
		local networkId = tonumber(networkIdString)

		if networkId == nil then return end

		local vehicle = SharedModules.Entities:WaitForNetworkId(networkId)

		if NetworkGetEntityOwner(vehicle) ~= PlayerId() then return end

		SetForcedBoatLocationWhenAnchored(vehicle, true)
		SetBoatFrozenWhenAnchored(vehicle, true)
		SetBoatAnchor(vehicle, value)
	end)

	self:Register("lock_doors", function (entity, door_status, disable_anim)
		Citizen.CreateThread(function()
			if GetVehiclePedIsIn(PlayerPedId(), false) ~= entity and disable_anim ~= true then
				SetVehicleLights(entity, 2)
				Citizen.Wait(250)

				StartVehicleHorn(entity, 50, GetHashKey("NORMAL"), false)
				SetVehicleLights(entity, 0)

				local doors = GetNumberOfVehicleDoors(entity)

				if doors > 0 then
					for i=0, doors, 1 do
						if door_status == 2 then
							PlayVehicleDoorCloseSound(entity, i - 1)
							SetVehicleDoorShut(entity, i - 1, false)
						else
							PlayVehicleDoorOpenSound(entity, i - 1)
						end
					end
				end
			end

			SetVehicleDoorsLocked(entity, door_status)
		end)
	end)

	self:Register("repair", function(entity, only_engine)
		SetVehicleEngineHealth(entity, 1000.0)

		if only_engine == true then return end

		SetVehiclePetrolTankHealth(entity, 1000.0)
		SetVehicleBodyHealth(entity, 1000.0)
		SetVehicleFixed(entity)
	end)

	self:Register("toggle_door", function(entity, door_index, status)
		if status == false then
			SetVehicleDoorShut(entity, door_index, false)
		else
			SetVehicleDoorOpen(entity, door_index, false, false)
		end
	end)

	self:Register("toggle_window", function(entity, window_index, status)
		if status == false then
			RollDownWindow(entity, window_index)
		else
			RollUpWindow(entity, window_index)
		end
	end)

	self:Register("alarm", function(entity)
		SetVehicleAlarm(entity, true)
		SetVehicleAlarmTimeLeft(entity, 30000)
	end)

	self:Register("toggle_engine", function(entity, engine_status)
		SetVehicleEngineOn(entity, engine_status, true, true)
	end)

	self:Register("refill", function(entity, level)
		ClientModules.Vehicles.Fuel:Set(entity, level == nil and 65.0 or level)
	end)

	self:Register("flip", function(entity)
		SetVehicleOnGroundProperly(entity)
	end)

	self:Register("clean", function(entity)
		SetVehicleDirtLevel(entity, 0.0)
	end)

	AddStateBagChangeHandler("indicator_left", "", function(bag, key, value, reserved, replicated)
		local networkIdString = bag:gsub("entity:", "")
		local networkId = tonumber(networkIdString)

		if networkId == nil then return end

		SetVehicleIndicatorLights(SharedModules.Entities:WaitForNetworkId(networkId), 1, value)
	end)

	AddStateBagChangeHandler("indicator_right", "", function(bag, key, value, reserved, replicated)
		local networkIdString = bag:gsub("entity:", "")
		local networkId = tonumber(networkIdString)

		if networkId == nil then return end

		SetVehicleIndicatorLights(SharedModules.Entities:WaitForNetworkId(networkId), 0, value)
	end)


	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Vehicles.Actions:Initialize()
end)
