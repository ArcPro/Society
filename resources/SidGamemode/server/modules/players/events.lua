Events.Register("player:updateCharacter", function(source, player)
	local currentPlayer = Players.Get(source)
	-- DB.Player.UpdateCharacter(player, true)


	MySQL.update.await("UPDATE `characters` SET  \
        `firstname` = ?,                        		\
        `lastname` = ?,                         		\
        `birthdate` = ?,                        		\
        `sex` = ?,                              		\
		`nationality` = ?,								\
        `height` = ?,                           		\
        `weight` = ?,                           		\
        `hunger` = ?,                           		\
        `thirst` = ?,                           		\
        `armor` = ?,                            		\
        `health` = ?,                           		\
        `position` = ?,                         		\
        `job` = ?,                              		\
        `job_grade` = ?,                        		\
        `skin` = ?,                             		\
        `bank_account_id` = ?,                   		\
        `metadata` = ?                   				\
    WHERE `id` = ?",
        {player._firstname, player._lastname, player._birthdate, player._sex, player._nationality, player._height,
         player._weight, player._hunger, player._thirst, player._armor, player._health,
         json.encode(player._position), player._job.id or nil, player._job_grade.grade or nil,
         json.encode(Functions.RemoveUnderscores(player._skin)), player.bank_account_id,
         json.encode(player._metadata), player._id})

end)

Events.Register("player:switch", function(source, id)
	local player = Players.Get(source)

	if player == nil then return end

	ServerModules.Societies.Duty:Toggle(source, player:job().id, player:id(), false)

	DB.Player.UpdateCharacter(player)

	DB.Player.SetActiveCharacter(Identifiers.Parse(GetPlayerIdentifiers(source)).discord, id)

	SharedModules.Log:Create(source, "player", "switch", {
		["ID Personnage switch"] = id,
	})

	Events.TriggerClient("player:switched", source)
end)

Events.Register("player:ready", function(source)
    local player = Players.Get(source)

    if not player then return end

    player:loaded(true)
end)

Events.Register("player:revive", function(source, targetId, hp)
    local player = Players.Get(source)
    local target = Players.Get(targetId)

    if not player or not target then return end

    target:health(hp)

	Events.TriggerClient("player:revive", targetId, hp)

	SharedModules.Log:Create(source, "player", "revive", {
		["ID joueur revive"] = targetId,
		["Nom joueur revive"] = target:fullname(),
		["Discord joueur revive"] = ("<@%s>"):format(target:identifiers().discord),
		["PV Après le revive"] = hp,
	})
end)

Events.Register("player:update", function(source, key, value, id)
    local ply;

    if id then
        ply = Players.Get(id)
    else
        ply = Players.Get(source)
    end

	if key == "position" then
		local src = source

		if ply then
			src = ply:source() or source
		end

		local ped = GetPlayerPed(src)
		local vehicle = GetVehiclePedIsIn(ped, false)

		SetEntityCoords(DoesEntityExist(vehicle) and vehicle or ped, value.x, value.y, value.z, true, false, false, false)
	end

    if ply then
		if key ~= "position" then
			SharedModules.Log:Create(source, "player", "update", {
				["ID Joueur mis à jour"] = id,
				["Clé mise a jour"] = key,
				["Ancienne valeur"] = ply[key](ply),
				["Nouvelle valeur"] = value,
			})
		end

		if key == "metadata" and (value.instance or 1) ~= GetPlayerRoutingBucket(ply:source()) then
			Events.Trigger("bucket:change", value.instance or 1, ply:source())
		end

		ply[key](ply, value)

        Events.TriggerClient("player:update", ply:source(), key, value)
    end

end)

Events.Register("player:updateSkin", function(source, key, value, id)
    local ply;

    if id then
        ply = Players.Get(id)
    else
        ply = Players.Get(source)
    end

    if ply then

		if key == "tattoos" then
			ply:skin():tattoos(value, ply:sex() == "m" and "male" or "female")
		else
			ply:skin()[key](ply:skin(), value)
		end

        ply:skin()[key](ply:skin(), value)
        Events.TriggerClient("player:updateSkin", ply:source(), key, value)
    end
end)

Events.Register("player:loadAppearance", function(source, id)
    local ply;

    if id then
        ply = Players.Get(id)
    else
        ply = Players.Get(source)
    end

    if ply then
        Events.TriggerClient("player:loadAppearance", ply:source())
    end
end)

Events.Register("player:rejectConnection", function(source, reason)
	DropPlayer(source, reason)
end)

AddEventHandler("playerDropped", function(reason)
    local src = source
    local player = Players.Get(src)

    if player then
        DB.Player.UpdateCharacter(player)
        local inventory = Inventories.Get(player:inventory_id())

		DeleteEntity(NetworkGetEntityFromNetworkId(OnesyncPlayer(src).state.blip_entity))
		ServerModules.Societies.Duty:Toggle(src, player:job().id, player:id(), false)

        if inventory then
            inventory:save()
            inventory:remove()
        end

		SharedModules.Log:Create(src, "player", "leave", {})

		Citizen.Wait(1000)

        player:remove()
    end
end)
