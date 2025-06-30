MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.FarmCircuits = MainMenu.Admin.FarmCircuits or {}

local circuits = {}

MainMenu.Admin.FarmCircuits.onOpen = function ()
    circuits = Callbacks.Trigger("farm:all")
end

MainMenu.Admin.FarmCircuits.Create = function()
    MainMenu.Admin.FarmCircuits.Main = Menus:CreateSub(MainMenu.Admin.Main, "Circuits de farm", "default")
    MainMenu.Admin.FarmCircuits.Circuit.Create()

    Menus:CreateThread(MainMenu.Admin.FarmCircuits.Main, function()
        Menus:IsVisible(MainMenu.Admin.FarmCircuits.Main, function()

            Menus:AddButton("Créer un circuit", false, "➕", "", function()
                local society = tonumber(Utils.KeyboardInput("ID de l'entreprise liée", 4, ""))

				if society == nil then return end

                local id = Callbacks.Trigger("farm:create", society)

                MainMenu.Admin.FarmCircuits.onOpen()
                MainMenu.Admin.FarmCircuits.Circuit.onOpen(id)
                Menus:Visible(MainMenu.Admin.FarmCircuits.Circuit.Main, true)
            end)

            Menus:AddSeparator("Circuits de farm")

            for _, circuit in pairs(circuits) do
                if ClientModules.Societies:Get(tonumber(circuit.society)) == nil then
                    Events.TriggerServer("farm:delete", circuit.id)
                else
                    Menus:AddButton(("#%d"):format(circuit.id), false, ClientModules.Societies:Get(tonumber(circuit.society)):label() or "Inconnu", "", function()
                        MainMenu.Admin.FarmCircuits.Circuit.onOpen(circuit.id)
                    end, MainMenu.Admin.FarmCircuits.Circuit.Main)
                end
            end

        end)
    end)
end
