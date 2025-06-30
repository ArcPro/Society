Item.RegisterUsable("skateboard", function(item, entity, coords)
	if coords == nil then
		coords = GetEntityCoords(PlayerPedId(), true) + GetEntityForwardVector(PlayerPedId()) * 1.5
	end

	if Math.Distance(player:position(), coords) > 2.0 then
		UI:AddNotification("basic", "~r~Trop loin.~s~", "info", 5000)
		return
	end

	exports["electric-skateboard"]:PlaceSkate()

	return true
end, "ground")
