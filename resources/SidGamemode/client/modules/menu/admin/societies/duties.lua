MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Societies = MainMenu.Admin.Societies or {}
MainMenu.Admin.Societies.Society = MainMenu.Admin.Societies.Society or {}
MainMenu.Admin.Societies.Society.Duties = MainMenu.Admin.Societies.Society.Duties or {}

local duties = {}

MainMenu.Admin.Societies.Society.Duties.onOpen = function (id)
	duties = {}

	for k, characterId in pairs(ClientModules.Societies:Get(id):duties() or {}) do
		table.insert(duties, {
			id = characterId,
			name = Callbacks.Trigger("player:getName", characterId)
		})
	end
end

MainMenu.Admin.Societies.Society.Duties.Create = function()
    MainMenu.Admin.Societies.Society.Duties.Main = Menus:CreateSub(MainMenu.Admin.Societies.Society.Main, "En service", "default")

    Menus:CreateThread(MainMenu.Admin.Societies.Society.Duties.Main, function()
        Menus:IsVisible(MainMenu.Admin.Societies.Society.Duties.Main, function()
			Menus:AddSeparator("Employés en service")

			for k, employee in pairs(duties) do
				Menus:AddButton(employee.name, false, "", "chevron_right", function()
					MainMenu.Admin.Players.Player.onOpen(employee.id, false)
					Menus:Visible(MainMenu.Admin.Players.Player.Main, true)
				end)
			end
        end)
    end)
end
