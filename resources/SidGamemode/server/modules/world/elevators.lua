Callbacks.Register("elevator:create", function(source, name)
    local id = DB.Elevator.Create(name)
    Events.TriggerClient("elevator:create", -1, id, name, {})

	return id
end)

Events.Register("elevator:update", function(source, id, name, tp_points)
    DB.Elevator.Update(id, name, tp_points)
    Events.TriggerClient("elevator:update", -1, id, name, tp_points)
end)

Events.Register("elevator:delete", function(source, id)
    DB.Elevator.Delete(id)
    Events.TriggerClient("elevator:delete", -1, id)
end)

Callbacks.Register("elevator:get", function(source, id)
    return DB.Elevator.Get(id)
end)

Callbacks.Register("elevator:all", function(source)
    return DB.Elevator.All()
end)
