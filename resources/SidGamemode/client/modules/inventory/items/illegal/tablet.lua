Item.RegisterUsable("tablet", function(item)
	if item.metadata.id == nil then
		local newItem = Functions.DeepCopy(item)
		newItem.metadata.id = ClientModules.Illegal.Orders:CreateTablet()

		player:inventory():updateItem(item, newItem)
	end

	if Zones.IsPlayerIn("tablet") == false then
		UI:AddNotification("basic", "~r~Connexion au réseau impossible~s~", "info", 5000)
		return false
	end

	ClientModules.Illegal.Orders:OpenTablet(item.metadata.id)

    return false
end)