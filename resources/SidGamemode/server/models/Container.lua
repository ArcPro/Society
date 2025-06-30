DB = DB or {}
DB.Container = {}

DB.Container.Get = function(id)
    return MySQL.single.await("SELECT * FROM `containers` WHERE `id` = ?", { id })
end

DB.Container.All = function()
    return MySQL.query.await("SELECT * FROM `containers`")
end

DB.Container.Create = function(coords, rotation, reward)
    return MySQL.insert.await("INSERT INTO `containers` (`coords`, `rotation`, `reward`) VALUES (?, ?, ?)", {
		json.encode(coords),
		json.encode(rotation),
		json.encode(reward)
	})
end

DB.Container.Update = function(id, coords, rotation, reward)
    return MySQL.update.await("UPDATE `containers` SET `coords` = ?, `rotation` = ?, `reward` = ? WHERE `id` = ?", {
        json.encode(coords),
		json.encode(rotation),
		json.encode(reward),
        id
    })
end

DB.Container.Delete = function(id)
    return MySQL.query.await("DELETE FROM `containers` WHERE `id` = ?", { id })
end
