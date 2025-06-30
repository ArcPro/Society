Item.RegisterUsable("naloxone", function(item, entity)
    local serverId = player:source()

    if entity then
        serverId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
    end

    local targetPlayer = Core.Player:Get(serverId, true)

    if not targetPlayer then
        UI:AddNotification("basic", "~r~Une erreur s'est produite", "info", 5000)
        return false
    end

    ClientModules.Misc.Animations:Play("give")
    Events.TriggerServer("player:update", "drugs", Math.Clamp(targetPlayer:drugs() - 50, 0, 100), targetPlayer:source())

    return true
end, "player")
