local times = {
	{ "Matin", 8 },
	{ "Midi", 12 },
	{ "Après-Midi", 18 },
	{ "Nuit", 22 },
}

Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (DoesEntityExist(hitEntity) and not IsEntityAVehicle(hitEntity) and not IsEntityAPed(hitEntity) and not IsEntityAnObject(hitEntity)) then

		if player:metadata().instance == 1 or HasPropertyKeys(player:metadata().instance) then
			Context:AddItem(0, "Poser un objet", function()
				local model = Utils.KeyboardInput("Modèle de l'objet", 100, "")

				if model == nil then return end

				ClientModules.World.Decoration:Create(model, worldPosition)
			end, true)

		end

		if (player:permissions() < Config.Permissions.MOD) then
			return
		end

		local blipsCheckbox = Context:AddCheckboxItem(0, "Afficher les blips", LocalPlayer.state.blips)

		Context:OnActivate(blipsCheckbox, function()
			LocalPlayer.state:set("blips", not LocalPlayer.state.blips, true)
		end)

		local namesCheckbox = Context:AddCheckboxItem(0, "Afficher les noms", LocalPlayer.state.player_names)

		Context:OnActivate(namesCheckbox, function()
			Events.Trigger("admin:toggleNames", not LocalPlayer.state.player_names)
		end)

		Context:AddItem(0, "Se téléporter ici", function()
			player:position(worldPosition, true)
		end, true)

		Context:AddItem(0, "Poser un véhicule ici", function()
			local model = Utils.KeyboardInput("Modèle du véhicule", 100, "")

			if (not model or not IsModelValid(model)) then
				return UI:AddNotification("basic", "~r~Modèle invalide", "info", 3000)
			end

			ClientModules.Vehicles:Create(GetHashKey(model), worldPosition, GetEntityHeading(PlayerPedId()), nil, player:fullname())
		end, true)
	end

	if (not hitSomething and player:permissions() > Config.Permissions.MOD) then
		local submenuWeather = Context:AddSubmenu(0, "Changer la météo")
		for i = 1, #Config.Weather.Types, 1 do
			Context:AddItem(submenuWeather, Config.Weather.Types[i], function()
				Events.TriggerServer("onesync:globalState", "weather", Config.Weather.Types[i])
			end, true)
		end

		local submenuTime = Context:AddSubmenu(0, "Changer l'heure")
		for i = 1, #times, 1 do
			Context:AddItem(submenuTime, times[i][1], function()
				Events.TriggerServer("onesync:globalState", "time.hours", times[i][2])
			end, true)
		end
	end
end)
