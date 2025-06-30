MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Markers = MainMenu.Admin.Markers or {}
MainMenu.Admin.Markers.Marker = MainMenu.Admin.Markers.Marker or {}
MainMenu.Admin.Markers.Marker.Shop = MainMenu.Admin.Markers.Marker.Shop or {}

---@type Marker | nil
local currentMarker = nil

---@param marker Marker
MainMenu.Admin.Markers.Marker.Shop.onOpen = function (marker)
    currentMarker = marker
end

MainMenu.Admin.Markers.Marker.Shop.Create = function()
    MainMenu.Admin.Markers.Marker.Shop.Main = Menus:CreateSub(MainMenu.Admin.Markers.Marker.Main, "Catégories", "default")
    MainMenu.Admin.Markers.Marker.Shop.Category.Create()

    Menus:CreateThread(MainMenu.Admin.Markers.Marker.Shop.Main, function()
        Menus:IsVisible(MainMenu.Admin.Markers.Marker.Shop.Main, function()

            if currentMarker == nil then
                Menus:AddButton("~r~Erreur lors du chargement des données", true, "", "", function()end)
                return
            end

            if currentMarker:data().society == nil then
                currentMarker:data().society = {}
            end

            Menus:AddSeparator("Entreprise liée")

            Menus:AddButton("Label", false, currentMarker:data().society.name or "", "", function()
                local name = Utils.KeyboardInput("Label de l'entreprise", 100, "")

                if name == nil then return end

                currentMarker:data().society.name = name

                Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
            end)

            Menus:AddButton("Nom", false, currentMarker:data().society.logo or "", "", function()
                local logo = Utils.KeyboardInput("Nom de l'entreprise", 100, "")

                if logo == nil then return end

                currentMarker:data().society.logo = logo

                Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
            end)

			Menus:AddButton("Texte du bouton", false, currentMarker:data().buttonText or "Commander", "", function()
                currentMarker:data().buttonText = Utils.KeyboardInput("Texte du bouton", 20, "")

                Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
            end)

			Menus:AddCheckbox("Regarder sa tablette", false, currentMarker:data().useTablet or false, function(checked)
                currentMarker:data().useTablet = checked

                Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
            end)

            Menus:AddSeparator("Catégories")

            Menus:AddButton("Ajouter une catégorie", false, "➕", "", function()
                local name = Utils.KeyboardInput("Nom de la catégorie", 100, "")

                if name == nil then return end

                if currentMarker:data().shop == nil then
                    currentMarker:data().shop = {}
                end

                currentMarker:data().shop[name] = {}

                Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
            end)

            for name, items in pairs(currentMarker:data().shop or {}) do
                Menus:AddButton(("%s (%d items)"):format(name, #items), false, "", "chevron_right", function()
                    MainMenu.Admin.Markers.Marker.Shop.Category.onOpen(currentMarker, name)
                end, MainMenu.Admin.Markers.Marker.Shop.Category.Main)
            end

            if currentMarker:data().shop == nil or #currentMarker:data().shop == 0 then
                Menus:AddButton("~r~Aucune catégorie dans ce shop.", true, "", "", function()end)
            end
        end)
    end)
end
