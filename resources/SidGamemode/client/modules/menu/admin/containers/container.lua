MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Containers = MainMenu.Admin.Containers or {}
MainMenu.Admin.Containers.Container = MainMenu.Admin.Containers.Container or {}

local container = nil

MainMenu.Admin.Containers.Container.onOpen = function(id)
	container = Callbacks.Trigger("container:get", id)
end

MainMenu.Admin.Containers.Container.Create = function()
    MainMenu.Admin.Containers.Container.Main = Menus:CreateSub(MainMenu.Admin.Containers.Main, "Conteneur", "default")

    Menus:CreateThread(MainMenu.Admin.Containers.Container.Main, function()
        Menus:IsVisible(MainMenu.Admin.Containers.Container.Main, function()
			if container == nil then
				UI:AddNotification("basic", "~r~Erreur lors du chargement du conteneur~s~", "info", 5000)
				Menus:Back()
				return
			end

			Menus:AddButton("ID", true, tostring(container.id), "", function()end)

			Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("container:delete", container.id)
					Citizen.Wait(1000)

					Menus:Back()
				end)
			end)

			Menus:AddButton("Position du conteneur", false, "🗺️", "", function()
				Events.TriggerServer("container:update", container.id, GetEntityCoords(PlayerPedId(), true) + GetEntityForwardVector(PlayerPedId()) * 2.5, GetEntityRotation(PlayerPedId(), 2), container.reward or {})
				Citizen.Wait(1000)

				MainMenu.Admin.Containers.Container.onOpen(container.id)
			end)

			Menus:AddButton("S'y téléporter", false, "🗺️", "", function()
				player:position(vector3(container.coords.x, container.coords.y, container.coords.z), true)
			end)

			Menus:AddButton("Récompenses du conteneur", false, "", "chevron_right", function()
				MainMenu.Admin.Containers.Rewards.onOpen(container.id)
			end, MainMenu.Admin.Containers.Rewards.Main)
        end)
    end)
end
