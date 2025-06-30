Events.Register("me", function(source, text, id)

	local log = {
		["Contenu"] = text
	}

    if id then
        local player = Players.Get(source)
		local target = Players.Get(id)

        if not player or player:permissions() < Config.Permissions.HM then
            return
        end

		if target == nil then return end

        Events.TriggerClient("me", -1, text, id)

		log["Cible"] = ("<@%s>"):format(target:identifiers().discord)
    else
        Events.TriggerClient("me", -1, text, source)
    end

	SharedModules.Log:Create(source, "player", "me", log)
end)
