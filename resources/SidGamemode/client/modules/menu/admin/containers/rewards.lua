MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Containers = MainMenu.Admin.Containers or {}
MainMenu.Admin.Containers.Rewards = MainMenu.Admin.Containers.Rewards or {}

local items, itemLabels, itemIndex = {}, {}, 1
local container = nil
local item = nil

MainMenu.Admin.Containers.Rewards.onOpen = function(id)
	container = Callbacks.Trigger("container:get", id)

	local list = {}

	items = {}
	itemLabels = {}
	itemIndex = 1

	for k, v in pairs(Item._list) do
		list[v.label] = k
	end

    for label, name in Table.PairsByKeys(list) do
        table.insert(itemLabels, label)
        table.insert(items, name)
    end
end

MainMenu.Admin.Containers.Rewards.Create = function()
    MainMenu.Admin.Containers.Rewards.Main = Menus:CreateSub(MainMenu.Admin.Containers.Main, "Récompenses", "default")

    Menus:CreateThread(MainMenu.Admin.Containers.Rewards.Main, function()
        Menus:IsVisible(MainMenu.Admin.Containers.Rewards.Main, function()
			if container == nil then
				UI:AddNotification("basic", "~r~Erreur lors du chargement des récompenses~s~", "info", 5000)
				Menus:Back()
				return
			end

			Menus:AddList("Ajouter une récompense", itemLabels, itemIndex, false, function(isClicked, index)
                if isClicked then
                    table.insert(container.reward, {
						item = items[itemIndex],
						chance = 50,
						min = 1,
						max = 1,
					})

					Events.TriggerServer("container:update", container.id, container.coords, container.rotation, container.reward)
					Citizen.Wait(1000)

					MainMenu.Admin.Containers.Rewards.onOpen(container.id)
                end

                itemIndex = index
            end)

			Menus:AddSeparator("Récompenses")

			for k, reward in pairs(container.reward) do
				item = Item.Get(reward.item)

				if item ~= nil then
					Menus:AddButton(item.label, false, "", "chevron_right", function()
						MainMenu.Admin.Containers.Reward.onOpen(container.id, reward.item)
					end, MainMenu.Admin.Containers.Reward.Main)
				end
			end
        end)
    end)
end
