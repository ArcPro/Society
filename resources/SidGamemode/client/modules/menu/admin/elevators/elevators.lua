MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Elevators = MainMenu.Admin.Elevators or {}

local elevators = {}

MainMenu.Admin.Elevators.Create = function()
    MainMenu.Admin.Elevators.Main = Menus:CreateSub(MainMenu.Admin.Main, "Ascenceurs", "default")
    MainMenu.Admin.Elevators.Elevator.Create()

	Menus:OnOpen(MainMenu.Admin.Elevators.Main, function()
		elevators = Callbacks.Trigger("elevator:all")
	end)

    Menus:CreateThread(MainMenu.Admin.Elevators.Main, function()
        Menus:IsVisible(MainMenu.Admin.Elevators.Main, function()

            Menus:AddButton("Créer un ascenseur", false, "➕", "", function()
				local name = Utils.KeyboardInput("Nom de l'ascenseur", 50, "")

				if name == nil then return end

				local id = Callbacks.Trigger("elevator:create", name)

				if id == nil then
					UI:AddNotification("basic", "~s~Une erreur s'est produite lors de la création de l'ascenseur~s~", "info", 5000)
				end

				elevators[id] = {
					name = name,
					tp_points = {}
				}
            end)

            Menus:AddSeparator("Ascenseurs")

            for _, elevator in pairs(elevators) do
                Menus:AddButton(("%s"):format(elevator.name), false, "", "", function()
                    MainMenu.Admin.Elevators.Elevator.onOpen(elevator.id)
                end, MainMenu.Admin.Elevators.Elevator.Main)
            end

        end)
    end)
end
