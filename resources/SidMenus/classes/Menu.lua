---@class Menu
---@field private _title string
---@field private _banner string
---@field private _visible boolean
---@field private _index number
---@field private _parent number
---@field private _items Items
---@field private _onOpen fun()
---@field private _onClose fun()
---@field private _onVisible fun()
---@field private _onIndexChange fun(index: number)
Menu = {
    _title = "",
    _banner = "",
    _visible = false,
    _index = 1,
    _parent = 0,
    _onOpen = function()end,
    _onClose = function()end,
    _onVisible = function()end,
    _onIndexChange = function()end,
}
Menu.__index = Menu

function Menu:new(data)

    local self = setmetatable({}, Menu)
    self:items(Items:new())
    self:title(data.title)
    self:banner(data.banner)
    self:visible(data.visible)
    self:index(data.index or 1)
    self:parent(data.parent or 0)
    self:onOpen(data.onOpen)
    self:onClose(data.onClose)
    self:onVisible(data.onVisible)
    self:onIndexChange(data.onIndexChange)
    return self
end

---@param title string | nil
---@return string
function Menu:title(title)
    if title ~= nil then
        self._title = title
    end
    return self._title
end

---@param banner string | nil
---@return string
function Menu:banner(banner)
    if banner ~= nil then
        self._banner = banner
    end
    return self._banner
end

---@param index number | nil
---@return number
function Menu:index(index)
    if index ~= nil then
        self._index = index
    end
    return self._index
end

---@param parent number | nil
---@return number
function Menu:parent(parent)
    if parent ~= nil then
        self._parent = parent
    end
    return self._parent
end

---@param visible boolean | nil
---@return boolean
function Menu:visible(visible)
    if visible ~= nil then
        self._visible = visible
    end
    return self._visible
end

---@param onOpen function | nil
---@return function
function Menu:onOpen(onOpen)
    if onOpen ~= nil then
        self._onOpen = onOpen
    end
    return self._onOpen
end

---@param onClose function | nil
---@return function
function Menu:onClose(onClose)
    if onClose ~= nil then
        self._onClose = onClose
    end
    return self._onClose
end

---@param onVisible function | nil
---@return function
function Menu:onVisible(onVisible)
    if onVisible ~= nil then
        self._onVisible = onVisible
    end
    return self._onVisible
end

---@param onIndexChange function | nil
---@return function
function Menu:onIndexChange(onIndexChange)
    if onIndexChange ~= nil then
        self._onIndexChange = onIndexChange
    end
    return self._onIndexChange
end

---@param items Items | nil
---@return Items
function Menu:items(items)
    if items ~= nil then
        self._items = items
    end
    return self._items
end

---@param index number
---@param indexOrChecked? number | boolean
---@return nil
function Menu:select(index, indexOrChecked)

    if type(indexOrChecked) == "number" then
        indexOrChecked += 1
    end

    self:items():callback(index, indexOrChecked)
end

---@return table | nil
function Menu:currentItem()
    return self:items():list()[self:index()]
end
