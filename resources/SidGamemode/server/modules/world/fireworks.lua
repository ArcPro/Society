local presets = {
	{ 1, 2, 3, 4, 9, 10, 11 },
	{ 5, 6, 7, 8 },
	{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 }
}

Events.Register('fireworks', function(source, index)
    local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.DEV then return end

	if presets[index] == nil then return end

	for k, v in pairs(presets[index]) do
		Events.TriggerClient("fireworks:start", -1, v)
	end
end)
