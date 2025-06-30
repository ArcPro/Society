Blips = {
    ---@type Blip[]
    _list = {},
	Initialized = false
}

Blips.Get = function(id)
    return Blips._list[id]
end

Blips.All = function()
    return Blips._list
end

Blips.Clear = function()
    for _, blip in pairs(Blips.All()) do
        blip:delete()
    end
    Blips._list = {}
end

Events.Register("blip:create", function(source, id, sprite, color, coords, title)
    Blip:new({
        id = id,
        sprite = sprite,
        color = color,
        coords = coords,
        title = title,
        size = 1,
        shortRange = true,
        editable = true,
    }):show()
end)

Events.Register("blip:update", function(source, id, sprite, color, coords, title)
    local blip = Blips.Get(id)

    if blip ~= nil then
        blip:sprite(sprite)
        blip:color(color)
        blip:coords(coords)
        blip:title(title)
    end
end)

Events.Register("blip:delete", function(source, id)
    local blip = Blips.Get(id)

    if blip ~= nil then
        blip:delete()
    end
end)

Core.Player:OnLoad(function()
	if Blips.Initialized == true then return end

    Events.Register("blip:load", function(source, blips)
		for _, blip in pairs(blips) do
			Blip:new({
				coords = json.decode(blip.position),
				sprite = blip.sprite,
				color = blip.color,
				title = blip.title,
				shortRange = true,
				editable = true,
				id = blip.id,
				size = 0.75,
			}):show()
		end
	end)

	Events.TriggerServer("blip:load")

	Blips.Initialized = true
end)
