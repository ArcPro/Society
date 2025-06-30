local function dutyCount(id)
	return #ServerModules.Societies.List[id]:duties()
end

local function notify(source, text)
	Events.TriggerClient("player:notify", source, "basic", text, "info", 5000)
end

exports("dutyCount", dutyCount)
exports("notify", notify)
