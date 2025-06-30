Item.RegisterUsable("document", function(item, entity)
    if item.metadata.image == nil then
        local updatedItem = Functions.DeepCopy(item)
		updatedItem.metadata.image = Utils.KeyboardInput("Image", 255, "")
		updatedItem.metadata.format = "page"
        item.quantity = 1
        updatedItem.quantity = 1
        updatedItem.slot = nil
        if player:inventory():addItem(updatedItem) then
            player:inventory():removeItem(item)
        end
    else
        Events.TriggerServer("items:useDocument", item.metadata)
        ClientModules.Misc.Animations:Play("idcard")
        Utils.RealWait(5000)
        ClientModules.Misc.Animations:Stop()
    end
end)

Item.RegisterUsable("visit_card", function(item, entity)
    if item.metadata.image == nil then
        local updatedItem = Functions.DeepCopy(item)
		updatedItem.metadata.image = Utils.KeyboardInput("Image", 255, "")
		updatedItem.metadata.format = "card"

        item.quantity = 1
        updatedItem.quantity = 1
        updatedItem.slot = nil
        if player:inventory():addItem(updatedItem) then
            player:inventory():removeItem(item)
        end
    else
        Events.TriggerServer("items:useDocument", item.metadata)
        ClientModules.Misc.Animations:Play("idcard")
        Utils.RealWait(5000)
        ClientModules.Misc.Animations:Stop()
    end
end)

Events.Register("items:showDocument", function(src, data)
    UI:Toggle("document", true, data, true, false)
end)
