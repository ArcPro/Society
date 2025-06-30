local playersInInventory = {}

Inventories = {}
---@type table<number | string, Inventory>
Inventories._list = {}

Inventories.Get = function(id)
    if Inventories._list[id] == nil then
        return DB.Inventory.Get(id)
    end
    return Inventories._list[id]
end

Inventories.SaveAll = function()
	for _, inventory in pairs(Inventories._list) do
		if inventory:temporary() == false then
			inventory:save()
		end

		Citizen.Wait(0)
	end
end

Callbacks.Register("inventory:get", function(source, id)
    if id == nil then
		return nil
	end

	return Inventories.Get(id)
end)

Callbacks.Register("inventory:all", function(source, filter)
    local player = Players.Get(source)

    if player == nil then
        return
    end

    if player:permissions() < Config.Permissions.MOD then
        return
    end

    return DB.Inventory.All(filter)
end)

Callbacks.Register("inventory:create", function(source, max_weight)
    local player = Players.Get(source)

    if player == nil then
        return
    end

    if player:permissions() < Config.Permissions.MOD then
        return
    end

	local id = DB.Inventory.Create(max_weight, 65)

	SharedModules.Log:Create(source, "inventories", "inventory_create", {
		["ID"] = id,
		["Poids max"] = max_weight
	})

    return id
end)

Events.Register("inventory:update", function(source, updatedInventory)
    local player = Players.Get(source)
    local inventory = Inventories.Get(updatedInventory._id)

    if player == nil then
        return
    end

    if player:permissions() < Config.Permissions.MOD then
        return
    end

    if inventory == nil then
        return
    end

    inventory:max_weight(updatedInventory._max_weight)
    inventory:content(updatedInventory._content)
	inventory:slots(updatedInventory._slots)

	SharedModules.Log:Create(source, "inventories", "inventory_update", {
		["ID"] = inventory:id(),
		["Poids max"] = inventory:max_weight(),
		["Slots"] = inventory:slots(),
	})

    return DB.Inventory.Update(inventory)
end)

Events.Register("inventory:delete", function(source, inventory)
    local player = Players.Get(source)

    if player == nil then
        return
    end

    if player:permissions() < Config.Permissions.MOD then
        return
    end

	SharedModules.Log:Create(source, "inventories", "inventory_create", {
		["ID"] = inventory,
	})

    return DB.Inventory.Delete(inventory)
end)

---@param source number
---@param id number | string
---@param type  InventoryAction
---@param item Item
---@param updatedItem? Item
---@return boolean
Callbacks.Register("inventory:action", function(source, id, type, item, updatedItem)
	local inventory = Inventories.Get(id)
	local result = false

	if inventory == nil then
		Console.Error(("Tried to perform action (%s) on invalid inventory (id: %s)"):format(type, tostring(id)))
		return false
	end

	if type == "add" then
		result = inventory:addItem(item)
	elseif type == "update" then
		result = inventory:updateItem(item, updatedItem)
	elseif type == "remove" then
		result = inventory:removeItem(item)
	else
		Console.Error(("Unsupported action '%s' for inventory %s with item %s"):format(type, tostring(id), json.encode(item)))
	end

	if result == true then
		local log = {
			["Inventaire"] = id,
			["Item"] = ("%dx %s"):format(item.quantity, item.name),
			["Métadonnées"] = json.encode(item.metadata),
		}

		if updatedItem ~= nil then
			log["Item mis à jour"] = ("%dx %s"):format(updatedItem.quantity, updatedItem.name)
			log["Métadonnées mises à jour"] = json.encode(updatedItem.metadata)
		end

		SharedModules.Log:Create(source, "inventories", ("item_%s"):format(type), log)
	end

	return result
end)

---@param source any
---@param id integer | string
---@param check "slot"
---@param p1 any
---@return boolean | string | nil
Callbacks.Register("inventory:check", function(source, id, check, p1)
	local inventory = Inventories.Get(id)

	if inventory == nil then
		Console.Error(("Tried to perform check (%s) on invalid inventory (id: %s)"):format(check, tostring(id)))
		return false
	end

	if check == "slot" then
		if type(p1) == "string" then
			return inventory:findFirstEmptySlot(p1)
		elseif type(p1) == "table" then
			return inventory:findSlotForItem(p1)
		else
			Console.Error(("Unsupported type '%s' for check %s in inventory %s (p1: %s)"):format(type(p1), check, tostring(id), json.encode(p1)))
			return nil
		end
	end

	Console.Error(("Unsupported check '%s' for inventory %s with param %s"):format(check, tostring(id), json.encode(p1)))

	return false
end)

Callbacks.Register("inventory:give", function(source, item, target)
	local players = {
		target = Players.Get(target),
		source = Players.Get(source),
	}

	local inventories = {
		origin = nil,
		target = nil,
	}

	if item.quantity == nil then
		item.quantity = 1
	end

	local itemName = ("~b~x%d %s~s~"):format(item.quantity, item.metadata.name or item.label)
	local slot = item.slot

	if players.target == nil then
		players.target = Players.GetNearest(source, 3.0)
	end

	if players.target == nil or players.source == nil then
		Events.TriggerClient("player:notify", source, "basic", "~r~Aucun joueur à proximité.~s~", "info", 5000)
		return false
	end

	if Math.Distance(players.target:position(), players.source:position()) > 3.0 then
		Events.TriggerClient("player:notify", source, "basic", "~r~Trop loin.~s~", "info", 5000)
		return
	end

	inventories.origin = Inventories.Get(players.source:inventory_id())
	inventories.target = Inventories.Get(players.target:inventory_id())

	if inventories.target == nil or inventories.origin == nil then
		Events.TriggerClient("player:notify", players.source:source(), "basic", "~r~Une erreur s'est produite. (inventory_not_found)~s~", "info", 5000)
		return false
	end

	if inventories.origin:removeItem(item) == false then
		Events.TriggerClient("player:notify", players.source:source(), "basic", "~r~Une erreur s'est produite. (origin_remove_item)~s~", "info", 5000)
		return false
	end

	item.slot = nil
	if inventories.target:addItem(item) == false then
		item.slot = slot

		Events.TriggerClient("player:notify", players.source:source(), "basic", "~r~Une erreur s'est produite. (target_add_item)~s~", "info", 5000)
		inventories.origin:addItem(item)
		return false
	end

	SharedModules.Log:Create(source, "inventories", "item_give", {
		["Cible"] = ("<@%s>"):format(players.target:identifiers().discord),
		["Inventaire source"] = inventories.target:id(),
		["Inventaire cible"] = inventories.origin:id(),
		["Item"] = ("%dx %s"):format(item.quantity, item.name),
		["Métadonnées"] = json.encode(item.metadata)
	})

	Events.TriggerClient("me", -1, "donne quelque chose", players.source:source())

	Events.TriggerClient("animations:play", players.source:source(), "give")
	Events.TriggerClient("animations:play", players.target:source(), "give2")

	Events.TriggerClient("player:notify", players.source:source(), "basic", ("Vous avez donné %s"):format(itemName), "info", 5000)
	Events.TriggerClient("player:notify", players.target:source(), "basic", ("Vous avez reçu %s"):format(itemName), "info", 5000)

	return true
end)

Events.Register("inventory:createTemporary", function(source, id, max_weight, isBin, slots)

    if Inventories._list[id] ~= nil then
        return
    end

    local content = {}

    if isBin then
        local usedSlots = {}
		local random = math.random(6, 17)
		local binItems = {
            water = { min = 1, max = 1, chance = 5 },
            sandwich = { min = 1, max = 1, chance = 5 },
            tesson = { min = 1, max = 1, chance = 0.25 },
            cardboard = { min = 1, max = 6, chance = 60 },
            empty_can = { min = 2, max = 5, chance = 60 },
            empty_packaging = { min = 1, max = 3, chance = 60 },
        }

        for i = 1, random do
            local item = nil

            for k, v in pairs(binItems) do
                if math.random(1, 100) <= v.chance then
                    item = k
                    break
                end
            end

            if item ~= nil then
				local slot = math.random(1, slots)
				while usedSlots[slot] do
					slot = math.random(1, slots)
				end
				usedSlots[slot] = true
                table.insert(content, Item.Create(
                    item,
                    {},
                    math.random(binItems[item].min, binItems[item].max),
                    tostring(slot)
                ))
            end
        end
    end

    Inventory:new({
        max_weight = max_weight,
        content = content,
        temporary = true,
		slots = slots,
        id = id,
    })
end)

Events.Register("inventory:setInInventory", function(source, id)
    local inventory = Inventories.Get(id)

	if inventory == nil then return end

	inventory:setPlayerIn(source)
end)

Events.Register("inventory:removeFromInventory", function(source, id)
    local inventory = Inventories.Get(id)

	if inventory == nil then return end

	inventory:removePlayerIn(source)
end)
