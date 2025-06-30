DB = DB or {}
DB.Tablet = {}

DB.Tablet.All = function()
    return MySQL.query.await("SELECT tablet.id AS id, name FROM `tablet` JOIN `groups` ON groups.id = tablet.owner")
end

DB.Tablet.Get = function(id)
    return MySQL.single.await("SELECT * FROM `tablet` WHERE `id` = ?", { id })
end

DB.Tablet.Create = function(owner)
    return MySQL.insert.await("INSERT INTO `tablet` (`owner`, `content`, `total_orders`, `total_spent`) VALUES (?, '[]', 0, 0)", { owner })
end

DB.Tablet.Update = function(id, owner, content, total_orders, total_spent)
    return MySQL.update.await("UPDATE `tablet` SET `owner` = ?, `content` = ?, `total_orders` = ?, `total_spent` = ? WHERE `id` = ?", {
		owner,
        json.encode(content),
        total_orders,
        total_spent,
        id
    })
end

DB.Tablet.Delete = function(id)
    return MySQL.query.await("DELETE FROM `tablet` WHERE `id` = ?", { id })
end
