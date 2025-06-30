MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Groups = MainMenu.Admin.Groups or {}

local groups = {}

MainMenu.Admin.Groups.onOpen = function ()
    groups = Callbacks.Trigger("group:all")
end

MainMenu.Admin.Groups.Create = function()
    MainMenu.Admin.Groups.Main = Menus:CreateSub(MainMenu.Admin.Main, "Groupes", "default")
    MainMenu.Admin.Groups.Group.Create()

	Menus:OnOpen(MainMenu.Admin.Groups.Main, function()
		MainMenu.Admin.Groups.onOpen()
	end)

    Menus:CreateThread(MainMenu.Admin.Groups.Main, function()
        Menus:IsVisible(MainMenu.Admin.Groups.Main, function()

            Menus:AddButton("Créer un groupe", false, "➕", "", function()
				local name = Utils.KeyboardInput("Nom du groupe", 50, "")

				if name == nil then return end

				local label = Utils.KeyboardInput("Label du groupe", 50, "")

				if label == nil then return end

				local id = Callbacks.Trigger("group:create", name, label)

				UI:AddNotification("basic", ("Groupe ~b~%d~s~ créé !"):format(id), "info", 5000)

				Citizen.Wait(500)

				MainMenu.Admin.Groups.onOpen()
            end)

            Menus:AddSeparator("Groupes")

            for _, group in pairs(groups) do
                Menus:AddButton(("#%d %s"):format(group.id, group.label), false, "", "", function()
                    MainMenu.Admin.Groups.Group.onOpen(group.id)
                end, MainMenu.Admin.Groups.Group.Main)
            end

        end)
    end)
end
