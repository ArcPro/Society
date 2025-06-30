UI:RegisterCallback("announce", function(data, cb)

	UI:Toggle("announce", true, {
		society = {
			name = player:job().name,
			label = player:job().label
		}
	}, true, false)
	ToggleRadar(false)

	cb(true)
end)

UI:RegisterCallback("announce:send", function(data, cb)

	Events.TriggerServer("society:announce", data.text)

	UI:Toggle("announce", false, {}, false, false)
	ToggleRadar(true)

	cb(true)
end)

UI:RegisterCallback("announce:closed", function(data, cb)
	ToggleRadar(true)

	cb(true)
end)
