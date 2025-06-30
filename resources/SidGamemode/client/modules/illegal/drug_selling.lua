ClientModules = ClientModules or {}
ClientModules.Illegal = ClientModules.Illegal or {}
ClientModules.Illegal.DrugSelling = {}

function ClientModules.Illegal.DrugSelling:GetDrugsInInventory()
	return player:inventory():findItems(function(item)
		return item.name:find("drug_") and item.name ~= "drug_test"
	end)
end

function ClientModules.Illegal.DrugSelling:GetDrugInInventory(drug, quantity)
	return player:inventory():findItem(function(item)
		return item.name == drug and item.quantity == quantity
	end)
end

function ClientModules.Illegal.DrugSelling:CanSellToThisEntity(entity)
	if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 2.0 then
		UI:AddNotification("basic", "~r~Trop loin.~s~", "info", 5000)
		return false
	end

	if (
		not Zones.IsPlayerIn("drugs")
		or Entity(entity).state.drug_sold == true
		or not IsPedOnFoot(PlayerPedId())
		or IsPedDeadOrDying(entity, true)
	) then
		UI:AddNotification("basic", "~r~Impossible de vendre à cette personne.~s~", "info", 5000)
		return false
	end

	return true
end

function ClientModules.Illegal.DrugSelling:Sell(entity, drug, owned_quantity)
	print(ClientModules.Illegal:CheckForPolice("drug_selling_cops"))
	if ClientModules.Illegal:CheckForPolice("drug_selling_cops") == false then return end

	if self:CanSellToThisEntity(entity) == false then return end

	local item = self:GetDrugInInventory(drug, owned_quantity)

	if item == nil then
		return UI:AddNotification("basic", "~r~Vous n'avez pas cette drogue sur vous.~s~", "info", 5000)
	end

	local random = math.random(1, 10)
	local playerPed = PlayerPedId()

	SharedModules.Entities:SetStatebag(entity, "drug_sold", true)

	if random == 7 then
		UI:AddNotification("basic", "~r~Cette personne ne semble pas intéressée.~s~", "info", 5000)
		ClientModules.Illegal:AlertPolice("Vente de drogue")
		return
	end

	TaskTurnPedToFaceEntity(playerPed, entity, 500)
	TaskTurnPedToFaceEntity(entity, playerPed, 500)
	FreezeEntityPosition(PlayerPedId(), true)
	TaskStandStill(entity, 3000)

	ClientModules.Misc.Animations:Play("point")
	Utils.RealWait(1000)

	ClientModules.Misc.Animations:Play("pointdown")
	Utils.RealWait(1000)

	ClientModules.Misc.Animations:Play("give")
	Utils.RealWait(1500)

	local price = (SharedModules.Variables:Get("items", item.name) or 100) * (1 + (Zones.GetCurrent():data()[item.name] and (Zones.GetCurrent():data()[item.name] / 100) or 0.0))

	item.quantity = math.random(1, item.quantity > 4 and 4 or item.quantity)

	if player:inventory():removeItem(item) == false then
		return UI:AddNotification("basic", "~r~Une erreur s'est produite.~s~", "info", 5000)
	end

	player:inventory():addItem(Item.Create("money", {}, item.quantity * math.random(math.floor(price * 0.925), math.floor(price * 1.075))))

	-- 1/10 to have 4, so if yes, then call police
	if random == 4 then
		ClientModules.Illegal:AlertPolice("Vente de drogue")
	end

	SharedModules.Log:Create(player:source(), "illegal", "drug_selling", {
		["Zone"] = Zones.GetCurrent():name(),
		["Quantité"] = item.quantity,
		["Drogue"] = item.label,
	})

	Utils.RealWait(1500)
	FreezeEntityPosition(PlayerPedId(), false)
end
