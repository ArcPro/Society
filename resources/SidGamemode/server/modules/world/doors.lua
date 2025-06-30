Callbacks.Register("doors:all", function(source)
	return DB.Door.All()
end)

Events.Register("doors:create", function(source, model, coords, doorType, job)
	local id = DB.Door.Create(model, coords, doorType, job)
	Events.TriggerClient("doors:create", -1, DB.Door.Get(id))
end)

Events.Register("doors:toggleLock", function(source, id, lock)
	DB.Door.ToggleLock(id, lock)

	Events.TriggerClient("doors:toggleLock", -1, id, lock)
end)

Events.Register("doors:update", function(source, door)
	if door.double then
		door.double[1].entity = nil
		door.double[2].entity = nil
	end

	if door.auto and not door.doorRate then
		door.doorRate = 5.0
	end

	DB.Door.Update(door.id, door.model, door.position, door.job, door.locked, door.doorType, door.double, door.doorRate, door.auto)

	Events.TriggerClient("doors:update", -1, door)
end)

Events.Register("doors:delete", function(source, id)
	DB.Door.Delete(id)

	Events.TriggerClient("doors:delete", -1, id)
end)

Events.Register("doors:addDoorToGroup", function(source, door)
	DB.Door.Update(door.id, door.model, door.position, door.job, door.locked, door.doorType, door.double, door.doorRate, door.auto)

	
	Events.TriggerClient("doors:delete", -1, door.id)
	Wait(10.0)
	Events.TriggerClient("doors:create", -1, DB.Door.Get(door.id))
end)
