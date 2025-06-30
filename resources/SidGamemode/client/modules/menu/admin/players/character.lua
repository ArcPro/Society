MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Players = MainMenu.Admin.Players or {}
MainMenu.Admin.Players.Player = MainMenu.Admin.Players.Player or {}
MainMenu.Admin.Players.Player.Character = {}

local currentCharacter = nil

MainMenu.Admin.Players.Player.Character.onOpen = function (character)
	currentCharacter = character
end

MainMenu.Admin.Players.Player.Character.Create = function()
    MainMenu.Admin.Players.Player.Character.Main = Menus:CreateSub(MainMenu.Admin.Players.Player.Main, "Personnage", "default")

    Menus:CreateThread(MainMenu.Admin.Players.Player.Character.Main, function()
        Menus:IsVisible(MainMenu.Admin.Players.Player.Character.Main, function()
			if currentCharacter == nil then return end

            Menus:AddButton(("%s"):format(currentCharacter.locked == 1 and "Débloquer" or "Bloquer"), false, "🔒", "", function()
				Events.TriggerServer("admin:toggleCharacterLockStatus", currentCharacter.id, currentCharacter.locked == 1 and 0 or 1)
			end)

			Menus:AddButton("Charger", currentCharacter.locked == 1, "🙍", "", function()
				Core.Player:Load(currentCharacter.id)
			end)

			Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Menus:Back()
					Menus:Back()

					Events.TriggerServer("admin:wipe", currentCharacter.id)
				end)
			end)
        end)
    end)
end
