MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}

MainMenu.Admin.Blips = MainMenu.Admin.Blips or {}

local filteredBlips = {}

MainMenu.Admin.Blips.onOpen = function ()
    filteredBlips = {}

    for _, blip in pairs(Blips.All()) do
        if blip:editable() then
            table.insert(filteredBlips, blip)
        end
    end
end

MainMenu.Admin.Blips.Create = function()
    MainMenu.Admin.Blips.Main = Menus:CreateSub(MainMenu.Admin.Main, "Blips", "default")
    MainMenu.Admin.Blips.Blip.Create()

    Menus:CreateThread(MainMenu.Admin.Blips.Main, function()
        Menus:IsVisible(MainMenu.Admin.Blips.Main, function()
            Menus:AddButton("Rechercher", false, "🔍", "", function()
                local filter = Utils.KeyboardInput("Recherche", 50, "")

                if filter == "" or filter == nil then
                    filter = nil
                    MainMenu.Admin.Blips.onOpen()

                    return
                end

				filter = filter:lower()

                filteredBlips = {}
                for _, blip in pairs(Blips.All()) do
                    if blip:editable() and (
                        string.find(blip:title():lower(), filter) or
                        string.find(tostring(blip:id()):lower(), filter)
                    ) then
                        table.insert(filteredBlips, blip)
                    end
                end
            end)

            Menus:AddButton("Créer", false, "➕", "", function()
                local name = Utils.KeyboardInput("Nom", 50, "")
                local sprite = tonumber(Utils.KeyboardInput("Sprite", 50, ""))
                local color = tonumber(Utils.KeyboardInput("Color", 50, ""))
                local x, y, z = table.unpack(player:position())

                if name == nil or sprite == nil or color == nil then
                    return
                end

                Events.TriggerServer("blip:create", sprite, color, vector3(x, y, z), name)
                Citizen.Wait(500)
                MainMenu.Admin.Blips.onOpen()
            end)

            Menus:AddSeparator("Blips")

            if filteredBlips == nil or #filteredBlips == 0 then
                Menus:AddButton("~r~Aucun blip trouvé~s~", false, "", "", function()end)
            else
                for _, blip in pairs(filteredBlips) do
                    Menus:AddButton(("#%s %s"):format(blip:id(), blip:title()), false, "", "chevron_right", function()
                        MainMenu.Admin.Blips.Blip.onOpen(blip)
                    end, MainMenu.Admin.Blips.Blip.Main)
                end
            end
        end)
    end)
end
