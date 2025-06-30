AddStateBagChangeHandler("godmode", "", function(bag, key, value, reserved, replicated)
	local source = bag:gsub("player:", "")

	SharedModules.Log:Create(tonumber(source), "staff", "godmode", {
		["État"] = value == true and "Activé" or "Désactivé"
	})
end)

AddStateBagChangeHandler("invisible", "", function(bag, key, value, reserved, replicated)
	local source = bag:gsub("player:", "")

	SharedModules.Log:Create(tonumber(source), "staff", "invisible", {
		["État"] = value == true and "Activé" or "Désactivé"
	})
end)

AddStateBagChangeHandler("player_names", "", function(bag, key, value, reserved, replicated)
	local source = bag:gsub("player:", "")

	SharedModules.Log:Create(tonumber(source), "staff", "names", {
		["État"] = value == true and "Activé" or "Désactivé"
	})
end)

AddStateBagChangeHandler("blips", "", function(bag, key, value, reserved, replicated)
	local source = bag:gsub("player:", "")

	SharedModules.Log:Create(tonumber(source), "staff", "blips", {
		["État"] = value == true and "Activé" or "Désactivé"
	})
end)
