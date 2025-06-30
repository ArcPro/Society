Security = Security or {}
Security.Checkers = Security.Checkers or {}

Security.Checkers.Spectate = function()
	if Security.IsAllowed("spectate") then return end

    if NetworkIsInSpectatorMode() then
        Events.TriggerServer("security:flag", "Spectate", "NetworkIsInSpectatorMode: true")
    end
end
