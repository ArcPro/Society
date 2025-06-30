MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.FarmCircuits = MainMenu.Admin.FarmCircuits or {}
MainMenu.Admin.FarmCircuits.Circuit = MainMenu.Admin.FarmCircuits.Circuit or {}

local circuit = nil;
local items = {}
local itemLabels = {}
local itemIndexes = {
	harvest = 1,
	treatment = 1
}

local function updateCircuit(key, value)
    if circuit == nil then return end
    Events.TriggerServer("farm:update", circuit.id, key, value)
    Citizen.Wait(250)
    MainMenu.Admin.FarmCircuits.Circuit.onOpen(circuit.id)
end

MainMenu.Admin.FarmCircuits.Circuit.onOpen = function (id)
    circuit = Callbacks.Trigger("farm:get", id)

	if not circuit then return end

	local list = {}

	for k, v in pairs(Item._list) do
		list[v.label] = k
	end

	local i = 1

    for label, name in Table.PairsByKeys(list) do
        table.insert(items, name)
        table.insert(itemLabels, label)

		if name == circuit.harvest_item then
			itemIndexes.harvest = i
		end

		if name == circuit.treatment_item then
			itemIndexes.treatment = i
		end

		i += 1;
    end
end

MainMenu.Admin.FarmCircuits.Circuit.Create = function()
    MainMenu.Admin.FarmCircuits.Circuit.Main = Menus:CreateSub(MainMenu.Admin.FarmCircuits.Main, "Circuit de farm", "default")

    Menus:CreateThread(MainMenu.Admin.FarmCircuits.Circuit.Main, function()
        Menus:IsVisible(MainMenu.Admin.FarmCircuits.Circuit.Main, function()

            if circuit == nil then return end

            Menus:AddButton("Entreprise liée", false, tostring(circuit.society) or "", "", function()
                local society = tonumber(Utils.KeyboardInput("Entreprise liée", 6, ""))

                if society == nil then return end

                updateCircuit("society", society)
            end)

            Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("farm:delete", circuit.id)
					Citizen.Wait(500)

					MainMenu.Admin.FarmCircuits.onOpen()
					Menus:Back()
				end)
            end)

            Menus:AddSeparator("Récolte")

			Menus:AddList("Item", itemLabels, itemIndexes.harvest, false, function(isClicked, index)
                if isClicked then
					updateCircuit("harvest_item", items[index])
                end

                itemIndexes.harvest = index
            end)

            Menus:AddButton("Emote", false, circuit.harvest_emote or "", "", function()
                local emote = Utils.KeyboardInput("Emote de récolte", 50, "")

                if emote == nil then return end

                updateCircuit("harvest_emote", emote)
            end)

            Menus:AddButton("Position", false, "🗺️", "", function()
                updateCircuit("harvest_pos", GetEntityCoords(PlayerPedId(), true))
            end)

            Menus:AddSeparator("Traitement")

            Menus:AddList("Item", itemLabels, itemIndexes.treatment, false, function(isClicked, index)
                if isClicked then
					updateCircuit("treatment_item", items[index])
                end

                itemIndexes.treatment = index
            end)

            Menus:AddButton("Emote", false, circuit.treatment_emote or "", "", function()
                local emote = Utils.KeyboardInput("Emote de traitement", 50, "")

                if emote == nil then return end

                updateCircuit("treatment_emote", emote)
            end)

            Menus:AddButton("Position", false, "🗺️", "", function()
                updateCircuit("treatment_pos", GetEntityCoords(PlayerPedId(), true))
            end)

            Menus:AddSeparator("Vente")

            Menus:AddButton("Prix", false, tostring(circuit.sell_price) or "", "", function()
                local price = tonumber(Utils.KeyboardInput("Prix de vente", 6, ""))

                if price == nil then return end

                updateCircuit("sell_price", price)
            end)

            Menus:AddButton("Position", false, "🗺️", "", function()
                updateCircuit("sell_pos", GetEntityCoords(PlayerPedId(), true))
            end)

        end)
    end)
end
