Item.RegisterUsable("wheelchair", function(item, entity, coords)
	if coords == nil then
		coords = GetEntityCoords(PlayerPedId(), true) + GetEntityForwardVector(PlayerPedId()) * 2.0
	end

	if Math.Distance(player:position(), coords) > 2.0 then
		UI:AddNotification("basic", "~r~Trop loin.~s~", "info", 5000)
		return
	end

    ClientModules.Misc.Animations:Play("pickup")

    local chair = ClientModules.Vehicles:Create(GetHashKey("iak_wheelchair"), coords, player:heading(), nil, nil, nil, true)

	Utils.RealWait(1000)

	ClientModules.Vehicles.Actions:Call("lock_doors", chair, { Config.VehicleDoors.OPEN })
    SharedModules.Entities:SetStatebag(chair, "pickupItem", "wheelchair")

    return chair ~= nil
end, "ground")
