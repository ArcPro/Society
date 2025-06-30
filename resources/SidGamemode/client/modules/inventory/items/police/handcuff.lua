Item.RegisterUsable("handcuff", function(item, entity)
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

    if OnesyncPlayer(serverId).state.handcuffed then
        UI:AddNotification("basic", "La personne est déjà menottée", "info", 5000)
        return false
	else
		TaskTurnPedToFaceEntity(PlayerPedId(), entity, 1000)
        ClientModules.Misc.Animations:Play("breakfreefont")

		UI:Progress(2.5)
        Utils.RealWait(2500)

        Events.TriggerServer("onesync:update", serverId, "handcuffed", true)
        return true
    end
end, "player")

Item.RegisterUsable("handcuff_keys", function(item, entity)
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

    if not OnesyncPlayer(serverId).state.handcuffed then
        UI:AddNotification("basic", "La personne n'est pas menottée", "info", 5000)
        return false
	else
        TaskTurnPedToFaceEntity(PlayerPedId(), entity, 1000)
        ClientModules.Misc.Animations:Play("breakfreefont")

		UI:Progress(2.5)
        Utils.RealWait(2500)

        Events.TriggerServer("onesync:update", serverId, "handcuffed", false)
        player:inventory():addItem(Item.Create("handcuff", {}, 1))
        return false
    end
end, "player")
