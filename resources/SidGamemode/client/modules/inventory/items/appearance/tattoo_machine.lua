Item.RegisterUsable("tattoo_machine", function(item, entity)

    if entity == nil then
        entity = Core.Player:GetClosest(5.0)

        if not entity then
            UI:AddNotification("basic", "Aucun joueur à proximité", "info", 5000)
            return false
        end
    end

    if not IsEntityAPed(entity) and not IsPedAPlayer(entity) then
        return false
    end

    local serverId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))

    if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 2.0 then
        UI:AddNotification("basic", "Vous êtes trop loin", "info", 5000)
        return false
    end

    Events.TriggerServer("tattoo:request", serverId)

    return false
end, "player")
