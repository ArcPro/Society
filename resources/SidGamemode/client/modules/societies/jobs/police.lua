local isTrackingPlayers = false
local trackedBlips = {}

local function CreatePoliceDutyHandler(name)
    Events.Register(("%s:duty"):format(name), function(source, duty)

        if not duty then
			MainMenu.Radial.Unregister()

            isTrackingPlayers = false
            trackedBlips = {}
            return
        end


        MainMenu.Radial.Register({
            {
                icon = "panic",
                title = "Panic Button",
                callback = ("%s:panic"):format(name)
            },
            {
                icon = "traffic",
                title = "Traffic",
                callback = "police:traffic",
            },
            {
                icon = "trackedPlayers",
                title = "Tracked Players",
                callback = "police:trackedPlayers",
            },
        })
    end)

    UI:RegisterCallback(("%s:panic"):format(name), function(data, cb)
        Events.TriggerServer(
            "dispatch:add",
            name,
            GetStreetNameFromHashKey(GetStreetNameAtCoord(player:position().x, player:position().y, player:position().z)),
            "Agent en détresse (Panic Button)",
            "10-99"
        )
        Events.TriggerServer("me", "appuie sur son bouton de détresse")
    end)
end

CreatePoliceDutyHandler("lspd")
CreatePoliceDutyHandler("sahp")
CreatePoliceDutyHandler("lssd")
CreatePoliceDutyHandler("usss")

UI:RegisterCallback("police:traffic", function(data, cb)
	UI:AddNotification("basic", "~r~Les zones de traffic sont désactivées pour le moment~s~", "info", 5000)
end)

UI:RegisterCallback("police:trackedPlayers", function(data, cb)
    if isTrackingPlayers then
        isTrackingPlayers = false
        UI:AddNotification("basic", "Vous avez désactivé le suivi des bracelets", "info", 5000)
        for _, blip in pairs(trackedBlips) do
            blip:delete()
        end
    else
        isTrackingPlayers = true
        UI:AddNotification("basic", "Vous avez activé le suivi des bracelets", "info", 5000)
        Citizen.CreateThread(function()
            while isTrackingPlayers do
                local trackedPlayers = Callbacks.Trigger("police:getTrackedPlayers")

                if trackedPlayers == nil then
                    return
                end

                for _, blip in pairs(trackedBlips) do
                    blip:delete()
                end
                trackedBlips = {}

                for _, trackedPlayer in pairs(trackedPlayers) do
                    local blip = Blip:new({
                        id = trackedPlayer.id + 10000,
                        coords = trackedPlayer.coords,
                        title = trackedPlayer.name,
                        shortRange = true,
                        size = 0.75,
                        sprite = 1,
                        color = 0,
                    })

                    blip:show()
                    table.insert(trackedBlips, blip)
                end

                Citizen.Wait(2 * 60 * 1000)
            end
        end)
    end
end)

Events.Register("police:placeClamp", function(source, clamp, entity)
    local prop = SharedModules.Entities:WaitForNetworkId(clamp)
    local veh = SharedModules.Entities:WaitForNetworkId(entity)

    local vehRotation = GetEntityRotation(veh, 0)
    local vehPosition = GetEntityCoords(veh, true)
    local clampPosition = GetOffsetFromEntityInWorldCoords(veh, -0.05, 0.0, 0.0)

    AttachEntityToEntity(
        prop, veh, GetEntityBoneIndexByName(veh, "wheel_lf"),
        clampPosition.x - vehPosition.x, clampPosition.y - vehPosition.y, clampPosition.z - vehPosition.z - 0.33,
        vehRotation.x, vehRotation.y, vehRotation.z - 90.0,
        true, true, false, false, 0, false
    )
end)

Events.Register("police:putInCar", function(source, vehicle)
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, 2)
end)

Events.Register("police:removeAnkleBracelet", function(source)
    local ankle_bracelet = player:inventory():findItem(function(item)
        return item.name == "ankle_bracelet" and item.metadata.equipped == true
    end)

    if ankle_bracelet == nil then
        return
    end

    if EquipClothe(ankle_bracelet, false, true) == false then return end

    player:inventory():removeItem(ankle_bracelet)
end)
