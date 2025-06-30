Events.Register("admin:register", function(source, id)

	local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.MOD then return end
	Events.TriggerClient("register:toggle", id)
end)
