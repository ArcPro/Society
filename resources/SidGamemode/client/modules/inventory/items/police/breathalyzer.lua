Item.RegisterUsable("breathalyzer", function(item, entity)
    if not entity then
        entity = Core.Player:GetClosest(5.0)

        if not entity then
            UI:AddNotification("basic", "~r~Aucun joueur à proximité", "info", 5000)
            return false
        end
    end

    local serverid = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
    local alcohol = OnesyncPlayer(serverid).state.alcohol / 100 * 2.5

    local color = "~b~"

    if alcohol > 0.66 then
        color = "~y~"
    end

    if alcohol > 1.33 then
        color = "~r~"
    end

    ClientModules.Misc.Animations:Play("give")

    UI:AddNotification("basic", ("Taux d'alcool: %s%s g/L~s~"):format(color, alcohol), "info", 5000)

    return false
end, "player")
