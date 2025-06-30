local function hasItems(items)
    local playerRequiredItems = {}
    for k, itemName in pairs(items) do
        player:inventory():findItem(function(item)
            if item.name == itemName and item.quantity > 0 then
                table.insert(playerRequiredItems, item)
            end
        end)
        if next(items, k) == nil then
            if #playerRequiredItems == #items then
                return true
            else
                return false
            end
        end
    end
end

exports('hasItems', hasItems)