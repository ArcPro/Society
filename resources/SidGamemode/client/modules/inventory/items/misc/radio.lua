Item.RegisterUsable("radio", function(_)
    Events.TriggerExternal("fd_radio:use")
    return false
end)

Item.RegisterUsable("radio_jammer", function(_)
    Events.TriggerExternal("fd_radio:usedJammer")
    return true
end)
