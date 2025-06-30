DB = DB or {};
DB.PostOPOrder = {}

DB.PostOPOrder.Get = function(id)
    return MySQL.single.await("SELECT * FROM `postop_orders` WHERE `id` = ?", { id })
end

DB.PostOPOrder.All = function()
    return MySQL.query.await("SELECT id, sender FROM `postop_orders`")
end

DB.PostOPOrder.Create = function(sender, content)
    return MySQL.insert.await("INSERT INTO `postop_orders` (`sender`, `content`, `created_at`) VALUES (?, ?, ?)", {
        sender,
        json.encode(content),
        Date.format('%Y-%m-%d %H:%M:%S', Date.timestamp()),
    })
    
end

DB.PostOPOrder.Delete = function(id)
    return MySQL.query.await("DELETE FROM `postop_orders` WHERE `id` = ?", { id })
end
