DB = DB or {}
DB.Door = {}

DB.Door.Get = function(id)
    return MySQL.single.await("SELECT * FROM `doors` WHERE `id` = ?", { id })
end

DB.Door.Find = function(model, coords)
	return MySQL.single.await("SELECT * FROM `doors` WHERE `model` = ? AND `position` = ?", { model, json.encode(coords) })
end

DB.Door.All = function()
    return MySQL.query.await("SELECT * FROM `doors`")
end

DB.Door.Create = function(model, position, doorType, job)
    return MySQL.insert.await("INSERT INTO `doors` (`model`, `position`, `doorType`, `job`) VALUES (?, ?, ?, ?)", {
        model,
        json.encode(position),
		doorType,
		job
    })
end

DB.Door.Update = function(id, model, position, job, locked, doorType, double, doorRate, auto)
    return MySQL.update.await("UPDATE `doors` SET `model` = ?, `position` = ?, `job` = ?, `locked` = ?, `doorType` = ?, `double`= ?, `doorRate` = ?, `auto` = ? WHERE `id` = ?", {
        model,
        json.encode(position),
		job,
		locked,
		doorType,
        json.encode(double),
        doorRate,
        auto,
        id
    })
end

DB.Door.ToggleLock = function(id, lock)
    return MySQL.update.await("UPDATE `doors` SET `locked` = ? WHERE `id` = ?", {
        lock,
        id
    })
end

DB.Door.Delete = function(id)
    return MySQL.query.await("DELETE FROM `doors` WHERE `id` = ?", { id })
end
