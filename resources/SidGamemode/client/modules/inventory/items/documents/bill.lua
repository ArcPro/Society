Item.RegisterUsable("bill", function(item, entity)
    UI:Toggle("bill", true, item.metadata, true, false)
end)
