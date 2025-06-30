ClientModules = ClientModules or {}
ClientModules.Illegal = ClientModules.Illegal or {}
ClientModules.Illegal.Orders = {}
ClientModules.Illegal.Orders.Initialized = false
ClientModules.Illegal.Orders.CurrentTablet = nil

---@param items string[]
---@return { name: string, image: string, price: integer }[]
function ClientModules.Illegal.Orders:ParseItems(items)
	local parsedItems = {}
	local currentItem = nil

	for item, quantity in pairs(items) do
		currentItem = Item.Get(item)

		if currentItem ~= nil then
			table.insert(parsedItems, {
				price = SharedModules.Variables:Get("items", currentItem.name),
				image = currentItem.name,
				name = currentItem.label,
				quantity = quantity,
			})
		end
	end

	return parsedItems
end

function ClientModules.Illegal.Orders:OpenTablet(id)
	if self.CurrentTablet ~= nil then return end

	self.CurrentTablet = id

	UI:Toggle("tablet_illegal", true, {
		items = self:ParseItems(Callbacks.Trigger("order:getTabletCart", id) or {})
	}, true, false, true)

	Citizen.CreateThread(function()
		ClientModules.Misc.Animations:Play("tablet")

		while self.CurrentTablet ~= nil do
			Citizen.Wait(100)
		end

		ClientModules.Misc.Animations:Stop()
	end)
end

function ClientModules.Illegal.Orders:CloseTablet()
	UI:Toggle("tablet_illegal", false, {}, false, false, false)
	self.CurrentTablet = nil
end

---@return integer | nil
function ClientModules.Illegal.Orders:CreateTablet()
	return Callbacks.Trigger("order:createTablet")
end

---@param cart { item: string, quantity: integer }[]
---@return boolean
function ClientModules.Illegal.Orders:CreateOrder(cart)
	local ethData = exports["lb-phone"]:GetOwnedCoin("ethereum")
	local orderPrice = 0

	for k, v in pairs(cart) do
		orderPrice += v.quantity * SharedModules.Variables:Get("items", v.item)
	end

	-- Check if player has enough ethereum
	if (ethData.owned or 0) < (orderPrice / ethData.current_price) then
		UI:AddNotification("basic", "~r~Vous n'avez pas assez d'ethereum dans votre wallet.~s~", "basic", 5000)
		return false
	end

	return Callbacks.Trigger("order:create", self.CurrentTablet, cart, ethData.current_price) or false
end

function ClientModules.Illegal.Orders:RegisterUICallbacks()
	UI:RegisterCallback("tablet_illegal:order", function(data, cb)
		local parsedCart = {}

		for k, item in pairs(data.cart) do
			table.insert(parsedCart, { quantity = item.quantity, item = item.image })
		end

		cb(self:CreateOrder(parsedCart))
	end)

	UI:RegisterCallback("tablet_illegal:closed", function(data, cb)
		TriggerScreenblurFadeOut(250.0)
		self.CurrentTablet = nil
		cb(true)
	end)
end

function ClientModules.Illegal.Orders:Initialize()
	if self.Initialized == true then return end

	self:RegisterUICallbacks()

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Illegal.Orders:Initialize()
end)
