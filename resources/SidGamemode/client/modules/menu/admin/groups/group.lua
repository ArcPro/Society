MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Groups = MainMenu.Admin.Groups or {}
MainMenu.Admin.Groups.Group = MainMenu.Admin.Groups.Group or {}

local group = {}

MainMenu.Admin.Groups.Group.onOpen = function (id)
    group = Callbacks.Trigger("group:get", id)
end

MainMenu.Admin.Groups.Group.Create = function()
    MainMenu.Admin.Groups.Group.Main = Menus:CreateSub(MainMenu.Admin.Groups.Group.Main, "Groupe", "default")

    Menus:CreateThread(MainMenu.Admin.Groups.Group.Main, function()
        Menus:IsVisible(MainMenu.Admin.Groups.Group.Main, function()

			Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("group:delete", group.id)
					Citizen.Wait(500)
					Menus:Back()
				end)
			end)

            Menus:AddSeparator("Informations")

			Menus:AddButton("Nom", false, group.name, "", function()
				local name = Utils.KeyboardInput("Nom du groupe", 50, group.name)

				if name == nil then return end

				Events.TriggerServer("group:update", group.id, name, group.label)
			end)

			Menus:AddButton("Label", false, group.label, "", function()
				local label = Utils.KeyboardInput("Label du groupe", 50, group.label)

				if label == nil then return end

				Events.TriggerServer("group:update", group.id, group.name, label)
			end)

        end)
    end)
end
