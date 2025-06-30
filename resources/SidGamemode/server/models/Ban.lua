DB = DB or {}
DB.Ban = {}

DB.Ban.All = function()
    return MySQL.query.await("SELECT * FROM `bans` ORDER BY `expiration`")
end

DB.Ban.Get = function(discord)
    return MySQL.single.await("SELECT * FROM `bans` WHERE `discord` = ? ORDER BY `expiration` DESC LIMIT 1", { discord })
end

DB.Ban.Create = function(discord, reason, expiration)
    return MySQL.insert.await("INSERT INTO `bans` (`discord`, `reason`, `expiration`) VALUES (?, ?, ?)", {
        discord,
        reason,
        expiration
    })
end

DB.Ban.Update = function(id, reason, expiration)
    return MySQL.update.await("UPDATE `bans` SET `reason` = ?, `expiration` = ? WHERE `license` = ? OR `discord` = ? OR `ip` = ?", {
        reason,
        expiration,
        id, id, id
    })
end

DB.Ban.Delete = function(id)
    return MySQL.query.await("DELETE FROM `bans` WHERE `discord` = ?", { id })
end
