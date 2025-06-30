SharedModules = SharedModules or {}
SharedModules.Vehicles = {}

function SharedModules.Vehicles:GetRealPlate(entity)

	if not DoesEntityExist(entity) then
		return nil
	end

	if (
		NetworkGetNetworkIdFromEntity(entity) and Entity(entity)
		and Entity(entity).state.real_plate
	) then
		return Entity(entity).state.real_plate
	end

	return GetVehicleNumberPlateText(entity)
end

function SharedModules.Vehicles:GetFirstFreeSeat(veh)
    for i=-1, 2 do
        if not DoesEntityExist(GetPedInVehicleSeat(veh, i)) then
            return i
        end
    end
end

function SharedModules.Vehicles:GetSeatPedIsSitting(vehicle, ped)
    for i=-1, 6 do
        if GetPedInVehicleSeat(vehicle, i) == ped then
			return i
		end
    end

	return nil
end
