Item.RegisterUsable("keyring", function(item, entity)
    ClientModules.Inventory:Close()

    if item.metadata.id == nil then
        local oldItem = Functions.DeepCopy(item)
        item.metadata.id = Callbacks.Trigger("items:createCategorizedInventory", "keyring", 25)
        player:inventory():updateItem(oldItem, item)
    end

    ClientModules.Inventory:Open(item.metadata.id, "Trousseau de clés")
end)
