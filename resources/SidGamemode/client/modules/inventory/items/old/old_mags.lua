Item.RegisterUsable("cal50_mag", function ()
	return player:inventory():addItem(Item.Create("cal50_ammo", {}, 7))
end)

Item.RegisterUsable("40mm_mag", function ()
	return player:inventory():addItem(Item.Create("40mm_ammo", {}, 1))
end)

Item.RegisterUsable("9mm_mag", function ()
	return player:inventory():addItem(Item.Create("9mm_ammo", {}, 12))
end)

Item.RegisterUsable("357_mag", function ()
	return player:inventory():addItem(Item.Create("357_ammo", {}, 6))
end)

Item.RegisterUsable("556_mag", function ()
	return player:inventory():addItem(Item.Create("556_ammo", {}, 30))
end)

Item.RegisterUsable("12g_mag", function ()
	return player:inventory():addItem(Item.Create("12g_ammo", {}, 8))
end)

Item.RegisterUsable("762_mag", function ()
	return player:inventory():addItem(Item.Create("762_ammo", {}, 30))
end)
