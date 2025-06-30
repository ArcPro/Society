Events.Register("barber:request", function(source, type, target)
	local player = Players.Get(source)

	if player == nil or player:job().name == nil or player:job().name:find("barber_") == nil then return end

	Events.TriggerClient("barber:request", target, type, source)
end)

Events.Register("barber:accept", function(source, type, targetId)
	local player = Players.Get(source)
	local target = Players.Get(targetId)

	if not player or not target then
		return
	end
	if target:job().name:find("barber_") == nil then
		return
	end

	if Math.Distance(player:position(), target:position()) > 2.0 then
		return
	end

	Events.TriggerClient("barber:accept", targetId, type, source)
end)
