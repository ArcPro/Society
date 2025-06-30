MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Blips = MainMenu.Admin.Blips or {}

MainMenu.Admin.Blips.Blip = {}

---@type Blip | nil
local blip = nil

---@param _blip Blip
MainMenu.Admin.Blips.Blip.onOpen = function (_blip)
    blip = Blips.Get(_blip:id())
end

MainMenu.Admin.Blips.Blip.Create = function()
    MainMenu.Admin.Blips.Blip.Main = Menus:CreateSub(MainMenu.Admin.Blips.Main, "Blip", "default")

    Menus:CreateThread(MainMenu.Admin.Blips.Blip.Main, function()
        Menus:IsVisible(MainMenu.Admin.Blips.Blip.Main, function()
            if blip == nil then
                Menus:AddSeparator("~r~Erreur lors du chargement du blip~s~")
                return
            end

            Menus:AddButton("Sprite", false, tostring(blip:sprite()), "", function()
                local sprite = tonumber(Utils.KeyboardInput("Sprite", 3, blip:sprite()))

                if sprite == "" or sprite == nil then
                    sprite = 1
                end

                Events.TriggerServer("blip:update", blip:id(), sprite, blip:color(), blip:coords(), blip:title())
            end)

            Menus:AddButton("Couleur", false, tostring(blip:color()), "", function()
                local color = tonumber(Utils.KeyboardInput("Couleur", 3, blip:color()))

                if color == "" or color == nil then
                    color = 1
                end

                Events.TriggerServer("blip:update", blip:id(), blip:sprite(), color, blip:coords(), blip:title())
            end)

            Menus:AddButton("Titre", false, blip:title(), "", function()
                local title = Utils.KeyboardInput("Titre", 50, blip:title())

                if title == "" or title == nil then
                    title = ""
                end

                Events.TriggerServer("blip:update", blip:id(), blip:sprite(), blip:color(), blip:coords(), title)
            end)

            Menus:AddButton("Position", false, "🗺️", "", function()
                local x, y, z = table.unpack(player:position())

                Events.TriggerServer("blip:update", blip:id(), blip:sprite(), blip:color(), vector3(x, y, z), blip:title())
            end)

            Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("blip:delete", blip:id())
					Citizen.Wait(500)

					MainMenu.Admin.Blips.onOpen()
					Menus:Back()
					blip = nil
				end)
            end)
        end)
    end)
end
