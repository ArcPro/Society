local blipsUsers = {}

Events.Register("admin:wipe", function(source, id)
    local player = Players.Get(source)

    if not player then return end

    if player:permissions() < Config.Permissions.MOD then return end

    local target;

    if id then
		target = Players.Find(function(p)
			return p:id() == id
		end)

		if target == nil then
			target = DB.Player.GetCharacterById(id)
		end
    else
        target = player
    end

    if not target then
        Events.TriggerClient("player:notify", source, "basic", "~r~Ce joueur n'existe pas~s~", "info", 5000)
        return
    end

	SharedModules.Log:Create(source, "staff", "wipe", {
		["ID"] = target:id(),
	})

	SharedModules.Log:Create(source, "player", "delete", {
		["ID"] = target:id(),
	})

    DB.Player.DeleteCharacter(target)

    if target:source() then
        Events.TriggerClient("skinchanger:new", target:source())
    end
end)

Events.Register("admin:unban", function(source, id)
    local player = Players.Get(source)

    if not player then return end

    if player:permissions() < Config.Permissions.MOD2 then return end

    DB.Ban.Delete(id)
end)

Events.Register("admin:kick", function(source, target, reason)
    local player = Players.Get(source)

    if not player then return end

    if player:permissions() < Config.Permissions.MOD then return end

    target = Players.Get(target)

    if not target then
        Events.TriggerClient("player:notify", source, "basic", "~r~Ce joueur n'existe pas~s~", "info", 5000)
        return
    end

	SharedModules.Log:Create(source, "staff", "kick", {
		["Cible"] = ("<@%s>"):format(target:identifiers().discord),
	})

    DropPlayer(target:source(), reason)
end)

Events.Register("admin:ban", function(source, target, duration, reason)
    local player = Players.Get(source)

    if not player then return end

    if player:permissions() < Config.Permissions.MOD then return end

    local xTarget = Players.Get(target)
    local expiration = Date.format("%Y-%m-%d %H:%M:%S", os.time() + (duration * 86400))

    if not xTarget then
        local discordId = DB.Player.GetDiscord(target)

        if not discordId then
            Events.TriggerClient("player:notify", source, "basic", "~r~Ce joueur n'existe pas~s~", "info", 5000)
            return
        end

		SharedModules.Log:Create(source, "staff", "ban", {
			["Cible"] = ("<@%s>"):format(discordId),
		})

        DB.Ban.Create(discordId, reason, expiration)
    else
        local identifiers = xTarget:identifiers()

		SharedModules.Log:Create(source, "staff", "ban", {
			["Cible"] = ("<@%s>"):format(identifiers.discord),
		})

        DB.Ban.Create(identifiers.discord, reason, expiration)
    end
end)

local giveInventories = {}

Events.Register("admin:initGiveInventory", function(source, search)
    local player = Players.Get(source)

    if not player then return end
    if player:permissions() < Config.Permissions.HM then return end

    if giveInventories[source] == nil then
        giveInventories[source] = Inventory:new({
            id = ("admin_give_inventory_%d"):format(source),
            max_weight = 10000000000000,
            temporary = true,
            content = {},
			slots = 150,
        })
    end

    giveInventories[source]:content({})

    for _, item in pairs(Item._list) do
		if string.find(item.label, search) or string.find(item.name, search) then
			if giveInventories[source]:addItem(Item.Create(item.name, {}, 1000000)) == false then return end
		end
	end
end)

Events.Register("admin:goto", function(source, id)
    local player = Players.Get(source)
	local target = Players.Get(id)

    if not player then return end
	if not target then return end
    if player:permissions() < Config.Permissions.MOD then return end

	SharedModules.Log:Create(source, "staff", "goto", {
		["Cible"] = ("<@%s>"):format(target:identifiers().discord),
	})

    Events.Trigger("player:update", "position", GetEntityCoords(GetPlayerPed(id), true), source)
end)

Events.Register("admin:toggleCharacterLockStatus", function(source, id, status)
    local player = Players.Get(source)

    if not player then return end
	if player:permissions() < Config.Permissions.MOD2 then return end

	DB.Player.LockCharacter(id, status)

	SharedModules.Log:Create(source, "staff", "locl_unlock_character", {
		["Cible"] = id,
		["État"] = status,
	})
end)

Events.Register("admin:setPlayerCharacterSlots", function(source, player, slots)
    local sourcePlayer = Players.Get(source)

    if not sourcePlayer then return end

    if sourcePlayer:permissions() < Config.Permissions.HM then return end

	local identifier = Identifiers.Parse(GetPlayerIdentifiers(source)).discord

	if player then
		identifier = DB.Player.GetDiscord(player)
	end

	local target = Players.Find(function(ply)
		return ply:identifiers().discord == identifier
	end)

	if target and target:source() then
		Events.TriggerClient("player:update", target:source(), "slots", slots)
	end

	SharedModules.Log:Create(source, "staff", "set_slots", {
		["Cible"] = id,
		["État"] = status,
	})

    return DB.Player.SetSlots(identifier, slots)
end)

Events.Register("admin:sendMessage", function(source, text, target)
    local sourcePlayer = Players.Get(source)
	local targetPlayer = Players.Get(target)

    if not sourcePlayer then return end
	if not targetPlayer then return end

    if sourcePlayer:permissions() < Config.Permissions.MOD then return end

	SharedModules.Log:Create(source, "staff", "send_message", {
		["Cible"] = ("<@%s>"):format(targetPlayer:identifiers().discord),
		["Message"] = text,
	})

	Events.TriggerClient("player:notify", target, "basic", ("~b~[MESSAGE D'UN MODÉRATEUR]~s~ %s"):format(text), "info", 10000)
end)

Events.Register("admin:changePhoneNumber", function(source, playerId, oldNumber, newNumber)
    local sourcePlayer = Players.Get(source)
	local targetPlayer = Players.Get(playerId)

    if not sourcePlayer then return end
	if not targetPlayer then return end

	local targetInventory = Inventories.Get(targetPlayer:inventory_id())

    if sourcePlayer:permissions() < Config.Permissions.HM then return end

	if targetInventory == nil then
		return
	end

	local phone = targetInventory:findItem(function(item)
		return item.name == "phone" and item.metadata.number == oldNumber
	end)

	if phone == nil then
		return
	end

	MySQL.update.await("UPDATE `phone_phones` SET `phone_number` = ? WHERE `owner_id` = ? AND `phone_number` = ?", {
        newNumber,
        targetPlayer:id(),
        oldNumber
    })

	MySQL.update.await("UPDATE `phone_last_phone` SET `phone_number` = ? WHERE `id` = ? AND `phone_number` = ?", {
        newNumber,
        targetPlayer:id(),
        oldNumber
    })

	local updatedPhone = Functions.DeepCopy(phone)
	updatedPhone.metadata.number = newNumber

	targetInventory:updateItem(phone, updatedPhone)

	SharedModules.Log:Create(source, "staff", "change_phone_number", {
		["Cible"] = ("<@%s>"):format(targetPlayer:identifiers().discord),
		["Numéro"] = ("%s -> %s"):format(oldNumber, newNumber),
	})

	Events.TriggerClient("inventory:updateItem", targetPlayer:source(), targetPlayer:inventory_id(), phone)

end)

Callbacks.Register("admin:banlist", function(source)
    local sourcePlayer = Players.Get(source)

    if not sourcePlayer then return end

    if sourcePlayer:permissions() < Config.Permissions.MOD2 then return end

    return DB.Ban.All()
end)
