Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then return end
    if Entity(hitEntity).state.can_firework ~= player:id() then return end

	Context:AddItem(0, "Déclencher", function()
		ClientModules.Misc.Animations:Play("keyfob")
		Citizen.Wait(5500)

		ClientModules.World.Fireworks:RequestStart(hitEntity)
	end, true)
end)
