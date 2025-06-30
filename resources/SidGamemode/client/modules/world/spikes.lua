local nearestSpike = nil

local tyres = {
	{bone = "wheel_lf", index = 0},
	{bone = "wheel_rf", index = 1},
	{bone = "wheel_lm", index = 2},
	{bone = "wheel_rm", index = 3},
	{bone = "wheel_lr", index = 4},
	{bone = "wheel_rr", index = 5}
}

local currentVehicle = nil
local ped = PlayerPedId()

Citizen.CreateThread(function()
    while true do
		ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, false) then
            currentVehicle = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(currentVehicle, -1) == ped then
                local vehicleCoords = GetEntityCoords(currentVehicle, false)
                local spike = GetClosestObjectOfType(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 10.0, GetHashKey("p_ld_stinger_s"), false, false, false)

                if DoesEntityExist(spike) then
					nearestSpike = {
						coords = GetEntityCoords(spike, false),
						entity = spike,
					}
				end
            else
                nearestSpike = nil
            end
        else
            nearestSpike = nil
        end

        Citizen.Wait(500)
    end
end)

Citizen.CreateThread(function()
	local tirePos = nil

	while true do
		if nearestSpike ~= nil then
            for _, tyre in pairs(tyres) do
                tirePos = GetWorldPositionOfEntityBone(currentVehicle, GetEntityBoneIndexByName(currentVehicle, tyre.bone))

                if Math.Distance(tirePos, nearestSpike.coords) < 1.8 then
                    if not IsVehicleTyreBurst(currentVehicle, tyre.index, true) or IsVehicleTyreBurst(currentVehicle, tyre.index, false) then
                        SetVehicleTyreBurst(currentVehicle, tyre.index, false, 1000.0)
                    end
                end
            end
        end

        Citizen.Wait(0)
	end
end)
