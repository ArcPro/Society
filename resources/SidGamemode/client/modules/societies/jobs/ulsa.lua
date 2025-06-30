Events.Register("ulsa:duty", function(source, duty)

    if not duty then
		MainMenu.Radial.Unregister()
        return
    end

	MainMenu.Radial.Register({
        {
            callback = "ulsa:ringbell",
            title = "Sonnerie",
            icon = "ringbell",
        },
	})
end)

UI:RegisterCallback("ulsa:ringbell", function(data, cb)
	Events.TriggerServer("ulsa:ringbell")
end)

Events.Register("ulsa:ringbell", function(source)
	if Zones.IsPlayerIn("university") then
		UI:PlaySound("ringbell")
	end
end)
