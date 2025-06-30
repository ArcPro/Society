---@class Inventory
---@field private _id number | string | nil
---@field private _max_weight number
---@field private _content table
---@field private _temporary boolean | nil
---@field private _slots integer
---@field private _players_in? table Server side only
---@field private _category string
Inventory = {
    _id = nil,
    _max_weight = 0,
    _content = {},
    _temporary = false,
	_slots = 65,
	_players_in = {},
	_category = ""
}
Inventory.__index = Inventory

---@param data { id: number | string, max_weight: number, content: table, temporary: boolean, slots: integer, category: string }
---@return Inventory
function Inventory:new(data)

    local self = setmetatable({}, Inventory)

    self:id(data.id)
    self:max_weight(data.max_weight)
    self:content(data.content)
    self:temporary(data.temporary)
	self:slots(data.slots)
	self:category(data.category)

	if Config.Env == "server" then
		self:playersIn({})
		Inventories._list[self:id()] = self
	end

    return self
end

---@param id integer | string | nil
---@return integer | string
function Inventory:id(id)
	if id ~= nil then
		self._id = id
	end

	return self._id
end

---@param max_weight integer | nil
---@return integer
function Inventory:max_weight(max_weight)
	if max_weight ~= nil then
		self._max_weight = max_weight
	end

	return self._max_weight
end

---@param content Item[] | nil
---@return Item[]
function Inventory:content(content)

	if content ~= nil then
		if Config.Env == "server" then
			for idx, item in pairs(content) do
				if tonumber(item.slot) == nil or tonumber(item.slot) > self:slots() then
					table.remove(content, idx)
				end
			end
		end

		self._content = content
	end

	return self._content
end

---@param temporary boolean | nil
---@return boolean
function Inventory:temporary(temporary)
	if temporary ~= nil then
		self._temporary = temporary
	end

	return self._temporary
end

---@param slots integer | nil
---@return integer
function Inventory:slots(slots)
	if slots ~= nil then
		self._slots = slots
	end

	return self._slots
end

---@param category string | nil
---@return string
function Inventory:category(category)
	if category ~= nil then
		self._category = category
	end

	return self._category
end

---@return number
function Inventory:weight()
	local weight = 0
    for _, item in pairs(self:content()) do
        weight += (item.weight * item.quantity)
    end
    return weight
end

---@return number
function Inventory:free_weight()
    return self:max_weight() - self:weight()
end

---@param fn function
---@return table | nil
function Inventory:findItem(fn)
    for _, item in pairs(self:content()) do
        if fn(item) then
			if Config.Env == "server" then
				return item
			else
				return Functions.DeepCopy(item)
			end
        end
    end

    return nil
end

---@param fn function
---@return table
function Inventory:findItems(fn)
    local items = {}

    for _, item in pairs(self:content()) do
        if fn(item) then
            table.insert(items, item)
        end
    end

    return Functions.DeepCopy(items)
end

---@param category "other" | "clothes" | "keys"
---@return number
function Inventory:freeSlots(category)
	return self:slots() - #(self:findItems(function(item)
		return item.metadata.category == category
	end))
end
