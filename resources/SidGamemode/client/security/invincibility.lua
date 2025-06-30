Security = Security or {}
Security.Checkers = Security.Checkers or {}

Security.Checkers.Invicibility = function()
    local playerId = PlayerId()
    local retval, bulletProof, fireProof, explosionProof, collisionProof, meleeProof, steamProof, p7, drownProof = GetEntityProofs(PlayerPedId())

    if Security.IsAllowed("godmode") then return end

    if GetPlayerInvincible(playerId) or GetPlayerInvincible_2(playerId) then
        Citizen.Wait(1000)

		if GetPlayerInvincible(playerId) or GetPlayerInvincible_2(playerId) then
			return Events.TriggerServer(
				"security:flag",
				"God mode",
				("GetPlayerInvincible: %s, GetPlayerInvincible_2: %s"):format(tostring(GetPlayerInvincible(playerId)), tostring(GetPlayerInvincible_2(playerId)))
			)
		end
    end

    if retval == 1 and bulletProof == 1 and fireProof == 1 and explosionProof == 1 and collisionProof == 1 and steamProof == 1 and p7 == 1 and drownProof == 1 then
        return Events.TriggerServer("security:flag", "God mode", "Damage proof")
    end

    if not GetEntityCanBeDamaged(PlayerPedId()) then
        return Events.TriggerServer("security:flag", "God mode", "GetEntityCanBeDamaged => false")
    end
end
