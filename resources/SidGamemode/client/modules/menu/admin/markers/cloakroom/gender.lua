MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Markers = MainMenu.Admin.Markers or {}
MainMenu.Admin.Markers.Marker = MainMenu.Admin.Markers.Marker or {}
MainMenu.Admin.Markers.Marker.Cloakroom = MainMenu.Admin.Markers.Marker.Cloakroom or {}

---@type Marker | nil
local currentMarker = nil

MainMenu.Admin.Markers.Marker.Cloakroom.onOpen = function (marker)
    currentMarker = marker
end

MainMenu.Admin.Markers.Marker.Cloakroom.Create = function()
    MainMenu.Admin.Markers.Marker.Cloakroom.Main = Menus:CreateSub(MainMenu.Admin.Markers.Marker.Main, "Vestiaire", "default")
    MainMenu.Admin.Markers.Marker.Cloakroom.Categories.Create()
    MainMenu.Admin.Markers.Marker.Cloakroom.List.Create()

    Menus:CreateThread(MainMenu.Admin.Markers.Marker.Cloakroom.Main, function()
        Menus:IsVisible(MainMenu.Admin.Markers.Marker.Cloakroom.Main, function()
            if currentMarker == nil then
                return
            end

            Menus:AddCheckbox("Vêtements gratuits", false, currentMarker:data().free or false, function(checked)
                currentMarker:data().free = checked
				Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
            end)

            Menus:AddButton("Homme", false, "🚹", "", function()
                MainMenu.Admin.Markers.Marker.Cloakroom.Categories.onOpen(currentMarker, "m")
            end, MainMenu.Admin.Markers.Marker.Cloakroom.Categories.Main)

            Menus:AddButton("Femme", false, "🚺", "", function()
                MainMenu.Admin.Markers.Marker.Cloakroom.Categories.onOpen(currentMarker, "f")
            end, MainMenu.Admin.Markers.Marker.Cloakroom.Categories.Main)

        end)
    end)
end
