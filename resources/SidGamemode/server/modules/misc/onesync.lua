Events.Register("onesync:update", function(_, id, key, value)
    OnesyncPlayer(id).state:set(key, value, true)
end)

Events.Register("onesync:updateEntity", function(_, netId, key, value)
    SharedModules.Entities:SetStatebag(netId, key, value)
end)

Events.Register("onesync:globalState", function(source, key, value)
	local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.DEV then return end

    GlobalState[key] = value
end)
