MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Markers = MainMenu.Admin.Markers or {}

local filteredMarkers = {}
local showMarkersID = false

local function ShowMarkersID()
    Citizen.CreateThread(function()
        while showMarkersID do
            for _, marker in pairs(Markers.All()) do
                Utils.Draw3DText(
                    marker:coords(),
                    "ID: ".. marker:name() .. " \nType: ".. (marker:action() or "Non défini") .. " \nJob: ".. (marker:data().job or "Aucun") .. " \nGroupe: ".. (marker:data().group or "Aucun"),
                    1.0,
					100.0,
					false
                )
            end
            Citizen.Wait(0)
        end
    end)
end

MainMenu.Admin.Markers.onOpen = function ()
    local rawMarkers = Markers.All()
    filteredMarkers = {}

    for _, marker in pairs(rawMarkers) do
        if marker:editable() then
            table.insert(filteredMarkers, marker)
        end
    end
end

MainMenu.Admin.Markers.Create = function()
    MainMenu.Admin.Markers.Main = Menus:CreateSub(MainMenu.Admin.Main, "Markers", "default")
    MainMenu.Admin.Markers.Marker.Create()

    Menus:CreateThread(MainMenu.Admin.Markers.Main, function()
        Menus:IsVisible(MainMenu.Admin.Markers.Main, function()
            Menus:AddButton("Rechercher", false, "🔍", "", function()
                local filter = Utils.KeyboardInput("Recherche", 50, "")

                if filter == "" or filter == nil then
                    filter = nil
                    MainMenu.Admin.Markers.onOpen()
                    return
                end

				filter = filter:lower()

                filteredMarkers = {}
                for _, marker in pairs(Markers.All()) do
                    if string.find(marker:name():lower(), filter) and marker:editable() then
                        table.insert(filteredMarkers, marker)
                    end
                end
            end)

            Menus:AddButton("Créer", false, "➕", "", function()
                local name = Utils.KeyboardInput("Nom", 50, "")
                local x, y, z = table.unpack(player:position())

                if name == "" or name == nil then
                    name = ""
                end

                Events.TriggerServer("marker:create", name, "", vector3(x, y, z - 0.95), {})
                Citizen.Wait(500)
                MainMenu.Admin.Markers.onOpen()
            end)

            Menus:AddCheckbox("Afficher les ID", false, showMarkersID, function (checked)
                showMarkersID = checked

                if showMarkersID then
                    ShowMarkersID()
                end
            end)

            Menus:AddSeparator("Markers")

            if filteredMarkers == nil or #filteredMarkers == 0 then
                Menus:AddButton("~r~Aucun marker trouvé~s~", true, "", "", function()end)
            else
                for _, marker in pairs(filteredMarkers) do
                    Menus:AddButton(marker:name(), false, "", "chevron_right", function()
                        MainMenu.Admin.Markers.Marker.onOpen(marker)
                    end, MainMenu.Admin.Markers.Marker.Main)
                end
            end
        end)
    end)
end
