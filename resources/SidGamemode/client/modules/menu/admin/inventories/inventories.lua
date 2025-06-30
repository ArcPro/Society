MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Inventories = MainMenu.Admin.Inventories or {}

local inventories = {}

MainMenu.Admin.Inventories.onOpen = function (filter)
    inventories = Callbacks.Trigger("inventory:all", filter) or {}

    table.sort(inventories, function(a, b)
        return a < b
    end)
end

MainMenu.Admin.Inventories.Create = function()
    MainMenu.Admin.Inventories.Main = Menus:CreateSub(MainMenu.Admin.Main, "Inventaires", "default")
    MainMenu.Admin.Inventories.Inventory.Create()

    Menus:CreateThread(MainMenu.Admin.Inventories.Main, function()
        Menus:IsVisible(MainMenu.Admin.Inventories.Main, function()
            Menus:AddButton("Rechercher", false, "🔍", "", function()
                local filter = Utils.KeyboardInput("Recherche", 50, "")

                if filter == "" or filter == nil then
                    filter = nil
                    inventories.filtered = {}
                    return
                end

				filter = filter:lower()

                inventories = Callbacks.Trigger("inventory:all", filter) or {}
            end)

            Menus:AddButton("Créer", false, "➕", "", function()
                local max_weight = tonumber(Utils.KeyboardInput("Poids max", 50, ""))

                if max_weight == "" or max_weight == nil then
                    max_weight = 0
                end

                UI:AddNotification("basic", ("Inventaire ~b~%s~s~ créé"):format(Callbacks.Trigger("inventory:create", max_weight)), "info", 5000)
                MainMenu.Admin.Inventories.onOpen()
            end)

            if #inventories == 0 then return end

            Menus:AddSeparator("Inventaires")

            for _, inventory in pairs(inventories) do
                Menus:AddButton(("Inventaire %s"):format(inventory.id), false, "", "chevron_right", function()
                    MainMenu.Admin.Inventories.Inventory.onOpen(inventory.id)
                end, MainMenu.Admin.Inventories.Inventory.Main)
            end
        end)
    end)
end
