
Item.RegisterUsable("fresh_weed", function(item)
	local pooch = player:inventory():findItem(function (_item)
		return _item.name == "pooch"
	end)

	if pooch == nil then
		UI:AddNotification("basic", "~r~Vous n'avez pas de pochons.~s~", "info", 5000)
		return false
	end

	pooch.quantity = 1
	player:inventory():removeItem(pooch)

	if player:inventory():addItem(Item.Create("drug_weed", {}, 1)) == false then
		UI:AddNotification("basic", "~r~Erreur lors de l'ajout de weed à votre inventaire, le pochon vous a été restitué.~s~", "info", 5000)
		player:inventory():addItem(pooch)
		return false
	end

    return true
end)
