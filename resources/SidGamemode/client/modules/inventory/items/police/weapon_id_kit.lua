Item.RegisterUsable("weapon_id_kit", function(item, entity)
    local weaponItem = player:inventory():findItem(function(i)
        return i.metadata.id == LocalPlayer.state.current_weapon
    end)

	if weaponItem == nil or LocalPlayer.state.current_weapon == nil then
		UI:AddNotification("basic", "~r~Vous n'avez pas d'arme en main~s~", "info", 5000)
		return
	end

	UI:AddNotification("basic", ("ID de l'arme: ~b~%d~s~"):format(weaponItem.metadata.id), "info", 5000)

    return false
end)
