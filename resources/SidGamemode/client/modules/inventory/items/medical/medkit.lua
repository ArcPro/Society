Item.RegisterUsable("medkit", function(item, entity)
    local serverId = player:source()

    if player:job().name ~= "sams" then
        UI:AddNotification("basic", "~r~Vous ne savez pas utiliser cet item", "info", 5000)
        return false
    end

    if entity then
        serverId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
    end

    local targetPlayer = Core.Player:Get(serverId, true)

    if not targetPlayer then
        UI:AddNotification("basic", "~r~Une erreur s'est produite", "info", 5000)
        return false
    end

    Events.TriggerServer("player:update", "health", Math.Clamp(targetPlayer:health() + 50, 0, 100), targetPlayer:source())

    return true
end, "player")
