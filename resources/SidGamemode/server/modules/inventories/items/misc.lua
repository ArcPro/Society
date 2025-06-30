local function onEveryPlayerInRange(fn, src, range)
    local players = Players.GetInRange(src, range)

    for _, target in pairs(players) do
        fn(target)
    end
end

Events.Register("items:useIdCard", function(src, data)
    onEveryPlayerInRange(function(ply)
        Events.TriggerClient("items:showIdCard", ply:source(), data)
    end, src, 3.0)
end)

Events.Register("items:useDocument", function(src, data)
    onEveryPlayerInRange(function(ply)
        Events.TriggerClient("items:showDocument", ply:source(), data)
    end, src, 3.0)
end)

Callbacks.Register("items:createCategorizedInventory", function(src, category, slots)
    return DB.Inventory.Create(5, slots, category)
end)

Events.Register("items:useGreyCard", function(src, data)
    onEveryPlayerInRange(function(ply)
        Events.TriggerClient("items:showGreyCard", ply:source(), data)
    end, src, 3.0)
end)
