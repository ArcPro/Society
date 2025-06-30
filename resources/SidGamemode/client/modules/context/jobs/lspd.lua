Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
    if (not DoesEntityExist(hitEntity) or not IsEntityAPed(hitEntity) or not IsPedAPlayer(hitEntity) or hitEntity == PlayerPedId()) then
        return
    end

    if player:job().name ~= "lspd" and player:job().name ~= "lssd" and player:job().name ~= "sahp" and player:job().name ~= "usss" then
        return
    end

    local serverId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(hitEntity))

    Context:AddItem(0, "Mettre dans le véhicule", function()
        if (not OnesyncPlayer(serverId).state.handcuffed) then
            return UI:AddNotification("basic", "~r~La personne doit être menottée~s~", "info", 3000)
        end

        local vehicle = ClientModules.Vehicles:GetClosest()

        if (not vehicle) then
            return UI:AddNotification("basic", "~r~Aucun véhicule à proximité~s~", "info", 3000)
        end

        local distance = Math.Distance(player:position(), GetEntityCoords(vehicle, true))

        if (distance > 3.0) then
            return UI:AddNotification("basic", "~r~Vous êtes trop loin du véhicule~s~", "info", 3000)
        end

        Events.TriggerServer("police:putInCar", serverId, NetworkGetNetworkIdFromEntity(vehicle))
    end, true)

    if (Callbacks.Trigger("police:isPlayerTracked", serverId)) then
        Context:AddItem(0, "Retirer le bracelet électronique", function()
            Events.TriggerServer("police:removeAnkleBracelet", serverId)
        end, true)
    end
end)
