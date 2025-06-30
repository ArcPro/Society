function GetClosestAliveNPC(coords)
	local pedPool = GetGamePool("CPed")
	local closestDist = -1
	local closestPed = -1
	local distance = nil

	coords = coords or GetEntityCoords(PlayerPedId(), true)

	for _, ped in pairs(pedPool) do
		if not IsPedAPlayer(ped) and not IsPedDeadOrDying(ped, true) then
			distance = #(coords - GetEntityCoords(ped, true))

			if closestDist == -1 or distance < closestDist then
				closestDist = distance
				closestPed = ped
			end
		end
	end

	return closestPed, closestDist
end
