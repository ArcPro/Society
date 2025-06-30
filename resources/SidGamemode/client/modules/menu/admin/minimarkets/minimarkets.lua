MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Minimarkets = MainMenu.Admin.Minimarkets or {}

local minimarkets = {}

MainMenu.Admin.Minimarkets.Create = function()
    MainMenu.Admin.Minimarkets.Main = Menus:CreateSub(MainMenu.Admin.Main, "Supérettes", "default")
	MainMenu.Admin.Minimarkets.Minimarket.Create()

	Menus:OnOpen(MainMenu.Admin.Minimarkets.Main, function()
		minimarkets = Callbacks.Trigger("minimarket:all") or {}
	end)

    Menus:CreateThread(MainMenu.Admin.Minimarkets.Main, function()
        Menus:IsVisible(MainMenu.Admin.Minimarkets.Main, function()

			Menus:AddButton("Créer une supérette", false, "➕", "", function()
				MainMenu.Admin.Minimarkets.Minimarket.onOpen(Callbacks.Trigger("minimarket:create", player:position(), vector3(0, 0, 0)))
			end, MainMenu.Admin.Minimarkets.Minimarket.Main)

			Menus:AddSeparator("Liste des supérettes")

			for k, v in pairs(minimarkets) do
				Menus:AddButton(("Supérette #%d"):format(v.id), false, "", "chevron_right", function()
					MainMenu.Admin.Minimarkets.Minimarket.onOpen(v.id)
				end, MainMenu.Admin.Minimarkets.Minimarket.Main)
			end

        end)
    end)
end
