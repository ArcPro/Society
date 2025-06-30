---@class Callback
---@field _name string
---@field _func function | nil
Callback = {
    _name = "",
    _func = nil,
}
Callback.__index = Callback

---@param data { name: string, func: function }
---@return Callback
function Callback:new(data)
    local self = setmetatable({}, Callback)
    self._name = data.name
    self._func = data.func
    return self
end

---@param name string | nil
---@return string
function Callback:name(name)
    if name then
        self._name = name
    end
    return self._name
end

---@param func function | nil
---@return function
function Callback:func(func)
    if func then
        self._func = func
    end
    return self._func
end

---@vararg any
---@return any
function Callback:trigger(...)
    return self._func(...)
end
