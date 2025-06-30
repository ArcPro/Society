-- Check @shared/classes/Inventory.lua for class definition

local allowed_items = {
	wallet = { "grey_card", "id_card", "driver_license", "credit_card", "money" },
	document_holder = { "document", "visit_card", "bill" },
	keyring = { "carkeys", "empty_carkeys", "house_keys" },
}

function Inventory:remove()
	Inventories._list[self:id()] = nil
end

function Inventory:save()
	DB.Inventory.Update(self)
end

---@param playerSrc integer
function Inventory:setPlayerIn(playerSrc)
	if Table.has(self._players_in, playerSrc) == false then
		table.insert(self._players_in, playerSrc)
	end
end

---@param playerSrc integer
function Inventory:removePlayerIn(playerSrc)
	for pos, src in pairs(self._players_in) do
		if src == playerSrc then
			table.remove(self._players_in, pos)
			break
		end
	end
end

---@param players_in table | nil
function Inventory:playersIn(players_in)
	if players_in ~= nil then
		self._players_in = players_in
	end

	return self._players_in
end

---@param item Item
---@param action "update" | "remove"
---@param slot string
function Inventory:synchronize(item, action, slot)

	local function sync(src)
		Events.TriggerClient("inventory:synchronize", src, self:id(), action, slot, item)
	end

	local inventoryOwner = Players.Find(function(player)
		return player:inventory_id() == self:id()
	end)

	if inventoryOwner ~= nil and Table.has(self:playersIn(), inventoryOwner:source()) == false then
		sync(inventoryOwner:source())
	end

	for _, src in pairs(self:playersIn()) do
		sync(src)
	end
end

---@param category string | nil
---@return string | nil
function Inventory:findFirstEmptySlot(category)

    if category == nil then
        category = "other"
    end

    for i = 0, self:slots() - 1 do
        if self:findItem(function(item)
            return item.slot == tostring(i) and item.metadata.category == category
        end) == nil then
            return tostring(i)
        end
    end

    return nil
end

---@param item table
---@return string | nil
function Inventory:findSlotForItem(item)
    local existingItem = self:findItem(function(_item)
        return _item.name == item.name and Table.compareMetadatas(_item.metadata, item.metadata) and tonumber(_item.slot) ~= nil
    end)

    if existingItem ~= nil then
        return existingItem.slot
    end

    return self:findFirstEmptySlot(item.metadata.category)
end

---@param item Item | nil Item to add
---@return boolean Success
function Inventory:addItem(item)
	if item == nil or item.quantity == nil or item.quantity <= 0 then
        return false
    end

    if allowed_items[self:category()] ~= nil and Table.has(allowed_items[self:category()], item.name) ~= true then
        return false
    end

    if self:weight() + (item.weight * item.quantity) > self:max_weight() then
        return false
    end

    -- If the item has no slot and there is no free slot, return false
    -- If the item has a slot, it will be checked later for stackable items on the same slot
    -- If there aren't stackable, items will be switched
	if self:freeSlots(item.metadata.category) <= 0 and item.slot == nil then
		return false
	end

    -- Check if it is a document holder, if it is, only documents can be added

    if item.slot == nil then
		local slot = self:findSlotForItem(item)

		if slot == nil then
			return false
		end

		item.slot = slot
	end

	local itemOnSlot = self:findItem(function(i)
		return i.metadata.category == item.metadata.category and item.slot == i.slot
	end)

	if itemOnSlot then
		if itemOnSlot.name ~= item.name or Table.compareMetadatas(itemOnSlot.metadata, item.metadata) == false then
			return false
		end

		local newItem = Functions.DeepCopy(itemOnSlot)
		newItem.quantity += item.quantity
		return self:updateItem(itemOnSlot, newItem)
	else
		table.insert(self:content(), item)
		self:synchronize(item, "update", item.slot)
		return true
	end
end

---@param item? Item Item to remove
---@return boolean Success
function Inventory:removeItem(item)
	if item == nil or item.quantity == nil or item.quantity <= 0 then
        return false
    end

    for i, _item in pairs(self:content()) do
		if item.slot == _item.slot and item.metadata.category == _item.metadata.category then
			if _item.quantity < item.quantity then
				return false
			end

			if _item.quantity > item.quantity then
				self:content()[i].quantity = _item.quantity - item.quantity
				self:synchronize(self:content()[i], "update", self:content()[i].slot)
				return true
			else
				table.remove(self:content(), i)
				self:synchronize(item, "remove", item.slot)
				return true
			end
		end
	end

	return false
end

---@param oldItem? Item Item to update
---@param newItem? Item Item to update
---@return boolean Success
function Inventory:updateItem(oldItem, newItem)

	if oldItem == nil or oldItem.quantity == nil or oldItem.quantity <= 0 then
        return false
    end

	if newItem == nil or newItem.quantity == nil or newItem.quantity <= 0 then
        return false
    end

	local inventoryItem = self:findItem(function(i)
		return Table.compare(oldItem, i)
	end)

	if inventoryItem == nil then
		return false
	end

	if self:weight() + ((newItem.quantity - inventoryItem.quantity) * newItem.weight) > self:max_weight() then
		return false
	end

    for i, item in pairs(self:content()) do
		if oldItem.slot == item.slot and oldItem.metadata.category == item.metadata.category then
			self:content()[i] = newItem
			self:synchronize(newItem, "update", oldItem.slot)
			return true
		end
	end

	return false
end
