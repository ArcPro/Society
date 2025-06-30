MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Societies = MainMenu.Admin.Societies or {}
MainMenu.Admin.Societies.Society = MainMenu.Admin.Societies.Society or {}
MainMenu.Admin.Societies.Society.Employees = MainMenu.Admin.Societies.Society.Employees or {}

local societyId = nil
local filteredEmployees = {}
local grades = {}
local indexes = {}
local filter = nil

MainMenu.Admin.Societies.Society.Employees.onOpen = function(id)
    societyId = id
    filteredEmployees = ClientModules.Societies:Get(id):employees() or {}
    grades = {}

    for rank, data in pairs(ClientModules.Societies:Get(id):grades() or {}) do
        grades[rank] = data.label
    end

    table.insert(grades, "~r~Licencier~s~")

    for i, data in pairs(filteredEmployees) do
        indexes[i] = data.grade or 1
    end
end

MainMenu.Admin.Societies.Society.Employees.Create = function()
    MainMenu.Admin.Societies.Society.Employees.Main = Menus:CreateSub(MainMenu.Admin.Societies.Society.Main, "Employés", "default")

    Menus:CreateThread(MainMenu.Admin.Societies.Society.Employees.Main, function()
        Menus:IsVisible(MainMenu.Admin.Societies.Society.Employees.Main, function()
            Menus:AddButton("Rechercher", false, "🔍", "", function()
                filter = Utils.KeyboardInput("Employé", 50, "")

                if filter == "" or filter == nil then
                    filteredEmployees = ClientModules.Societies:Get(id):employees() or {}
                    return
                end

				filter = filter:lower()

                filteredEmployees = {}

                for _, employee in pairs(currentSociety:employees()) do
                    if filter ~= nil and (
                        string.find(employee.firstname:lower(), filter) ~= nil
                        or string.find(employee.lastname:lower(), filter) ~= nil
                    ) then
                        table.insert(filteredEmployees, employee)
                    end
                end
            end)

            Menus:AddButton("Ajouter", false, "➕", "", function()
                local characterId = tonumber(Utils.KeyboardInput("ID du personnage", 50, ""))
                local jobGrade = tonumber(Utils.KeyboardInput("Grade", 50, ""))

                if characterId == "" or characterId == nil then
                    return
                end

                if jobGrade == "" or jobGrade == nil then
                    jobGrade = 1
                end

                Events.TriggerServer("society:employees:add", societyId, characterId, jobGrade)
				table.insert(indexes, 1)
            end)

            Menus:AddSeparator("Employés")

            for id, employee in pairs(filteredEmployees) do
                Menus:AddList(employee.firstname .. " " .. employee.lastname, grades, indexes[id], false, function (isClicked, index)
                    if isClicked then
                        if grades[indexes[id]] == "~r~Licencier~s~" then
                            Events.TriggerServer("society:employees:delete", societyId, employee.id)
                        else
                            Events.TriggerServer("society:employees:update", societyId, employee.id, index)
                        end
                    end

                    indexes[id] = index
                end)
            end
        end)
    end)
end
