---@class Vehicle
---@field private _plate string | nil The vehicle plate
---@field private _model integer | nil The vehicle model
---@field private _trunk_id number | nil The vehicle trunk id
---@field private _glovebox_id number | nil The vehicle glovebox_id
---@field private _owner string | nil The vehicle owner
---@field private _cover_coords { x: number, y: number, z: number, w: number } | nil The vehicle corver coords
---@field private _props VehicleProps | table The vehicle properties
---@field private _linked_society integer
Vehicle = {
    _plate = nil,
    _model = nil,
    _props = {
        plateIndex = 0,
        bodyHealth = 0,
        engineHealth = 0,
        tankHealth = 0,
        fuelLevel = 0,
        dirtLevel = 0,
        color1 = 0,
        color2 = 0,
        rgbcolor1 = { r = 0, g = 0, b = 0 },
        rgbcolor2 = { r = 0, g = 0, b = 0 },
        interiorColor = 0,
        pearlescentColor = 0,
        wheelColor = 0,
        wheels = 0,
        windowTint = 0,
        xenonColor = 0,
        neonEnabled = { false, false, false, false },
        neonColor = { r = 0, g = 0, b = 0 },
        extras = {},
        tyreSmokeColor = { r = 0, g = 0, b = 0 },
        mods = {
            spoiler = 0,
            frontBumper = 0,
            rearBumper = 0,
            sideSkirt = 0,
            exhaust = 0,
            frame = 0,
            grille = 0,
            hood = 0,
            fender = 0,
            rightFender = 0,
            roof = 0,
            engine = 0,
            brakes = 0,
            transmission = 0,
            horns = 0,
            suspension = 0,
            armor = 0,
            turbo = false,
            smokeEnabled = false,
            xenon = false,
            frontWheels = 0,
            backWheels = 0,
            plateHolder = 0,
            vanityPlate = 0,
            trimA = 0,
            ornaments = 0,
            dashboard = 0,
            dial = 0,
            doorSpeaker = 0,
            seats = 0,
            steeringWheel = 0,
            shifterLeavers = 0,
            aPlate = 0,
            speakers = 0,
            trunk = 0,
            hydrolic = 0,
            engineBlock = 0,
            airFilter = 0,
            struts = 0,
            archCover = 0,
            aerials = 0,
            trimB = 0,
            tank = 0,
            windows = 0,
            livery = 0,
        },
    },
    _status = 0,
    _cover_coords = { x = 0.0, y = 0.0, z = 0.0, w = 0.0 },
	_linked_society = 0,
}
Vehicle.__index = Vehicle

---@param data { plate: string, model: integer, props: VehicleProps, trunk_id: number, glovebox_id: number, owner: string, status: number, cover_coords: { x: number, y: number, z: number, w: number }, linked_society: integer }
---@return Vehicle
function Vehicle:new(data)

    local self = setmetatable({}, Vehicle)

    self:plate(data.plate)
    self:model(data.model)
    self:trunk_id(data.trunk_id)
    self:glovebox_id(data.glovebox_id)
    self:props(data.props)
    self:owner(data.owner)
    self:status(data.status)
    self:cover_coords(data.cover_coords)
	self:linked_society(data.linked_society)

    if Config.Env == "server" then
        Vehicles._list[self:plate()] = self
    end

    return self
end

---@param plate string | nil
---@return string
function Vehicle:plate(plate)
    if plate ~= nil then
        self._plate = plate
    end
    return self._plate
end

---@param cover_coords { x: number, y: number, z: number, w: number } | nil
---@return { x: number, y: number, z: number, w: number }
function Vehicle:cover_coords(cover_coords)
    if cover_coords ~= nil then
        self._cover_coords = cover_coords
    end
    return self._cover_coords
end

---@param model integer | nil
---@return integer
function Vehicle:model(model)
    if model ~= nil then
        self._model = model
    end
    return self._model
end

---@param trunk_id number | nil
---@return number
function Vehicle:trunk_id(trunk_id)
    if trunk_id ~= nil then
        self._trunk_id = trunk_id
    end
    return self._trunk_id
end

---@param glovebox_id number | nil
---@return number
function Vehicle:glovebox_id(glovebox_id)
    if glovebox_id ~= nil then
        self._glovebox_id = glovebox_id
    end
    return self._glovebox_id
end

---@param props? VehicleProps
---@return VehicleProps
function Vehicle:props(props)
    if props ~= nil then
        self._props = props
    end
    return self._props
end

---@param owner string | nil
---@return string
function Vehicle:owner(owner)
    if owner ~= nil then
        self._owner = owner
    end
    return self._owner
end

---@param status number | nil
---@return number
function Vehicle:status(status)
    if status ~= nil then
        self._status = status
    end
    return self._status
end

---@param linked_society number | nil
---@return number
function Vehicle:linked_society(linked_society)
    if linked_society ~= nil then
        self._linked_society = linked_society
    end
    return self._linked_society
end

---@param entity number | nil
---@return number
function Vehicle:entity(entity)
	if entity ~= nil then
		self._entity = entity
	end
	return self._entity
end

if Config.Env == "client" then

    function Vehicle:update(key, value)
        self[key](self, value)
        Events.TriggerServer("vehicle:update", self:plate(), key, value)
    end
end
