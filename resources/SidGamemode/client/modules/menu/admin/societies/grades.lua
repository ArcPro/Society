MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Societies = MainMenu.Admin.Societies or {}
MainMenu.Admin.Societies.Society = MainMenu.Admin.Societies.Society or {}
MainMenu.Admin.Societies.Society.Grades = MainMenu.Admin.Societies.Society.Grades or {}

local societyId = nil
local filteredGrades = {}
local filter = nil

MainMenu.Admin.Societies.Society.Grades.onOpen = function (id)
    societyId = id
    filteredGrades = ClientModules.Societies:Get(id):grades() or {}
end

MainMenu.Admin.Societies.Society.Grades.Create = function()
    MainMenu.Admin.Societies.Society.Grades.Main = Menus:CreateSub(MainMenu.Admin.Societies.Society.Main, "Grades", "default")

    Menus:CreateThread(MainMenu.Admin.Societies.Society.Grades.Main, function()
        Menus:IsVisible(MainMenu.Admin.Societies.Society.Grades.Main, function()
            Menus:AddButton("Rechercher", false, "🔍", "", function()
                filter = Utils.KeyboardInput("Grade", 50, "")

                if filter == "" or filter == nil then
                    filteredGrades = ClientModules.Societies:Get(id):grades() or {}
                    return
                end

				filter = filter:lower()

                filteredGrades = {}

                for rank, data in pairs(currentSociety:grades()) do
                    if filter ~= nil and (
                        string.find(tostring(rank):lower(), filter) ~= nil
                        or string.find(data.label:lower(), filter) ~= nil
                    ) then
                        table.insert(filteredGrades, v)
                    end
                end
            end)

            Menus:AddButton("Créer", false, "➕", "", function()
                local grade = tonumber(Utils.KeyboardInput("Grade", 50, ""))
                local label = Utils.KeyboardInput("Label", 50, "")

                if grade == "" or grade == nil then
                    return
                end

                if label == "" or label == nil then
                    label = ""
                end

                Events.TriggerServer("society:grades:add", societyId, grade, label)
                Citizen.Wait(500)
                MainMenu.Admin.Societies.Society.Grades.onOpen(societyId)
            end)

            Menus:AddSeparator("Grades")

            for _, data in pairs(filteredGrades) do
                Menus:AddButton(("%d: %s"):format(data.grade, data.label), false, "", "chevron_right", function()
					MainMenu.Admin.Societies.Society.Grade.onOpen(societyId, data.grade)
				end, MainMenu.Admin.Societies.Society.Grade.Main)
            end
        end)
    end)
end
