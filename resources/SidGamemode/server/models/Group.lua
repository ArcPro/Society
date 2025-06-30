DB = DB or {}
DB.Group = {}

DB.Group.Get = function(id)
    return MySQL.single.await("SELECT * FROM `groups` WHERE `id` = ?", { id })
end

DB.Group.All = function()
    return MySQL.query.await("SELECT * FROM `groups`", {})
end

DB.Group.Create = function(name, label)
    return MySQL.insert.await("INSERT INTO `groups` (`name`, `label`) VALUES (?, ?)", {
        name,
		label
    })
end

DB.Group.Update = function(id, name, label)
    return MySQL.update.await("UPDATE `groups` SET `name` = ?, `label` = ? WHERE `id` = ?", {
        name,
        label,
        id
    })
end

DB.Group.Delete = function(id)
    return MySQL.query.await("DELETE FROM `groups` WHERE `id` = ?", { id })
end
