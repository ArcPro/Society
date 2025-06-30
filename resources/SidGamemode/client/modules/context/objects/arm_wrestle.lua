local models = {
	`prop_arm_wrestle_01`,
	`bkr_prop_clubhouse_arm_wrestle_01a`,
	`bkr_prop_clubhouse_arm_wrestle_02a`,
}

local function isArmWrestleTable(model)
    for _, v in pairs(models) do
        if v == model then
            return true
        end
    end
    return false
end

Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then
        return
    end

    if not isArmWrestleTable(GetEntityModel(hitEntity)) then
        return
    end

    local subMenu = Context:AddSubmenu(0, "Bras de fer")
	local coords = GetEntityCoords(hitEntity, false)
	local id = ("%d_%d_%d"):format(math.floor(coords.x), math.floor(coords.y), math.floor(coords.z))

	Context:AddItem(subMenu, "Position 1", function()
		Events.TriggerExternalServer("arm_wrestling:requestPosition", id, "a")
	end, true)

	Context:AddItem(subMenu, "Position 2", function()
		Events.TriggerExternalServer("arm_wrestling:requestPosition", id, "b")
	end, true)
end)
