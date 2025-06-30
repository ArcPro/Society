---@param price number
---@param onSuccess fun()
function PaymentPopup(price, onSuccess, reason)
	if price == 0 then
		return onSuccess()
	end

	UI:Popup("Paiement", ("Vous devez payer $%d. Voulez-vous accepter ?"):format(price), {
		text = "Accepter",
		cb = function()
			UI:Popup("Paiement", ("Vous devez payer $%d. Choisissez un mode de paiement."):format(price), {
				text = "Espèces",
				cb = function()
					local money = player:inventory():findItem(function(item)
						return item.name == "money"
					end)

					if money == nil then
						UI:AddNotification("basic", "~r~Vous ne pouvez pas constituer cette somme", "info", 5000)
						return
					end

					money.quantity = price
					if player:inventory():removeItem(money) == true then
						onSuccess()
					else
						UI:AddNotification("basic", "~r~Vous n'avez pas assez d'argent.~s~", "info", 3000)
					end
				end
			}, {
				text = "Carte bancaire",
				cb = function()
					local cardItems = player:inventory():findItems(function(item)
						return item.name == "credit_card" and item.metadata.linkedAccount ~= nil
					end)

					if #cardItems == 0 then
						return UI:AddNotification("basic", "~r~Vous n'avez pas de carte bancaire.~s~", "info", 3000)
					end

					local cards = {}

					for k, card in pairs(cardItems) do
						table.insert(cards, ("%s (%s)"):format(card.metadata.name ~= nil and card.metadata.name or card.label, card.metadata.linkedAccount))
					end

					table.insert(cards, "Annuler")

					UI:PopupMultiChoice("Paiement", "Choisissez la carte bancaire avec laquelle vous souhaitez payer", cards, function (choice)
						if choice == "Annuler" then 
							UI:AddNotification("basic", "~r~Transaction annulé.~s~", "info", 3000)
						end

						-- Reprocess the choice to get the card id
						choice = tonumber(string.match(choice, "%((%d+)%)"))

						if choice == nil then
							return UI:AddNotification("basic", "~r~Une erreur s'est produite.~s~", "info", 3000)
						end

						---@type BankAccount | nil
						local bankAccount = Bank.GetAccount(choice)
						if (bankAccount == nil) then
							return UI:AddNotification("basic", "~r~Ce compte ne semble pas exister.~s~", "info", 3000)
						end

						local code = Utils.KeyboardInput("Code", 4, "")

						if bankAccount:code() ~= code then 
							return UI:AddNotification("basic", "~r~Code incorrect.~s~", "info", 3000)
						end

						if (bankAccount:balance() < price) then
							return UI:AddNotification("basic", "~r~Vous n'avez pas assez d'argent sur votre compte.~s~", "info", 3000)
						end

						if bankAccount:withdraw(price, true, reason) then
							onSuccess()
						else
							UI:AddNotification("basic", "~r~Une erreur est survenue.~s~", "info", 3000)
						end
					end)
				end
			}, 1)
		end
	}, {
		text = "Refuser",
		cb = function()end
	}, 0)
end

local currentBillTarget = nil

function Bill(serverId)
	local streetName, _ = GetStreetNameAtCoord(player:position().x, player:position().y, player:position().z)

	UI:Toggle("bill", true, {
		location = GetStreetNameFromHashKey(streetName),
		society = player:job().name,
		reason = "Motif de facture",
		date = (Date * 1000),
		editable = true,
		price = 0,
	}, true, false)

	currentBillTarget = serverId

	ClientModules.Misc.Animations:Play("terminal")
end

UI:RegisterCallback("bill:closed", function(data, cb)
	ClientModules.Misc.Animations:Stop()
	cb(true)
end)

UI:RegisterCallback("bill:signAsEmitter", function(data, cb)
	data.emitter = player:lastname()

	UI:SendMessage("bill:update", data)
	cb(true)
end)

UI:RegisterCallback("bill:signAsReceiver", function(data, cb)
	data.receiver = player:lastname()

	local bankAccount = Bank.GetAccount(player:bank_account_id())
	local society = ClientModules.Societies:Find(data.society)
	local paid = true

	if currentBillTarget == nil then return end
	if bankAccount == nil or society == nil or society:bank_account_id() == nil then return end

	if not bankAccount:send(data.price, society:bank_account_id() or -1, {type = "bill", iban = society:label() }) then
		bankAccount:addBill(data.price, ("%s: %s"):format(society:label(), data.reason), tostring(society:bank_account_id()))
		UI:AddNotification("basic", "La facture est à payer à la banque", "info", 5000)
		paid = false
	end

	data.showControls = false

	-- Give bill item to receiver
	player:inventory():addItem(Item.Create("bill", data, 1))

	-- Inform sender if bill has been paid or not
	Events.TriggerServer("bill:sign_response", currentBillTarget, data, paid)

	UI:Toggle("bill", false, {}, false, true)
	ClientModules.Misc.Animations:Stop()
	currentBillTarget = nil
	cb(true)
end)

UI:RegisterCallback("bill:requestReceiverSign", function(data, cb)
	if Math.Distance(player:position(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(currentBillTarget)), true)) > 2.5 then
		UI:AddNotification("basic", "~r~Trop loin.~s~", "info", 5000)
		return
	end

	Events.TriggerServer("bank:bill", currentBillTarget, data)

	UI:Toggle("bill", false, {}, false, true)
	ClientModules.Misc.Animations:Stop()
	currentBillTarget = nil
	cb(true)
end)

Events.Register("bank:bill", function(source, billData, sender)
    local bankAccount = Bank.GetAccount(player:bank_account_id())

    if not bankAccount then return end

	currentBillTarget = sender
	billData.editable = false

	ClientModules.Misc.Animations:Play("terminal")
	UI:Toggle("bill", true, billData, true, false)
end)
