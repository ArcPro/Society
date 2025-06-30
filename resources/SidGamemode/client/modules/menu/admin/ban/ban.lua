MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Bans = MainMenu.Admin.Bans or {}
MainMenu.Admin.Bans.Ban = {}

local ban = nil

MainMenu.Admin.Bans.Ban.onOpen = function(b)
    ban = b
	ban.end_date = Callbacks.Trigger("date:format", "%d/%m/%Y %H:%M", b.expiration / 1000)
end

MainMenu.Admin.Bans.Ban.Create = function()
    MainMenu.Admin.Bans.Ban.Main = Menus:CreateSub(MainMenu.Admin.Bans.Main, "Action", "default")

    Menus:CreateThread(MainMenu.Admin.Bans.Ban.Main, function()
        Menus:IsVisible(MainMenu.Admin.Bans.Ban.Main, function()
			if ban == nil then return end

			Menus:AddSeparator("Raison")

			Menus:AddButton(ban.reason, true, "", "", function()end)

			Menus:AddButton("Expiration", true, ban.end_date, "", function()end)

			Menus:AddButton("~r~Révoquer le ban~s~", false, "🗑️", "", function()
				Events.TriggerServer("admin:unban", ban.discord)
				Menus:Back()
			end)
        end)
    end)
end
