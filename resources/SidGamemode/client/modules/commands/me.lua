Events.Register("me", function(source, text, origin)
    local target = GetPlayerFromServerId(origin)

    if target ~= -1 or origin == GetPlayerServerId(PlayerId()) then
        text = ("* La personne %s *"):format(text)
        local timer = GetGameTimer() + 5000
        while timer > GetGameTimer() do
            Utils.Draw3DText(GetEntityCoords(GetPlayerPed(target), true), text, 1.0, 5.0, false)
            Citizen.Wait(0)
        end
    end
end)

RegisterCommand("me", function (source, args)
    Events.TriggerServer("me", table.concat(args," "))
end, false)

Events.TriggerExternal("chat:addSuggestion", "/me", "Permet d'afficher une action du personnage.", {
	{name = "texte", help = "Le texte qui sera affiché au dessus du personnage"},
})
