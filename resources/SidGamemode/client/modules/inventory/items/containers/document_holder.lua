Item.RegisterUsable("document_holder", function(item, entity)
    ClientModules.Inventory:Close()

    if item.metadata.id == nil then
        local oldItem = Functions.DeepCopy(item)
        item.metadata.id = Callbacks.Trigger("items:createCategorizedInventory", "document_holder", 100)
        player:inventory():updateItem(oldItem, item)
    end

    ClientModules.Inventory:Open(item.metadata.id, "Porte document")
end)
