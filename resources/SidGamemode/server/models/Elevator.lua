DB = DB or {}
DB.Elevator = {}

DB.Elevator.Get = function(id)
    return MySQL.single.await("SELECT * FROM `elevators` WHERE `id` = ?", { id })
end

DB.Elevator.All = function()
    return MySQL.query.await("SELECT * FROM `elevators`")
end

DB.Elevator.Create = function(name)
    return MySQL.insert.await("INSERT INTO `elevators` (`name`, `tp_points`) VALUES (?, ?)", {
        name,
        json.encode({}),
    })
end

DB.Elevator.Update = function(id, name, tp_points)
    return MySQL.update.await("UPDATE `elevators` SET `name` = ?, `tp_points` = ? WHERE `id` = ?", {
        name,
        json.encode(tp_points),
        id
    })
end

DB.Elevator.Delete = function(id)
    return MySQL.query.await("DELETE FROM `elevators` WHERE `id` = ?", { id })
end
