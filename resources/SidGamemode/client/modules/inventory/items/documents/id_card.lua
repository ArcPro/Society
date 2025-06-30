Item.RegisterUsable("id_card", function(item, entity)
    Events.TriggerServer("items:useIdCard", item.metadata)
    ClientModules.Misc.Animations:Play("idcard")
    Utils.RealWait(5000)
    ClientModules.Misc.Animations:Stop()
end)

Item.RegisterUsable("driver_license", function(item, entity)
    item.metadata.isDriverLicense = true
    Events.TriggerServer("items:useIdCard", item.metadata)
    ClientModules.Misc.Animations:Play("idcard")
    Utils.RealWait(5000)
    ClientModules.Misc.Animations:Stop()
end)

Events.Register("items:showIdCard", function(src, data)
    UI:Toggle("identity_card", true, data, false, true)

    Citizen.CreateThread(function()
        Utils.RealWait(5000)
        UI:Toggle("identity_card", false, {}, false, true)
    end)
end)
