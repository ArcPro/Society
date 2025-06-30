MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Markers = MainMenu.Admin.Markers or {}
MainMenu.Admin.Markers.Marker = MainMenu.Admin.Markers.Marker or {}
MainMenu.Admin.Markers.Marker.Crafts = MainMenu.Admin.Markers.Marker.Crafts or {}

---@type Marker | nil
local currentMarker = nil

MainMenu.Admin.Markers.Marker.Crafts.onOpen = function (marker)
    currentMarker = marker
end

MainMenu.Admin.Markers.Marker.Crafts.Create = function()
    MainMenu.Admin.Markers.Marker.Crafts.Main = Menus:CreateSub(MainMenu.Admin.Markers.Marker.Main, "Crafts", "default")
    MainMenu.Admin.Markers.Marker.Crafts.Craft.Create()

    Menus:CreateThread(MainMenu.Admin.Markers.Marker.Crafts.Main, function()
        Menus:IsVisible(MainMenu.Admin.Markers.Marker.Crafts.Main, function()
            if currentMarker == nil then
                return
            end

            Menus:AddButton("Emote", false, currentMarker:data().emote, "", function()
                local emote = Utils.KeyboardInput("Emote", 255, currentMarker:data().emote)

                if emote then
                    currentMarker:data().emote = emote
                    Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
                end
            end)

            Menus:AddButton("Ajouter un craft", false, "➕", "", function()
                if currentMarker:data().crafts == nil then
                    currentMarker:data().crafts = {}
                end

                table.insert(currentMarker:data().crafts, {
                    targetItem = {
                        label = "",
                        name = "",
                        weight = 0,
                        quantity = 0,
                    },

                    requirements = {},

                    craftTime = 0,
                })
            end)

            Menus:AddSeparator("Crafts")

            for k, v in pairs(currentMarker:data().crafts or {}) do
                Menus:AddButton(("Craft %s"):format(k), false, "", "chevron_right", function()
                    MainMenu.Admin.Markers.Marker.Crafts.Craft.onOpen(currentMarker, k)
                end, MainMenu.Admin.Markers.Marker.Crafts.Craft.Main)
            end
        end)
    end)
end
