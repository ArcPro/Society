DB = DB or {}
DB.Marker = {}

DB.Marker.Get = function(name)
    return MySQL.single.await("SELECT * FROM `markers` WHERE `name` = ?", { name })
end

DB.Marker.All = function()
    return MySQL.query.await("SELECT * FROM `markers`")
end

DB.Marker.Create = function(name, type, coords, data, bucket)
    return MySQL.insert.await("INSERT INTO `markers` (`name`, `type`, `coords`, `data`, `bucket`) VALUES (?, ?, ?, ?, ?)", {
        name,
        type,
        json.encode(coords),
        json.encode(data),
		bucket
    })
end

DB.Marker.Update = function(name, type, coords, data, bucket)
    return MySQL.update.await("UPDATE `markers` SET `type` = ?, `coords` = ?, `data` = ?, `bucket` = ? WHERE `name` = ?", {
        type,
        json.encode({ x = coords.x, y = coords.y, z = coords.z }),
        json.encode(data),
		bucket,
        name
    })
end

DB.Marker.Delete = function(name)
    return MySQL.query.await("DELETE FROM `markers` WHERE `name` = ?", { name })
end
