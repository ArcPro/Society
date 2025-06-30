MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Minimarkets = MainMenu.Admin.Minimarkets or {}
MainMenu.Admin.Minimarkets.Minimarket = MainMenu.Admin.Minimarkets.Minimarket or {}

local minimarket = nil

MainMenu.Admin.Minimarkets.Minimarket.onOpen = function(id)
	minimarket = Callbacks.Trigger("minimarket:get", id)
end

MainMenu.Admin.Minimarkets.Minimarket.Create = function()
    MainMenu.Admin.Minimarkets.Minimarket.Main = Menus:CreateSub(MainMenu.Admin.Minimarkets.Main, "Supérette", "default")

    Menus:CreateThread(MainMenu.Admin.Minimarkets.Minimarket.Main, function()
        Menus:IsVisible(MainMenu.Admin.Minimarkets.Minimarket.Main, function()
			if minimarket == nil then
				UI:AddNotification("basic", "~r~Erreur lors du chargement de la supérette~s~", "info", 5000)
				Menus:Back()
				return
			end

			Menus:AddButton("ID", true, tostring(minimarket.id), "", function()end)

			Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("minimarket:delete", minimarket.id)
					Citizen.Wait(1000)

					Menus:Back()
				end)
			end)

			Menus:AddButton("Position du PNJ", false, "🗺️", "", function()
				Events.TriggerServer("minimarket:update", minimarket.id, vector4(player:position().x, player:position().y, player:position().z - 0.95, player:heading()), vector3(minimarket.safe_coords.x, minimarket.safe_coords.y, minimarket.safe_coords.z))
				Citizen.Wait(1000)

				minimarket = Callbacks.Trigger("minimarket:get", minimarket.id)
			end)

			Menus:AddButton("Position du coffre-fort", false, "🗺️", "", function()
				Events.TriggerServer("minimarket:update", minimarket.id, vector4(minimarket.ped_coords.x, minimarket.ped_coords.y, minimarket.ped_coords.z, minimarket.ped_coords.w), vector3(player:position().x, player:position().y, player:position().z))
				Citizen.Wait(1000)

				minimarket = Callbacks.Trigger("minimarket:get", minimarket.id)
			end)
        end)
    end)
end
