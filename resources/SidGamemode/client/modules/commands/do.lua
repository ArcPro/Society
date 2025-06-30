Events.Register("do", function(source, text, origin)
    local target = GetPlayerFromServerId(origin)

    if target ~= -1 or origin == GetPlayerServerId(PlayerId()) then
        text = ("* %s *"):format(text)
        local timer = GetGameTimer() + 5000
        while timer > GetGameTimer() do
            Utils.Draw3DText(GetEntityCoords(GetPlayerPed(target), true), text, 1.0, 5.0, false)
            Citizen.Wait(0)
        end
    end
end)

RegisterCommand("do", function (source, args)
    Events.TriggerServer("do", table.concat(args," "))
end, false)

Events.TriggerExternal("chat:addSuggestion", "/do", "Permet d'afficher une évenement lié au personnage.", {
	{name = "texte", help = "Le texte qui sera affiché au dessus du personnage"},
})
