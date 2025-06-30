MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Societies = MainMenu.Admin.Societies or {}
MainMenu.Admin.Societies.Society = MainMenu.Admin.Societies.Society or {}
MainMenu.Admin.Societies.Society.Grade = MainMenu.Admin.Societies.Society.Grade or {}

---@type Society | nil
local society = nil
---@type Grade | nil
local grade = nil

MainMenu.Admin.Societies.Society.Grade.onOpen = function(societyId, rankId)
	society = ClientModules.Societies:Get(societyId)
	grade = ClientModules.Societies.Grades:Get(societyId, rankId)
end

MainMenu.Admin.Societies.Society.Grade.Create = function()
    MainMenu.Admin.Societies.Society.Grade.Main = Menus:CreateSub(MainMenu.Admin.Societies.Society.Main, "Grade", "default")

    Menus:CreateThread(MainMenu.Admin.Societies.Society.Grade.Main, function()
        Menus:IsVisible(MainMenu.Admin.Societies.Society.Grade.Main, function()

			if society == nil or grade == nil then
				Menus:AddButton("~r~Une erreur s'est produite lors du chargement du grade~s~", false, "", "", function()end)
				return
			end

			Menus:AddButton("Rang", false, tostring(grade.grade), "", function()
				local newGrade = tonumber(Utils.KeyboardInput("Nouveau grade", 50, grade.grade))

				if newGrade == nil then return end

				Events.TriggerServer("society:grades:update", society:id(), grade.id, newGrade, grade.label, grade.salary, grade.can_manage)
                Citizen.Wait(500)
                MainMenu.Admin.Societies.Society.Grade.onOpen(society:id(), newGrade)
			end)

			Menus:AddButton("Label", false, grade.label, "", function()
				local newLabel = Utils.KeyboardInput("Nouveau label", 50, grade.label)

				if newLabel == nil then return end

				Events.TriggerServer("society:grades:update", society:id(), grade.id, grade.grade, newLabel, grade.salary, grade.can_manage)
                Citizen.Wait(500)
                MainMenu.Admin.Societies.Society.Grade.onOpen(society:id(), grade.grade)
			end)

			Menus:AddButton("Salaire", false, tostring(grade.salary), "", function()
				local newSalary = tonumber(Utils.KeyboardInput("Nouveau salaire", 11, tostring(grade.salary)))

				if newSalary == nil then return end

				Events.TriggerServer("society:grades:update", society:id(), grade.id, grade.grade, grade.label, newSalary, grade.can_manage)
                Citizen.Wait(500)
                MainMenu.Admin.Societies.Society.Grade.onOpen(society:id(), grade.grade)
			end)

			Menus:AddCheckbox("Gestion", false, grade.can_manage, function(checked)
				grade.can_manage = checked == true and 1 or 0

				Events.TriggerServer("society:grades:update", society:id(), grade.id, grade.grade, grade.label, grade.salary, grade.can_manage)
                Citizen.Wait(500)
                MainMenu.Admin.Societies.Society.Grade.onOpen(society:id(), grade.grade)
			end)

			Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("society:grades:delete", society:id(), grade.id)
					Citizen.Wait(500)
					Menus:Back()
				end)
			end)

        end)
    end)
end
