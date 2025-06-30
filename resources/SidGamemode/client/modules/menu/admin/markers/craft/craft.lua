MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Markers = MainMenu.Admin.Markers or {}
MainMenu.Admin.Markers.Marker = MainMenu.Admin.Markers.Marker or {}
MainMenu.Admin.Markers.Marker.Crafts = MainMenu.Admin.Markers.Marker.Crafts or {}
MainMenu.Admin.Markers.Marker.Crafts.Craft = MainMenu.Admin.Markers.Marker.Crafts.Craft or {}

---@type Marker | nil
local currentMarker = nil
local items, itemLabels = {}, {}
local requirementIndexes = {}
local currentCraft = 0
local itemIndex = 1

MainMenu.Admin.Markers.Marker.Crafts.Craft.onOpen = function (marker, _currentCraft)
    currentMarker = marker
    currentCraft = _currentCraft

    items = {}
    itemLabels = {}

	local list = {}

	for k, v in pairs(Item._list) do
		list[v.label] = k
	end

    for label, name in Table.PairsByKeys(list) do
        table.insert(items, name)
        table.insert(itemLabels, label)
    end

    for i, item in ipairs(items) do
        if item == currentMarker:data().crafts[currentCraft].targetItem.name then
            itemIndex = i
        end
    end

    requirementIndexes = {}

    for k, v in pairs(currentMarker:data().crafts[currentCraft].requirements or {}) do
        requirementIndexes[k] = 1

        for i, item in ipairs(items) do
            if item == v.name then
                requirementIndexes[k] = i
            end
        end
    end
end

MainMenu.Admin.Markers.Marker.Crafts.Craft.Create = function()
    MainMenu.Admin.Markers.Marker.Crafts.Craft.Main = Menus:CreateSub(MainMenu.Admin.Markers.Marker.Crafts.Main, "Craft", "default")

    Menus:CreateThread(MainMenu.Admin.Markers.Marker.Crafts.Craft.Main, function()
        Menus:IsVisible(MainMenu.Admin.Markers.Marker.Crafts.Craft.Main, function()
            if currentMarker == nil then
                return
            end

            Menus:AddList("Item", itemLabels, itemIndex, false, function(isClicked, index)

                if isClicked then
                    currentMarker:data().crafts[currentCraft].targetItem.name = items[index]
                    currentMarker:data().crafts[currentCraft].targetItem.label = itemLabels[index]
                    currentMarker:data().crafts[currentCraft].targetItem.weight = Item.Get(items[index]).weight

                    Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
                end

                itemIndex = index
            end)

            Menus:AddButton("Quantité", false, tostring(currentMarker:data().crafts[currentCraft].targetItem.quantity), "", function()
                local quantity = tonumber(Utils.KeyboardInput("Quantité", 5, currentMarker:data().crafts[currentCraft].targetItem.quantity))

                if quantity == nil then
                    return
                end

                currentMarker:data().crafts[currentCraft].targetItem.quantity = quantity

                Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
            end)

            Menus:AddButton("Temps de craft", false, tostring(currentMarker:data().crafts[currentCraft].craftTime), "", function()
                local craftTime = tonumber(Utils.KeyboardInput("Temps de craft", 5, currentMarker:data().crafts[currentCraft].craftTime))

                if craftTime == nil then
                    return
                end

                currentMarker:data().crafts[currentCraft].craftTime = craftTime

                Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())

            end)

            Menus:AddButton("Ajouter une ressource", false, "➕", "", function()
                if currentMarker:data().crafts[currentCraft].requirements == nil then
                    currentMarker:data().crafts[currentCraft].requirements = {}
                end

                table.insert(currentMarker:data().crafts[currentCraft].requirements, {
                    label = "",
                    name = "",
                    quantity = 0,
                })

                table.insert(requirementIndexes, 1)
            end)

            Menus:AddButton("~r~Supprimer le craft~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					table.remove(currentMarker:data().crafts, currentCraft)

					Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
				end)
			end)

            for k, v in pairs(currentMarker:data().crafts[currentCraft].requirements or {}) do
                Menus:AddSeparator(("Ressource %s"):format(k))

                Menus:AddList("Item", itemLabels, requirementIndexes[k], false, function(isClicked, index)
                    if isClicked then
                        currentMarker:data().crafts[currentCraft].requirements[k].name = items[index]
                        currentMarker:data().crafts[currentCraft].requirements[k].label = itemLabels[index]

                        Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
                    end

                    requirementIndexes[k] = index
                end)

                Menus:AddButton("Quantité", false, tostring(currentMarker:data().crafts[currentCraft].requirements[k].quantity), "", function()
                    local quantity = tonumber(Utils.KeyboardInput("Quantité", 5, currentMarker:data().crafts[currentCraft].requirements[k].quantity))

                    if quantity == nil then
                        return
                    end

                    currentMarker:data().crafts[currentCraft].requirements[k].quantity = quantity

                    Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
                end)

                Menus:AddButton("~r~Supprimer la ressource~s~", false, "🗑️", "", function()
					Utils.ValidateDeletion(function()
						table.remove(currentMarker:data().crafts[currentCraft].requirements, k)

						Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
					end)
				end)
            end

        end)
    end)
end
