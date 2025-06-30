ServerModules = ServerModules or {}
ServerModules.World = ServerModules.World or {}
ServerModules.World.Decoration = {}
ServerModules.World.Decoration.DisabledBuckets = {}

--- Synchronize a decoration modification for all players in bucket
---@param bucket integer
---@param sync_type "create" | "update" | "delete"
---@param id integer
---@param p1? any
---@param p2? any
function ServerModules.World.Decoration:Sync(src, bucket, sync_type, id, p1, p2)
	for _, player in pairs(Players._list) do
        if player:metadata().instance == bucket and (player:source() ~= src or sync_type ~= "create") then
			Events.TriggerClient(("decoration:%s"):format(sync_type), player:source(), id, p1, p2)
        end
    end
end

function ServerModules.World.Decoration:GetMaxAllowedProps(player)
	if Table.has(self.disabledBuckets, player:metadata().instance or 1) then
		return 0
	end

	if player:permissions() >= Config.Permissions.MOD then
		return 16384
	end

	if player:metadata().instance ~= 1 then
		return 1024
	end

	return 25
end

---Check if a player can create a prop or not
---@param src integer
---@param bucket integer
---@return boolean
function ServerModules.World.Decoration:CanCreate(src, bucket)
	local player = Players.Get(src)

	if player == nil then
		return false
	end

	return DB.Decoration.CountOwned(bucket, player:id()) < self:GetMaxAllowedProps(player)
end

---Check if a player can edit a prop
---@param src integer
---@param bucket integer
---@param id integer
---@return boolean
function ServerModules.World.Decoration:CanEdit(src, bucket, id)
	local player = Players.Get(src)

	if player == nil then
		return false
	end

	local prop = DB.Decoration.Get(id)

	local inventory = Inventories.Get(player:inventory_id())
	local has_property_keys = false

	if inventory then
		has_property_keys = inventory:findItem(function(item)
			return item.name == "house_keys" and item.metadata.instance == bucket
		end) ~= nil
	end

	if prop == nil then
		return has_property_keys == true or bucket == 1
	end

	if player:permissions() >= Config.Permissions.MOD then
		return true
	end

	if bucket ~= 1 then
		return has_property_keys == true
	end

	return prop.owner == player:id()
end

---Create a decoration
---@param src integer
---@param model string | integer
---@param matrix { forward: vector3, right: vector3, pos: vector3, up: vector3 }
---@return integer | nil
function ServerModules.World.Decoration:Create(src, model, matrix)
	local bucket = GetPlayerRoutingBucket(src)
	local sourcePlayer = Players.Get(src)

	if sourcePlayer == nil or self:CanCreate(src, bucket) ~= true then
		return nil
	end

	local id = DB.Decoration.Create(bucket, model, 1, matrix, sourcePlayer:id())

	self:Sync(src, bucket, "create", id, model, matrix)

	return id
end

---Update a decoration
---@param src integer
---@param id integer
---@param key any
---@param value any
---@return boolean
function ServerModules.World.Decoration:Update(src, id, key, value)
	local bucket = GetPlayerRoutingBucket(src)
    local prop = DB.Decoration.Get(id)

	if prop == nil or self:CanEdit(src, bucket, id) ~= true then
		return false
	end

	prop[key] = value

	if DB.Decoration.Update(prop.id, prop.bucket, prop.model, prop.collisions, prop.matrix, prop.owner) == false then
		return false
	end

	self:Sync(src, bucket, "update", id, key, value)

	return true
end

---Delete a decoration
---@param src integer
---@param id integer
---@return boolean
function ServerModules.World.Decoration:Delete(src, id)
	local bucket = GetPlayerRoutingBucket(src)

	if self:CanEdit(src, bucket, id) ~= true then
		return false
	end

	if DB.Decoration.Delete(id) == false then
		return false
	end

	for _, player in pairs(Players._list) do
        if player:metadata().instance == bucket then
            Events.TriggerClient("decoration:delete", player:source(), id)
        end
    end

	self:Sync(src, bucket, "delete", id)

	return true
end

---Load a decoration
---@param bucket integer
---@return table
function ServerModules.World.Decoration:Load(bucket)
	return DB.Decoration.AllInBucket(bucket)
end

---Register Decoration module events
function ServerModules.World.Decoration:RegisterEvents()
	Callbacks.Register("decoration:create", function(src, model, matrix)
		return self:Create(src, model, matrix)
	end)

	Callbacks.Register("decoration:load", function(_, bucket)
		return self:Load(bucket)
	end)

	Callbacks.Register("decoration:can_edit", function(src, id)
		return self:CanEdit(src, GetPlayerRoutingBucket(src), id)
	end)

	Callbacks.Register("decoration:get_max_allowed_props", function(src)
		local player = Players.Get(src)

		if player == nil then
			return 0
		end

		return self:GetMaxAllowedProps(player)
	end)

	Callbacks.Register("decoration:update", function(src, id, key, value)
		return self:Update(src, id, key, value)
	end)

	Callbacks.Register("decoration:delete", function(src, id)
		return self:Delete(src, id)
	end)
end

ServerModules.World.Decoration:RegisterEvents()
