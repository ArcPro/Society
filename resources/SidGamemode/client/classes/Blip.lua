---@class Blip
---@field _id number
---@field _blip number
---@field _coords vector3
---@field _sprite number
---@field _color number
---@field _title string
---@field _shortRange boolean
---@field _size number
---@field _editable boolean
---@field _showOnList boolean
---@field _category integer
Blip = {
    _id = 0,
    _blip = 0,
    _coords = vector3(0, 0, 0),
    _sprite = 0,
    _color = 0,
    _title = '',
    _shortRange = true,
    _size = 0.0,
    _editable = false,
    _showOnList = true,
	_category = 1,
}
Blip.__index = Blip

---@param data { id: number, coords: vector3, sprite: number, color: number, title: string, shortRange: boolean, size: number, editable: boolean, showOnList: boolean, category: integer }
---@return Blip
function Blip:new(data)
    local self = setmetatable({}, Blip)
    self:id(data.id)
    self:coords(data.coords)
    self:sprite(data.sprite)
    self:color(data.color)
    self:title(data.title)
    self:shortRange(data.shortRange)
    self:size(data.size)
    self:editable(data.editable)
    self:showOnList(data.showOnList)
    self:category(data.category or 1)

    Blips._list[self:id()] = self

    return self
end

---@param id number | nil
---@return number
function Blip:id(id)
    if id ~= nil then
        self._id = id
    end

    return self._id
end

---@param coords vector3 | nil
---@return vector3
function Blip:coords(coords)
    if coords ~= nil then
        self._coords = coords

		if self:exists() then
			SetBlipCoords(self._blip, coords.x, coords.y, coords.z)
		end
    end

    return self._coords
end

---@param sprite number | nil
---@return number
function Blip:sprite(sprite)
    if sprite ~= nil then
        self._sprite = sprite

		if self:exists() then
			SetBlipSprite(self._blip, sprite)
		end
    end

    return self._sprite
end

---@param color number | nil
---@return number
function Blip:color(color)
    if color ~= nil then
        self._color = color

		if self:exists() then
			SetBlipColour(self._blip, color)
		end
    end

    return self._color
end

---@param category integer | nil
---@return integer
function Blip:category(category)
    if category ~= nil then
        self._category = category

		if self:exists() then
			SetBlipCategory(self._blip, category)
		end
    end

    return self._category
end

---@param title string | nil
---@return string
function Blip:title(title)
    if title ~= nil then
        self._title = title

		if self:exists() then
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentSubstringPlayerName(title)
			EndTextCommandSetBlipName(self._blip)
		end
    end

    return self._title
end

---@param shortRange boolean | nil
---@return boolean
function Blip:shortRange(shortRange)
    if shortRange ~= nil then
        self._shortRange = shortRange

		if self:exists() then
			SetBlipAsShortRange(self._blip, shortRange)
		end
    end

    return self._shortRange
end

---@param size number | nil
---@return number
function Blip:size(size)
    if size ~= nil then
        self._size = size

		if self:exists() then
			SetBlipScale(self._blip, size)
		end
    end

    return self._size
end

---@param editable boolean | nil
---@return boolean
function Blip:editable(editable)
    if editable ~= nil then
        self._editable = editable
    end

    return self._editable
end

---@param showOnList boolean | nil
---@return boolean
function Blip:showOnList(showOnList)
    if showOnList ~= nil then
        self._showOnList = showOnList

		if self:exists() then
			SetBlipDisplay(self._blip, self._showOnList and 4 or 8)
		end
    end

    return self._showOnList
end

---@return boolean
function Blip:exists()
    return DoesBlipExist(self._blip)
end

function Blip:show()
    self._blip = AddBlipForCoord(self._coords.x, self._coords.y, self._coords.z)
    SetBlipSprite(self._blip, self._sprite)
    SetBlipDisplay(self._blip, self._showOnList and 4 or 8)
    SetBlipScale(self._blip, self._size)
    SetBlipColour(self._blip, self._color)
    SetBlipAsShortRange(self._blip, self._shortRange)
	SetBlipCategory(self._blip, self._category)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(self._title)
    EndTextCommandSetBlipName(self._blip)
end

function Blip:hide()
    RemoveBlip(self._blip)
end

function Blip:toggle()
    if self:exists() then
        self:hide()
    else
        self:show()
    end
end

function Blip:delete()
    self:hide()
    Blips._list[self._id] = nil
end

function Blip:showNumber(number)
    ShowNumberOnBlip(self._blip, number)
end
