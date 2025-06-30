local minimarkets = {}

local function createMinimarket(id, ped_coords, safe_coords)
	if type(ped_coords) == "string" then
		ped_coords = json.decode(ped_coords)
	end

	if type(safe_coords) == "string" then
		safe_coords = json.decode(safe_coords)
	end

	minimarkets[id] = {
		id = id,
		ped_coords = ped_coords,
		safe_coords = safe_coords,
	}
end

for k, v in pairs(DB.Minimarket.All()) do
	createMinimarket(v.id, v.ped_coords, v.safe_coords)
end

Callbacks.Register("minimarket:create", function(source, ped_coords, safe_coords)
	local sourcePlayer = Players.Get(source)

	if not sourcePlayer or sourcePlayer:permissions() < Config.Permissions.HM then return end

	local id = DB.Minimarket.Create(ped_coords, safe_coords)

	createMinimarket(id, ped_coords, safe_coords)

	Events.TriggerClient("minimarket:create", -1, id, ped_coords, safe_coords)

	return id
end)

Callbacks.Register("minimarket:all", function(source)
	return minimarkets
end)

Callbacks.Register("minimarket:get", function(source, id)
	return minimarkets[id]
end)

Events.Register("minimarket:update", function(source, id, ped_coords, safe_coords)
	local sourcePlayer = Players.Get(source)

	if not sourcePlayer or sourcePlayer:permissions() < Config.Permissions.HM then return end

	DB.Minimarket.Update(id, ped_coords, safe_coords)

	minimarkets[id] = {
		id = id,
		ped_coords = ped_coords,
		safe_coords = safe_coords,
	}

	Events.TriggerClient("minimarket:update", -1, id, ped_coords, safe_coords)
end)

Events.Register("minimarket:delete", function(source, id)
	local sourcePlayer = Players.Get(source)

	if not sourcePlayer or sourcePlayer:permissions() < Config.Permissions.HM then return end

	DB.Minimarket.Delete(id)

	minimarkets[id] = nil

	Events.TriggerClient("minimarket:delete", -1, id)
end)

Events.Register("minimarket:startRobbery", function(source, id)
	if not minimarkets[id] then return end

	minimarkets[id].isRobbed = true

	SharedModules.Log:Create(source, "illegal", "minimarket", {
		["ID"] = id,
	})

	Citizen.SetTimeout(30 * 60 * 1000, function()
		minimarkets[id].isSafeRobbed = false
		minimarkets[id].isRobbed = false
	end)

	Citizen.SetTimeout(2.5 * 60 * 1000, function()
		minimarkets[id].isSafeRobbed = true
	end)
end)

Callbacks.Register("minimarket:isRobbed", function(source, id)
	return minimarkets[id].isRobbed == true
end)

Callbacks.Register("minimarket:isSafeRobbed", function(source, id)
	return minimarkets[id].isSafeRobbed == true
end)

Events.Register("minimarket:setSafeRobbed", function(source, id)
	minimarkets[id].isSafeRobbed = true

	Citizen.SetTimeout(30 * 60 * 1000, function()
		minimarkets[id].isSafeRobbed = nil
	end)
end)
