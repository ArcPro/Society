local currentProperty = nil
local hasKeys = false
local hasRam = false

local function EnterProperty(property)

	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    if DoesEntityExist(vehicle) and Config.Properties[property.type].type ~= "garage" then
		UI:AddNotification("basic", "~r~Impossible en véhicule.~s~", "info", 5000)
		return
	end

    Events.TriggerServer("property:enter", property.id)
end

local function LeaveProperty(property)
	Events.TriggerServer("property:leave", property.id)
end

local function IsRentExpired(property)
    return property.rent_end ~= 1 and property.rent_end < Date
end

local function GetLockState(property)
    if IsRentExpired(property) then
        return true
    end

    if hasKeys then
        return false
    else
        return property.locked
    end
end

local function CanToggleDoor(property)
    if IsRentExpired(property) then
        return false
    end

    return hasKeys
end

Core.Player:OnLoad(function()

    local PropertyMenu = Menus:Create("Propriété", "default")
    local basePosition = player:position()

    if player:metadata().instance then
        local property = Callbacks.Trigger("property:get", player:metadata().instance)

        if property ~= nil then
            EnterProperty(property)
			Utils.RealWait(1500)
            player:position(vector4(basePosition.x, basePosition.y, basePosition.z, basePosition.w), true)
        end
    end

    Menus:CreateThread(PropertyMenu, function()
        Menus:IsVisible(PropertyMenu, function()

            if currentProperty == nil then
                return
            end

            Menus:AddSeparator("Informations")

            if (player:job().name or ""):find("realestate_") or player:permissions() >= Config.Permissions.MOD then
                Menus:AddButton("ID:", true, ("~b~%s~s~"):format(currentProperty.id), "", function()end)
            end

            Menus:AddButton("Adresse:", true, ("~b~%s~s~"):format(currentProperty.name), "", function()end)
            Menus:AddButton("Propriétaire:", true, ("~b~%s~s~"):format(currentProperty.owner), "", function()end)
            Menus:AddButton("Porte:", true, ("%s~s~"):format(currentProperty.locked and "~r~Fermée 🔒" or "~g~Ouverte 🔓"), "", function()end)

            Menus:AddSeparator("Actions")
            if player:metadata().instance == 1 then
                Menus:AddButton("Entrer", GetLockState(currentProperty), "", "", function()
                    EnterProperty(currentProperty)
                end)
            else
                Menus:AddButton("Sortir", false, "", "", function()
                    LeaveProperty(currentProperty)
                end)
            end

            Menus:AddButton(("%s la porte"):format(currentProperty.locked and "Ouvrir" or "Fermer"), not CanToggleDoor(currentProperty), "", "", function()
                Events.TriggerServer("property:update", currentProperty.id, "locked", currentProperty.locked and 0 or 1)
                currentProperty.locked = not currentProperty.locked
            end)

			if hasRam and currentProperty.locked == true then
				Menus:AddButton("Enfoncer la porte", false, "🐏", "", function()
                    ClientModules.Misc.Animations:Play("knock2")
                    UI:Progress(5)
                    Utils.RealWait(5 * 1000)
                    Events.TriggerServer("property:update", currentProperty.id, "locked", 0)
                    ClientModules.Misc.Animations:Stop()
					currentProperty.locked = false
                end)
			end
        end)
    end)

    Events.Register("property:menu", function(source, property, toggle)
        currentProperty = Callbacks.Trigger("property:get", tonumber(property))

        if currentProperty == nil then
            return
        end

        if toggle then
            hasKeys = HasPropertyKeys(currentProperty.id, currentProperty.linked_society, currentProperty.linked_group)
        else
            hasKeys = false
        end

        currentProperty.locked = currentProperty.locked

		hasRam = player:inventory():findItem(function(item)
			return item.name == "police_ram"
		end) ~= nil

        Menus:Visible(PropertyMenu, toggle)
    end)

	Events.Register("property:move", function(source, id, position)
        local marker = Markers.Get(("property_%d"):format(id))

		if not marker then return end

		marker:coords(position)
    end)

end)
