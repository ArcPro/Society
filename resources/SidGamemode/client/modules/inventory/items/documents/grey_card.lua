Item.RegisterUsable("grey_card", function(item, entity)
    Events.TriggerServer("items:useGreyCard", item.metadata)
    ClientModules.Misc.Animations:Play("idcard")
    Utils.RealWait(5000)
    ClientModules.Misc.Animations:Stop()
end)

Events.Register("items:showGreyCard", function(src, data)
	data.image = data.image:lower()

    UI:Toggle("grey_card", true, data, false, true)

    Citizen.CreateThread(function()
        Utils.RealWait(5000)
        UI:Toggle("grey_card", false, {}, false, true)
    end)
end)
