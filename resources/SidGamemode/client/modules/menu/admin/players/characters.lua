MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Players = MainMenu.Admin.Players or {}
MainMenu.Admin.Players.Player = MainMenu.Admin.Players.Player or {}
MainMenu.Admin.Players.Player.Characters = {}

local playerId = nil
local characters = {}
local slots = 0

MainMenu.Admin.Players.Player.Characters.onOpen = function (id)
	playerId = id
end

MainMenu.Admin.Players.Player.Characters.Create = function()
    MainMenu.Admin.Players.Player.Characters.Main = Menus:CreateSub(MainMenu.Admin.Players.Player.Main, "Personnages", "default")
    MainMenu.Admin.Players.Player.Character.Create()

    Menus:CreateThread(MainMenu.Admin.Players.Player.Characters.Main, function()
        Menus:IsVisible(MainMenu.Admin.Players.Player.Characters.Main, function()

			Menus:AddButton("Nombre de slots", false, tostring(slots), "", function()
				local newSlots = tonumber(Utils.KeyboardInput("Nombre de slots", 5, ""))

				if not newSlots then return end

				slots = newSlots
				Events.TriggerServer("admin:setPlayerCharacterSlots", playerId, newSlots)
			end)

			Menus:AddSeparator("Liste des personnages")

            for k, character in pairs(characters) do
				Menus:AddButton(
					("%d | %s %s"):format(character.id, character.firstname, character.lastname),
					false,
					("%s"):format(character.locked == 1 and "🔒" or player:id() == character.id and "✅" or ""),
					"",
					function()
						MainMenu.Admin.Players.Player.Character.onOpen(character)
					end,
					MainMenu.Admin.Players.Player.Character.Main
				)
			end
        end)
    end)

	Menus:OnOpen(MainMenu.Admin.Players.Player.Characters.Main, function()
		characters = Callbacks.Trigger("player:getCharacters", playerId)
		slots = Callbacks.Trigger("player:getSlots", playerId) or 0
	end)
end
