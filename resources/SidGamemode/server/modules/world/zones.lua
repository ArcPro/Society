Callbacks.Register("zone:create", function(source, name, coords, size, action, data, temporary)

	local id = math.random(1, 2147483647)

	if temporary == false then
		id = DB.Zone.Create(name, coords, size, action, data)
	end

    Events.TriggerClient("zone:create", -1, id, name, coords, size, action, data)

	return id
end)

Events.Register("zone:update", function(source, id, name, coords, size, action, data)
    Events.TriggerClient("zone:update", -1, id, name, coords, size, action, data)
    DB.Zone.Update(id, name, coords, size, action, data)
end)

Events.Register("zone:delete", function(source, id)
    Events.TriggerClient("zone:delete", -1, id)
    DB.Zone.Delete(id)
end)

Callbacks.Register("zone:all", function(source)
    return DB.Zone.All()
end)
