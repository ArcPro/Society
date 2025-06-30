OnesyncPlayer = Player;

---@class Player
---@field private _id number | nil
---@field private _firstname string
---@field private _lastname string
---@field private _birthdate string
---@field private _height number
---@field private _weight number
---@field private _sex string
---@field private _hunger number
---@field private _thirst number
---@field private _alcohol number
---@field private _drugs number
---@field private _armor number
---@field private _health number
---@field private _position vector3 | { x: number, y: number, z: number, w: number }
---@field private _job table
---@field private _job_grade table
---@field private _permissions number
---@field private _skin Skin | table | {}
---@field private _inventory_id number
---@field private _inventory table
---@field private _identifiers table
---@field private _loaded boolean
---@field private _spawned boolean
---@field private _dead boolean
---@field private _hate 0 | 1 | 2
---@field private _slots integer
---@field private _locked 0 | 1
---@field private _group integer
---@field private _metadata table
Player = {
    _id = nil,
    _firstname = "",
    _lastname = "",
    _birthdate = "1970-01-01",
    _height = 0,
    _weight = 0,
    _nationality = "",
    _sex = "m",
    _hunger = 100,
    _thirst = 100,
    _alcohol = 0,
    _drugs = 0,
    _armor = 0,
    _health = 100,
    _position = vector3(0, 0, 0),
    _job = {
        id = 0,
        name = "",
        label = ""
    },
    _job_grade = {
        grade = 0,
        name = "",
        label = ""
    },
    _permissions = 0,
    _skin = {},
    _inventory_id = 0,
    _inventory = {},
    _identifiers = {},
    _loaded = false,
    _spawned = false,
    _dead = false,
    _hate = 0,
    _slots = 1,
    _locked = 0,
    _group = 0,
    _metadata = {}

}
Player.__index = Player

---@param data { id: number, firstname: string, lastname: string, birthdate: string, height: number, weight: number, nationality: string, sex: string, hunger: number, thirst: number, alcohol: number, drugs: number, armor: number, health: number, position: vector3, job: table, job_grade: table, permissions: number, skin: table, inventory: table, inventory_id: number, bank_account_id: number, identifiers: table, source: number, hate: (0 | 1 | 2), slots: integer, locked: 0 | 1, group: integer, metadata: table }
---@param source number | nil
---@param assign boolean | nil
---@return Player
function Player:new(data, source, assign)
    local self = setmetatable({}, Player)
    if assign then
        self._id = data.id
        self._firstname = data.firstname
        self._lastname = data.lastname
        self._birthdate = data.birthdate
        self._height = data.height
        self._weight = data.weight
        self._nationality = data.nationality
        self._sex = data.sex
        self._hunger = data.hunger
        self._thirst = data.thirst
        self._alcohol = data.alcohol
        self._drugs = data.drugs
        self._armor = data.armor
        self._health = data.health
        self._position = data.position
        self._job = data.job
        self._job_grade = data.job_grade
        self._permissions = data.permissions
        self._skin = data.skin
        self._inventory = data.inventory
        self._inventory_id = data.inventory_id
        self._bank_account_id = data.bank_account_id
        self._identifiers = data.identifiers
        self._source = data.source
        self._hate = data.hate
        self._slots = data.slots
        self._locked = data.locked
        self._group = data.group
        self._metadata = data.metadata
    else
        self:id(data.id)
        self:firstname(data.firstname)
        self:lastname(data.lastname)
        self:birthdate(data.birthdate)
        self:height(data.height)
        self:weight(data.weight)
        self:nationality(data.nationality)
        self:sex(data.sex or "m")
        self:skin(Skin:new(data.skin))
        self:hunger(data.hunger)
        self:thirst(data.thirst)
        self:alcohol(data.alcohol)
        self:drugs(data.drugs)
        self:armor(data.armor)
        self:health(data.health)
        self:position(data.position, true)
        self:job(data.job)
        self:job_grade(data.job_grade)
        self:permissions(data.permissions)
        self:inventory(data.inventory)
        self:inventory_id(data.inventory_id)
        self:bank_account_id(data.bank_account_id)
        self:identifiers(data.identifiers)
        self:source(data.source)
        self:hate(data.hate)
        self:slots(data.slots)
        self:locked(data.locked)
        self:group(data.group)
        self:metadata(data.metadata)
    end

    if Config.Env == "server" then

        if source then
            self:source(tonumber(source))
            Players._list[self:source()] = self
        end

    end

    return self
end

---@param id number | nil
---@return number
function Player:id(id)
    if id ~= nil then
        self._id = id
    end
    return self._id
end

---@param firstname string | nil
---@return string
function Player:firstname(firstname)
    if firstname ~= nil then
        assert(type(firstname) == "string", "Player:firstname() must be a string")
        self._firstname = firstname
    end
    return self._firstname
end

---@param lastname string | nil
---@return string
function Player:lastname(lastname)
    if lastname ~= nil then
        assert(type(lastname) == "string", "Player:lastname() must be a string")
        self._lastname = lastname
    end
    return self._lastname
end

---@param birthdate string | nil
---@return string
function Player:birthdate(birthdate)
    if birthdate ~= nil then
        local year, month, day = string.match(birthdate, "(%d%d%d%d)-(%d%d)-(%d%d)")

        assert(year ~= nil and month ~= nil and day ~= nil, "Player:birthdate() must be in format yyyy-mm-dd")

        self._birthdate = birthdate
    end
    return self._birthdate
end

---@param height number | nil
---@return number
function Player:height(height)
    if height ~= nil then
        assert(type(height) == "number", "Player:height() must be a number")
        self._height = height
    end
    return self._height
end

---@param weight number | nil
---@return number
function Player:weight(weight)
    if weight ~= nil then
        assert(type(weight) == "number", "Player:weight() must be a number")
        self._weight = weight
    end
    return self._weight
end

---@param nationality string | nil
function Player:nationality(nationality)
    if nationality ~= nil then
        assert(type(nationality) == "string", "Player:nationality() must be a string")
        self._nationality = nationality
    end

    return self._nationality
end

---@param sex string | nil
---@return string
function Player:sex(sex)
    if sex ~= nil then
        assert(type(sex) == "string", "Player:sex() must be a string")
        assert(string.lower(sex) == "m" or string.lower(sex) == "f", "Player:sex() must be M or F")
        self._sex = string.lower(sex)
    end
    return self._sex
end

---@param hunger number | nil
---@return number
function Player:hunger(hunger)
    if hunger ~= nil then
        if hunger < 0 then
            hunger = 0
        end
        assert(type(hunger) == "number", "Player:hunger() must be a number")
        self._hunger = Math.Clamp(hunger, 0, 100)
    end
    return self._hunger
end

---@param thirst number | nil
---@return number
function Player:thirst(thirst)
    if thirst ~= nil then
        if thirst < 0 then
            thirst = 0
        end
        assert(type(thirst) == "number", "Player:thirst() must be a number")
        self._thirst = Math.Clamp(thirst, 0, 100)
    end
    return self._thirst
end

---@param alcohol number | nil
---@return number
function Player:alcohol(alcohol)
    if alcohol ~= nil then
        if alcohol < 0 then
            alcohol = 0
        end
        assert(type(alcohol) == "number", "Player:alcohol() must be a number")
        self._alcohol = Math.Clamp(alcohol, 0, 100)
    end
    return self._alcohol
end

---@param drugs number | nil
---@return number
function Player:drugs(drugs)
    if drugs ~= nil then
        if drugs < 0 then
            drugs = 0
        end
        assert(type(drugs) == "number", "Player:drugs() must be a number")
        self._drugs = Math.Clamp(drugs, 0, 100)
    end
    return self._drugs
end

---@param armor number | nil
---@return number
function Player:armor(armor)
    if armor ~= nil then
        assert(type(armor) == "number", "Player:armor() must be a number")
        self._armor = Math.Clamp(armor, 0, 100)

        if Config.Env == "client" then
            SetPedArmour(PlayerPedId(), self._armor)
        end
    end
    return self._armor
end

---@param health number | nil
---@return number
function Player:health(health)
    if health ~= nil then
        assert(type(health) == "number", "Player:health() must be a number")

        self._health = Math.Clamp(health, 0, 200)

        if Config.Env == "client" then
            SetEntityHealth(PlayerPedId(), self._health + 100)
        end

    end
    return self._health
end

---@param position vector3 | vector4 | nil
---@param updateEntityCoords boolean | nil
---@return vector3 | vector4
function Player:position(position, updateEntityCoords)
    if position ~= nil then
        assert(type(position) == "vector4" or type(position) == "vector3",
            "Player:position() must be a vector3 or vector4")

        if Config.Env == "client" and updateEntityCoords == true then
            if Utils.IsValidCoords(position.x, position.y, position.z) == false then
                UI:AddNotification("basic", "Position invalide, replacement à la dernière position valide connue",
                    "info", 5000)
                position = self._position or vector3(0.0, 0.0, 0.0)
            end

            SetFocusPosAndVel(position.x, position.y, position.z, 0.0, 0.0, 0.0)
            RequestCollisionAtCoord(position.x, position.y, position.z)

            Events.TriggerServer("player:update", "position", position)
            FreezeEntityPosition(PlayerPedId(), true)

            while Math.Distance(GetEntityCoords(PlayerPedId(), true), position) > 2.5 do
                Citizen.Wait(100)
            end

            Utils.RealWait(500)

            -- check if coords are on cayo perico island
            if Math.Distance(position, vector3(4840.571, -5174.425, 2.0)) < 2000 then
                SetIslandEnabled("HeistIsland", true)
            end

            Utils.Streaming.LoadCollisionsAroundEntity(PlayerPedId())

            FreezeEntityPosition(PlayerPedId(), false)
            ClearFocus()

        end

        if (type(position) == "vector4") then
            self:heading(position.w, updateEntityCoords)
        end

        self._position = position
    end

    return self._position
end

---@param heading number | nil
---@param updateEntityCoords boolean | nil
---@return number
function Player:heading(heading, updateEntityCoords)
    if heading ~= nil then
        assert(type(heading) == "number", "Player:heading() must be a number")
        self._position = vector4(self._position.x, self._position.y, self._position.z, heading)

        if Config.Env == "client" and updateEntityCoords == true then
            SetEntityHeading(PlayerPedId(), heading)
        end
    end

    return self._position.w
end

---@param job table | nil
---@return table
function Player:job(job)
    if job ~= nil then
        assert(type(job) == "table", "Player:job() must be a table ({ id = 0, name = \"\", label = \"\" })")
        self._job = job
    end
    return self._job
end

---@param job_grade table | nil
---@return table
function Player:job_grade(job_grade)
    if job_grade ~= nil then
        assert(type(job_grade) == "table", "Player:job_grade() must be a table ({ grade = 0, label = \"\" })")
        if job_grade.grade ~= nil then
            assert(type(job_grade.grade) == "number", "Player:job_grade().grade must be a number")
            assert(job_grade.grade >= 0, "Player:job_grade().grade must be greater than 0")
        end
        self._job_grade = job_grade
    end
    return self._job_grade
end

---@param permissions number | nil
---@return number
function Player:permissions(permissions)
    if permissions ~= nil then
        assert(type(permissions) == "number", "Player:permissions() must be a number")
        assert(permissions >= 0, "Player:permissions() must be greater than 0")
        self._permissions = permissions
    end
    return self._permissions
end

---@param skin Skin | table | nil
---@return Skin | table
function Player:skin(skin)
    if skin ~= nil then
        assert(type(skin) == "table", "Player:skin() must be a table")
        self._skin = skin
    end
    return self._skin
end

---@param inventory Inventory | table | nil
---@return Inventory | table
function Player:inventory(inventory)
    if inventory ~= nil then
        assert(type(inventory) == "table", "Player:inventory() must be a table")
        self._inventory = inventory
    end
    return self._inventory
end

---@param inventory_id number | nil
---@return number
function Player:inventory_id(inventory_id)
    if inventory_id ~= nil then
        assert(type(inventory_id) == "number", "Player:inventory_id() must be a number")
        self._inventory_id = inventory_id
    end
    return self._inventory_id
end

---@param bank_account_id number | nil
---@return number
function Player:bank_account_id(bank_account_id)
    if bank_account_id ~= nil then
        assert(type(bank_account_id) == "number", "Player:bank_account_id() must be a number")
        self._bank_account_id = bank_account_id
    end
    return self._bank_account_id
end

---@param identifiers table | nil
---@return table
function Player:identifiers(identifiers)
    if identifiers ~= nil then
        assert(type(identifiers) == "table", "Player:identifiers() must be a table")
        self._identifiers = identifiers
    end
    return self._identifiers
end

---@return string
function Player:fullname()
    return self._firstname .. " " .. self._lastname
end

---@param source number | nil
---@return number
function Player:source(source)
    if source ~= nil then
        self._source = source
    end
    return self._source
end

---@param loaded boolean | nil
---@return boolean
function Player:loaded(loaded)
    if loaded ~= nil then
        self._loaded = loaded
    end
    return self._loaded
end

---@param hate 0 | 1 | 2 | nil
---@return 0 | 1 | 2
function Player:hate(hate)
    if hate ~= nil then
        self._hate = hate
    end
    return self._hate
end

---@param slots integer | nil
---@return integer
function Player:slots(slots)
    if slots ~= nil then
        self._slots = slots
    end
    return self._slots
end

---@param locked 0 | 1 | nil
---@return 0 | 1
function Player:locked(locked)
    if locked ~= nil then
        self._locked = locked
    end
    return self._locked
end

---@param group integer | nil
---@return integer
function Player:group(group)
    if group ~= nil then
        self._group = group
    end
    return self._group
end

---@param metadata table | nil
---@return table
function Player:metadata(metadata)
    if metadata ~= nil then
        self._metadata = metadata
    end

    return self._metadata
end

if Config.Env == "server" then

    function Player:remove()
        Players._list[self:source()] = nil
    end

else

    ---@param spawned boolean | nil
    ---@return boolean
    function Player:spawned(spawned)
        if spawned ~= nil then
            self._spawned = spawned
        end
        return self._spawned
    end

    ---@param dead boolean | nil
    ---@return boolean
    function Player:dead(dead)
        if dead ~= nil then
            self._dead = dead
        end
        return self._dead
    end

    ---@param ko boolean | nil
    ---@return boolean
    function Player:ko(ko)
        if ko ~= nil then
            self._ko = ko
        end
        return self._ko
    end
end
