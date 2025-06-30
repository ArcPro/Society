MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Bans = MainMenu.Admin.Bans or {}

local bans = { all = {}, filtered = {} }
local filter = nil

MainMenu.Admin.Bans.onOpen = function ()
    bans.all = Callbacks.Trigger("admin:banlist")
	bans.filtered = {}
end

MainMenu.Admin.Bans.Create = function()
    MainMenu.Admin.Bans.Main = Menus:CreateSub(MainMenu.Admin.Main, "Bans", "default")
    MainMenu.Admin.Bans.Ban.Create()

    Menus:CreateThread(MainMenu.Admin.Bans.Main, function()
        Menus:IsVisible(MainMenu.Admin.Bans.Main, function()
			Menus:AddButton("Rechercher", false, "🔍", "", function()
				filter = Utils.KeyboardInput("Recherche", 255, filter)
				bans.filtered = {}

				for _, ban in pairs(bans.all) do
					if ban.discord:find(filter) or ban.reason:find(filter) then
						table.insert(bans.filtered, ban)
					end
				end
			end)

			Menus:AddSeparator("Liste des bannissements")

            for _, ban in pairs(bans.filtered) do
                Menus:AddButton(("Discord: %s"):format(ban.discord), false, "", "", function()
                    MainMenu.Admin.Bans.Ban.onOpen(ban)
                end, MainMenu.Admin.Bans.Ban.Main)
            end
        end)
    end)
end
