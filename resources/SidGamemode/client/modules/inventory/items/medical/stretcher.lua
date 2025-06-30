Item.RegisterUsable("stretcher", function(item, entity, coords)
	coords = coords or (GetEntityCoords(PlayerPedId(), true) + GetEntityForwardVector(PlayerPedId()) * 1.5)

    if Math.Distance(player:position(), coords) > 2.0 then
        UI:AddNotification("basic", "Vous êtes trop loin", "info", 5000)
        return false
    end

	ClientModules.Misc.Animations:Play("pickup")

	return ClientModules.World.Stretcher:Create("lowered", coords, player:heading())
end, "ground")
