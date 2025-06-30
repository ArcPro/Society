Events.Register("amber_alert", function(source, text)
	local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.DEV then return end

    exports['lb-phone']:SendAmberAlert(-1, {
		title = "Alerte d'urgence",
		content = text,
		icon = "danger",
	})
end)
