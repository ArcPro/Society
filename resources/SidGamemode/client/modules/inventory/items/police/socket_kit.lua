Item.RegisterUsable("socket_kit", function(item, entity, coords)
    if coords == nil then
        coords = GetEntityCoords(PlayerPedId(), true) + GetEntityForwardVector(PlayerPedId()) * 1.5
    end

    if Math.Distance(player:position(), coords) > 2.0 then
        UI:AddNotification("basic", "Vous êtes trop loin", "info", 5000)
        return false
    end

	ClientModules.Misc.Animations:Play("medic2")

	Utils.RealWait(2000)

	local socket = Callbacks.Trigger("weapons:getSocketInRange", coords)

	if socket then
		UI:AddNotification(
            "society",
			("Calibre: ~b~%s~s~\nID de l'arme: ~b~%d~s~"):format(String.split(socket.type, "_")[1], socket.weaponId),
            "lspd",
            10000,
            "Résultats d'analyse"
        )
	else
		UI:AddNotification("basic", "~r~Il n'y a pas de douille ici.~s~", "info", 10000)
	end

	ClientModules.Misc.Animations:Stop()

    return true
end, "ground")
