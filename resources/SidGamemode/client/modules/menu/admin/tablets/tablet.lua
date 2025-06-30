MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Tablets = MainMenu.Admin.Tablets or {}
MainMenu.Admin.Tablets.Tablet = {}

local tablet = {}
local listIndex = 1

MainMenu.Admin.Tablets.Tablet.onOpen = function(id)
    tablet = Callbacks.Trigger("order:getTablet", id)
end

MainMenu.Admin.Tablets.Tablet.Create = function()
    MainMenu.Admin.Tablets.Tablet.Main = Menus:CreateSub(MainMenu.Admin.Tablets.Main, "Tablette", "default")

    Menus:CreateThread(MainMenu.Admin.Tablets.Tablet.Main, function()
        Menus:IsVisible(MainMenu.Admin.Tablets.Tablet.Main, function()
					print(json.encode(tablet))
            if tablet == nil then
                return
            end

            Menus:AddButton("Ajouter un item", false, "➕", "", function()
                local item = Utils.KeyboardInput("Item", 250, "")
                local quantity = tonumber(Utils.KeyboardInput("Quantité", 10, ""))

                if item == nil or quantity == nil then
                    return
                end

                if Item.Get(item) == nil then
                    UI:AddNotification("basic", "~r~Cet item n'existe pas~s~", "info", 5000)
                    return
                end

                tablet.content[item] = quantity

                Events.TriggerServer("order:updateTablet", tablet.id, tablet.owner, tablet.content)
            end)

            Menus:AddSeparator("Liste des items")

            for item, quantity in pairs(tablet.content) do
                if Item.Get(item) ~= nil then
                    Menus:AddList(("x%d %s"):format(quantity, Item.Get(item).label),
                        {"Modifier la quantité", "~r~Supprimer 🗑️~s~"}, listIndex, false,
                        function(isClicked, index)
                            listIndex = index

                            if isClicked then
                                if listIndex == 1 then
                                    local qty = tonumber(Utils.KeyboardInput("Quantité", 10, tostring(quantity)))

                                    if qty == nil then
                                        return
                                    end

                                    tablet.content[item] = qty
                                else
                                    tablet.content[item] = nil
                                end

                                Events.TriggerServer("order:updateTablet", tablet.id, tablet.owner, tablet.content)
                            end
                        end)
                end
            end
        end)
    end)
end
