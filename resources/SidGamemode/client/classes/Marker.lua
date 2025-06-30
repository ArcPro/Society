---@class Marker
---@field _name string
---@field _action string | nil
---@field _coords vector3
---@field _textureDict string
---@field _maxDistance number
---@field _visible boolean
---@field _opened boolean
---@field _onInteract function
---@field _onLeave function
---@field _data any
---@field _editable boolean
---@field _bucket integer
Marker = {
    _name = '',
    _action = nil,
    _coords = vector3(0, 0, 0),
    _textureDict = "outro",
    _maxDistance = 5.0,
    _visible = true,
    _opened = false,
    _onInteract = function()end,
    _onLeave = function()end,
    _data = {},
    _editable = false,
	_bucket = 1,
}
Marker.__index = Marker

---@param data { name: string, coords: vector3, maxDistance: number, visible: boolean, onInteract: function, onLeave: function, opened: boolean, data: any, action: string, textureDict: string, editable: boolean, bucket: integer }
---@return Marker
function Marker:new(data)

    local self = setmetatable({}, Marker)
    self:name(data.name)
    self:coords(data.coords)
    self:visible(data.visible)
    self:onInteract(data.onInteract)
    self:onLeave(data.onLeave)
    self:data(data.data)
    self:action(data.action)
    self:editable(data.editable)
	self:bucket(data.bucket)
	self:textureDict(data.textureDict)

    Markers._list[self._name] = self

    return self
end

---@param name string | nil
---@return string
function Marker:name(name)
    if name ~= nil then
        assert(type(name) == 'string', '^1[Error]^0 Marker:name() name must be a string')
        self._name = name
    end

    return self._name
end

---@param _type number | nil
---@return number
function Marker:type(_type)
    if _type ~= nil then
        assert(type(_type) == 'number', '^1[Error]^0 Marker:type() type must be a number')
        self._type = _type
    end

    return self._type
end

---@param coords vector3 | nil
---@return vector3
function Marker:coords(coords)
    if coords ~= nil then
        assert(type(coords) == 'vector3', '^1[Error]^0 Marker:coords() coords must be a vector3')
        self._coords = coords
    end

    return self._coords
end

---@param textureDict string | nil
---@return string
function Marker:textureDict(textureDict)
    if textureDict ~= nil then
        assert(type(textureDict) == 'string', '^1[Error]^0 Marker:textureDict() textureDict must be a string')
        self._textureDict = textureDict
    end

    return self._textureDict
end

---@param textureName string | nil
---@return string
function Marker:textureName(textureName)
    if textureName ~= nil then
        assert(type(textureName) == 'string', '^1[Error]^0 Marker:textureName() textureName must be a string')
        self._textureName = textureName
    end

    return self._textureName
end

---@param maxDistance number | nil
---@return number
function Marker:maxDistance(maxDistance)
    if maxDistance ~= nil then
        assert(type(maxDistance) == 'number', '^1[Error]^0 Marker:maxDistance() maxDistance must be a number')
        self._maxDistance = maxDistance
    end

    return self._maxDistance
end

---@param visible boolean | nil
---@return boolean
function Marker:visible(visible)
    if visible ~= nil then
        assert(type(visible) == 'boolean', '^1[Error]^0 Marker:visible() visible must be a boolean')
        self._visible = visible
    end

    return self._visible
end

---@param onInteract function | nil
---@return function
function Marker:onInteract(onInteract)
    if onInteract ~= nil then
        assert(type(onInteract) == 'function', '^1[Error]^0 Marker:onInteract() fn must be a function')
        self._onInteract = onInteract
    end

    return self._onInteract
end

---@param onLeave function | nil
---@return function
function Marker:onLeave(onLeave)
    if onLeave ~= nil then
        assert(type(onLeave) == 'function', '^1[Error]^0 Marker:onLeave() fn must be a function')
        self._onLeave = onLeave
    end

    return self._onLeave
end

---@param data any | nil
---@return any
function Marker:data(data)
    if data ~= nil then
        assert(type(data) == 'table', '^1[Error]^0 Marker:data() data must be a table')
        self._data = data
    end

    return self._data
end

---@param action string | nil
---@return string
function Marker:action(action)
    if action ~= nil then
        assert(type(action) == 'string', '^1[Error]^0 Marker:action() action must be a string')
        self._action = action
    end

    return self._action
end

---@param opened boolean | nil
---@return boolean
function Marker:opened(opened)
    if opened ~= nil then
        assert(type(opened) == 'boolean', '^1[Error]^0 Marker:opened() opened must be a boolean')
        self._opened = opened
    end

    return self._opened
end

---@param bucket integer | nil
---@return integer
function Marker:bucket(bucket)
    if bucket ~= nil then
        self._bucket = bucket
    end

    return self._bucket
end

---@param editable boolean | nil
---@return boolean
function Marker:editable(editable)
    if editable ~= nil then
        self._editable = editable
    end

    return self._editable
end

function Marker:draw(dist)
    if self._textureDict then
        Utils.Streaming.RequestStreamedTextureDict(self._textureDict)
    end

	if self:action() == nil then return end

	if dist > 2.0 then
		Utils.Sprites.Draw(self:textureDict(), "marker_" .. self:action() .. "_empty", 42, 42, self:coords(), self:maxDistance())
	else
		Utils.Sprites.Draw(self:textureDict(), "marker_" .. self:action(), 70, 70, self:coords(), self:maxDistance())
	end
end

function Marker:delete()
    Markers._list[self._name] = nil
end
