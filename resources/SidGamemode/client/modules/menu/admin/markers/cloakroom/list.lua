MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Markers = MainMenu.Admin.Markers or {}
MainMenu.Admin.Markers.Marker = MainMenu.Admin.Markers.Marker or {}
MainMenu.Admin.Markers.Marker.Cloakroom = MainMenu.Admin.Markers.Marker.Cloakroom or {}
MainMenu.Admin.Markers.Marker.Cloakroom.List = MainMenu.Admin.Markers.Marker.Cloakroom.List or {}

---@type Marker | nil
local currentMarker = nil
local currentSex = nil
local currentCategory = nil
local ped = nil
local isProp = false
local max = 0

local function isSelected(component)
    local category = isProp and Lists.Variations.PropsIndexes[currentCategory]:lower() or Lists.Variations.ClothIndexes[currentCategory]:lower()

    if not currentMarker or not currentMarker:data().cloakroom then return false end

    local list = currentMarker:data().cloakroom[currentSex][category]

    if list == nil then
        return false
    end

    for k, v in pairs(list) do
        if v.component == component then
            return true
        end
    end

    return false
end

MainMenu.Admin.Markers.Marker.Cloakroom.List.onOpen = function (marker, sex, category, prop)
    local model = GetHashKey(("mp_%s_freemode_01"):format(sex))
    Utils.Streaming.RequestModel(model)
	local pos = GetEntityCoords(PlayerPedId(), true) + GetEntityForwardVector(PlayerPedId()) * 1.0
    ped = CreatePed(4, model, pos.x, pos.y, pos.z - 0.95, 0.0, false, true)
    currentCategory = category
    currentMarker = marker
    currentSex = sex
    isProp = prop

	for k, v in pairs(Lists.Variations.NakedOutfits[sex].props) do
		SetPedPropIndex(ped, k, v[1], v[2], true)
	end

	for k, v in pairs(Lists.Variations.NakedOutfits[sex].components) do
		SetPedComponentVariation(ped, k, v[1], v[2], 0)
	end

    if prop then
        max = GetNumberOfPedPropDrawableVariations(ped, category) + 1
    else
        max = GetNumberOfPedDrawableVariations(ped, category)
    end

    if currentMarker:data().cloakroom == nil then
        local newData = currentMarker:data()
        newData.cloakroom = {
            ["m"] = {},
            ["f"] = {}
        }

        currentMarker:data(newData)
    end
end

MainMenu.Admin.Markers.Marker.Cloakroom.List.Create = function()
    MainMenu.Admin.Markers.Marker.Cloakroom.List.Main = Menus:CreateSub(MainMenu.Admin.Markers.Marker.Cloakroom.Main, "Liste", "default")
	MainMenu.Admin.Markers.Marker.Cloakroom.Variations.Create()

    Menus:CreateThread(MainMenu.Admin.Markers.Marker.Cloakroom.List.Main, function()
        Menus:IsVisible(MainMenu.Admin.Markers.Marker.Cloakroom.List.Main, function()
            if currentMarker == nil then
                return
            end

            for i=0, max - 1 do
				if isSelected(i) then
					Menus:AddButton(("#%d"):format(i), false, "", "chevron_right", function()
						MainMenu.Admin.Markers.Marker.Cloakroom.Variations.onOpen(currentMarker, i, currentCategory, currentSex, isProp)
					end, MainMenu.Admin.Markers.Marker.Cloakroom.Variations.Main)
				else
					Menus:AddCheckbox(("#%d"):format(i), false, false, function(checked)
						local category = isProp and Lists.Variations.PropsIndexes[currentCategory]:lower() or Lists.Variations.ClothIndexes[currentCategory]:lower()
						local data = currentMarker:data()

						if data.cloakroom[currentSex][category] == nil then
							data.cloakroom[currentSex][category] = {}
						end

						if checked then
							table.insert(data.cloakroom[currentSex][category], {
								component = i,
								variation = 0,
							})
						else
							for k, v in pairs(data.cloakroom[currentSex][category]) do
								if v == i then
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
					end)
				end
            end

        end)

		Menus:OnIndexChange(MainMenu.Admin.Markers.Marker.Cloakroom.List.Main, function (index)
			if isProp then
				SetPedPropIndex(ped, currentCategory, index - 1, 0, true)
			else
				SetPedComponentVariation(ped, currentCategory, index - 1, 0, 0)
			end
		end)

        Menus:OnClose(MainMenu.Admin.Markers.Marker.Cloakroom.List.Main, function ()
            DeleteEntity(ped)
        end)
    end)
end
