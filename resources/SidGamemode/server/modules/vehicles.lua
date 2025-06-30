Vehicles = {
    ---@type table<string, Vehicle>
    _list = {}
}

Vehicles.RandomPlate = function()
	return ("%s%s%d%d%d%s%s%s"):format(
		string.char(math.random(65, 90)),
		string.char(math.random(65, 90)),
		math.random(0, 9),
		math.random(0, 9),
		math.random(0, 9),
		string.char(math.random(65, 90)),
		string.char(math.random(65, 90)),
		string.char(math.random(65, 90))
	)
end

Vehicles.Get = function(plate)
    if plate == nil then
        return nil
    end

    if Vehicles._list[plate] == nil then
        return DB.Vehicle.Get(plate)
    end

    return Vehicles._list[plate]
end

Vehicles.Find = function(fn)
    for _, vehicle in pairs(Vehicles._list) do
        if fn(vehicle) then
            return vehicle
        end
    end

    return nil
end

Vehicles.SaveAll = function()
	for _, vehicle in pairs(Vehicles._list) do
		DB.Vehicle.Update(vehicle)
		Citizen.Wait(0)
	end
end

Callbacks.Register("vehicle:get", function(source, plate)
    return Vehicles.Get(plate)
end)

Callbacks.Register("vehicle:all", function(source, filter)
    return DB.Vehicle.All(filter)
end)

Callbacks.Register("vehicle:new", function(source, plate, model, props, trunk_max_weight, owner, netId)
	if DB.Vehicle.Get(plate) ~= nil then return end

	repeat
		Citizen.Wait(50)
		plate = Vehicles.RandomPlate()
	until DB.Vehicle.Get(plate) == nil

    DB.Vehicle.Create(plate, model, props, trunk_max_weight, owner)
	local vehicle = DB.Vehicle.Get(plate)

	if not vehicle then return end

	SharedModules.Log:Create(source, "vehicles", "create", {
		["Modèle"] = vehicle:model(),
		["Propriétaire"] = vehicle:owner(),
		["Plaque"] = vehicle:plate(),
		["ID Coffre"] = vehicle:trunk_id(),
		["ID Boite à gants"] = vehicle:glovebox_id()
	})

	exports["AdvancedParking"]:UpdatePlate(netId, plate)

	return plate
end)

Events.Register("vehicle:delete", function(source, plate)
    local vehicle = Vehicles.Get(plate)

    if vehicle == nil then
        return
    end

	SharedModules.Log:Create(source, "vehicles", "delete", {
		["Modèle"] = vehicle:model(),
		["Propriétaire"] = vehicle:owner(),
		["Plaque"] = vehicle:plate(),
		["ID Coffre"] = vehicle:trunk_id(),
		["ID Boite à gants"] = vehicle:glovebox_id()
	})

    DB.Vehicle.Delete(vehicle)
end)

Events.Register("vehicle:update", function(source, plate, key, value)
    local vehicle = Vehicles.Get(plate)

    if vehicle == nil or key == "plate" then
        return
    end

    vehicle[key](vehicle, value)

    DB.Vehicle.Update(vehicle)
end)

Events.Register("vehicle:cover", function(source, plate, coords)
	Events.Trigger("vehicle:update", plate, "cover_coords", coords)
	Events.Trigger("vehicle:update", plate, "status", 1)

	Events.TriggerClient("vehicle:cover", -1, plate, coords)

	SharedModules.Log:Create(source, "vehicles", "cover", {
		["Coordonnées"] = coords,
		["Plaque"] = plate,
	})
end)

Events.Register("vehicle:uncover", function(source, plate)
	Events.Trigger("vehicle:update", plate, "status", 0)
	Events.TriggerClient("vehicle:uncover", -1, plate)

	SharedModules.Log:Create(source, "vehicles", "uncover", {
		["Coordonnées"] = coords,
		["Plaque"] = plate,
	})
end)

Callbacks.Register("vehicle:allCovered", function()
	return DB.Vehicle.AllCovered()
end)

Events.Register("vehicle:action", function(source, action, netId, params)
	local entity = NetworkGetEntityFromNetworkId(netId)

	if DoesEntityExist(entity) == false then return end

    Events.TriggerClient("vehicle:action", NetworkGetEntityOwner(entity) or source, netId, action, params)

	SharedModules.Log:Create(source, "vehicles", action, {
		["Plaque"] = SharedModules.Vehicles:GetRealPlate(entity),
	})
end)

Events.Register("vehicle:updatePlate", function(source, netId, plate)
	exports["AdvancedParking"]:UpdatePlate(netId, plate)
end)

Events.Register("trunk:getOut", function(source, vehicle, target)
    Events.TriggerClient("trunk:getOut", target, vehicle)
end)

AddEventHandler("AP:vehicleSpawned", function(entity)
	Citizen.Wait(500)

	local vehicle = Vehicles.Get(SharedModules.Vehicles:GetRealPlate(entity))


	if vehicle == nil then return end

	if vehicle:linked_society() ~= nil then
		SharedModules.Entities:SetStatebag(NetworkGetNetworkIdFromEntity(entity), "linked_society", vehicle:linked_society())
	end
end)

local nonLockedModels = {
	GetHashKey("inductor2"),
	GetHashKey("tribike2"),
	GetHashKey("tribike3"),
	GetHashKey("inductor"),
	GetHashKey("scorcher"),
	GetHashKey("cruiser"),
	GetHashKey("tribike"),
	GetHashKey("fixter"),
	GetHashKey("bmx"),
	-1963629913
}

local function isModelNonLockable(model)
	for k, v in pairs(nonLockedModels) do
		if v == model then return true end
	end

	return false
end

AddEventHandler("entityCreated", function(entity)
	Citizen.Wait(100)

	if not DoesEntityExist(entity) then return end
	if GetEntityType(entity) ~= 2 then return end

	if string.match(GetVehicleNumberPlateText(entity), "^%u%u%d%d%d%u%u%u$") == nil then
		if isModelNonLockable(GetEntityModel(entity)) == false then
			SetVehicleDoorsLocked(entity, 2)
		end
	end
end)
