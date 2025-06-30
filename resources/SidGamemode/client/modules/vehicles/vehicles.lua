ClientModules = ClientModules or {}
ClientModules.Vehicles = ClientModules.Vehicles or {}
ClientModules.Vehicles.Initialized = false

function ClientModules.Vehicles:DoesHaveValidPlate(entity)
	if string.match(GetVehicleNumberPlateText(entity), "^%u%u%d%d%d%u%u%u$") == nil then
		if Entity(entity).state.real_plate then
			if string.match(Entity(entity).state.real_plate, "^%u%u%d%d%d%u%u%u$") == nil then
				return false
			end
		else
			return false
		end
	end

	return true
end

function ClientModules.Vehicles:Synchronize(entity)
	if self:DoesHaveValidPlate(entity) == false then return end

    Events.TriggerServer("vehicle:update", SharedModules.Vehicles:GetRealPlate(entity), "props", ClientModules.Vehicles.Properties:Get(entity))
	exports["AdvancedParking"]:UpdateVehicle(entity)
end

---@param plate string | nil
---@return Vehicle | nil
function ClientModules.Vehicles:Get(plate)
    if (plate == nil) then
        return nil
    end

    local vehicle = Callbacks.Trigger("vehicle:get", plate)
    if (vehicle == nil) then
        return nil
    end

	vehicle = Vehicle:new(Functions.RemoveUnderscores(vehicle))
	vehicle:entity(self:GetByPlate(plate))

    return vehicle
end

---@param entity integer
---@param owner? string
---@return string
function ClientModules.Vehicles:Register(entity, owner)
	return tostring(Callbacks.Trigger("vehicle:new",
		SharedModules.Vehicles:GetRealPlate(entity),
		GetEntityModel(entity),
		ClientModules.Vehicles.Properties:Get(entity),
		Config.TrunkMaxWeight[GetVehicleClass(entity)] or 50,
		owner or "Inconnu",
		NetworkGetNetworkIdFromEntity(entity)
	))
end

---@param model integer
---@param position vector3
---@param heading number
---@param props VehicleProps | nil
---@param owner string | nil
---@param plate string | nil
---@param temporary boolean | nil true means that the vehicle will not be registered at persistent
---@return number
function ClientModules.Vehicles:Create(_model, position, heading, props, owner, plate, temporary)
	local model = tonumber(_model)
	if props then
		props.bucket = player:metadata().instance
	end

	Utils.Streaming.RequestModel(model)

	local vehicle = CreateVehicle(model, position.x, position.y, position.z, heading, true, false)

    if vehicle == nil or not DoesEntityExist(vehicle) then
		UI:AddNotification("basic", "Une erreur s'est produite lors de la création du véhicule", "basic", 5000)
		return 0
	end

	if props == nil then
		props = self.Properties:Get(vehicle)
	end

	if props.fakePlate then
		SharedModules.Entities:SetStatebag(vehicle, "real_plate", plate)
	end

    SetNetworkIdExistsOnAllMachines(netId, true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetVehicleDoorsLocked(vehicle, 2)

    if plate ~= nil then
        local veh = self:Get(plate)

        if (veh and veh:status() == 2) then
            Events.TriggerServer("police:clampVehicle", plate, netId)
        end

		if (veh and veh:linked_society()) then
			SharedModules.Entities:SetStatebag(vehicle, "linked_society", veh:linked_society())
		end
    elseif temporary ~= true then
		props.plate = ClientModules.Vehicles:Register(vehicle, owner)
    end

    self.Properties:Set(vehicle, props, true)

    return vehicle
end

---@param vehicle integer
---@param definitive boolean | nil
---@return boolean
function ClientModules.Vehicles:Delete(vehicle, definitive)
    if (not DoesEntityExist(vehicle)) then
        return false
    end

    SetEntityAsMissionEntity(vehicle, false, false)
	exports["AdvancedParking"]:DeleteVehicle(vehicle, false)

    if (definitive == true) then
        Events.TriggerServer("vehicle:delete", GetVehicleNumberPlateText(vehicle))
    end

    return true
end

---@param entity integer
---@return boolean
function ClientModules.Vehicles:IsLocked(entity)
    if (not DoesEntityExist(entity)) then
        return false
    end

    return GetVehicleDoorLockStatus(entity) >= 2
end

function ClientModules.Vehicles:GetByPlate(plate)
    local vehicles = GetGamePool("CVehicle")

    for i = 1, #vehicles, 1 do
		if (SharedModules.Vehicles:GetRealPlate(vehicles[i]) == plate) then
			return vehicles[i]
		end
    end
end

function ClientModules.Vehicles:GetClosest()
    local coords = GetEntityCoords(PlayerPedId(), true)
    local vehicles = GetGamePool("CVehicle")
    local closestDistance = -1
    local closestVehicle = -1

    for i = 1, #vehicles, 1 do
        local distance = Math.Distance(coords, GetEntityCoords(vehicles[i], true))
        if (closestDistance == -1 or distance < closestDistance) then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end

    return closestVehicle
end

function ClientModules.Vehicles:HasKey(entity)
	if Entity(entity).state.linked_society and Entity(entity).state.linked_society == player:job().id then
		return true
	end

	return player:inventory():findItem(function(item)
		return item.name == "carkeys"
		and item.metadata.plate == SharedModules.Vehicles:GetRealPlate(entity)
	end) ~= nil
end

function ClientModules.Vehicles:Initialize()
	if self.Initialized == true then return end

	RegisterNetEvent("AP:vehicleSpawned")
	AddEventHandler("AP:vehicleSpawned", function(netId)
		if (not NetworkDoesEntityExistWithNetworkId(netId)) then return end

		local vehicle = NetworkGetEntityFromNetworkId(netId)
		local plate = SharedModules.Vehicles:GetRealPlate(vehicle)

		if NetworkGetEntityOwner(vehicle) ~= PlayerId() then return end

		local dbVehicle = ClientModules.Vehicles:Get(plate)

		if dbVehicle == nil or dbVehicle:status() ~= 2 then return end

		Events.TriggerServer("police:clampVehicle", plate, netId)
	end)

	self.Initialized = true
end

Core.Player:OnLoad(function ()
	ClientModules.Vehicles:Initialize()
end)
