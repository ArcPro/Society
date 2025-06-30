MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Societies = MainMenu.Admin.Societies or {}

local filteredSocieties = {}

MainMenu.Admin.Societies.onOpen = function ()
    filteredSocieties = ClientModules.Societies:All()
end

MainMenu.Admin.Societies.Create = function()
    MainMenu.Admin.Societies.Main = Menus:CreateSub(MainMenu.Admin.Main, "Entreprises", "default")
    MainMenu.Admin.Societies.Society.Create()

    Menus:CreateThread(MainMenu.Admin.Societies.Main, function()
        Menus:IsVisible(MainMenu.Admin.Societies.Main, function()
            Menus:AddButton("Rechercher", false, "🔍", "", function()
                local filter = Utils.KeyboardInput("Recherche", 50, "")

                if filter == "" or filter == nil then
                    filteredSocieties = ClientModules.Societies:All()
                    filter = nil
                    return
                end

				filter = filter:lower()

                filteredSocieties = {}
                for _, society in pairs(ClientModules.Societies:All()) do
                    if filter ~= nil and (
                        string.find(society:name():lower(), filter) or
                        string.find(tostring(society:id()):lower(), filter)
                    ) then
                        table.insert(filteredSocieties, society)
                    end
                end
            end)

            Menus:AddButton("Créer", false, "➕", "", function()
                local name = Utils.KeyboardInput("Nom", 50, "")
                local label = Utils.KeyboardInput("Label", 50, "")

                if name == "" or name == nil then
                    name = ""
                end

                if label == "" or label == nil then
                    label = ""
                end

                Events.TriggerServer("society:create", label, name)
                Citizen.Wait(500)
                MainMenu.Admin.Societies.onOpen()
            end)

            Menus:AddSeparator("Entreprises")

            for _, society in pairs(filteredSocieties) do
                Menus:AddButton(society:label(), false, tostring(society:id()), "", function()
                    MainMenu.Admin.Societies.Society.onOpen(society:id())
                end, MainMenu.Admin.Societies.Society.Main)
            end
        end)
    end)
end
