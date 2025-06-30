Zones = {
    ---@type Zone[]
    _list = {},
	currentType = nil,
	current = nil,
}

Zones.Types = { "drugs", "tablet", "university" }

Zones.Get = function(id)
    return Zones._list[id]
end

Zones.All = function()
    return Zones._list
end

function Zones.IsPlayerIn(type)
	return Zones.currentType == type
end

function Zones.GetCurrent()
	return Zones.Get(Zones.current)
end

Events.Register("zone:create", function(source, id, name, coords, size, action, data)
    Zone:new({
		action = action,
		coords = coords,
		data = data,
		name = name,
		size = size,
		id = id,
	})
end)

Events.Register("zone:update", function(source, id, name, coords, size, action, data)
    local zone = Zones.Get(id)

    if zone ~= nil then
		zone:action(action)
        zone:coords(coords)
		zone:data(data)
		zone:name(name)
		zone:size(size)

		zone:refresh()
    end
end)

Events.Register("zone:delete", function(source, id)
    local zone = Zones.Get(id)

    if zone ~= nil then
        zone:delete()
    end
end)

Core.Player:OnLoad(function()

    local rawZones = Callbacks.Trigger("zone:all")

    if rawZones == nil then
        return
    end

    for _, zone in pairs(rawZones) do
        Zone:new({
			coords = json.decode(zone.coords),
			size = json.decode(zone.size),
			data = json.decode(zone.data),
			action = zone.action,
			name = zone.name,
			id = zone.id,
		})
    end
end)
