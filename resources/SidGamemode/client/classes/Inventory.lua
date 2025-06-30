-- Check @shared/classes/Inventory.lua for class definition

---@private
---@param type InventoryAction
---@param item Item
---@param updatedItem? Item
---@return boolean
function Inventory:action(type, item, updatedItem)
	if type == "update" then
		return Callbacks.Trigger("inventory:action", self:id(), type, item, updatedItem) or false
	else
		return Callbacks.Trigger("inventory:action", self:id(), type, item) or false
	end
end

---@private
---@param type "money" | "slot"
---@param p1 any
---@return any
function Inventory:check(type, p1)
	return Callbacks.Trigger("inventory:check", self:id(), type, p1) or false
end

---@param amount integer Money amount to check if is present in this inventory
---@return boolean Success
function Inventory:hasEnoughMoney(amount)
	return self:check("money", amount)
end

---@param itemOrCategory Item | "other" | "clothes" | "keys"
---@return string | nil
function Inventory:findFreeSlot(itemOrCategory)
	return self:check("slot", itemOrCategory)
end

---@param item Item | nil Item to add
---@return boolean Success
function Inventory:addItem(item)
	if item == nil then return false end

	return self:action("add", item)
end

---@param item? Item Item to remove
---@return boolean Success
function Inventory:removeItem(item)
	if item == nil then return false end

	return self:action("remove", item)
end

---@param oldItem? Item Item to update
---@param newItem? Item Item to update
---@return boolean Success
function Inventory:updateItem(oldItem, newItem)
	if oldItem == nil or newItem == nil then return false end

	return self:action("update", oldItem, newItem)
end
