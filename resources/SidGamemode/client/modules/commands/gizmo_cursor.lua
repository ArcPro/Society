RegisterCommand("gizmo_cursor", function()
	EnterCursorMode();
end, false)

Events.TriggerExternal("chat:addSuggestion", "/gizmo_cursor", "Permet de réparer gizmo.", {})
