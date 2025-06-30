MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Moderation = {}

MainMenu.Admin.Moderation.Create = function()
    MainMenu.Admin.Moderation.Main = Menus:CreateSub(MainMenu.Admin.Main, "Modération", "default")

    Menus:CreateThread(MainMenu.Admin.Moderation.Main, function()
        Menus:IsVisible(MainMenu.Admin.Moderation.Main, function()
            Menus:AddCheckbox("Afficher les blips", false, LocalPlayer.state.blips == true, function(checked)
                LocalPlayer.state:set("blips", checked)
            end)

            Menus:AddCheckbox("Afficher les noms", false, LocalPlayer.state.player_names == true, function(checked)
                Events.Trigger("admin:toggleNames", checked)
            end)

            Menus:AddCheckbox("Noclip", false, ClientModules.Admin.Noclip.enabled, function()
                ClientModules.Admin.Noclip:Use()
            end)

			Menus:AddCheckbox("Invisibilité", false, LocalPlayer.state.invisible == true, function(checked)
				LocalPlayer.state:set("invisible", checked, true)
                SetEntityVisible(PlayerPedId(), not checked, false)
            end)

			Menus:AddCheckbox("God mode", false, LocalPlayer.state.godmode == true, function(checked)
				LocalPlayer.state:set("godmode", checked, true)
                SetEntityInvincible(PlayerPedId(), checked)
			end)

			if player:permissions() >= Config.Permissions.ADMIN then
				Menus:AddCheckbox("Vanish", false, LocalPlayer.state.vanish or false, function(checked)
					LocalPlayer.state:set("vanish", checked, true)
				end)
			end
        end)
    end)
end
