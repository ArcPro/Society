DB = DB or {}
DB.Zone = {}

DB.Zone.Get = function(id)
    return MySQL.single.await("SELECT * FROM `zones` WHERE `id` = ?", { id })
end

DB.Zone.All = function()
    return MySQL.query.await("SELECT * FROM `zones`")
end

DB.Zone.Create = function(name, coords, size, action, data)
    return MySQL.insert.await("INSERT INTO `zones` (`name`, `coords`, `size`, `action`, `data`) VALUES (?, ?, ?, ?, ?)", {
		name,
        json.encode(coords),
		json.encode(size),
        action,
        json.encode(data)
    })
end

DB.Zone.Update = function(id, name, coords, size, action, data)
    return MySQL.update.await("UPDATE `zones` SET `name` = ?, `coords` = ?, `size` = ?, `action` = ?, `data` = ? WHERE `id` = ?", {
		name,
        json.encode(coords),
		json.encode(size),
        action,
        json.encode(data),
        id
    })
end

DB.Zone.Delete = function(id)
    return MySQL.query.await("DELETE FROM `zones` WHERE `id` = ?", { id })
end
