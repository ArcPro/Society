Item.RegisterUsable("wallet", function(item, entity)
    ClientModules.Inventory:Close()

    if item.metadata.id == nil then
        local oldItem = Functions.DeepCopy(item)
        item.metadata.id = Callbacks.Trigger("items:createCategorizedInventory", "wallet", 10)
        player:inventory():updateItem(oldItem, item)
    end

    ClientModules.Inventory:Open(item.metadata.id, "Portefeuille")
end)
