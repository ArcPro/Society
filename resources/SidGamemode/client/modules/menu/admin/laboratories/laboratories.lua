MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Laboratories = MainMenu.Admin.Laboratories or {}

local laboratories = {}

MainMenu.Admin.Laboratories.Create = function()
    MainMenu.Admin.Laboratories.Main = Menus:CreateSub(MainMenu.Admin.Main, "Laboratoires", "default")
	MainMenu.Admin.Laboratories.Laboratory.Create()

	Menus:OnOpen(MainMenu.Admin.Laboratories.Main, function()
		laboratories = Callbacks.Trigger("laboratory:all") or {}

		if not laboratories then return end

		for k, v in pairs(laboratories) do
			laboratories[k].step_1_pos = json.decode(laboratories[k].step_1_pos)
			laboratories[k].step_2_pos = json.decode(laboratories[k].step_2_pos)
			laboratories[k].step_3_pos = json.decode(laboratories[k].step_3_pos)
		end
	end)

    Menus:CreateThread(MainMenu.Admin.Laboratories.Main, function()
        Menus:IsVisible(MainMenu.Admin.Laboratories.Main, function()

			Menus:AddButton("Créer un laboratoire", false, "➕", "", function()
				MainMenu.Admin.Laboratories.Laboratory.onOpen(Callbacks.Trigger("laboratory:create", 1, "1_dollar", "1_dollar", "1_dollar", "1_dollar", "", vector3(0, 0, 0), vector3(0, 0, 0), vector3(0, 0, 0), vector3(0, 0, 0), vector3(0, 0, 0)))
			end, MainMenu.Admin.Laboratories.Laboratory.Main)

			Menus:AddSeparator("Liste des laboratoires")

			if #laboratories == 0 then
				Menus:AddButton("~r~Aucun laboratoire trouvé.~s~", true, "", "", function()end)
			end

			for k, v in pairs(laboratories) do
				Menus:AddButton(("Laboratoire #%d"):format(v.id), false, "", "chevron_right", function()
					MainMenu.Admin.Laboratories.Laboratory.onOpen(v.id)
				end, MainMenu.Admin.Laboratories.Laboratory.Main)
			end

        end)
    end)
end
