Events.Register("admin:chat", function(source, name, text)

    local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.MOD then return end

    for k, v in pairs(Players._list) do
        if v:permissions() >= Config.Permissions.MOD then
			exports["chat"]:addMessage(v:source(), {
				color = { 255, 255, 255 },
				args = { name, text },
				multiline = true,
			})
        end
    end

end)
