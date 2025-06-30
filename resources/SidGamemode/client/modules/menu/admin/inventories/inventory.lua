MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Inventories = MainMenu.Admin.Inventories or {}
MainMenu.Admin.Inventories.Inventory = MainMenu.Admin.Inventories.Inventory or {}

local currentInventory = nil

MainMenu.Admin.Inventories.Inventory.onOpen = function (id)
    currentInventory = Callbacks.Trigger("inventory:get", id)
end

MainMenu.Admin.Inventories.Inventory.Create = function()
    MainMenu.Admin.Inventories.Inventory.Main = Menus:CreateSub(MainMenu.Admin.Inventories.Main, "Inventaire", "default")

    Menus:CreateThread(MainMenu.Admin.Inventories.Inventory.Main, function()
        Menus:IsVisible(MainMenu.Admin.Inventories.Inventory.Main, function()
            if currentInventory == nil then
                return
            end

            Menus:AddButton("Poids max", false, tostring(currentInventory._max_weight), "", function()
                local max_weight = tonumber(Utils.KeyboardInput("Poids max", 5, currentInventory._max_weight))

                if max_weight == nil then
                    return
                end

                currentInventory._max_weight = max_weight

                Events.TriggerServer("inventory:update", currentInventory)
            end)

            Menus:AddButton("Slots", false, tostring(currentInventory._slots), "", function()
                local slots = tonumber(Utils.KeyboardInput("Slots", 5, currentInventory._slots))

                if slots == nil then
                    return
                end

                currentInventory._slots = slots

                Events.TriggerServer("inventory:update", currentInventory)
            end)

            Menus:AddButton("Voir le contenu", false, "", "", function()
				ClientModules.Inventory:Open(currentInventory._id, ("Inventaire #%s"):format(tostring(currentInventory._id)))
            end)

            Menus:AddButton("~r~Supprimer~s~", false, "", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("inventory:delete", currentInventory._id)
					Citizen.Wait(500)

					MainMenu.Admin.Inventories.onOpen()
					Menus:Back()
				end)
            end)
        end)
    end)
end
