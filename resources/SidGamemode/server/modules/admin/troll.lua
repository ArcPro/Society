Events.Register("admin:emote", function(source, id, emote)
    local player = Players.Get(source)
	local target = Players.Get(id)

    if not player then return end
	if not target then return end
	if player:permissions() < Config.Permissions.HM then return end

    Events.TriggerClient("animations:play", id, emote)

	SharedModules.Log:Create(source, "staff", "emote", {
		["Cible"] = ("<@%s>"):format(target:identifiers().discord),
		["Emote"] = emote,
	})
end)

Events.Register("admin:ragdoll", function(source, id)
    local player = Players.Get(source)
	local target = Players.Get(id)

    if not player then return end
	if not target then return end
	if player:permissions() < Config.Permissions.HM then return end

    Events.TriggerClient("ragdoll", id)

	SharedModules.Log:Create(source, "staff", "ragdoll", {
		["Cible"] = ("<@%s>"):format(target:identifiers().discord),
		["Emote"] = emote,
	})
end)

Events.Register("admin:soundboard", function(source, id, sound)
    local player = Players.Get(source)
	local target = Players.Get(id)

    if not player then return end
	if not target then return end
	if player:permissions() < Config.Permissions.HM then return end

    Events.TriggerClient("soundboard", id, sound)
end)

Events.Register("admin:makeemfly", function(source, id)
    local player = Players.Get(source)
	local target = Players.Get(id)

    if not player then return end
	if not target then return end
	if player:permissions() < Config.Permissions.HM then return end

	SharedModules.Log:Create(source, "staff", "make_em_fly", {
		["Cible"] = ("<@%s>"):format(target:identifiers().discord)
	})

    Events.TriggerClient("fly", id)
end)
