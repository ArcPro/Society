Events.Register("flashbang:explode", function(source, flashBangCoords)
	Events.TriggerClient("flashbang:explode", -1, flashBangCoords, source)
end)
