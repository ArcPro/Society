Item.RegisterUsable("stethoscope", function(item, entity)
    if entity == nil then
		entity = Core.Player:GetClosest(2.5)
	end

	if entity == nil then
        UI:AddNotification("basic", "~r~Personne à proximité.~s~", "info", 5000)
		return false
	end

    if player:job().name ~= "sams" then
        UI:AddNotification("basic", "~r~Vous ne savez pas utiliser cet item", "info", 5000)
        return false
    end

	if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 2.0 then
        UI:AddNotification("basic", "~r~Vous êtes trop loin.~s~", "info", 5000)
		return false
	end

    if not entity then
        UI:AddNotification("basic", "~r~Une erreur s'est produite.~s~", "info", 5000)
        return false
    end

    UI:AddNotification("basic", ("La personne a %d%% de vie"):format(GetEntityHealth(entity) - 100), "info", 5000)

    return false
end, "player")
