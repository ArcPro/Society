Events.Register("police:clampVehicle", function(source, plate, netId)
    local vehicle = Vehicles.Get(plate)
	local entity = NetworkGetEntityFromNetworkId(netId)
	local coords = GetEntityCoords(entity, false)

    if vehicle ~= nil then
        Events.Trigger("vehicle:update", vehicle:plate(), "status", 2)
    end

    local prop = CreateObject(GetHashKey("prop_clamp"), coords.x, coords.y, coords.z - 5, true, false, false)
    SharedModules.Entities:Wait(prop)

	local netProp = NetworkGetNetworkIdFromEntity(prop)

    Events.TriggerClient("police:placeClamp", source, netProp, netId)
    SharedModules.Entities:SetStatebag(netId, "clamp", netProp)
end)

Events.Register("police:unclampVehicle", function(source, plate, vehNetId, clampNetId)
    local vehicle = Vehicles.Get(plate)

    if vehicle ~= nil then
        Events.Trigger("vehicle:update", vehicle:plate(), "status", 0)
    end

    SharedModules.Entities:Delete(clampNetId)
    SharedModules.Entities:SetStatebag(vehNetId, "clamp", nil)
end)

Events.Register("police:putInCar", function(source, target, vehicle)
    local player = Players.Get(source)

    if player == nil then
        return
    end

    if not OnesyncPlayer(target).state.handcuffed then
        return
    end

    local vehicleEntity = NetworkGetEntityFromNetworkId(vehicle)

    if not DoesEntityExist(vehicleEntity) then return end

    TaskEnterVehicle(GetPlayerPed(target), vehicleEntity, -1, 1, 1.0, 1, 0)
end)

Callbacks.Register("police:getTrackedPlayers", function(source)
    local sourcePlayer = Players.Get(source)

    if sourcePlayer == nil then
        return
    end

    local trackedPlayers = {}

    for _, player in pairs(Players._list) do
        local inventory = Inventories.Get(player:inventory_id())

        if inventory ~= nil then
            local ankleBracelet = inventory:findItem(function(item)
                return item.name == "ankle_bracelet" and item.metadata.equipped == true
            end)

            if ankleBracelet ~= nil then
                table.insert(trackedPlayers, {
                    id = player:id(),
                    name = player:fullname(),
                    coords = GetEntityCoords(GetPlayerPed(player:source()), true)
                })
            end
        end
    end

    return trackedPlayers
end)

Callbacks.Register("police:isPlayerTracked", function(source, target)
    local player = Players.Get(source)

    if player == nil then
        return
    end

    local targetPlayer = Players.Get(target)

    if targetPlayer == nil then
        return
    end

    local inventory = Inventories.Get(targetPlayer:inventory_id())

    if inventory == nil then
        return
    end

    local ankleBracelet = inventory:findItem(function(item)
        return item.name == "ankle_bracelet" and item.metadata.equipped == true
    end)

    if ankleBracelet == nil then
        return false
    end

    return true
end)

Events.Register("police:removeAnkleBracelet", function(source, target)
    local player = Players.Get(source)

    if player == nil then
        return
    end

    local targetPlayer = Players.Get(target)

    if targetPlayer == nil then
        return
    end

    local inventory = Inventories.Get(targetPlayer:inventory_id())

    if inventory == nil then
        return
    end

    local ankleBracelet = inventory:findItem(function(item)
        return item.name == "ankle_bracelet" and item.metadata.equipped == true
    end)

    if ankleBracelet == nil then
        return
    end

    Events.TriggerClient("police:removeAnkleBracelet", target)
end)
