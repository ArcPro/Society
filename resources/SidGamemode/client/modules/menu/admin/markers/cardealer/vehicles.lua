MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Markers = MainMenu.Admin.Markers or {}
MainMenu.Admin.Markers.Marker = MainMenu.Admin.Markers.Marker or {}
MainMenu.Admin.Markers.Marker.Cardealer = MainMenu.Admin.Markers.Marker.Cardealer or {}
MainMenu.Admin.Markers.Marker.Cardealer.Category = MainMenu.Admin.Markers.Marker.Cardealer.Category or {}

---@type Marker | nil
local currentMarker = nil
local currentCategory = nil
local vehicles = {}

local function isSelected(model)
    if not currentMarker then
        return false
    end

    for _, vehicle in pairs(currentMarker:data().categories[currentCategory]) do
        if model == vehicle then
            return true
        end
    end

    return false
end

---@param marker Marker
MainMenu.Admin.Markers.Marker.Cardealer.Category.onOpen = function(marker, category)
    currentMarker = marker
    currentCategory = category

    local variables = Callbacks.Trigger("variable:list")

    if variables == nil then
        return
    end

    vehicles = {}

    for name, label in pairs(variables) do
        if name:find("vehicles") then
            if GetVehicleClassFromName(GetHashKey(label)) == tonumber(currentCategory) then
                vehicles[label] = GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(label)))
            end
        end
    end
end

MainMenu.Admin.Markers.Marker.Cardealer.Category.Create = function()
    MainMenu.Admin.Markers.Marker.Cardealer.Category.Main = Menus:CreateSub(
        MainMenu.Admin.Markers.Marker.Cardealer.Main, "Cardealer | Catégorie", "default")

    Menus:CreateThread(MainMenu.Admin.Markers.Marker.Cardealer.Category.Main, function()
        Menus:IsVisible(MainMenu.Admin.Markers.Marker.Cardealer.Category.Main, function()

            if currentMarker == nil then
                return
            end

            for model, displayName in pairs(vehicles) do
                Menus:AddCheckbox(("%s (%s)"):format(displayName, model), false, isSelected(model), function(checked)

                    local data = currentMarker:data()

                    if checked == true then
                        table.insert(data.categories[currentCategory], model)
                    else
                        for k, v in pairs(data.categories[currentCategory]) do
                            if v == model then
                                table.remove(data.categories[currentCategory], k)
                                break
                            end
                        end
                    end

                    currentMarker:data(data)
                    Events.TriggerServer("marker:update", currentMarker:name(), currentMarker:action(),
                        currentMarker:coords(), currentMarker:data(), currentMarker:bucket())
                end)
            end
        end)
    end)
end
