DB = DB or {}
DB.Blip = {}

DB.Blip.Get = function(id)
    return MySQL.single.await("SELECT * FROM `blips` WHERE `id` = ?", { id })
end

DB.Blip.All = function()
    return MySQL.query.await("SELECT * FROM `blips`")
end

DB.Blip.Create = function(sprite, color, title, position)
    return MySQL.insert.await("INSERT INTO `blips` (`sprite`, `color`, `title`, `position`) VALUES (?, ?, ?, ?)", {
        sprite,
        color,
        title,
        json.encode(position)
    })
end

DB.Blip.Update = function(id, sprite, color, title, position)
    return MySQL.update.await("UPDATE `blips` SET `sprite` = ?, `color` = ?, `title` = ?, `position` = ? WHERE `id` = ?", {
        sprite,
        color,
        title,
        json.encode(position),
        id
    })
end

DB.Blip.Delete = function(id)
    return MySQL.query.await("DELETE FROM `blips` WHERE `id` = ?", { id })
end
