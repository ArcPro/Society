DB = DB or {}
DB.Vehicle = {}

---@param plate string
---@return Vehicle | nil
DB.Vehicle.Get = function(plate)
    local result = MySQL.single.await("SELECT * FROM vehicles WHERE plate = @plate", {
        ["@plate"] = plate
    })

    if (result == nil) then
        return nil
    end

    if type(result.props) == "string" then
        result.props = json.decode(result.props)
    end

    if type(result.cover_coords) == "string" then
        result.cover_coords = json.decode(result.cover_coords)
    end

    return Vehicle:new(result)
end

DB.Vehicle.GetOwned = function(name)
    return MySQL.query.await("SELECT plate, model FROM vehicles WHERE owner = ?", { name })
end

---@param plate string
---@param props table
---@param trunk_max_weight number
---@param owner string
---@return number
DB.Vehicle.Create = function(plate, model, props, trunk_max_weight, owner)

    local trunk_id = DB.Inventory.Create(trunk_max_weight, 65)
    local glovebox_id = DB.Inventory.Create(5, 5)

    return MySQL.insert.await("INSERT INTO `vehicles` (`plate`, `model`, `props`, `trunk_id`, `glovebox_id`, `status`, `owner`, `cover_coords`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", {
        plate,
        model,
        json.encode(props),
        trunk_id,
        glovebox_id,
        0,
        owner,
        json.encode({})
    })
end

---@param vehicle Vehicle
---@return number
DB.Vehicle.Update = function(vehicle)

	local cover_coords = vehicle:cover_coords()
	local linkedSociety = nil

	if vehicle:linked_society() ~= 0 then
		linkedSociety = vehicle:linked_society()
	end

	if type(vehicle:cover_coords()) ~= "string" then
		cover_coords = json.encode(cover_coords)
	end

    return MySQL.update.await("UPDATE `vehicles` SET `props` = ?, `owner` = ?, `status` = ?, `cover_coords` = ?, `linked_society` = ? WHERE `plate` = ?", {
        json.encode(vehicle:props()),
        vehicle:owner(),
        vehicle:status(),
        cover_coords,
		linkedSociety,
        vehicle:plate(),
    })
end

---@param vehicle Vehicle
---@return number
DB.Vehicle.Delete = function(vehicle)
    DB.Inventory.Delete(Inventories.Get(vehicle:trunk_id()))
    DB.Inventory.Delete(Inventories.Get(vehicle:glovebox_id()))
    return MySQL.query.await("DELETE FROM `vehicles` WHERE `plate` = ?", { vehicle:plate() })
end

---@return table<number, table>
DB.Vehicle.All = function(filter)
	local hash = ("%%%s%%"):format(GetHashKey(filter or ""))
	filter = ("%%%s%%"):format(filter or "")

    return MySQL.query.await("SELECT plate, model, owner FROM vehicles WHERE	\
		`plate` LIKE ?															\
		OR `model` LIKE ?														\
		OR `owner` LIKE ?														\
		LIMIT 500																\
	", { filter, hash, filter })
end

---@return table<number, table>
DB.Vehicle.AllCovered = function()
    return MySQL.query.await("SELECT plate, cover_coords FROM vehicles WHERE `status` = 1")
end
