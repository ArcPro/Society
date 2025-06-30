---@class Zone
---@field _id number
---@field _name string
---@field _coords vector4
---@field _size vector2
---@field _instance any
---@field _data table
---@field _action string
Zone = {
    _id = 0,
    _name = "",
    _coords = vector3(0, 0, 0),
	_size = vector2(0, 0),
	_onEnter = nil,
	_onLeave = nil,
	_instance = nil,
	_data = {},
	_action = "",
}
Zone.__index = Zone

---@param data { id: number, name: string, coords: vector4, size: vector2, data: table, action: string }
---@return Zone
function Zone:new(data)

    local self = setmetatable({}, Zone)
	self:action(data.action)
    self:coords(data.coords)
	self:data(data.data)
	self:name(data.name)
	self:size(data.size)
    self:id(data.id)

	self:onEnter(function()
		Zones.currentType = self:action()
	end)

	self:onLeave(function()
		Zones.currentType = nil
	end)

	self:instance(self:create())

    Zones._list[self:id()] = self

    return self
end

---@param id number | nil
---@return number
function Zone:id(id)
    if id ~= nil then
        self._id = id
    end

    return self._id
end

---@param name string | nil
---@return string
function Zone:name(name)
    if name ~= nil then
        self._name = name
    end

    return self._name
end

---@param coords vector4 | nil
---@return vector4
function Zone:coords(coords)
    if coords ~= nil then
        self._coords = coords
    end

    return self._coords
end

---@param size vector2 | nil
---@return vector2
function Zone:size(size)
    if size ~= nil then
        self._size = size
    end

    return self._size
end

---@param onEnter fun() | nil
---@return fun()
function Zone:onEnter(onEnter)
    if onEnter ~= nil then
        self._onEnter = onEnter
    end

    return self._onEnter
end

---@param onLeave fun() | nil
---@return fun()
function Zone:onLeave(onLeave)
    if onLeave ~= nil then
        self._onLeave = onLeave
    end

    return self._onLeave
end

---@param data table | nil
---@return table
function Zone:data(data)
    if data ~= nil then
        self._data = data
    end

    return self._data
end

---@param instance any | nil
---@return any
function Zone:instance(instance)
    if instance ~= nil then
        self._instance = instance
    end

    return self._instance
end

---@param action string | nil
---@return string
function Zone:action(action)
    if action ~= nil then
        self._action = action
    end

    return self._action
end

function Zone:delete()
	self:instance():destroy()

	if Zones.current == self:id() then
		Zones.current = nil
		self:onLeave()()
	end

	Zones._list[self:id()] = nil
end

function Zone:create()
	local instance = BoxZone:Create(vector3(self:coords().x, self:coords().y, self:coords().z), self:size().x, self:size().y, {
        name = ("zone_%d"):format(self:id()),
        heading = self:coords().w or 0,
        offset = { 0.0, 0.0, 0.0 },
        scale = { 1.0, 1.0, 1.0 },
        debugPoly = false,
    })

	instance:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
		if isPointInside then
			Zones.current = self:id()
			self:onEnter()()
		else
			Zones.current = nil
			self:onLeave()()
		end
	end, 100)

	return instance
end

function Zone:refresh()
	if Zones.current == self:id() then
		Zones.current = nil
		self:onLeave()()
	end

	self:instance():destroy()
	self:instance(self:create())
end
