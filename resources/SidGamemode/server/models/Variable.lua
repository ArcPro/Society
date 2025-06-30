DB = DB or {}
DB.Variable = {}

DB.Variable.All = function()
    return MySQL.query.await("SELECT * FROM `variables`")
end

DB.Variable.List = function()
    return MySQL.query.await("SELECT `name`, `label` FROM `variables`")
end

DB.Variable.Get = function(name)
    return MySQL.single.await("SELECT * FROM `variables` WHERE `name` = ?", { name })
end

DB.Variable.Update = function(name, value)
    return MySQL.update.await("UPDATE `variables` SET `value` = ? WHERE `name` = ?", { value, name })
end

DB.Variable.Create = function(name, label, value)
    GlobalState[name] = value
    return MySQL.insert.await("INSERT INTO `variables` (name, label, value) VALUES (?, ?, ?)", { name, label, value })
end
