Item.RegisterUsable("hanger", function(item)
	player:metadata().useOutfit = true

	Events.TriggerServer("player:update", "metadata", player:metadata())

	ClientModules.Inventory:Refresh()
	return true
end)
