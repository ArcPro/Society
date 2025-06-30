Security = Security or {}
Security.Checkers = Security.Checkers or {}

Security.Checkers.Ped = function()
    if GetEntityModel(PlayerPedId()) ~= GetHashKey(player:skin():model()) then

		Citizen.Wait(1000)

		if GetEntityModel(PlayerPedId()) ~= GetHashKey(player:skin():model()) then
			Events.TriggerServer("security:flag", "Changement de ped", "Détecté avec un autre ped que celui qu'il devrait avoir")
		end
    end
end
