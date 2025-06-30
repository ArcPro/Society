Item.RegisterUsable("drug_test", function(item, entity)
    if not entity then
        entity = Core.Player:GetClosest(5.0)

        if not entity then
            UI:AddNotification("basic", "~r~Aucun joueur à proximité", "info", 5000)
            return false
        end
    end

    local serverid = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
    local drugs = OnesyncPlayer(serverid).state.drugs

    local color = "~b~"

    if drugs > 0.0 then
        color = "~y~"
    end

    ClientModules.Misc.Animations:Play("give")

    UI:AddNotification("basic", ("Test de drogue %s%s~s~"):format(color, drugs > 0.0 and "positif" or "négatif"), "info", 5000)

    return true
end, "player")
