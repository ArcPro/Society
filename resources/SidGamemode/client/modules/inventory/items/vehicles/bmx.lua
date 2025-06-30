Item.RegisterUsable("bmx", function(item, entity, coords)
	if coords == nil then
		coords = GetEntityCoords(PlayerPedId(), true) + GetEntityForwardVector(PlayerPedId()) * 1.5
	end

	if Math.Distance(player:position(), coords) > 2.0 then
		UI:AddNotification("basic", "~r~Trop loin.~s~", "info", 5000)
		return
	end

	ClientModules.Misc.Animations:Play("pickup")

	local bmx = ClientModules.Vehicles:Create(GetHashKey("bmx"), coords, player:heading(), nil, nil, nil, true)

	Utils.RealWait(1000)

	ClientModules.Vehicles.Actions:Call("lock_doors", bmx, { Config.VehicleDoors.OPEN })
    SharedModules.Entities:SetStatebag(bmx, "pickupItem", "bmx")

    return bmx ~= nil
end, "ground")
