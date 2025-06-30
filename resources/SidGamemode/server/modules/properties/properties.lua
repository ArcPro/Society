Properties = {
    _list = {},
}

Citizen.CreateThread(function()
	Citizen.Wait(1000)

	DB.Property.CleanUp()
end)

Properties.SaveAll = function()
	for _, property in pairs(Properties._list) do
		DB.Property.Update(property.id, property.type, property.name, property.owner, property.position, property.locked, property.rent_end, property.inventory_id, property.linked_society, property.linked_group)
		Citizen.Wait(0)
	end
end

Properties.Get = function(id)
    if Properties._list[id] == nil then
        Properties._list[id] = DB.Property.Get(id)

        if Properties._list[id] == nil then
            return
        end

        Properties._list[id].position = json.decode(Properties._list[id].position)
        Properties._list[id].rent_end = Properties._list[id].rent_end / 1000
    end

    return Properties._list[id]
end

Properties.Set = function(id, key, value)
    if Properties._list[id] == nil then
        return
    end

    Properties._list[id][key] = value
end

Callbacks.Register("property:all", function()
    return DB.Property.GetAll()
end)

Callbacks.Register("property:get", function(source, id)
    return Properties.Get(id)
end)

Callbacks.Register("property:create", function(source, type, name, owner, position, locked, rent_end, storage_size)
    local id = DB.Property.Create(type, name, owner, position, locked, rent_end, storage_size)

	SharedModules.Log:Create(source, "properties", "create", {
		["ID"] = id,
		["Type"] = type,
		["Nom"] = name,
		["Propriétaire"] = owner,
		["Position"] = position,
		["Date de fin"] = Date.format("%d/%m/%Y %H:%M:%S", rent_end),
		["Poids dans le coffre"] = storage_size,
	})

    Events.TriggerClient("property:create", -1, {
        id = id,
        name = name,
        type = type,
        position = position,
    })

    return id
end)

Events.Register("property:update", function(source, id, key, value)
    Properties.Set(id, key, value)

	SharedModules.Log:Create(source, "properties", "update", {
		["ID"] = id,
		["Clé mise à jour"] = key,
		["Nouvelle valeur"] = value,
	})

	if key == "position" then
		Events.TriggerClient("property:move", -1, id, value)
	end
end)

Events.Register("property:delete", function(source, id)
    DB.Property.Delete(id)

	SharedModules.Log:Create(source, "properties", "delete", {
		["ID"] = id,
	})

    Events.TriggerClient("property:delete", -1, id)
end)

Events.Register("property:enter", function (source, propertyId)
	SharedModules.Log:Create(source, "properties", "enter", {
		["ID"] = propertyId,
	})

	local vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)
	local property = Properties.Get(propertyId)
	local player = Players.Get(source)
	local vehiclePlayers = {}

	if player == nil then return end

	player:metadata().instance = propertyId
	Events.Trigger("player:update", "metadata", player:metadata(), player:source())

	while GetPlayerRoutingBucket(source) ~= propertyId do
		Citizen.Wait(0)
	end

	if DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == GetPlayerPed(source) then
		local vehiclePlayer = nil
		local ped = nil

		for i=0, 6 do
			ped = GetPedInVehicleSeat(vehicle, i)

			if DoesEntityExist(ped) and IsPedAPlayer(ped) then
				vehiclePlayer = Players.GetFromPed(ped)

				if vehiclePlayer ~= nil then
					table.insert(vehiclePlayers, vehiclePlayer)
				end
			end
		end

		for k, v in pairs (vehiclePlayers) do
			v:metadata().instance = propertyId
			Events.Trigger("player:update", "metadata", v:metadata(), v:source())

			while GetPlayerRoutingBucket(v:source()) ~= propertyId do
				Citizen.Wait(0)
			end
		end

		SetEntityRoutingBucket(vehicle, propertyId)
		SharedModules.Entities:SetStatebag(NetworkGetNetworkIdFromEntity(vehicle), "bucket", propertyId)

		for k, v in pairs (vehiclePlayers) do
			Events.TriggerClient("property:enter", v:source(), property)
		end
	end

	Events.TriggerClient("property:enter", player:source(), property)
end)

Events.Register("property:leave", function (source, propertyId)
	SharedModules.Log:Create(source, "properties", "leave", {
		["ID"] = propertyId,
	})

	local vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)
	local property = Properties.Get(propertyId)
	local player = Players.Get(source)
	local vehiclePlayers = {}

	if player == nil then return end

	player:metadata().instance = 1
	Events.Trigger("player:update", "metadata", player:metadata(), player:source())

	while GetPlayerRoutingBucket(source) ~= 1 do
		Citizen.Wait(0)
	end

	if DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == GetPlayerPed(source) then
		local vehiclePlayer = nil
		local ped = nil

		for i=0, 6 do
			ped = GetPedInVehicleSeat(vehicle, i)

			if DoesEntityExist(ped) and IsPedAPlayer(ped) then
				vehiclePlayer = Players.GetFromPed(ped)

				if vehiclePlayer ~= nil then
					table.insert(vehiclePlayers, vehiclePlayer)
				end
			end
		end

		for k, v in pairs (vehiclePlayers) do
			v:metadata().instance = 1
			Events.Trigger("player:update", "metadata", v:metadata(), v:source())

			while GetPlayerRoutingBucket(v:source()) ~= 1 do
				Citizen.Wait(0)
			end
		end

		SetEntityRoutingBucket(vehicle, 1)
		SharedModules.Entities:SetStatebag(NetworkGetNetworkIdFromEntity(vehicle), "bucket", 1)

		for k, v in pairs (vehiclePlayers) do
			Events.TriggerClient("property:leave", v:source(), property)
		end
	end

	Events.TriggerClient("property:leave", player:source(), property)
end)
