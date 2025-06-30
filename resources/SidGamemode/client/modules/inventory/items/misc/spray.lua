Item.RegisterUsable("spray", function(item)
	Events.TriggerExternalServer("rcore_spray:startSpray")
	return true
end)

Item.RegisterUsable("spray_remover", function(item)
	Events.TriggerExternalServer("rcore_spray:removeSpray")
	return true
end)
