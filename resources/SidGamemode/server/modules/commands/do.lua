Events.Register("do", function(source, text, id)

    if id then
        local player = Players.Get(source)

        if not player or player:permissions() < Config.Permissions.HM then
            return
        end

        Events.TriggerClient("do", -1, text, id)
    else
        Events.TriggerClient("do", -1, text, source)
    end
end)
