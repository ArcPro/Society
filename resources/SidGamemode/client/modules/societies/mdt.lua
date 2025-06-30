local society_mdt = {
	["lspd"] = "https://matrp74.bubbleapps.io/",
	["lssd"] = "https://matrp74.bubbleapps.io/",
	["usss"] = "https://matrp74.bubbleapps.io/",
	["sahp"] = "https://matrp74.bubbleapps.io/",
	["sams"] = "https://matrp74.bubbleapps.io/",
	["lsfd"] = "https://matrp74.bubbleapps.io/",
	["postop"] = "https://www.cjoint.com/doc/22_03/LCxr0IDDV8o_rickroll.mp4",
	["dynasty8"] = "https://www.cjoint.com/doc/22_03/LCxr0IDDV8o_rickroll.mp4",
	["mechanic_autoexotic"] = "https://docs.google.com/spreadsheets/d/e/2PACX-1vSdnCEC9sgmMQmafAQJ_HM4QckjAUQ4EFntuyETG8nKxeC5you9iCzMzCQT6YIXVZBs142a1UxQDfx9/pubhtml?widget=true&amp;headers=false",
}

UI:RegisterCallback("mdt", function(data, cb)
	cb(true)

	if society_mdt[player:job().name] == nil then
		UI:AddNotification("basic", "~r~Cette entreprise n'a pas de MDT défini.~s~", "info", 5000)
		return
	end

	UI:UseTablet(society_mdt[player:job().name])
end)
