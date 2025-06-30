MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Containers = MainMenu.Admin.Containers or {}

local containers = {}

MainMenu.Admin.Containers.Create = function()
    MainMenu.Admin.Containers.Main = Menus:CreateSub(MainMenu.Admin.Main, "Conteneurs", "default")
	MainMenu.Admin.Containers.Container.Create()
	MainMenu.Admin.Containers.Rewards.Create()
	MainMenu.Admin.Containers.Reward.Create()

	Menus:OnOpen(MainMenu.Admin.Containers.Main, function()
		containers = Callbacks.Trigger("container:all") or {}
	end)

    Menus:CreateThread(MainMenu.Admin.Containers.Main, function()
        Menus:IsVisible(MainMenu.Admin.Containers.Main, function()

			Menus:AddButton("Créer un conteneur", false, "➕", "", function()
				MainMenu.Admin.Containers.Container.onOpen(Callbacks.Trigger("container:create", GetEntityCoords(PlayerPedId(), true) + GetEntityForwardVector(PlayerPedId()) * 2.5, GetEntityRotation(PlayerPedId(), 2), {}))
			end, MainMenu.Admin.Containers.Container.Main)

			Menus:AddSeparator("Liste des conteneurs")

			for k, v in pairs(containers) do
				Menus:AddButton(("Conteneur #%d"):format(v.id), false, "", "chevron_right", function()
					MainMenu.Admin.Containers.Container.onOpen(v.id)
				end, MainMenu.Admin.Containers.Container.Main)
			end

        end)
    end)
end
