MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Markers = MainMenu.Admin.Markers or {}
MainMenu.Admin.Markers.Marker = MainMenu.Admin.Markers.Marker or {}
MainMenu.Admin.Markers.Marker.Cloakroom = MainMenu.Admin.Markers.Marker.Cloakroom or {}
MainMenu.Admin.Markers.Marker.Cloakroom.Variations = MainMenu.Admin.Markers.Marker.Cloakroom.Variations or {}

---@type Marker | nil
local currentMarker = nil
local currentCategory = nil
local currentSex = nil
local isProp = false
local i = 1

---@return string
local getVariation = function(index)
	local category = isProp and Lists.Variations.PropsIndexes[currentCategory]:lower() or Lists.Variations.ClothIndexes[currentCategory]:lower()

	if currentMarker == nil then
		return "a"
	end

	for k, v in pairs(currentMarker:data().cloakroom[currentSex][category]) do
		if v.component == index then
			return tostring(v.variation)
		end
	end

	return "b"
end

MainMenu.Admin.Markers.Marker.Cloakroom.Variations.onOpen = function (marker, index, category, sex, prop)
	currentCategory = category
    currentMarker = marker
	currentSex = sex
	isProp = prop
	i = index
end

MainMenu.Admin.Markers.Marker.Cloakroom.Variations.Create = function()
    MainMenu.Admin.Markers.Marker.Cloakroom.Variations.Main = Menus:CreateSub(MainMenu.Admin.Markers.Marker.Cloakroom.Main, "Vestiaire | Variations", "default")

    Menus:CreateThread(MainMenu.Admin.Markers.Marker.Cloakroom.Variations.Main, function()
        Menus:IsVisible(MainMenu.Admin.Markers.Marker.Cloakroom.Variations.Main, function()
			if currentMarker == nil then return end

			Menus:AddCheckbox(("#%d"):format(i), false, true, function(checked)
				local data = currentMarker:data()
				local category = isProp and Lists.Variations.PropsIndexes[currentCategory]:lower() or Lists.Variations.ClothIndexes[currentCategory]:lower()

				if data.cloakroom[currentSex][category] == nil then
					data.cloakroom[currentSex][category] = {}
				end

				if not checked then
					for k, v in pairs(data.cloakroom[currentSex][category]) do
						if v.component == i then
							table.remove(data.cloakroom[currentSex][category], k)

							if #data.cloakroom[currentSex][category] == 0 then
								data.cloakroom[currentSex][category] = nil
							end

							break
						end
					end
				end

				currentMarker:data(data)
				Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
				Menus:Back()
			end)

			Menus:AddButton("Variation affichée", false, getVariation(i), "", function()
				local category = isProp and Lists.Variations.PropsIndexes[currentCategory]:lower() or Lists.Variations.ClothIndexes[currentCategory]:lower()
				local variation = tonumber(Utils.KeyboardInput("Variation affichée", 3, ""))
				local data = currentMarker:data()

				if variation == nil then return end

				for k, v in pairs(data.cloakroom[currentSex][category]) do
					if v.component == i then
						data.cloakroom[currentSex][category][k] = {
							component = v.component,
							variation = variation
						}

						break
					end
				end

				currentMarker:data(data)
				Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(), currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
			end)
        end)
    end)
end
