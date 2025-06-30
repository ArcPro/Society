---@param src integer | nil
---@param id number | string
---@param action "update" | "remove"
---@param slot string
---@param item Item
Events.Register("inventory:synchronize", function(src, id, action, slot, item)
	local quantity = item.quantity
	local inventory = nil

	if ClientModules.Inventory.rightPanel ~= nil and ClientModules.Inventory.rightPanel:id() == id then
		inventory = ClientModules.Inventory.rightPanel
	elseif player:inventory():id() == id then
		inventory = player:inventory()
	else
		return
	end

	if action ~= "remove" and action ~= "update" then
		return Console.Error(("Tried to perform action (%s) on invalid inventory (id: %s)"):format(type, tostring(id)))
	end

	local found, baseQuantity = false, 0
	for idx, inventoryItem in pairs(inventory:content()) do
		if inventoryItem.slot == slot and inventoryItem.metadata.category == item.metadata.category then

			baseQuantity = inventoryItem.quantity

			if action == "remove" then
				table.remove(inventory:content(), idx)
			else
				inventory:content()[idx] = Functions.DeepCopy(item)
			end

			found = true
			break
		end
	end

	if item.name == "phone" then
		if action == "remove" then
			Events.TriggerExternal("lb-phone:itemRemoved")
		else
			Events.TriggerExternal("lb-phone:itemAdded", item.metadata.number)
		end
	end

	if found == false and action == "update" then
		table.insert(inventory:content(), item)
	end

	Citizen.Wait(50)
	ClientModules.Inventory:Refresh()

	if id ~= player:inventory_id() then return end

	item.quantity = baseQuantity - item.quantity

	local previewType = "add"

	if item.quantity > 0 then
		previewType = "remove"
	end

	item.quantity = math.abs(item.quantity)

	if item.quantity ~= 0 then
		UI:SendMessage('itemPreview', {
			type = previewType,
			item = item,
		})
	elseif action == "remove" and item.quantity == 0 then
		item.quantity = baseQuantity

		UI:SendMessage('itemPreview', {
			type = "remove",
			item = item,
		})
	end

	if Item.IsWeapon(item.name) and id == player:inventory_id() then
		local group = GetWeapontypeGroup(Item._weapons[item.name].model)

		if item.metadata.id == nil and group ~= `GROUP_THROWN` and group ~= `GROUP_PARACHUTE` and group ~= `GROUP_FIREEXTINGUISHER` and group ~= `GROUP_MELEE` then
			local newItem = Functions.DeepCopy(item)
			newItem.metadata.id = math.random(0, 2147483647)

			player:inventory():updateItem(item, newItem)
		end

		if action == "remove" then
			if group == `GROUP_THROWN` then
				SetPedAmmo(PlayerPedId(), Item._weapons[item.name].model, ClientModules.Weapons:GetTotalQuantity(item.name))
				SetAmmoInClip(PlayerPedId(), Item._weapons[item.name].model, ClientModules.Weapons:GetTotalQuantity(item.name))

			end

			if player:inventory():findItem(function(i) return i.name == item.name end) == nil then
				ClientModules.Weapons.OnBack:Detach(Item._weapons[item.name].model)

				RemoveWeaponFromPed(PlayerPedId(), Item._weapons[item.name].model)
			end
		else
			local ammo = item.metadata.ammo or 0

			if group == `GROUP_THROWN` or group == `GROUP_PARACHUTE` then
				ammo = item.quantity
			end

			if HasPedGotWeapon(PlayerPedId(), Item._weapons[item.name].model, false) == false then
				GiveWeaponToPed(PlayerPedId(), Item._weapons[item.name].model, ammo, false, false)
				ClientModules.Weapons.OnBack:Attach(Item._weapons[item.name].model)
			elseif group == `GROUP_THROWN` then
				SetPedAmmo(PlayerPedId(), Item._weapons[item.name].model, ClientModules.Weapons:GetTotalQuantity(item.name))
				SetAmmoInClip(PlayerPedId(), Item._weapons[item.name].model, ClientModules.Weapons:GetTotalQuantity(item.name))
			end
		end
	end
end)
