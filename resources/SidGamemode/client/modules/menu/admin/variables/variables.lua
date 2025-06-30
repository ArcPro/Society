MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Variables = {}

local variablesList = {}
local filter = nil

local translations = {
    mechanic = "🧰 Modif. véhicules",
    properties = "🏠 Propriétés",
    vehicles = "🚗 Véhicules",
    global = "🌐 Global",
    items = "📦 Items",
}

local displayConditions = {}
displayConditions.vehicles = function(label)
    return ("%s (%s)"):format(GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(label))), label)
end

MainMenu.Admin.Variables.onOpen = function()
    local rawList = Callbacks.Trigger("variable:list")
    local splittedName = {}

    if not rawList then return end

    for name, label in pairs(rawList) do
        splittedName = String.split(name, ".")

        if splittedName[1] == "variables" then
            variablesList[splittedName[2]] = variablesList[splittedName[2]] or {}

            if displayConditions[splittedName[2]] ~= nil then
                variablesList[splittedName[2]][name] = displayConditions[splittedName[2]](label)
            else
                variablesList[splittedName[2]][name] = label
            end
        end
    end
end

local function CreateEconomySubMenu(category)
    MainMenu.Admin.Variables[category] = Menus:CreateSub(MainMenu.Admin.Variables.Main, ("Variable (%s)"):format(category), "default")

    Menus:CreateThread(MainMenu.Admin.Variables[category], function()
        Menus:IsVisible(MainMenu.Admin.Variables[category], function()
            Menus:AddButton("Rechercher", false, "🔍", "", function()
                filter = Utils.KeyboardInput("Recherche", 255, "")

				if filter then
					filter = filter:lower()
				end
            end)

            Menus:AddSeparator("Variables")

            for name, label in pairs(variablesList[category]) do
                if string.find(label:lower(), filter or "") then
                    Menus:AddButton(label or "fail 1", false, tostring(GlobalState[name]), "", function()
                        local value = Utils.KeyboardInput(("Nouvelle valeur de %s"):format(label), 255, tostring(GlobalState[name]))

                        if value and value ~= "" then
                            Events.TriggerServer("variable:set", name, value)
                        end
                    end)
                end
            end
        end)
    end)
end

MainMenu.Admin.Variables.Create = function()
    MainMenu.Admin.Variables.Main = Menus:CreateSub(MainMenu.Admin.Main, "Variables", "default")

    MainMenu.Admin.Variables.onOpen()

    for category, list in pairs(variablesList) do
        CreateEconomySubMenu(category)
    end

    Menus:CreateThread(MainMenu.Admin.Variables.Main, function()
        Menus:IsVisible(MainMenu.Admin.Variables.Main, function()
            for category, list in pairs(variablesList) do
                Menus:AddButton(translations[category] or category, false, "", "chevron_right", function()end, MainMenu.Admin.Variables[category])
            end
        end)
    end)
end
