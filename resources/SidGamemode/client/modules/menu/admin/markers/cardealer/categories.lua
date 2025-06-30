MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Markers = MainMenu.Admin.Markers or {}
MainMenu.Admin.Markers.Marker = MainMenu.Admin.Markers.Marker or {}
MainMenu.Admin.Markers.Marker.Cardealer = MainMenu.Admin.Markers.Marker.Cardealer or {}

---@type Marker | nil
local currentMarker = nil

---@param marker Marker
MainMenu.Admin.Markers.Marker.Cardealer.onOpen = function (marker)
    currentMarker = marker

    if currentMarker:data() == nil or currentMarker:data().categories == nil then
        local categories = {}
        for i=0, 22 do
            categories[tostring(i)] = {}
        end

        currentMarker:data({ categories = categories })
        Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
    end
end

MainMenu.Admin.Markers.Marker.Cardealer.Create = function()
    MainMenu.Admin.Markers.Marker.Cardealer.Main = Menus:CreateSub(MainMenu.Admin.Markers.Marker.Main, "Catégories", "default")
    MainMenu.Admin.Markers.Marker.Cardealer.Category.Create()

    Menus:CreateThread(MainMenu.Admin.Markers.Marker.Cardealer.Main, function()
        Menus:IsVisible(MainMenu.Admin.Markers.Marker.Cardealer.Main, function()

            if currentMarker == nil then
                Menus:AddButton("~r~Erreur lors du chargement des données", true, "", "", function()end)
                return
            end

            Menus:AddButton("Entreprise liée", false, currentMarker:data().society or "", "", function()
                local society = Utils.KeyboardInput("Nom de l'entreprise", 100, currentMarker:data().society or "")

                if society == nil then return end

                currentMarker:data().society = society

                Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
            end)

            Menus:AddSeparator("Catégories")
            for name, vehicles in pairs(currentMarker:data().categories or {}) do
                Menus:AddButton(("%s (%d véhicules)"):format(GetLabelText(("VEH_CLASS_%s"):format(name)), #vehicles), false, "", "chevron_right", function()
                    MainMenu.Admin.Markers.Marker.Cardealer.Category.onOpen(currentMarker, name)
                end, MainMenu.Admin.Markers.Marker.Cardealer.Category.Main)
            end
        end)
    end)
end
