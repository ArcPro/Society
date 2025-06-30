Security = Security or {}
Security.Checkers = Security.Checkers or {}

Security.Checkers.Invisibility = function()
    local ped = PlayerPedId()

    if Security.IsAllowed("invisible") then return end

	local currentVehicle = GetVehiclePedIsIn(ped, false)

	if currentVehicle and GetPedInVehicleSeat(currentVehicle, -1) ~= PlayerPedId() then
		return
	end

    if not IsEntityVisible(ped) and not IsEntityVisibleToScript(ped) then
		Citizen.Wait(1000)

		if not IsEntityVisible(ped) and not IsEntityVisibleToScript(ped) then
			return Events.TriggerServer(
				"security:flag",
				"Invisibilité",
				("IsEntityVisible: %s, IsEntityVisibleToScript: %s"):format(tostring(IsEntityVisible(ped)), tostring(IsEntityVisibleToScript(ped)))
			)
		end
    end

    if (GetEntityAlpha(ped) <= 150 and GetEntityAlpha(ped) ~= 0) then
        Citizen.Wait(1000)

		if (GetEntityAlpha(ped) <= 150 and GetEntityAlpha(ped) ~= 0) then
			return Events.TriggerServer(
				"security:flag",
				"Invisibilité",
				("EntityAlpha: %d"):format(GetEntityAlpha(ped))
			)
		end
    end
end
