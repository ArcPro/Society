RegisterCommand("stuck", function()
	Events.TriggerServer("bucket:change", 1)

	player:metadata().instance = 1
	Events.TriggerServer('player:update', 'metadata', player:metadata())
end, false)

Events.TriggerExternal("chat:addSuggestion", "/stuck", "Permet de sortir d'une instance buggée.", {})
