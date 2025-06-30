MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Laboratories = MainMenu.Admin.Laboratories or {}
MainMenu.Admin.Laboratories.Laboratory = MainMenu.Admin.Laboratories.Laboratory or {}

local indexes = { 1, 1, 1, 1, 1, 1 }
local items, itemLabels = {}, {}
local laboratory = nil

MainMenu.Admin.Laboratories.Laboratory.onOpen = function(id)
	laboratory = Callbacks.Trigger("laboratory:get", id)

	if laboratory == nil then return end

	local list = {}
	local i = 1

	for k, v in pairs(Item._list) do
		list[v.label] = k
	end

    for label, name in Table.PairsByKeys(list) do
        table.insert(items, name)
        table.insert(itemLabels, label)

		if name == laboratory.raw_mat_1 then
			indexes[1] = i
		end

		if name == laboratory.raw_mat_2 then
			indexes[2] = i
		end

		if name == laboratory.unpooched_item then
			indexes[3] = i
		end

		if name == laboratory.residue_item then
			indexes[4] = i
		end

		if name == laboratory.pooched_item then
			indexes[5] = i
		end

		i += 1;
    end
end

MainMenu.Admin.Laboratories.Laboratory.Create = function()
    MainMenu.Admin.Laboratories.Laboratory.Main = Menus:CreateSub(MainMenu.Admin.Laboratories.Main, "Laboratoire", "default")

    Menus:CreateThread(MainMenu.Admin.Laboratories.Laboratory.Main, function()
        Menus:IsVisible(MainMenu.Admin.Laboratories.Laboratory.Main, function()
			if laboratory == nil then
				UI:AddNotification("basic", "~r~Erreur lors du chargement du laboratoire~s~", "info", 5000)
				Menus:Back()
				return
			end

			Menus:AddButton("ID", true, tostring(laboratory.id), "", function()end)

			Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("laboratory:delete", laboratory.id)
					Citizen.Wait(500)
					Menus:Back()
				end)
			end)

			Menus:AddButton("Bucket", false, tostring(laboratory.bucket), "", function()
				local newBucket = tonumber(Utils.KeyboardInput("Bucket", 5, tostring(laboratory.bucket)))

				if newBucket == nil then return end

				Events.TriggerServer("laboratory:update", laboratory.id, "bucket", newBucket)
			end)

			Menus:AddSeparator("Matières premières")

			Menus:AddList("Matière première 1", itemLabels, indexes[1], false, function (isClicked, index)
				indexes[1] = index

				if isClicked then
					Events.TriggerServer("laboratory:update", laboratory.id, "raw_mat_1", items[index])
				end
			end)

			Menus:AddList("Matière première 2", itemLabels, indexes[2], false, function (isClicked, index)
				indexes[2] = index

				if isClicked then
					Events.TriggerServer("laboratory:update", laboratory.id, "raw_mat_2", items[index])
				end
			end)

			Menus:AddSeparator("Positions")

			Menus:AddButton("Réduction", false, "🗺️", "", function ()
				Events.TriggerServer("laboratory:update", laboratory.id, "reduce_pos", vector3(player:position().x, player:position().y, player:position().z))
			end)

			Menus:AddButton("Production", false, "🗺️", "", function ()
				Events.TriggerServer("laboratory:update", laboratory.id, "produce_pos", vector3(player:position().x, player:position().y, player:position().z))
			end)

			Menus:AddButton("Collection", false, "🗺️", "", function ()
				Events.TriggerServer("laboratory:update", laboratory.id, "collect_pos", vector3(player:position().x, player:position().y, player:position().z))
			end)

			Menus:AddButton("Empochage", false, "🗺️", "", function ()
				Events.TriggerServer("laboratory:update", laboratory.id, "pooch_pos", vector3(player:position().x, player:position().y, player:position().z))
			end)

			Menus:AddSeparator("Résultat")

			Menus:AddList("Drogue produite", itemLabels, indexes[3], false, function (isClicked, index)
				indexes[3] = index

				if isClicked then
					Events.TriggerServer("laboratory:update", laboratory.id, "unpooched_item", items[index])
				end
			end)

			Menus:AddList("Résidus produit (optionnel)", itemLabels, indexes[4], false, function (isClicked, index)
				indexes[4] = index

				if isClicked then
					Events.TriggerServer("laboratory:update", laboratory.id, "residue_item", items[index])
				end
			end)

			Menus:AddList("Drogue en pochons", itemLabels, indexes[5], false, function (isClicked, index)
				indexes[5] = index

				if isClicked then
					Events.TriggerServer("laboratory:update", laboratory.id, "pooched_item", items[index])
				end
			end)
        end)
    end)
end
