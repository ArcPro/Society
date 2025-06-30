local robbedATMs = {}

Callbacks.Register("atm:tryToRob", function(source, id)
	if robbedATMs[id] == true then
		return false
	end

	robbedATMs[id] = true

	SharedModules.Log:Create(source, "illegal", "atm", {
		["Coordonnées"] = ("vector3(%s, %s, %s)"):format(table.unpack(String.split(id, "_")))
	})

	Citizen.SetTimeout(30 * 60 * 1000, function()
		robbedATMs[id] = false
	end)
end)
