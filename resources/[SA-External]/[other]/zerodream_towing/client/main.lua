-- Register Events
RegisterNetEvent("zerodream_towing:SetTowVehicle")
RegisterNetEvent("zerodream_towing:FreeTowing")
RegisterNetEvent("zerodream_towing:CreateRope")
RegisterNetEvent("zerodream_towing:RemoveRope")
RegisterNetEvent("zerodream_towing:LoadRopes")
RegisterNetEvent("zerodream_towing:UpdateRopeLength")

-- Event handles
AddEventHandler("zerodream_towing:SetTowVehicle", function(vehicle) SetTowVehicle(vehicle) end)
AddEventHandler("zerodream_towing:FreeTowing", function() FreeTowing() end)
AddEventHandler("zerodream_towing:CreateRope", function(netId1, netId2) CreateRopeEvent(netId1, netId2) end)
AddEventHandler("zerodream_towing:RemoveRope", function(netId1, netId2) RemoveRopeEvent(netId1, netId2) end)
AddEventHandler("zerodream_towing:LoadRopes", function(ropeList) LoadRopesEvent(ropeList) end)
AddEventHandler("zerodream_towing:UpdateRopeLength", function(netId1, netId2, length) UpdateRopeLengthEvent(netId1, netId2, length) end)

-- Variables
_g = {
    isTowing   = false,
    length     = 0,
    ropeHandle = {},
}

-- Functions
function SetTowVehicle(vehicle)
    if not _g.isTowing and not _g.secondEntity then
        if not _g.firstEntity then
            if IsVehicleCanTowing(vehicle) then
                _g.firstEntity = NetworkGetNetworkIdFromEntity(vehicle)
				exports["SidUI"]:AddNotification('basic', "Véhicule attaché !", "info", 5000)
            else
				exports["SidUI"]:AddNotification('basic', "~r~Ce véhicule ne peut pas être attaché.~s~", "info", 5000)
            end
        elseif not _g.secondEntity then
            if IsVehicleCanBeTowing(vehicle) and vehicle ~= NetworkGetEntityFromNetworkId(_g.firstEntity) then
                local distance = #(GetEntityCoords(vehicle) - GetEntityCoords(NetworkGetEntityFromNetworkId(_g.firstEntity)))
                if distance < 20.0 then
                    local pos1   = GetWorldPositionOfEntityBone(NetworkGetEntityFromNetworkId(_g.firstEntity), bone1) - Config.towingOffset2
                    local pos2   = GetWorldPositionOfEntityBone(vehicle, bone2) - Config.towingOffset
                    _g.secondEntity = NetworkGetNetworkIdFromEntity(vehicle)
                    _g.isTowing     = true
                    _g.length       = #(pos1 - pos2)
                    TriggerServerEvent("zerodream_towing:CreateRope", _g.firstEntity, _g.secondEntity)
					exports["SidUI"]:AddNotification('basic', "Véhicule attaché !", "info", 5000)
				else
					exports["SidUI"]:AddNotification('basic', "~r~Trop loin.~s~", "info", 5000)
                end
			else
				exports["SidUI"]:AddNotification('basic', "~r~Ce véhicule ne peut pas être attaché.~s~", "info", 5000)
			end
		else
			exports["SidUI"]:AddNotification('basic', "~r~Ce véhicule ne peut pas être attaché.~s~", "info", 5000)
        end
    else
        TriggerServerEvent("zerodream_towing:RemoveRope", _g.firstEntity, _g.secondEntity)
        _g.isTowing     = false
        _g.firstEntity  = nil
        _g.secondEntity = nil
    end
end

function FreeTowing()
    if _g.isTowing then
        TriggerServerEvent("zerodream_towing:RemoveRope", _g.firstEntity, _g.secondEntity)
        _g.isTowing     = false
        _g.firstEntity  = nil
        _g.secondEntity = nil
    end
end

function FindRopeByNetworkId(netId1, netId2)
    for id, rope in pairs(_g.ropeHandle) do
        if rope.netId1 == netId1 and rope.netId2 == netId2 then
            return rope
        end
    end
    return nil
end

function AttachRope(rope, entity1, entity2)
    local bone1  = GetEntityBoneIndexByName(entity1, Config.towCarBone)
    local bone2  = GetEntityBoneIndexByName(entity2, Config.towBone)
    local pos1   = GetWorldPositionOfEntityBone(entity1, bone1) - Config.towingOffset2
    local pos2   = GetWorldPositionOfEntityBone(entity2, bone2) - Config.towingOffset
    local length = #(pos1 - pos2)
    AttachEntitiesToRope(rope, entity1, entity2, pos1.x, pos1.y, pos1.z, pos2.x, pos2.y, pos2.z, length, false, false, nil, nil)
    StopRopeUnwindingFront(rope)
    StartRopeWinding(rope)
    RopeForceLength(rope, length)
end

function CreateRope(pos)
    RopeLoadTextures()
    local rope = AddRope(pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, Config.maxRopeLength, 1, Config.maxRopeLength, 0.25, 0.0, false, true, false, 5.0, false, 0)
    table.insert(_g.ropeHandle, {
        id = rope,
        index = #_g.ropeHandle + 1,
    })
    return #_g.ropeHandle
end

function RemoveRope(id)
    if DoesRopeExist(id) then
        StopRopeUnwindingFront(id)
        StopRopeWinding(id)
        RopeConvertToSimple(id)
    end
end

function IsVehicleCanTowing(vehicle)
    if not Config.allowNpcCar then
        if not DoesEntityExist(vehicle) or not NetworkGetEntityIsNetworked(vehicle) or not IsEntityAMissionEntity(vehicle) then
            return false
        end
    end
    return GetEntityBoneIndexByName(vehicle, Config.towCarBone) ~= -1
end

function IsVehicleCanBeTowing(vehicle)
    if not Config.allowNpcCar then
        if not DoesEntityExist(vehicle) or not NetworkGetEntityIsNetworked(vehicle) or not IsEntityAMissionEntity(vehicle) then
            return false
        end
    end
    return GetEntityBoneIndexByName(vehicle, Config.towBone) ~= -1
end

function GetDesiredLength(entity1, entity2)
    local bone1  = GetEntityBoneIndexByName(entity1, Config.towCarBone)
    local bone2  = GetEntityBoneIndexByName(entity2, Config.towBone)
    local pos1   = GetWorldPositionOfEntityBone(entity1, bone1)
    local pos2   = GetWorldPositionOfEntityBone(entity2, bone2)
    local length = #(pos1 - pos2)
    return math.min(GetRopeLength(rope), length)
end

function CreateRopeEvent(netId1, netId2)
    if NetworkDoesNetworkIdExist(netId1) and NetworkDoesNetworkIdExist(netId2) then
        local entity1 = NetworkGetEntityFromNetworkId(netId1)
        local entity2 = NetworkGetEntityFromNetworkId(netId2)
        if IsVehicleCanTowing(entity1) and IsVehicleCanBeTowing(entity2) then
            local ropeIndex  = CreateRope(GetEntityCoords(entity1))
            local ropeHandle = _g.ropeHandle[ropeIndex].id
            _g.ropeHandle[ropeIndex].netId1 = netId1
            _g.ropeHandle[ropeIndex].netId2 = netId2
            AttachRope(ropeHandle, entity1, entity2)
        end
    end
end

function RemoveRopeEvent(netId1, netId2)
    local rope    = FindRopeByNetworkId(netId1, netId2)
    local entity1 = NetworkGetEntityFromNetworkId(netId1)
    local entity2 = NetworkGetEntityFromNetworkId(netId2)
    if rope then
        RemoveRope(rope.id)
        DetachRopeFromEntity(rope.id, entity1)
        DetachRopeFromEntity(rope.id, entity2)
        DeleteRope(rope.id)
        table.remove(_g.ropeHandle, rope.index)
        if _g.firstEntity == netId1 and _g.secondEntity == netId2 then
            _g.firstEntity  = nil
            _g.secondEntity = nil
            _g.isTowing     = false
        end
    end
end

function UpdateRopeLengthEvent(netId1, netId2, length)
    local rope    = FindRopeByNetworkId(netId1, netId2)
    if rope then
        rope.length = length
        RopeForceLength(rope.id, length)
    end
end

function LoadRopesEvent(ropeList)
    for k, v in pairs(ropeList) do
        if not FindRopeByNetworkId(v.netId1, v.netId2) then
            TriggerEvent("zerodream_towing:CreateRope", v.netId1, v.netId2)
        end
    end
end

-- Main Thread
Citizen.CreateThread(function()
    -- Wait for game finish loading
    while not NetworkIsPlayerActive(PlayerId()) do
        Citizen.Wait(0)
    end
    -- Wait for 5s
    Citizen.Wait(5000)
    -- Load all created ropes
    TriggerServerEvent('zerodream_towing:LoadRopes')
    -- Main thread loop
    while true do
        -- Check if is towing
        if _g.isTowing then
            -- Get entities and rope
            local firstEntity  = NetworkGetEntityFromNetworkId(_g.firstEntity)
            local secondEntity = NetworkGetEntityFromNetworkId(_g.secondEntity)
            local rope         = FindRopeByNetworkId(_g.firstEntity, _g.secondEntity)
            local distance     = #(GetEntityCoords(firstEntity) - GetEntityCoords(secondEntity))
            -- Check if entities exists and not too far
            if not DoesEntityExist(firstEntity) or not DoesEntityExist(secondEntity) or distance > Config.maxRopeLength * 2 then
                if rope then
                    _g.isTowing = false
					exports["SidUI"]:AddNotification('basic', "~r~La corde de traction s'est cassée.~s~", "info", 5000)
                    TriggerServerEvent('zerodream_towing:RemoveRope', _g.firstEntity, _g.secondEntity)
                end
            -- Check if car too fast
            elseif GetEntitySpeed(firstEntity) > Config.brokenSpeed then
                if rope then
                    _g.isTowing = false
					exports["SidUI"]:AddNotification('basic', "~r~Le véhicule va trop vite.~s~", "info", 5000)
                    TriggerServerEvent('zerodream_towing:RemoveRope', _g.firstEntity, _g.secondEntity)
                end
            else
                -- Check rope length
                if _g.length > Config.maxRopeLength then
                    _g.length = Config.maxRopeLength
                end
                SetVehicleHandbrake(secondEntity, false)
            end

            if rope then
				StopRopeUnwindingFront(rope.id)
				StartRopeWinding(rope.id)
				RopeConvertToSimple(rope.id)
			end

        end

        if _g.ropeHandle then
            for _, rope in pairs(_g.ropeHandle) do
                if DoesEntityExist(NetworkGetEntityFromNetworkId(rope.netId1)) and DoesEntityExist(NetworkGetEntityFromNetworkId(rope.netId2)) then
                    if _g.firstEntity ~= rope.netId1 and _g.secondEntity ~= rope.netId2 and rope.length then
                        StopRopeUnwindingFront(rope.id)
                        StartRopeWinding(rope.id)
                        RopeForceLength(rope.id, rope.length)
                        RopeConvertToSimple(rope.id)
                    end
                end
            end
        end
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    local lastLength = 0
    while true do
        Wait(500)
        if _g.ropeHandle then
            local newTable = {}
            for _, rope in pairs(_g.ropeHandle) do
                if DoesEntityExist(NetworkGetEntityFromNetworkId(rope.netId1)) and DoesEntityExist(NetworkGetEntityFromNetworkId(rope.netId2)) then
                    if _g.firstEntity ~= rope.netId1 and _g.secondEntity ~= rope.netId2 and rope.length then
                        RopeForceLength(rope.id, rope.length)
                    end
                    table.insert(newTable, rope)
                else
                    RemoveRope(rope.id)
                    DetachRopeFromEntity(rope.id, NetworkGetEntityFromNetworkId(rope.netId1))
                    DetachRopeFromEntity(rope.id, NetworkGetEntityFromNetworkId(rope.netId2))
                    DeleteRope(rope.id)
                end
            end
            _g.ropeHandle = newTable
        end
        -- Update rope length
        if _g.isTowing and _g.firstEntity and _g.secondEntity then
            if _g.length and _g.length ~= lastLength then
                TriggerServerEvent("zerodream_towing:UpdateRopeLength", _g.firstEntity, _g.secondEntity, _g.length)
                lastLength = _g.length
            end
        end
    end
end)
