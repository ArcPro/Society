Item.RegisterUsable("phone", function(item)
    Events.TriggerExternal("lb-phone:usePhoneItem", item)
    return false
end)
