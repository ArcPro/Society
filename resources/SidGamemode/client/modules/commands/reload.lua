RegisterCommand("reload", function()
	SetFocusPosAndVel(0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
	Utils.RealWait(1000)
	ClearFocus()
end, false)

Events.TriggerExternal("chat:addSuggestion", "/reload", "Permet de recharger les textures.", {})
