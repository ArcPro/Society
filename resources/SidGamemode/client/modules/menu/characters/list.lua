MainMenu = MainMenu or {}
MainMenu.Characters = MainMenu.Characters or {}

local characters = {}

MainMenu.Characters.Create = function()
    MainMenu.Characters.Main = Menus:CreateSub(MainMenu.Main, "Mes personnages", "default")

    Menus:CreateThread(MainMenu.Characters.Main, function()
        Menus:IsVisible(MainMenu.Characters.Main, function()
			Menus:AddButton("Nombre de slots", false, ("%d/%d"):format(#characters, player:slots()), "", function()end)

			Menus:AddButton("Créer un nouveau personnage", false, "➕", "", function()
				if #characters >= player:slots() then
					UI:AddNotification("basic", "~r~Vous n'avez plus de slot disponible.~s~", "info", 5000)
					return
				end

				Events.Trigger("skinchanger:new")
			end)

			Menus:AddSeparator("Vos personnages")

            if #characters == 0 then
				Menus:AddButton("~r~Erreur lors du chargement de vos personnages.~s~", false, "", "", function()end)
			end

			for k, character in pairs(characters) do
				Menus:AddButton(
					("%d | %s %s"):format(character.id, character.firstname, character.lastname),
					false,
					("%s"):format(character.locked == 1 and "🔒" or player:id() == character.id and "✅" or ""),
					"",
					function()
						if character.locked == 1 then
							UI:AddNotification("basic", "~r~Ce personnage est bloqué.~s~", "info", 5000)
							return
						end

						Events.TriggerServer("player:switch", character.id)
						UI:AddNotification("basic", "Personnage synchronisé !", "info", 5000)
						Citizen.Wait(500)
						Core.Player:Load(character.id)
					end
				)
			end

        end)
    end)

	Menus:OnOpen(MainMenu.Characters.Main, function()
		characters = Callbacks.Trigger("player:getCharacters")
	end)
end
