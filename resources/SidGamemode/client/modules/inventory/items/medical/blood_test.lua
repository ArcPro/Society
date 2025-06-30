Item.RegisterUsable("blood_test", function(item, entity)
	local serverId = player:source()

	if player:job().name ~= "sams" then
        UI:AddNotification("basic", "~r~Vous ne savez pas comment utiliser cela~s~", "info", 5000)
        return false
    end

	if entity then
		if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 2.0 then
			UI:AddNotification("basic", "~r~Trop loin.~s~", "info", 5000)
			return
		end

		serverId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
	end

    ClientModules.Misc.Animations:Play("give")

	local target = Core.Player:Get(serverId, true)

	if target:metadata().blood_type == nil then
		target:metadata().blood_type = Config.BloodTypes.GetRandomBloodType()
		Events.TriggerServer("player:update", "metadata", target:metadata(), target:source())
	end

	UI:AddNotification("basic", ("Groupe sanguin de la personne: ~b~%s~s~"):format(target:metadata().blood_type), "info", 5000)

    return true
end, "player")
