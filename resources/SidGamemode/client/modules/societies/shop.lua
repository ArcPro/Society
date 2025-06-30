local function formatData(data)
    local formatted = {
		buttonText = data.buttonText,
        society = data.society,
        categories = {},
    }

	local currentItem = nil

    for category, items in pairs(data.shop or {}) do
        formatted.categories[category] = {}

        for _, item in pairs(items) do
			currentItem = Item.Get(item)

			if currentItem ~= nil then
				table.insert(formatted.categories[category], {
					price = SharedModules.Variables:Get("items", item),
					label = Item.Get(item).label,
					name = item,
				})
			end
        end
    end

    return formatted
end

Events.Register("shop:toggle", function(source, data, toggle)
    UI:Toggle("shop", toggle, formatData(data), toggle, false, toggle)
    ToggleRadar(not toggle)

	if not data.useTablet then return end

    if toggle then
        ClientModules.Misc.Animations:Play('tablet2')
    else
        ClientModules.Misc.Animations:Stop()
    end
end)

UI:RegisterCallback("shop:closed", function(data, cb)
    TriggerScreenblurFadeOut(250.0)
    ToggleRadar(true)
    ClientModules.Misc.Animations:Stop()
end)

UI:RegisterCallback("shop:order", function(data, cb)
	Events.Trigger("shop:toggle", {}, false)

    if data.society == "postop" then
        local order = {}

        for _, cartItem in pairs(data.cart) do
            order[cartItem.item.name] = (order[cartItem.item.name] or 0) + cartItem.quantity
        end

        local orderId = Callbacks.Trigger("postop:createOrder", order)

        if orderId == nil then
            UI:AddNotification("basic", "~r~Une erreur s'est produite~s~", "info", 5000)
            return
        end

        UI:AddNotification(
            "society",
            ("Votre commande a été passée avec succés, merci pour votre confiance !\n\nRéférence commande: ~b~%d~s~"):format(orderId),
            "postop",
            7500,
            "Post OP"
        )

	elseif data.society == "247" then
		local price, weight = 0, 0
		for _, cartItem in pairs(data.cart) do
			price = price + cartItem.quantity * cartItem.item.price
			weight = weight + Item.Get(cartItem.item.name).weight * cartItem.quantity
        end

		if player:inventory():free_weight() < weight or player:inventory():freeSlots("other") < #data.cart then
			UI:AddNotification("basic", "~r~Pas assez de place.~s~", "info", 5000)
			return
		end

		PaymentPopup(price, function()
			for _, cartItem in pairs(data.cart) do
				player:inventory():addItem(Item.Create(cartItem.item.name, {}, cartItem.quantity))
				Utils.RealWait(250)
			end
		end, {type = "card", iban = "24/7"})
    end

    cb(true)
end)
