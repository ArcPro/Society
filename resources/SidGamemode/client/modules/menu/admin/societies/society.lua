MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Societies = MainMenu.Admin.Societies or {}
MainMenu.Admin.Societies.Society = MainMenu.Admin.Societies.Society or {}

local currentSociety = nil

local customIconIndex = 1

local function updateSociety()
    if currentSociety == nil then
        return
    end

    if currentSociety:phone_blip() == nil then
        currentSociety:phone_blip({})
    end

    if currentSociety:phone_custom_icon() == nil then
        currentSociety:phone_custom_icon({})
    end

    Events.TriggerServer("society:update", currentSociety:id(), currentSociety:name(), currentSociety:label(), currentSociety:phone_blip(), currentSociety:bank_account_id(), currentSociety:phone_can_message(), currentSociety:phone_can_call(), currentSociety:phone_custom_icon())
end

MainMenu.Admin.Societies.Society.onOpen = function (id)
    currentSociety = ClientModules.Societies:Get(id)
    if currentSociety:phone_custom_icon() == nil then
        currentSociety:phone_custom_icon({})
        return
    end
    customIconIndex = Table.index(PhoneCustomIconActions._list, currentSociety:phone_custom_icon().custom)
    if customIconIndex == 0 then
        customIconIndex = 1
    end
end

MainMenu.Admin.Societies.Society.Create = function()
    MainMenu.Admin.Societies.Society.Main = Menus:CreateSub(MainMenu.Admin.Societies.Main, "Entreprise", "default")
    MainMenu.Admin.Societies.Society.Employees.Create()
    MainMenu.Admin.Societies.Society.Grades.Create()
	MainMenu.Admin.Societies.Society.Duties.Create()
	MainMenu.Admin.Societies.Society.Grade.Create()

    Menus:CreateThread(MainMenu.Admin.Societies.Society.Main, function()
        Menus:IsVisible(MainMenu.Admin.Societies.Society.Main, function()
            if currentSociety == nil then
                return
            end

            Menus:AddSeparator("Informations")

            Menus:AddButton("Nom", false, currentSociety:name(), "", function()
                local name = Utils.KeyboardInput("Nom", 50, currentSociety:name())

                if name == "" or name == nil then
                    return
                end

                currentSociety:name(name)

                updateSociety()
            end)

            Menus:AddButton("Label", false, currentSociety:label(), "", function()
                local label = Utils.KeyboardInput("Label", 50, currentSociety:label())

                if label == "" or label == nil then
                    return
                end

                currentSociety:label(label)

                updateSociety()
            end)

            Menus:AddButton("Compte bancaire", false, tostring(currentSociety:bank_account_id()), "", function()
                local bank_account_id = tonumber(Utils.KeyboardInput("Compte bancaire", 5, currentSociety:bank_account_id()))

                if bank_account_id == nil then
                    return
                end

                currentSociety:bank_account_id(bank_account_id)

                updateSociety()
            end)

            Menus:AddSeparator("Téléphone")

            Menus:AddButton("Position", false, "🗺️", "", function()
                local x, y = table.unpack(player:position())

                currentSociety._phone_blip = { x = x, y = y }

                updateSociety()
            end)

            Menus:AddSeparator("Annuaire téléphone")

            Menus:AddButton("Messages", false, currentSociety:phone_can_message() and "✅" or "❌", "", function()
                currentSociety._phone_can_message = not currentSociety:phone_can_message()

                updateSociety()
            end)

            Menus:AddButton("Appels", false, currentSociety:phone_can_call() and "✅" or "❌", "", function()
                currentSociety._phone_can_call = not currentSociety:phone_can_call()

                updateSociety()
            end)

            Menus:AddButton("Icon personnalisé", false, (currentSociety:phone_custom_icon().customIcon ~= nil and currentSociety:phone_custom_icon().customIcon or ""):sub(1, 10), "", function()
                local customIcon = Utils.KeyboardInput("Custom Icon Téléphone", 150, currentSociety:phone_custom_icon() and currentSociety:phone_custom_icon().customIcon or "")

                if customIcon == "" or customIcon == nil then
                    currentSociety._phone_custom_icon = {}
                else
                    currentSociety._phone_custom_icon.customIcon = customIcon
                    currentSociety._phone_custom_icon.onCustomIconClick = PhoneCustomIconActions._list[customIconIndex]
                end

                updateSociety()
            end)

            Menus:AddList("Action Icon personnalisé", PhoneCustomIconActions._list, customIconIndex, (currentSociety:phone_custom_icon().customIcon == nil), function(isClicked, index)
                if not isClicked then
                    return
                end
                currentSociety._phone_custom_icon.onCustomIconClick = PhoneCustomIconActions._list[index]

                updateSociety()

                customIconIndex = index
            end)

            Menus:AddSeparator("Gestion")

            Menus:AddButton("Grades", false, "", "chevron_right", function()
                MainMenu.Admin.Societies.Society.Grades.onOpen(currentSociety:id())
            end, MainMenu.Admin.Societies.Society.Grades.Main)

            Menus:AddButton("Employés", false, "", "chevron_right", function()
                MainMenu.Admin.Societies.Society.Employees.onOpen(currentSociety:id())
            end, MainMenu.Admin.Societies.Society.Employees.Main)

            Menus:AddButton("Employés en service", false, "", "chevron_right", function()
                MainMenu.Admin.Societies.Society.Duties.onOpen(currentSociety:id())
            end, MainMenu.Admin.Societies.Society.Duties.Main)

            Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("society:delete", currentSociety:id())
					Citizen.Wait(500)

					MainMenu.Admin.Societies.onOpen()
					Menus:Back()
				end)
            end)
        end)
    end)
end
