Security = Security or {}
Security.Checkers = Security.Checkers or {}

--[[
Security.Checkers.Weapons = function()
	local weapon = GetSelectedPedWeapon(PlayerPedId())
	local weaponGroup = GetWeapontypeGroup(weapon)
    if IsPedInAnyVehicle(PlayerPedId(), false) == false and weapon ~= `WEAPON_UNARMED` and weapon ~= `WEAPON_FIREHOSE` and weapon ~= 966099553 then

		if weaponGroup == GetHashKey("GROUP_THROWN") or weaponGroup == GetHashKey("GROUP_PARACHUTE") then
			return
		end

        if #player:inventory():findItems(function(i) return i.metadata.onHand end) == 0 then
			Citizen.Wait(500)

			if #player:inventory():findItems(function(i) return i.metadata.onHand end) == 0 then
				Events.TriggerServer("security:flag", "Give d'arme", ("A une arme dans les mains sans l'avoir équipé avec l'inventaire (%s)"):format(weapon))
			end
        end
    end
end
]]
