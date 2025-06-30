MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Markers = MainMenu.Admin.Markers or {}
MainMenu.Admin.Markers.Marker = MainMenu.Admin.Markers.Marker or {}
MainMenu.Admin.Markers.Marker.Shop = MainMenu.Admin.Markers.Marker.Shop or {}
MainMenu.Admin.Markers.Marker.Shop.Category = MainMenu.Admin.Markers.Marker.Shop.Category or {}

---@type Marker | nil
local currentMarker = nil
local currentCategory = nil
local items = {}
local itemLabels = {}
local itemIndex = 1;

---@param marker Marker
MainMenu.Admin.Markers.Marker.Shop.Category.onOpen = function (marker, category)
    currentMarker = marker
    currentCategory = category

    if currentCategory == nil or currentMarker == nil or currentMarker:data().shop == nil or currentMarker:data().shop[currentCategory] == nil then return end

	local list = {}

	for k, v in pairs(Item._list) do
		list[v.label] = k
	end

    for label, name in Table.PairsByKeys(list) do
        table.insert(items, name)
        table.insert(itemLabels, label)
    end
end

MainMenu.Admin.Markers.Marker.Shop.Category.Create = function()
    MainMenu.Admin.Markers.Marker.Shop.Category.Main = Menus:CreateSub(MainMenu.Admin.Markers.Marker.Shop.Main, "Shop | Catégorie", "default")

    Menus:CreateThread(MainMenu.Admin.Markers.Marker.Shop.Category.Main, function()
        Menus:IsVisible(MainMenu.Admin.Markers.Marker.Shop.Category.Main, function()
            if currentCategory == nil or currentMarker == nil or currentMarker:data().shop == nil or currentMarker:data().shop[currentCategory] == nil then return end

			Menus:AddButton("Nom de la catégorie", false, currentCategory, "", function()
				local newCategoryName = Utils.KeyboardInput("Nouveau nom de la catégorie", 255, currentCategory)

				if not newCategoryName then return end

				currentMarker:data().shop[newCategoryName] = currentMarker:data().shop[currentCategory]
				currentMarker:data().shop[currentCategory] = nil
				currentCategory = newCategoryName

				Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
            end)

			Menus:AddButton("~r~Supprimer de la catégorie~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					currentMarker:data().shop[currentCategory] = nil

					Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
				end)
			end)

            Menus:AddList("Ajouter un item", itemLabels, itemIndex, false, function(isClicked, index)
                if isClicked then
                    table.insert(currentMarker:data().shop[currentCategory], items[itemIndex])

                    Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
                    MainMenu.Admin.Markers.Marker.Shop.Category.onOpen(currentMarker, currentCategory)
                end

                itemIndex = index
            end)

            if #currentMarker:data().shop[currentCategory] == 0 then
                Menus:AddButton("~r~Aucun item dans la catégorie.", true, "", "", function()end)
                return
            end

            Menus:AddSeparator(("Items dans la catégorie %s"):format(currentCategory))

            for k, item in pairs(currentMarker:data().shop[currentCategory]) do
                Menus:AddButton((Item.Get(item) or { label = "Item inexistant" }).label, false, "🗑️", "", function()
                    table.remove(currentMarker:data().shop[currentCategory], k)

                    Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
                    MainMenu.Admin.Markers.Marker.Shop.Category.onOpen(currentMarker, currentCategory)
                end)
            end
        end)
    end)
end
