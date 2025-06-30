SharedModules = SharedModules or {}
SharedModules.Entities = {}

---@param model string Model to create
---@param coords vector3 Entity coords
---@param bucket? number Entity routing bucket (server only)
---@return number | nil ID
function SharedModules.Entities:Create(model, coords, bucket)
	if Config.EntityLockdown then
		if Config.Env == "server" then
			local entity = CreateObjectNoOffset(model, coords.x, coords.y, coords.z, true, true, false)

			if not SharedModules.Entities:Wait(entity) then
				return 0
			end

			SetEntityRoutingBucket(entity, bucket)

			if type(coords) == "vector4" then SetEntityHeading(entity, coords.w) end

			return NetworkGetNetworkIdFromEntity(entity)
		else
			return self:WaitForNetworkId(Callbacks.Trigger("entities:createObject", model, coords) or 0)
		end
	else

		if Config.Env == "client" and #GetGamePool("CObject") > 3000 then
			UI:AddNotification("basic", "~r~Trop de props dans la zone~s~", "info", 5000)
			return 0
		end

		local entity = CreateObjectNoOffset(model, coords.x, coords.y, coords.z, true, true, false)

		if Config.Env == "server" then
			if not self:Wait(entity) then
				return 0
			end

			SetEntityRoutingBucket(entity, bucket)

			if type(coords) == "vector4" then SetEntityHeading(entity, coords.w) end

			return NetworkGetNetworkIdFromEntity(entity)
		end

		return self:Wait(entity) and entity or nil
	end
end

---@param model string Ped to create
---@param coords vector3 Ped coords
---@param networked boolean Ped networked or local
---@return number | nil ID
function SharedModules.Entities:CreatePed(model, coords, networked)
	local hash = GetHashKey(model)

	if Config.EntityLockdown then
		if Config.Env == "server" then
			local entity = CreatePed(4, hash, coords.x, coords.y, coords.z, 0.0, networked, true)

			if not self:Wait(entity) then
				return 0
			end

			SetEntityRoutingBucket(entity, bucket)

			return NetworkGetNetworkIdFromEntity(entity)
		else
			return self:WaitForNetworkId(Callbacks.Trigger("entities:createPed", model, coords) or 0)
		end
	else

		if Config.Env == "client" then
			Utils.Streaming.RequestModel(hash)
		end

		local entity = CreatePed(4, hash, coords.x, coords.y, coords.z, 0.0, networked, true)

		if Config.Env == "server" then
			if not self:Wait(entity) then
				return 0
			end

			SetEntityRoutingBucket(entity, bucket)

			return NetworkGetNetworkIdFromEntity(entity)
		end

		return self:Wait(entity) and entity or nil
	end
end

---@param entity number Entity to delete
function SharedModules.Entities:Delete(entity)
    if Config.Env == "client" then
		Events.TriggerServer("entities:delete", NetworkGetNetworkIdFromEntity(entity))
    else
		DeleteEntity(NetworkGetEntityFromNetworkId(entity))
    end
end

---@param entity number Entity to wait
---@return boolean Success
function SharedModules.Entities:Wait(entity)
    local timer = GetGameTimer() + 5000
    while not DoesEntityExist(entity) and timer > GetGameTimer() do
        Citizen.Wait(0)
    end

    return DoesEntityExist(entity)
end

---@param netId number NetworkID to wait
---@return number | nil LocalID
function SharedModules.Entities:WaitForNetworkId(netId)
    local timer = GetGameTimer() + 5000
    while not NetworkDoesNetworkIdExist(netId) do
        Citizen.Wait(0)

        if GetGameTimer() > timer then
            return
        end
    end

    timer = GetGameTimer() + 5000
    while not DoesEntityExist(NetworkGetEntityFromNetworkId(netId)) do
        Citizen.Wait(0)

        if GetGameTimer() > timer then
            return
        end
    end

    return NetworkGetEntityFromNetworkId(netId)
end

---@param entity number
---@return boolean success
function SharedModules.Entities:Control(entity)
    if NetworkHasControlOfEntity(entity) then
        return true
    end

    local timer = GetGameTimer() + 5000
    while not NetworkHasControlOfEntity(entity) and timer > GetGameTimer() do
		NetworkRequestControlOfEntity(entity)
        Citizen.Wait(0)
    end

    return NetworkHasControlOfEntity(entity)
end

---@param entity number
---@param key string
---@param value any
function SharedModules.Entities:SetStatebag(entity, key, value)
    if Config.Env == "server" then
        Entity(NetworkGetEntityFromNetworkId(entity)).state:set(key, value, true)
    else
        Events.TriggerServer("onesync:updateEntity", NetworkGetNetworkIdFromEntity(entity), key, value)
    end
end

function SharedModules.Entities:AttachToEntity(ent1, ent2, bone, offset, rotation, isPed, collision)
	if Config.Env == "server" then
		Events.TriggerClient("entities:attachEntityToEntity", NetworkGetEntityOwner(NetworkGetEntityFromNetworkId(ent2)), ent1, ent2, bone, offset, rotation, isPed, collision)
	else
		Events.TriggerServer("entities:attachEntityToEntity", ent1, ent2, bone, offset, rotation, isPed, collision)
	end
end

function SharedModules.Entities:Detach(entity, dynamic, collision)
	if Config.Env == "server" then
		Events.TriggerClient("entities:detachEntity", NetworkGetEntityOwner(NetworkGetEntityFromNetworkId(entity)), entity, dynamic, collision)
	else
		Events.TriggerServer("entities:detachEntity", NetworkGetNetworkIdFromEntity(entity), dynamic, collision)

		while IsEntityAttached(entity) do
			Citizen.Wait(0)
		end
	end
end

function SharedModules.Entities:AttachToEntityClientSided(ent1, ent2, bone, offset, rotation, isPed, collision)
	if Config.Env == "server" then
		return
	else
		AttachEntityToEntity(ent1, ent2, bone or 0,
			offset.x, offset.y, offset.z,
			rotation.x, rotation.y, rotation.z,
			true, true, collision, isPed, 2, true
		)
	end
end

function SharedModules.Entities:Initialize()
	Citizen.CreateThread(function()
		while Callbacks == nil or Events == nil do
			Citizen.Wait(0)
		end

		if Config.Env == "server" then
			Events.Register("entities:attachEntityToEntity", function(source, ent1, ent2, bone, offset, rotation, isPed, collision)
				self:AttachToEntity(ent1, ent2, bone, offset, rotation, isPed, collision)
			end)

			Events.Register("entities:detachEntity", function(source, entity, dynamic, collision)
				self:Detach(entity, dynamic, collision)
			end)

			Events.Register("entities:delete", function(source, netId)
				self:Delete(netId)
			end)

			Callbacks.Register("entities:createObject", function(source, model, coords)
				return self:Create(model, coords, GetPlayerRoutingBucket(source))
			end)

			Callbacks.Register("entities:createPed", function(source, model, coords)
				return self:CreatePed(model, coords, GetPlayerRoutingBucket(source))
			end)
		else
			Events.Register("entities:attachEntityToEntity", function(source, ent1, ent2, bone, offset, rotation, isPed, collision)
				ent1 = self:WaitForNetworkId(ent1)
				ent2 = self:WaitForNetworkId(ent2)

				if not ent1 or not ent2 then return end

				if not self:Control(ent1) then return end

				AttachEntityToEntity(ent1, ent2, bone or 0,
					offset.x, offset.y, offset.z,
					rotation.x, rotation.y, rotation.z,
					true, true, collision, isPed, 2, true
				)
			end)

			Events.Register("entities:detachEntity", function(source, entity, dynamic, collision)
				entity = self:WaitForNetworkId(entity)

				if entity == nil or DoesEntityExist(entity) == nil then return end

				DetachEntity(entity, dynamic, collision)
			end)
		end
	end)
end

SharedModules.Entities:Initialize()
