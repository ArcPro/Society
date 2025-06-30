MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Containers = MainMenu.Admin.Containers or {}
MainMenu.Admin.Containers.Reward = MainMenu.Admin.Containers.Reward or {}

local container = nil
local index = nil

MainMenu.Admin.Containers.Reward.onOpen = function(id, item)
	container = Callbacks.Trigger("container:get", id) or {}

	for idx, reward in pairs(container.reward) do
		if reward.item == item then
			index = idx
			break
		end
	end
end

MainMenu.Admin.Containers.Reward.Create = function()
    MainMenu.Admin.Containers.Reward.Main = Menus:CreateSub(MainMenu.Admin.Containers.Main, "Récompense", "default")

    Menus:CreateThread(MainMenu.Admin.Containers.Reward.Main, function()
        Menus:IsVisible(MainMenu.Admin.Containers.Reward.Main, function()
			if container == nil or index == nil then
				UI:AddNotification("basic", "~r~Erreur lors du chargement de la récompense~s~", "info", 5000)
				Menus:Back()
				return
			end

			Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					container.reward[index] = nil
					Events.TriggerServer("container:update", container.id, container.coords, container.rotation, container.reward)
					Menus:Back()
				end)
			end)

			Menus:AddButton("Pourcentage d'apparition", false, tostring(container.reward[index].chance), "", function()
				local chance = tonumber(Utils.KeyboardInput("Pourcentage d'apparition", 3, tostring(container.reward[index].chance)))

				if chance == nil then return end

				container.reward[index].chance = chance
				Events.TriggerServer("container:update", container.id, container.coords, container.rotation, container.reward)
			end)

			Menus:AddButton("Quantité min.", false, tostring(container.reward[index].min), "", function()
				local min = tonumber(Utils.KeyboardInput("Quantité min.", 3, tostring(container.reward[index].min)))

				if min == nil then return end

				container.reward[index].min = min
				Events.TriggerServer("container:update", container.id, container.coords, container.rotation, container.reward)
			end)

			Menus:AddButton("Quantité max.", false, tostring(container.reward[index].max), "", function()
				local max = tonumber(Utils.KeyboardInput("Quantité max.", 3, tostring(container.reward[index].max)))

				if max == nil then return end

				container.reward[index].max = max
				Events.TriggerServer("container:update", container.id, container.coords, container.rotation, container.reward)
			end)
        end)
    end)
end
