MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Markers = MainMenu.Admin.Markers or {}
MainMenu.Admin.Markers.Marker = MainMenu.Admin.Markers.Marker or {}
MainMenu.Admin.Markers.Marker.Cloakroom = MainMenu.Admin.Markers.Marker.Cloakroom or {}
MainMenu.Admin.Markers.Marker.Cloakroom.Categories = MainMenu.Admin.Markers.Marker.Cloakroom.Categories or {}

---@type Marker | nil
local currentMarker = nil
local currentSex = nil

MainMenu.Admin.Markers.Marker.Cloakroom.Categories.onOpen = function (marker, sex)
    currentMarker = marker
    currentSex = sex
end

MainMenu.Admin.Markers.Marker.Cloakroom.Categories.Create = function()
    MainMenu.Admin.Markers.Marker.Cloakroom.Categories.Main = Menus:CreateSub(MainMenu.Admin.Markers.Marker.Cloakroom.Main, "Catégories", "default")

    Menus:CreateThread(MainMenu.Admin.Markers.Marker.Cloakroom.Categories.Main, function()
        Menus:IsVisible(MainMenu.Admin.Markers.Marker.Cloakroom.Categories.Main, function()
            if currentMarker == nil then
                return
            end

            Menus:AddSeparator("Accessoires")
            for k, v in pairs(Lists.Variations.Props) do
                Menus:AddButton(k:lower(), false, "", "chevron_right", function()
                    MainMenu.Admin.Markers.Marker.Cloakroom.List.onOpen(currentMarker, currentSex, v, true)
                end, MainMenu.Admin.Markers.Marker.Cloakroom.List.Main)
            end

            Menus:AddSeparator("Vêtements")
            for k, v in pairs(Lists.Variations.Clothes) do
                Menus:AddButton(k:lower(), false, "", "chevron_right", function()
                    MainMenu.Admin.Markers.Marker.Cloakroom.List.onOpen(currentMarker, currentSex, v, false)
                end, MainMenu.Admin.Markers.Marker.Cloakroom.List.Main)
            end

        end)
    end)
end
