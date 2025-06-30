Events.Register("tattoo:request", function(source, target)
	local player = Players.Get(source)

	if player == nil or player:job().name == nil or player:job().name:find("tattoo_") == nil then return end

	Events.TriggerClient("tattoo:request", target, source)
end)

Events.Register("tattoo:accept", function(source, targetId)
	local player = Players.Get(source)
	local target = Players.Get(targetId)

	if not player or not target then return end
	if target:job().name:find("tattoo_") == nil then return end

	if Math.Distance(player:position(), target:position()) > 2.0 then return end

	Events.TriggerClient("tattoo:accept", targetId, source)
end)
