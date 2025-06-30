Item.RegisterUsable("1_dollar", function(item, entity)
    return player:inventory():addItem(Item.Create("money", {}, 1))
end)

Item.RegisterUsable("5_dollar", function(item, entity)
    return player:inventory():addItem(Item.Create("money", {}, 5))
end)

Item.RegisterUsable("10_dollar", function(item, entity)
    return player:inventory():addItem(Item.Create("money", {}, 10))
end)

Item.RegisterUsable("20_dollar", function(item, entity)
    return player:inventory():addItem(Item.Create("money", {}, 20))
end)

Item.RegisterUsable("50_dollar", function(item, entity)
    return player:inventory():addItem(Item.Create("money", {}, 50))
end)

Item.RegisterUsable("100_dollar", function(item, entity)
    return player:inventory():addItem(Item.Create("money", {}, 100))
end)

Item.RegisterUsable("200_dollar", function(item, entity)
    return player:inventory():addItem(Item.Create("money", {}, 200))
end)

Item.RegisterUsable("500_dollar", function(item, entity)
    return player:inventory():addItem(Item.Create("money", {}, 500))
end)

Item.RegisterUsable("cocaine_pack", function(item, entity)
    return player:inventory():addItem(Item.Create("cocaine_pure", {}, 10))
end)
