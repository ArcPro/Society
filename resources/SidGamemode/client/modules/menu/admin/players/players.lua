MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Players = MainMenu.Admin.Players or {}

local players = {
    all = { online = {}, offline = {} },
    filtered = { online = {}, offline = {} }
}
local displayOffline = false

MainMenu.Admin.Players.onOpen = function ()
    players.all = Callbacks.Trigger("player:all")

	table.sort(players.all.online, function(a, b)
		return a.id < b.id
	end)

	table.sort(players.all.offline, function(a, b)
		return a.id < b.id
	end)

    players.filtered = Functions.DeepCopy(players.all)
end

MainMenu.Admin.Players.Create = function()
    MainMenu.Admin.Players.Main = Menus:CreateSub(MainMenu.Admin.Main, "Joueurs", "default")
    MainMenu.Admin.Players.Player.Create()

    Menus:CreateThread(MainMenu.Admin.Players.Main, function()
        Menus:IsVisible(MainMenu.Admin.Players.Main, function()

            Menus:AddCheckbox("Afficher les joueurs hors-ligne", false, displayOffline, function(checked)
                displayOffline = checked
            end)

            Menus:AddButton("Rechercher", false, "🔍", "", function()
                local filter = Utils.KeyboardInput("Recherche", 50, "")

                if filter == "" or filter == nil then
                    players.filtered = Functions.DeepCopy(players.all)
                    filter = nil
                    return
                end

				filter = filter:lower()

                players.filtered.online = {}
                for _, v in pairs(players.all.online) do
                    if filter ~= nil and (
                        string.find(v.nickname:lower(), filter) or
                        string.find(v.discord:lower(), filter) or
                        string.find(v.name:lower(), filter) or
                        string.find(tostring(v.id):lower(), filter)
                    ) then
                        table.insert(players.filtered.online, v)
                    end
                end

                players.filtered.offline = {}
                for _, v in pairs(players.all.offline) do
                    if filter ~= nil and (
                        string.find(v.nickname:lower(), filter) or
                        string.find(v.discord:lower(), filter) or
                        string.find(v.name:lower(), filter) or
                        string.find(tostring(v.id):lower(), filter)
                    ) then
                        table.insert(players.filtered.offline, v)
                    end
                end
            end)

            Menus:AddSeparator("En ligne")
            local colorCode = {
                [0] = "", -- Default
                [1] = "y", -- VIP1
                [2] = "b", -- VIP2
                [3] = "g", -- MOD
                [4] = "g", -- MOD+
                [5] = "o", -- HM
                [6] = "p", -- Dev
                [7] = "r", -- Admin
            }

            
            for _, p in pairs(players.filtered.online) do
                local code = colorCode[p.permissions] or "s"
                print(code)
                print(p.permissions)
                Menus:AddButton(("~%s~[%s] %s | %s~s~"):format(code, p.id, p.name, p.nickname), false, "", "", function()
                    MainMenu.Admin.Players.Player.onOpen(p.id, true)
                end, MainMenu.Admin.Players.Player.Main)
            end

            if not displayOffline then return end

            Menus:AddSeparator("Hors ligne")

            for _, p in pairs(players.filtered.offline) do
                Menus:AddButton(("[%s] %s"):format(p.id, p.name), false, "", "", function()
                    MainMenu.Admin.Players.Player.onOpen(p.id, false)
                end, MainMenu.Admin.Players.Player.Main)
            end
        end)
    end)
end
