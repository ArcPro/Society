local function CreateQuickAccessBind(index)
	local key = index == 10 and "0" or tostring(index)
	local inventorySlot = index == 10 and "9" or tostring(index - 1)

    Utils.KeyRegister(key, "inventory_quick_" .. key, "Accès rapide inventaire " .. key, function()
        -- if IsControlPressed(0, 21) == false then return end

        local item = player:inventory():findItem(function (item)
			return item.slot == inventorySlot and item.metadata.category == 'other'
        end)

        if not item then return end

		item.quantity = 1
		ClientModules.Inventory:UseItem(item)

    end)
end

for i = 1, 10 do
    CreateQuickAccessBind(i)
end

Citizen.CreateThread(function()
	while true do
		if IsControlPressed(0, 21) or ClientModules.Admin.Noclip.enabled then
			DisableControlAction(0, 157, true)
			DisableControlAction(0, 158, true)
			DisableControlAction(0, 159, true)
			DisableControlAction(0, 160, true)
			DisableControlAction(0, 161, true)
			DisableControlAction(0, 162, true)
			DisableControlAction(0, 163, true)
			DisableControlAction(0, 164, true)
			DisableControlAction(0, 165, true)
		end

		Citizen.Wait(0)
	end
end)
