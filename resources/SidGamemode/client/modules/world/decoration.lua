ClientModules = ClientModules or {}
ClientModules.World = ClientModules.World or {}
ClientModules.World.Decoration = {}

ClientModules.World.Decoration.ThreadInterval = 2500
ClientModules.World.Decoration.disabledBuckets = {}
ClientModules.World.Decoration.Initialized = false
ClientModules.World.Decoration.Current = nil
ClientModules.World.Decoration.List = {}

function ClientModules.World.Decoration:Get()
	local list = {}

	for _, data in pairs(self.List) do
		if player:permissions() >= Config.Permissions.MOD or player:metadata().instance ~= 1 or data.owner == player:id() then
			table.insert(list, data)
		end
	end

	return list
end

---@return number
function ClientModules.World.Decoration:GetMaxAllowedProps()
	return Callbacks.Trigger("decoration:get_max_allowed_props") or 0
end

function ClientModules.World.Decoration:GetCurrentDecorationSize()
	return #self:Get()
end

function ClientModules.World.Decoration:GetPropId(entity)
	for _, data in pairs(self.List) do
		if data.entity == entity then
			return data.id
		end
	end

	return nil
end

function ClientModules.World.Decoration:GetPropDataFromId(id)
	return self.List[self:GetPropIndexFromId(id)]
end

function ClientModules.World.Decoration:GetPropIndexFromId(id)
	for index, data in pairs(self.List) do
		if data.id == id then
			return index
		end
	end

	return nil
end

function ClientModules.World.Decoration:CanEdit(prop)
	return Callbacks.Trigger("decoration:can_edit", prop)
end

function ClientModules.World.Decoration:AddEntityToDecoration(id, model, owner, matrix, collisions, entity)
	if self:GetPropIndexFromId(id) ~= nil then return end

	table.insert(self.List, {
		collisions = collisions,
		entity = entity or nil,
		matrix = matrix,
		model = model,
		owner = owner,
		id = id,
	})
end

function ClientModules.World.Decoration:LoadEntity(id, model, matrix, collisions)
	local index = self:GetPropIndexFromId(id)

	if index == nil then return end

	Citizen.CreateThread(function()
		local hash = GetHashKey(model)

		if IsModelAPed(hash) or IsModelAVehicle(hash) then return end

		if #GetGamePool("CObject") > 3000 then return end

		if Utils.Streaming.RequestModel(hash) == nil then
			self.List[index] = nil
			return
		end

		self.List[index].entity = CreateObject(hash, matrix.pos.x, matrix.pos.y, matrix.pos.z, false, false, false)

		SharedModules.Entities:Wait(self.List[index].entity)

		SetEntityMatrix(self.List[index].entity,
			matrix.forward.x, matrix.forward.y, matrix.forward.z,
			matrix.right.x, matrix.right.y, matrix.right.z,
			matrix.up.x, matrix.up.y, matrix.up.z,
			matrix.pos.x, matrix.pos.y, matrix.pos.z
		)

		SetEntityCollision(self.List[index].entity, collisions, collisions)
		FreezeEntityPosition(self.List[index].entity, true)
		SetModelAsNoLongerNeeded(hash)
	end)
end

function ClientModules.World.Decoration:UnloadEntity(id)
	local index = self:GetPropIndexFromId(id)

	if index == nil then return end

	if self.List[index].entity and DoesEntityExist(self.List[index].entity) then
		DeleteEntity(self.List[index].entity)
	end

	self.List[index].entity = nil
end

function ClientModules.World.Decoration:UpdateMatrix(entity)
	if (not DoesEntityExist(entity)) then
		return false
	end

	local forward, right, up, pos = GetEntityMatrix(entity)

	return self:Update(self:GetPropId(entity), "matrix", {
		forward = forward,
		right = right,
		pos = pos,
		up = up,
	})
end

function ClientModules.World.Decoration:Update(id, key, value)
	local update_result = Callbacks.Trigger("decoration:update", id, key, value)

	if update_result ~= true then
		UI:AddNotification("basic", "~r~Erreur lors de la mise à jour du prop~s~", "info", 5000)
	end

	return update_result
end

function ClientModules.World.Decoration:Delete(id)
	local delete_result = Callbacks.Trigger("decoration:delete", id)

	if delete_result ~= true then
		UI:AddNotification("basic", "~r~Erreur lors de la suppression du prop~s~", "info", 5000)
	end

	return delete_result
end

function ClientModules.World.Decoration:Create(model, position, disableGizmo)
	if self:GetCurrentDecorationSize() >= self:GetMaxAllowedProps() then
		UI:AddNotification("basic", "~r~Vous avez atteint la limite pour les props dans cette instance~s~", "info", 5000)
		return nil
	end

	if #GetGamePool("CObject") > 3000 then
		UI:AddNotification("basic", "~r~Trop de props dans la zone~s~", "info", 5000)
		return nil
	end

	local hash = Utils.Streaming.RequestModel(model)

    if hash == nil then
		UI:AddNotification("basic", ("~r~Modèle invalide %s.~s~"):format(model), "info", 3000)
        return nil
    end

	if IsModelAPed(hash) or IsModelAVehicle(hash) then
		UI:AddNotification("basic", ("~r~Modèle non autorisé %s.~s~"):format(model), "info", 3000)
        return nil
    end

	local coords = position or GetEntityCoords(PlayerPedId(), true) + GetEntityForwardVector(PlayerPedId()) * 2.0
    local prop = CreateObject(hash, coords.x, coords.y, coords.z, false, false, false)

	if not prop then
		UI:AddNotification("basic", "~r~Une erreur s'est produite (EntityCreation)", "info", 3000)
		return nil
	end

    FreezeEntityPosition(prop, true)
    PlaceObjectOnGroundProperly(prop)
    SetEntityHeading(prop, player:heading())

    local forward, right, up, pos = GetEntityMatrix(prop)

    local id = Callbacks.Trigger("decoration:create", model, {
        forward = forward,
        right = right,
        pos = pos,
        up = up,
    })

	if id == nil then
		UI:AddNotification("basic", "~r~Erreur lors de la création du prop~s~", "info", 5000)
		DeleteEntity(prop)
		return nil
	end

	self:AddEntityToDecoration(id, model, player:id(), { forward = forward, right = right, pos = pos, up = up }, true, prop)

	if disableGizmo ~= true then
		Events.Trigger("gizmo", prop)
	end

	return id
end

function ClientModules.World.Decoration:Duplicate(entity)
    local forward, right, up, pos = GetEntityMatrix(entity)
	local originalPropId = self:GetPropId(entity)

	if originalPropId == nil then return end

	local id = self:Create(self.List[self:GetPropIndexFromId(originalPropId)].model, GetEntityCoords(entity, true), true)

	if id == nil then return end

	local index = self:GetPropIndexFromId(id)

	SetEntityMatrix(self.List[index].entity,
		forward.x, forward.y, forward.z,
		right.x, right.y, right.z,
		up.x, up.y, up.z,
		pos.x, pos.y, pos.z
	)

	local update_result = self:Update(id, "matrix", {
		forward = forward,
		right = right,
		pos = pos,
		up = up,
	})

	if update_result ~= true then return end

	Events.Trigger("gizmo", self.List[index].entity)
end

function ClientModules.World.Decoration:Unload()
	for _, data in pairs(self.List) do
		if DoesEntityExist(data.entity) then
			DeleteEntity(data.entity)
		end
	end

	self.Current = nil
	self.List = {}
end

function ClientModules.World.Decoration:Load(bucket)
	self:Unload()

	if Table.has(self.disabledBuckets, player:metadata().instance or 1) then return end

	if self.Current == bucket then
		return
	end

	self.Current = bucket

	for _, v in pairs(Callbacks.Trigger("decoration:load", self.Current) or {}) do
		self:AddEntityToDecoration(v.id, v.model, v.owner, json.decode(v.matrix), v.collisions)
	end
end

function ClientModules.World.Decoration:RegisterEvents()
	Events.Register("decoration:create", function(src, id, model, matrix, owner)
		self:AddEntityToDecoration(id, model, owner, matrix, true)
	end)

	Events.Register("decoration:move", function(src, entity)
		if (not DoesEntityExist(entity)) then
			return
		end

		local forward, right, up, pos = GetEntityMatrix(entity)

		self:Update(self:GetPropId(entity), "matrix", {
			forward = forward,
			right = right,
			pos = pos,
			up = up,
		})
	end)

	Events.Register("decoration:update", function(src, id, key, value)
		local index = self:GetPropIndexFromId(id)

		if index == nil then return end

		if self.List[index] ~= nil then
			self.List[index][key] = value
		end

		if DoesEntityExist(self.List[index].entity) == false then return end

		if (key == "matrix") then
			SetEntityMatrix(self.List[index].entity,
				value.forward.x, value.forward.y, value.forward.z,
				value.right.x, value.right.y, value.right.z,
				value.up.x, value.up.y, value.up.z,
				value.pos.x, value.pos.y, value.pos.z
			)

			SetEntityCoords(self.List[index].entity, value.pos.x, value.pos.y, value.pos.z, false, false, false, false)
		elseif (key == "collisions") then
			SetEntityCollision(self.List[index].entity, value, value)
		end
	end)

	Events.Register("decoration:delete", function(src, id)
		local index = self:GetPropIndexFromId(id)

		if index == nil or self.List[index] == nil then return end

		self:UnloadEntity(id)
		self.List[index] = nil
	end)
end

function ClientModules.World.Decoration:WatchForBucketChange()
	Events.Register("bucket:changed", function (_, bucket)
		self:Load(bucket)
	end)
end

function ClientModules.World.Decoration:ProximityThread()
	Citizen.CreateThread(function()
		while true do
			for _, prop in pairs(self.List) do
				if prop.matrix and Math.Distance(player:position(), prop.matrix.pos) < 100 then
					if prop.entity == nil then
						self:LoadEntity(prop.id, prop.model, prop.matrix, prop.collisions)
					end
				else
					if prop.entity ~= nil then
						self:UnloadEntity(prop.id)
					end
				end
			end

			Citizen.Wait(self.ThreadInterval)
		end
	end)
end

function ClientModules.World.Decoration:Initialize()
	if self.Initialized == true then return end

	self:WatchForBucketChange()
	self:ProximityThread()
	self:RegisterEvents()

	self:Load(player:metadata().instance or 1)

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.World.Decoration:Initialize()
end)
