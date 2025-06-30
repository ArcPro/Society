Callbacks.Register("group:get", function(source, id)
	return DB.Group.Get(id)
end)

Callbacks.Register("group:create", function(source, name, label)
	local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.HM then return end

	return DB.Group.Create(name, label)
end)

Callbacks.Register("group:all", function(source, id)
    return DB.Group.All()
end)

Events.Register("group:update", function(source, id, name, label)
	local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.HM then return end

    DB.Group.Update(id, name, label)
end)

Events.Register("group:delete", function(source, id)
    local player = Players.Get(source)

    if player == nil or player:permissions() < Config.Permissions.HM then return end

    DB.Group.Delete(id)
end)
