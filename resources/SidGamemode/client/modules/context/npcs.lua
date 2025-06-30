Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAPed(hitEntity) or IsPedAPlayer(hitEntity) or not IsPedHuman(hitEntity)) then
		return
	end

	if PlayerPedId() == hitEntity then return end

	local items = ClientModules.Illegal.DrugSelling:GetDrugsInInventory()

	if #items == 0 then return end

	local submenu, _ = Context:AddSubmenu(0, "Vendre de la drogue")

	for k, item in pairs(items) do
		Context:AddItem(submenu, ("%s x%d"):format(item.metadata.name or item.label, item.quantity), function()
			ClientModules.Illegal.DrugSelling:Sell(hitEntity, item.name, item.quantity)
		end, true)
	end
end)
