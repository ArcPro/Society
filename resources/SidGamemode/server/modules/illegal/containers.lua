local containers = {}

local function createContainer(id, coords, rotation, reward)
	if type(coords) == "string" then
		coords = json.decode(coords)
	end

	if type(rotation) == "string" then
		rotation = json.decode(rotation)
	end

	if type(reward) == "string" then
		reward = json.decode(reward)
	end

	containers[id] = {
		rotation = rotation,
		coords = coords,
		reward = reward,
		open = false,
		id = id,
	}
end

local function fillContainerInventory(rewards)
	local content = {}

	for k, reward in pairs(rewards) do
		if math.random() < (reward.chance / 100) then
			table.insert(content, Item.Create(
				reward.item,
				{},
				math.random(reward.min, reward.max),
				tostring(k)
			))
		end
	end

	return content
end

for k, container in pairs(DB.Container.All()) do
	createContainer(container.id, container.coords, container.rotation, container.reward)
end

Callbacks.Register("container:create", function(source, coords, rotation, reward)
	local sourcePlayer = Players.Get(source)

	if not sourcePlayer or sourcePlayer:permissions() < Config.Permissions.HM then return end

	local id = DB.Container.Create(coords, rotation, reward)

	createContainer(id, coords, rotation, reward)

	Events.TriggerClient("container:create", -1, id, coords, rotation)

	return id
end)

Callbacks.Register("container:all", function(source)
	return containers
end)

Callbacks.Register("container:get", function(source, id)
	return containers[id]
end)

Callbacks.Register("container:tryToOpen", function(source, id)
	if containers[id] == nil or containers[id].open == true then
		return false
	end

	containers[id].open = true

	local inventory = Inventories.Get(("container_%d"):format(id))

	if inventory == nil then
		inventory = Inventory:new({
			id = ("container_%d"):format(id),
			max_weight = 5000,
			temporary = true,
			content = {},
			slots = 65,
		})
	end

	inventory:content(fillContainerInventory(containers[id].reward))

	SharedModules.Log:Create(source, "illegal", "container", {
		["ID"] = id,
		["Contenu"] = inventory:content()
	})

	Citizen.SetTimeout(30 * 60 * 1000, function()
		Events.TriggerClient("container:close", -1, id)
		containers[id].open = false
	end)

	return true
end)

Events.Register("container:update", function(source, id, coords, rotation, reward)
	local sourcePlayer = Players.Get(source)

	if not sourcePlayer or sourcePlayer:permissions() < Config.Permissions.HM then return end

	DB.Container.Update(id, coords, rotation, reward)

	containers[id] = {
		rotation = rotation,
		coords = coords,
		reward = reward,
		open = false,
		id = id,
	}

	Events.TriggerClient("container:update", -1, id, coords, rotation)
end)

Events.Register("container:delete", function(source, id)
	local sourcePlayer = Players.Get(source)

	if not sourcePlayer or sourcePlayer:permissions() < Config.Permissions.HM then return end

	DB.Container.Delete(id)

	containers[id] = nil

	Events.TriggerClient("container:delete", -1, id)
end)

Events.Register("container:opened", function(source, id)
	if containers[id] == nil then return end

	Events.TriggerClient("container:opened", -1, id)
end)
