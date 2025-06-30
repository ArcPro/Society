Events.Register("blip:create", function(source, sprite, color, coords, title)
    local id = DB.Blip.Create(sprite, color, title, coords)
    Events.TriggerClient("blip:create", -1, id, sprite, color, coords, title)
end)

Events.Register("blip:update", function(source, id, sprite, color, coords, title)
    DB.Blip.Update(id, sprite, color, title, coords)
    Events.TriggerClient("blip:update", -1, id, sprite, color, coords, title)
end)

Events.Register("blip:delete", function(source, id)
    DB.Blip.Delete(id)
    Events.TriggerClient("blip:delete", -1, id)
end)

Events.Register("blip:load", function(source)
	Events.TriggerClientLatent("blip:load", source, DB.Blip.All())
end)
