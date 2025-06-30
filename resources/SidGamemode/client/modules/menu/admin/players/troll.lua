MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Players = MainMenu.Admin.Players or {}
MainMenu.Admin.Players.Player = MainMenu.Admin.Players.Player or {}
MainMenu.Admin.Players.Player.Troll = MainMenu.Admin.Players.Player.Troll or {}

---@type Player
local currentPlayerSource = nil
local soundboardIndex = 1
local soundboards = {}

MainMenu.Admin.Players.Player.Troll.onOpen = function (source)
    currentPlayerSource = source

	UI:SendMessage("sound_list")
	UI:RegisterCallback("sound_list", function(data, cb)
		soundboards = data.sounds
		cb(true)
	end)
end

MainMenu.Admin.Players.Player.Troll.Create = function()
    MainMenu.Admin.Players.Player.Troll.Main = Menus:CreateSub(MainMenu.Admin.Players.Player.Main, "Troll", "default")

    Menus:CreateThread(MainMenu.Admin.Players.Player.Troll.Main, function()
        Menus:IsVisible(MainMenu.Admin.Players.Player.Troll.Main, function()
            if #soundboards == 0 then return end

			Menus:AddButton("/me", false, "💬", "", function()
				local text = Utils.KeyboardInput("Message", 100, "")

				if text then
					Events.TriggerServer("me", text, currentPlayerSource)
				end
			end)

			Menus:AddButton("Emote", false, "🕺", "", function()
				local emote = Utils.KeyboardInput("Emote", 100, "")

				if emote then
					Events.TriggerServer("admin:emote", currentPlayerSource, emote)
				end
			end)

			Menus:AddButton("Ragdoll", false, "🫠", "", function()
				Events.TriggerServer("admin:ragdoll", currentPlayerSource)
			end)

			Menus:AddButton("Le faire voler", false, "✈️", "", function()
				Events.TriggerServer("admin:makeemfly", currentPlayerSource)
			end)

			Menus:AddCheckbox("Faire une licorne", false, OnesyncPlayer(currentPlayerSource).state.unicorn == true, function(checked)
				Events.TriggerServer("onesync:update", currentPlayerSource, "unicorn", checked)
			end)

			Menus:AddCheckbox("Le faire bruler", false, OnesyncPlayer(currentPlayerSource).state.burning == true, function(checked)
				Events.TriggerServer("onesync:update", currentPlayerSource, "burning", checked)
			end)

			Menus:AddCheckbox("Lui mettre un écran noir", false, OnesyncPlayer(currentPlayerSource).state.blackscreen == true, function(checked)
				Events.TriggerServer("onesync:update", currentPlayerSource, "blackscreen", checked)
			end)

			Menus:AddList("Soundboard", soundboards, soundboardIndex, false, function(isClicked, index)
				soundboardIndex = index

				if isClicked then
					Events.TriggerServer("admin:soundboard", currentPlayerSource, soundboards[soundboardIndex])
				end
			end)
        end)
    end)
end
