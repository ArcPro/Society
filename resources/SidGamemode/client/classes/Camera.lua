---@class Camera
---@field _name string | nil
---@field _position vector3
---@field _rotation vector3
---@field _fov number
---@field _active boolean
---@field _instance number | nil
Camera = {
    _name = nil,
    _position = vector3(0, 0, 0),
    _rotation = vector3(0, 0, 0),
    _fov = 50.0,
    _active = false,
    _instance = nil
}
Camera.__index = Camera

---@param data { name: string, position: vector3, rotation: vector3, fov: number }
---@return Camera
function Camera:new(data)

    local self = setmetatable({}, Camera)
    self:name(data.name)
    self:position(data.position)
    self:rotation(data.rotation)
    self:fov(data.fov)
    self:active(false)
    self._instance = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", self._position.x, self._position.y, self._position.z, self._rotation.x, self._rotation.y, self._rotation.z, self._fov, false, 0)
    return self
end

---@param name string | nil
---@return string
function Camera:name(name)
    if name ~= nil then
        self._name = name
    end
    return self._name
end

---@param position vector3 | nil
---@return vector3
function Camera:position(position)
    if position ~= nil then
        self._position = position
        SetCamCoord(self._instance, self._position.x, self._position.y, self._position.z)
    end
    return self._position
end

---@param position vector3 | nil
---@return boolean
function Camera:focus(position)
    if position ~= nil then
        PointCamAtCoord(self._instance, position.x, position.y, position.z)
    end
    return position ~= nil
end

---@param rotation vector3 | nil
---@return vector3
function Camera:rotation(rotation)
    if rotation ~= nil then
        self._rotation = rotation
        SetCamRot(self._instance, self._rotation.x, self._rotation.y, self._rotation.z, 0)
    end
    return self._rotation
end

---@param fov number | nil
---@return number
function Camera:fov(fov)
    if fov ~= nil then
        self._fov = fov
        SetCamFov(self._instance, self._fov)
    end
    return self._fov
end

---@param active boolean | nil
---@return boolean
function Camera:active(active)
    if active ~= nil then
        self._active = active
    end
    return self._active
end

function Camera:render()
    if self._active then
        return
    end

    self:active(true)
    SetCamActive(self._instance, true)
    RenderScriptCams(true, false, 0, true, true)
end

function Camera:stopRendering()
    if self._active == false then
        return
    end

    self:active(false)
    SetCamActive(self._instance, false)
	RenderScriptCams(false, false, 0, true, true)
end

function Camera:destroy()
    self:stopRendering()
    DestroyCam(self._instance, false)
end
