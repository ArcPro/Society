DB = DB or {}
DB.Inventory = {}

---@param id number | string
---@return Inventory | nil
DB.Inventory.Get = function(id)

    if Inventories._list[id] then
        return Inventories._list[id]
    end

    local result = MySQL.single.await("SELECT * FROM `inventories` WHERE `id` = ?", { id })

    if not result then
        return nil
    end

    if type(result.content) == "string" then
        result.content = json.decode(result.content)
    end

    return Inventory:new({
        id = result.id,
        max_weight = result.max_weight,
        content = result.content,
		slots = result.slots,
        category = result.category
    })
end

DB.Inventory.All = function(filter)
    return MySQL.query.await("SELECT id FROM `inventories` WHERE `id` LIKE ?", { ("%%%s%%"):format(filter) })
end

DB.Inventory.Create = function(max_weight, slots, category)
    return MySQL.insert.await("INSERT INTO `inventories` (`max_weight`, `content`, `slots`, `category`) VALUES (?, '[]', ?, ?)", { max_weight, slots, category })
end

DB.Inventory.Update = function(inventory)
    return MySQL.update.await("UPDATE `inventories` SET `max_weight` = ?, `content` = ?, `slots` = ? WHERE `id` = ?", {
        inventory:max_weight(),
        json.encode(inventory:content()),
		inventory:slots(),
        inventory:id()
    })
end

DB.Inventory.Delete = function(inventory)
    local id;

    if type(inventory) == "number" then
        id = inventory
    else
        id = inventory:id()
    end

    return MySQL.query.await("DELETE FROM `inventories` WHERE `id` = ?", { id })
end
