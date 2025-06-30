Events.Register("animations:sharedRequest", function(source, emoteName, target)
    target = Players.Get(target) or Players.GetNearest(source, 2.5)

    if target == nil then
        return Events.TriggerClient("player:notify", source, "basic", "~r~Aucun joueur à proximité", "info", 5000)
    end

    Events.TriggerClient("animations:sharedRequest", target:source(), source, emoteName)
    Events.TriggerClient("player:notify", source, "basic", "~b~Demande envoyée !", "info", 5000)
end)

Events.Register("animations:requestAccepted", function(source, target, emoteName)

    local sourcePlayer = Players.Get(source)
    local targetPlayer = Players.Get(target)

    if sourcePlayer == nil or targetPlayer == nil then return end

    if Math.Distance(sourcePlayer:position(), targetPlayer:position()) > 2.5 then
        return Events.TriggerClient("player:notify", sourcePlayer:source(), "basic", "~r~Trop loin.", "info", 5000)
    end

    Events.TriggerClient("animations:playShared", targetPlayer:source(), sourcePlayer:source(), emoteName, 1)
    Events.TriggerClient("animations:playShared", sourcePlayer:source(), targetPlayer:source(), emoteName, 2)
end)

Events.Register("animations:cancelShared", function(source, target)
    Events.TriggerClient("animations:cancelShared", target)
end)
