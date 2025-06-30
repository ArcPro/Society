Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if not DoesEntityExist(hitEntity) then
        return
    end

    local type = "ground"

    if IsEntityAVehicle(hitEntity) then
        type = "vehicle"
    elseif IsEntityAPed(hitEntity) and not IsPedAPlayer(hitEntity) then
        type = "npc"
    elseif IsPedAPlayer(hitEntity) and hitEntity ~= PlayerPedId() then
        type = "player"
    elseif IsPedAPlayer(hitEntity) and hitEntity == PlayerPedId() then
        type = "self"
    elseif IsEntityAnObject(hitEntity) then
        type = "object"
    end

    local inventoryContent = player:inventory():content()

    local itemList = {}

    for _, item in pairs(inventoryContent) do
        if Item.IsUsable(item.name) then
            if Item._usableItems[item.name].type == type then
                table.insert(itemList, item)
            end
        end
    end

    if #itemList == 0 then
        return
    end

    local submenuItem, _ = Context:AddSubmenu(0, "Utiliser l'item")

    for _, item in pairs(itemList) do
        Context:AddItem(submenuItem, ("%s x%d"):format(item.metadata.name or item.label, item.quantity), function()
            Item.Use(item, hitEntity, worldPosition)
        end, true)
    end
end)
