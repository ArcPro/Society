Events.Register("society:announce", function(source, content)
	local player = Players.Get(source)

	if player == nil or player:job().name == nil then return end

	Events.TriggerClient("player:notify", -1, "society", content, player:job().name, 10000, player:job().label)

	SharedModules.Log:Create(source, "societies", "society_announce", {
		["Contenu"] = content
	})
end)
