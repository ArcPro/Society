DB = DB or {}
DB.Minimarket = {}

DB.Minimarket.Get = function(id)
    return MySQL.single.await("SELECT * FROM `minimarkets` WHERE `id` = ?", { id })
end

DB.Minimarket.All = function()
    return MySQL.query.await("SELECT * FROM `minimarkets`")
end

DB.Minimarket.Create = function(ped_coords, safe_coords)
	if type(ped_coords) ~= "string" then
		ped_coords = json.encode(ped_coords)
	end

	if type(safe_coords) ~= "string" then
		safe_coords = json.encode(safe_coords)
	end

	return MySQL.insert.await("INSERT INTO `minimarkets` (`ped_coords`, `safe_coords`) VALUES (?, ?)", {
        ped_coords,
		safe_coords
    })
end

DB.Minimarket.Update = function(id, ped_coords, safe_coords)
	if type(ped_coords) ~= "string" then
		ped_coords = json.encode(ped_coords)
	end

	if type(safe_coords) ~= "string" then
		safe_coords = json.encode(safe_coords)
	end

    return MySQL.update.await("UPDATE `minimarkets` SET `ped_coords` = ?, `safe_coords` = ? WHERE `id` = ?", {
        ped_coords,
        safe_coords,
        id
    })
end

DB.Minimarket.Delete = function(id)
    return MySQL.query.await("DELETE FROM `minimarkets` WHERE `id` = ?", { id })
end
