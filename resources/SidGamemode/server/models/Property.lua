DB = DB or {}
DB.Property = {}

DB.Property.GetAll = function()
    return MySQL.query.await("SELECT id, name, type, owner, position FROM `properties`")
end

DB.Property.Get = function(id)
    return MySQL.single.await("SELECT * FROM `properties` WHERE `id` = ?", { id })
end

DB.Property.Create = function(type, name, owner, position, locked, rent_end, max_weight)
    local inventory_id = DB.Inventory.Create(max_weight or 50, 65)

    return MySQL.insert.await("INSERT INTO `properties` (`type`, `name`, `owner`, `position`, `locked`, `rent_end`, `inventory_id`) VALUES (?, ?, ?, ?, ?, ?, ?)", {
        type,
        name,
        owner,
        json.encode(position),
        locked,
        Date.format('%Y-%m-%d %H:%M:%S', rent_end),
        inventory_id,
    })
end

DB.Property.Update = function(id, type, name, owner, position, locked, rent_end, inventory_id, linked_society, linked_group)
    if rent_end < 0 or rent_end ~= rent_end then
		rent_end = 1
	end

	return MySQL.query.await("UPDATE `properties` SET `type` = ?, `name` = ?, `owner` = ?, `position` = ?, `locked` = ?, `rent_end` = ?, `inventory_id` = ?, `linked_society` = ?, `linked_group` = ? WHERE `id` = ?", {
        type,
        name,
        owner,
        json.encode(position),
        locked,
        Date.format('%Y-%m-%d %H:%M:%S', rent_end),
        inventory_id,
		linked_society,
		linked_group,
        id
    })
end

DB.Property.Delete = function(id)
    return MySQL.query.await("DELETE FROM `properties` WHERE `id` = ?", { id })
end

DB.Property.CleanUp = function()
    return MySQL.query.await("DELETE FROM `properties` WHERE `rent_end` < ?", {
		Date.format("%Y-%m-%d %H:%M:%S", Date.timestamp() - 3 * 24 * 60 * 60)
	})
end
