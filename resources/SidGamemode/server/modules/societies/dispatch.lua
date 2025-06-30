local counters = {};
local dispatches = {}

local function getDispatchName(job)
	if job == "sams" then
		return "lsfd"
	end

	return job
end

Callbacks.Register("dispatch:get", function(source)

    local player = Players.Get(source)

    if player == nil or player:job().name == nil then
        return nil
    end

    return dispatches[getDispatchName(player:job().name)]
end)

Events.Register("dispatch:add", function(source, society, location, text, code, coords)
    if dispatches[society] == nil then
        dispatches[society] = {}
    end

    if counters[society] == nil then
        counters[society] = 0
    end

    coords = coords or GetEntityCoords(GetPlayerPed(source), true)

    if text == "Tir entendu" then
        for k, call in pairs(dispatches[society]) do
            if Math.Distance(call.coords, coords) < 50 and call.time > os.time() * 1000 - 15000 then
                return
            end
        end
    end

    counters[society] = counters[society] + 1
    local call = {
        coords = coords,
        coordsWeb = {
            x = coords.x,
            y = coords.y
        },
        location = location,
        state = "awaiting",
        time = os.time() * 1000,
        id = counters[society],
        text = text,
        code = code,
    }

	SharedModules.Log:Create(source, "societies", "dispatch_action", {
		["Position"] = call.coords,
        ["Nom de rue"] = call.location,
        ["État"] = call.state,
        ["ID"] = call.id,
        ["Texte"] = call.text,
        ["Code"] = call.code,
	})


    table.insert(dispatches[society], call)
	Events.TriggerClient("dispatch:new", -1, society, call)

    -- exports["sc_dispatch"]:sendAllCalls(dispatches[society], society);
end)

Events.Register("dispatch:accept", function(source, id)
    local player = Players.Get(source)

    if player == nil or player:job().name == nil then
        return nil
    end

	local name = getDispatchName(player:job().name)

    for k, call in pairs(dispatches[name]) do
        if call.id == id then
            call.state = "treated"
            dispatches[name][k] = call
			Events.TriggerClient("dispatch:accepted", -1, name, id)
            break
        end
    end
end)

Events.Register("dispatch:delete", function(source, id)
    local player = Players.Get(source)

    if player == nil or player:job().name == nil then
        return nil
    end

	local name = getDispatchName(player:job().name)

    for k, call in pairs(dispatches[name]) do
        if call.id == id then
            table.remove(dispatches[name], k)
			Events.TriggerClient("dispatch:deleted", -1, name, id)
            break
        end
    end

    -- exports["sc_dispatch"]:sendAllCalls(dispatches[name], name);
end)

exports("dispatchDeleteCall", function(callId, serviceName)
	for k, call in pairs(dispatches[serviceName]) do
        if call.id == callId then
            table.remove(dispatches[serviceName], k)
			Events.TriggerClient("dispatch:deleted", -1, serviceName, callId)
            break
        end
    end

    -- exports["sc_dispatch"]:sendAllCalls(dispatches[serviceName], serviceName);
end)

exports("getAllCalls", function(serviceName)
	return dispatches[serviceName];
end)
