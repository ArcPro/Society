Core.Player:OnLoad(function()
    if player:permissions() < Config.Permissions.MOD then return end

	if player:permissions() >= Config.Permissions.DEV then
		RegisterCommand('crun', function(source, args)
			load(args[1])()
		end, false)
	end

    RegisterCommand('revive', function(source, args)
        Events.TriggerServer("player:revive", args[1] or player:source(), 100)
    end, false)


	RegisterCommand('feed', function(source, args)
		Events.TriggerServer("player:update", "hunger", 100, args[1] or player:source())
		Events.TriggerServer("player:update", "thirst", 100, args[1] or player:source())
	end, false)

	RegisterCommand('goto', function(source, args)
		if not args[1] then return end

		Events.TriggerServer("admin:goto", tonumber(args[1]))
    end, false)

	RegisterCommand('bring', function(source, args)
		if not args[1] then return end

		Events.TriggerServer("player:update", "position", GetEntityCoords(PlayerPedId(), true), tonumber(args[1]))
    end, false)

	RegisterCommand('tp', function(source, args)
		if not args[1] or not args[2] or not args[3] then return end

		for i = 1, #args, 1 do
			args[i] = tonumber(args[i])
		end

        player:position(vector3(args[1], args[2], args[3]), true)
    end, false)

	RegisterCommand('tpm', function(source, args)
        local waypoint = GetFirstBlipInfoId(8)

		if not waypoint or not DoesBlipExist(waypoint) then return end

		local coords = GetBlipInfoIdCoord(waypoint);

		player:position(vector3(coords.x, coords.y, 250.0), true)
		FreezeEntityPosition(PlayerPedId(), true)

		local foundGroundZ, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, 250.0, false)

		while foundGroundZ == false do
			foundGroundZ, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, 250.0, false)
			Citizen.Wait(50)
		end

		player:position(vector3(coords.x, coords.y, groundZ), true)
		FreezeEntityPosition(PlayerPedId(), false)
    end, false)

	RegisterCommand('societycard', function(source, args)
		if not args[1] then return end

		if player:permissions() < Config.Permissions.HM then return end

		args[1] = tonumber(args[1])

		local society = ClientModules.Societies:Get(args[1])

        if society == nil then
			UI:AddNotification("basic", "~r~ID de l'entreprise invalide.~s~", "info", 5000)
			return
		end

		player:inventory():addItem(Item.Create("credit_card", { linkedAccount = society:bank_account_id() }, 1))

    end, false)

	RegisterCommand("custom", function(source)
		if player:permissions() < Config.Permissions.HM then return end

		if IsPedSittingInAnyVehicle(PlayerPedId()) == true then
			Events.Trigger("mechanic:toggle", true)
		else
			return UI:AddNotification("basic", "~r~Vous devez être dans un véhicule", "info", 5000)
		end
	end, false)

	RegisterCommand("adm", function (source, args)
		Events.TriggerServer("admin:chat", GetPlayerName(PlayerId()), table.concat(args," "))
	end, false)

    Events.TriggerExternal("chat:addSuggestion", "/adm", "Chat staff", {
        { name = "texte", help = "Le message a envoyer" },
    })

	RegisterCommand("register", function (source, args)
		if not args[1] then return end

		Events.TriggerServer("admin:register", tonumber(args[1]))
	end, false)

    Events.TriggerExternal("chat:addSuggestion", "/register", "Donner menu appearance", {
        { name = "id", help = "L'id serveur du joueur" },
    })

	Events.TriggerExternal("chat:addSuggestion", "/car", "Se donner un véhicule", {})

	Events.TriggerExternal("chat:addSuggestion", "/feed", "Se nourrir", {})

    Events.TriggerExternal("chat:addSuggestion", "/revive", "Revive un joueur", {
        { name = "id", help = "L'id du joueur à revive" },
    })

	Events.TriggerExternal("chat:addSuggestion", "/goto", "Se téléporter à un joueur", {
        { name = "id", help = "L'id serveur du joueur" },
    })

	Events.TriggerExternal("chat:addSuggestion", "/bring", "Téléporter un joueur à toi", {
        { name = "id", help = "L'id serveur du joueur" },
    })

	Events.TriggerExternal("chat:addSuggestion", "/tp", "Se téléporter à des coordonnées", {
        { name = "x", help = "Coordonnées X" },
		{ name = "y", help = "Coordonnées Y" },
		{ name = "z", help = "Coordonnées Z" },
    })

	Events.TriggerExternal("chat:addSuggestion", "/tpm", "Se téléporter sur le point", {})

	Events.TriggerExternal("chat:addSuggestion", "/societycard", "Récupérer une carte d'entreprise", {
        { name = "id", help = "ID de l'entreprise" },
	})
end)
