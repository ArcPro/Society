ServerModules = ServerModules or {}
ServerModules.Illegal = ServerModules.Illegal or {}
ServerModules.Illegal.Order = {}
ServerModules.Illegal.Order.DeliveryCoords = {
	vector3(-103.755, 1888.692, 197.315 - 0.95),
	vector3(-447.185, 1598.496, 358.417 - 0.95),
	vector3(1502.723, -2127.361, 76.103 - 0.95),
	vector3(-1598.105, 5206.283, 4.310 - 0.95),
	vector3(-869.168, -1087.268, 2.162 - 0.95),
	vector3(769.303, 1278.577, 360.296 - 0.95),
	vector3(2194.600, 5595.500, 53.700 - 0.95),
	vector3(2559.042, 3907.713, 40.663 - 0.95),
	vector3(2702.749, 1719.854, 24.513 - 0.95),
	vector3(275.348, 6788.527, 15.695 - 0.95),
	vector3(497.285, -521.256, 24.761 - 0.95),
	vector3(511.234, -2313.666, 5.917 - 0.95),
	vector3(3823.318, 4442.415, 2.806 - 0.95),
	vector3(493.459, -2800.598, 6.04 - 0.95),
	vector3(206.878, 24.192, 79.192 - 0.95),
}

function ServerModules.Illegal.Order:Create(source, id, cart, eth_price)
	local sender = ("%d%d"):format(math.random(1, 554), math.random(1, 9999))
	local number = exports["lb-phone"]:GetEquippedPhoneNumber(source)
	local tablet = DB.Tablet.Get(id)
	local total = 0

	if tablet == nil then
		Events.TriggerClient("player:notify", source, "basic", "~r~Cette tablette n'existe pas~s~", "info", 5000)
		return
	end

	if type(tablet.content) == "string" then
		tablet.content = json.decode(tablet.content)
	end

	if number == nil then
		Events.TriggerClient("player:notify", source, "basic", "~r~Vous n'avez pas de téléphone actif~s~", "info", 5000)
		return false
	end

	for _, v in pairs(cart) do
		total += v.quantity * SharedModules.Variables:Get("items", v.item)

		if tablet.content[v.item] < v.quantity then
			Events.TriggerClient("player:notify", source, "basic", ("~r~Vous ne pouvez pas commander cette quantité de %s~s~"):format(Item.Get(v.item).label), "info", 5000)
			return
		else
			tablet.content[v.item] = tablet.content[v.item] - v.quantity
		end
	end

	SharedModules.Log:Create(source, "illegal", "order", {
		["ID de la tablette"] = tablet.id,
		["Nombre de commandes avec cette tablette"] = tablet.total_orders,
		["Argent dépensé avec cette tablette"] = tablet.total_spent,
		["Montant de cette commande"] = total,
		["Contenu de la commande"] = cart
	})

	DB.Tablet.Update(tablet.id, tablet.owner, tablet.content, tablet.total_orders + 1, tablet.total_spent + total)

	if exports["lb-phone"]:RemoveCrypto(source, "ethereum", total / eth_price) == false then
		Events.TriggerClient("player:notify", source, "basic", "~r~Une erreur s'est produite~s~", "info", 5000)
	end


	exports["lb-phone"]:SendMessage(sender, number, "Votre commande est en cours de préparation. Nous vous recontactons dès qu'elle est prête.")

	-- Citizen.SetTimeout(60 * math.random(30, 45) * 1000, functio
	Citizen.SetTimeout(10 * 1000, function()
		local pos = self.DeliveryCoords[math.random(1, #self.DeliveryCoords)]

		exports["lb-phone"]:SendMessage(sender, number, "Votre commande est prête, elle vous attend ici.")
		exports["lb-phone"]:SendCoords(sender, number, vector2(pos.x, pos.y))

		for k, v in pairs(cart) do
			ServerModules.Misc.Pickups:Create(Item.Create(v.item, {}, v.quantity), pos, 1, true)
			pos = vector3(pos.x, pos.y, pos.z + 0.1)
		end
	end)

	return true
end

function ServerModules.Illegal.Order:CreateTablet(source)
	local player = Players.Get(source)

	if player == nil or player:group() == nil then return end

	return DB.Tablet.Create(player:group())
end

function ServerModules.Illegal.Order:GetTabletCart(id)
	local tablet = DB.Tablet.Get(id)

	if tablet == nil then
		return {}
	end

	if type(tablet.content) == "string" then
		tablet.content = json.decode(tablet.content)
	end

	return tablet.content
end

function ServerModules.Illegal.Order:RegisterEvents()
	Callbacks.Register("order:create", function(source, id, cart, eth_price)
		return self:Create(source, id, cart, eth_price)
	end)

	Callbacks.Register("order:createTablet", function(source)
		return self:CreateTablet(source)
	end)

	Callbacks.Register("order:getTabletCart", function(source, id)
		return self:GetTabletCart(id)
	end)

	Callbacks.Register("order:getTablet", function(source, id)
		local data = DB.Tablet.Get(id)

		if type(data.content) == "string" then
			data.content = json.decode(data.content)
		end

		return data
	end)

	Callbacks.Register("order:getAllTablets", function(source)
		return DB.Tablet.All()
	end)

	Events.Register("order:updateTablet", function(source, id, owner, content)
		local player = Players.Get(source)
		local tablet = DB.Tablet.Get(id)

		if player == nil or player:permissions() < Config.Permissions.HM or tablet == nil then return end

		DB.Tablet.Update(tablet.id, owner, content, tablet.total_orders, tablet.total_spent)
	end)
end

ServerModules.Illegal.Order:RegisterEvents()
