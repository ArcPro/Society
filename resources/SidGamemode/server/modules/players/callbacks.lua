Callbacks.Register("player:get", function(source, id)
    if id then
        return Players.Get(id)
    else
        local player = Players.Get(source)

        if not player then
            player = DB.Player.GetCharacter(source)
        end

        if not player then
            return nil
        end

        return player
    end
end)

Callbacks.Register("player:getName", function(source, id)
    local player = Players.Find(function(data)
		return data:id() == id
	end)

	if player == nil then
		return "Inconnu"
	end

	return player:fullname()
end)

Callbacks.Register("player:getCharacter", function(source, id, setIdentifiersAndPermissions)
    if id == nil then return end

	local character = DB.Player.GetCharacterById(id)

	if not character then
		return nil
	end

	if setIdentifiersAndPermissions then
		local current_player = Players.Get(source)

		if current_player ~= nil then
			character:identifiers(current_player:identifiers())
			character:permissions(current_player:permissions())
		end

		character:source(source)

		Players._list[source] = character

		SharedModules.Log:Create(source, "staff", "change_source", {
			["ID Perso chargé"] = id,
		})
	end

	return character
end)

Callbacks.Register("player:getDiscord", function(source, id)
	return Players.Get(id):identifiers().discord
end)

Callbacks.Register("player:getCharacters", function(source, player)
	local identifier = Identifiers.Parse(GetPlayerIdentifiers(source)).discord

	if player then
		identifier = DB.Player.GetDiscord(player)
	end

	if identifier == nil then
		return {}
	end

    return DB.Player.GetAllCharacters(identifier)
end)

Callbacks.Register("player:getSlots", function(source, player)
	local identifier = Identifiers.Parse(GetPlayerIdentifiers(source)).discord

	if player then
		identifier = DB.Player.GetDiscord(player)
	end

	if identifier == nil then
		return 1
	end

    return DB.Player.GetSlots(identifier)
end)

Callbacks.Register("player:create", function(source, player)
	if DB.Player.HasFreeSlot(Identifiers.Parse(GetPlayerIdentifiers(source)).discord) == 1 then return end

	local character = DB.Player.CreateCharacter(
        player._firstname,
        player._lastname,
        player._birthdate,
        player._nationality,
        player._height,
        player._weight,
        player._sex,
        player._position,
        player._skin,
        source
    );

	if not character then
		return nil
	end

	SharedModules.Log:Create(source, "player", "create", {
		["ID"] = character:id(),
		["Nom"] = character:fullname(),
		["Date de naissance"] = character:birthdate(),
		["Taille"] = character:height(),
		["Poids"] = character:weight(),
		["Sexe"] = character:sex(),
	})

    return character:id();

end)

Callbacks.Register("player:all", function(source)
    local offline = {}
    local online = {}

    local players = DB.Player.All()
    for _, player in pairs(players) do
        local ply = Players.Find(function(p)
            return p:id() == player.id
        end)

        if ply then
            table.insert(online, {
                nickname = GetPlayerName(ply:source()),
                discord = ply:identifiers().discord,
                permissions = ply:permissions(),
                name = ply:fullname(),
                id = ply:source(),
            })
        else
            table.insert(offline, {
                name = ("%s %s"):format(player.firstname, player.lastname),
                discord = player.identifier,
                nickname = "Hors ligne",
                id = player.id,
            })
        end
    end

    return {
        offline = offline,
        online = online,
    }
end)
