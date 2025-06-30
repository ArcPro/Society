Item.RegisterUsable("aed", function(item, entity)
    if not entity then
        return false
    end

    local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))

    if not target then
        UI:AddNotification("basic", "~r~Une erreur s'est produite~s~", "info", 5000)
        return false
    end

    if OnesyncPlayer(target).state.health > 0 then
        UI:AddNotification("basic", "~r~La personne n'est pas inconsciente~s~", "info", 5000)
        return false
    end

	if player:job().name ~= "sams" and player:job().name ~= "lsfd" then
        UI:AddNotification("basic", "~r~Vous ne savez pas comment utiliser cela~s~", "info", 5000)
        return false
    end

    ClientModules.Misc.Animations:Play("cpr2")
    Utils.RealWait(2500)

    Events.TriggerServer("player:revive", target, 20)

    ClientModules.Misc.Animations:Stop()

    return false
end, "player")
