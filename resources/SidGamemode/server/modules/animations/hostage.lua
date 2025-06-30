local takingHostage = {}

local takenHostage = {}

Events.Register("hostage:sync", function(source, targetSrc)
	Events.TriggerClient("hostage:syncTarget", targetSrc, source)
	takingHostage[source] = targetSrc
	takenHostage[targetSrc] = source
end)

Events.Register("hostage:releaseHostage", function(source, targetSrc)
	if takenHostage[targetSrc] then 
		Events.TriggerClient("hostage:releaseHostage", targetSrc, source)
		takingHostage[source] = nil
		takenHostage[targetSrc] = nil
	end
end)

Events.Register("hostage:killHostage", function(source, targetSrc)
	if takenHostage[targetSrc] then 
		Events.TriggerClient("hostage:killHostage", targetSrc, source)
		takingHostage[source] = nil
		takenHostage[targetSrc] = nil
	end
end)

Events.Register("hostage:stop", function(source, targetSrc)
    if takingHostage[source] then
        Events.TriggerClient("hostage:cl_stop", targetSrc)
        takingHostage[source] = nil
        takenHostage[targetSrc] = nil
    elseif takenHostage[source] then
        Events.TriggerClient("hostage:cl_stop", targetSrc)
        takenHostage[source] = nil
        takingHostage[targetSrc] = nil
    end
end)

AddEventHandler('playerDropped', function(reason)
	local source = source

	if takingHostage[source] then
		Events.TriggerClient("hostage:cl_stop", takingHostage[source])
		takenHostage[takingHostage[source]] = nil
		takingHostage[source] = nil
	end

	if takenHostage[source] then
		Events.TriggerClient("hostage:cl_stop", takenHostage[source])
		takingHostage[takenHostage[source]] = nil
		takenHostage[source] = nil
	end
end)
