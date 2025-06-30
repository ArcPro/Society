local currentCraft = {}

Events.Register("craft:toggle", function(source, data, toggle)
    UI:Toggle("craft", toggle, data, toggle, false, toggle)

    currentCraft = data
end)

UI:RegisterCallback("craft:closed", function()
    TriggerScreenblurFadeOut(250.0)
end)

UI:RegisterCallback("craft:can", function(data, cb)
    local hasRequirements = true
    for _, requirement in pairs(data.requirements) do
        local item = player:inventory():findItem(function(item)
            return item.name == requirement.name and item.quantity >= requirement.quantity
        end)

        if item == nil then
            hasRequirements = false
            UI:AddNotification("basic", "~r~Vous n'avez pas les ressources nécessaires pour fabriquer cet item.~s~", "info", 5000)
            break
        end
    end

    cb(hasRequirements)

    if hasRequirements then
        ClientModules.Misc.Animations:Play(currentCraft.emote or "mechanic")
		UI:Progress(tonumber(data.craftTime) or 5)
        Utils.RealWait(tonumber(data.craftTime) * 1000)
        ClientModules.Misc.Animations:Stop()
    end
end)

UI:RegisterCallback("craft:done", function(data, cb)

    if player:inventory():weight() + data.targetItem.weight > player:inventory():max_weight() then
        UI:AddNotification("basic", "~r~Vous n'avez pas assez de place dans votre inventaire pour stocker cet item.~s~", "info", 5000)
        return cb(false)
    end

    for _, requirement in pairs(data.requirements) do
        local item = player:inventory():findItem(function(item)
            return item.name == requirement.name and item.quantity >= requirement.quantity
        end)

        if item == nil then
            UI:AddNotification("basic", "~r~Vous n'avez pas les ressources nécessaires pour fabriquer cet item.~s~", "info", 5000)
            return
        end

        item.quantity = requirement.quantity
        player:inventory():removeItem(item)
    end

    player:inventory():addItem(Item.Create(data.targetItem.name, {}, data.targetItem.quantity))
    UI:AddNotification("basic", ("Vous avez fabriqué ~b~x%d %s.~s~"):format(data.targetItem.quantity, data.targetItem.label), "info", 5000)
    cb(true)
end)
