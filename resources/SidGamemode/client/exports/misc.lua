local function notify(text, duration, icon)
    UI:AddNotification("basic", text, icon, duration)
end

local function isAdmin()
	return player:permissions() >= Config.Permissions.ADMIN
end

local function isIGM()
	return player:permissions() >= Config.Permissions.HM
end

local function isMod()
	return player:permissions() >= Config.Permissions.MOD
end

local function createObject(model, coords, pickupItem)
    local object = SharedModules.Entities:Create(model, coords)

    if object then

        if pickupItem ~= nil then
            SharedModules.Entities:SetStatebag(object, "pickupItem", pickupItem)
        end

        return object
    else
        UI:AddNotification("basic", "~r~Erreur lors de la création de l'objet", "info", 5000)
        return 0
    end
end

local function createJammer(coords, id)
    local object = SharedModules.Entities:Create(GetHashKey("ch_prop_ch_mobile_jammer_01x"), coords)

    if object then
		Citizen.CreateThread(function()
			Citizen.Wait(500)

			SharedModules.Entities:SetStatebag(object, "pickupItem", "radio_jammer")
			SharedModules.Entities:SetStatebag(object, "jammerId", id)
		end)

        return object
    else
        UI:AddNotification("basic", "~r~Erreur lors de la création de l'objet", "info", 5000)
        return 0
    end
end

local function getRoutingBucket()
	if player == nil then
		return 1
	end

	return player:metadata().instance or 1
end

exports('getRoutingBucket', getRoutingBucket)
exports('createJammer', createJammer)
exports('createObject', createObject)
exports('isAdmin', isAdmin)
exports('notify', notify)
exports('isIGM', isIGM)
exports('isMod', isMod)
