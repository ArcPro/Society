local emotes = {
	["baseball"]	= "Baseball",
	["bro"]			= "Bro",
	["followa"]		= "Suis moi",
	["give"]		= "Donner",
	["handshake"]	= "Check",
	["headbutt"]	= "Coup de tête",
	["hug"]			= "Calin",
	["punch"]		= "Frapper",
	["slap2"]		= "Gifler",
}

Citizen.CreateThread(function()
	Citizen.Wait(100)

	Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
		if (not DoesEntityExist(hitEntity) or not IsEntityAPed(hitEntity) or not IsPedAPlayer(hitEntity)) then
			return
		end

		local serverId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(hitEntity))
		local target = Core.Player:Get(serverId)

		Context:AddItem(0, ("ID: %d"):format(serverId))

		if target and PlayerPedId() ~= hitEntity then
			Context:AddItem(0, "Fouiller", function()
				if Math.Distance(player:position(), target:position()) > 1.5 then
					return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
				end

				TaskTurnPedToFaceEntity(PlayerPedId(), hitEntity, 1000)
				Citizen.Wait(1000)
				Events.TriggerServer("me", "fouille")
				ClientModules.Misc.Animations:Play("search3")
				ClientModules.Inventory:Open(target:inventory_id(), "Joueur proche", hitEntity)
			end, true)

			Context:AddItem(0, "Donner un item", function()
				if Math.Distance(player:position(), target:position()) > 3.0 then
					return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
				end

				UI:AddNotification("basic", "Glissez l'item que vous voulez donner sur la partie droite", "basic", 5000)

				ClientModules.Inventory.targetPlayer = serverId
				ClientModules.Inventory:Open()
			end, true)

			local carrySubMenu, _ = Context:AddSubmenu(0, "Porter")

			Context:AddItem(carrySubMenu, "Sur l'épaule", function()
				if Math.Distance(player:position(), target:position()) > 1.5 then
					return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
				end

				Events.TriggerServer("animations:requestAccepted", target:source(), "carry2")
			end, true)

			Context:AddItem(carrySubMenu, "Sur le dos", function()
				if Math.Distance(player:position(), target:position()) > 1.5 then
					return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
				end

				Events.TriggerServer("animations:requestAccepted", target:source(), "pback2")
			end, true)

			Context:AddItem(carrySubMenu, "Cute", function()
				if Math.Distance(player:position(), target:position()) > 1.5 then
					return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
				end

				Events.TriggerServer("animations:requestAccepted", target:source(), "carrymecute2")
			end, true)

			local emotesSubmenu, _ = Context:AddSubmenu(0, "Animations")

			for emote, name in pairs(emotes) do
				Context:AddItem(emotesSubmenu, name, function()
					if Math.Distance(player:position(), target:position()) > 1.5 then
						return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
					end

					Events.TriggerServer("animations:sharedRequest", emote, target:source())
				end, true)
			end

			Context:AddItem(0, "Prendre en otage", function()
				if Math.Distance(player:position(), target:position()) > 1.5 then
					return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
				end

				callTakeHostage()
			end, true)

			Context:AddItem(0, "Monter sur son dos", function()
				if Math.Distance(player:position(), target:position()) > 1.5 then
					return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
				end

				Events.TriggerServer("animations:requestAccepted", target:source(), "pback")
			end, true)

			if OnesyncPlayer(serverId).state.emote ~= nil then
				Context:AddItem(0, ("Copier l'animation (%s)"):format(OnesyncPlayer(serverId).state.emote), function()
					ClientModules.Misc.Animations:Play(OnesyncPlayer(serverId).state.emote)
				end, true)
			end

			Context:AddItem(0, "Facturer", function()
				Bill(serverId)
			end, true)
		end

		if player:permissions() >= Config.Permissions.MOD then
			local submenuAdminActions, _ = Context:AddSubmenu(0, "Actions admin")
			local submenuAdminInfos, _ = Context:AddSubmenu(0, "Infos admin")
			local targetGroup = Callbacks.Trigger("group:get", target:group())

			--[[ ADMIN ACTIONS ]]
			Context:AddItem(submenuAdminActions, "Voir la page du joueur", function()
				MainMenu.Admin.Players.Player.onOpen(serverId, true)
				Menus:Visible(MainMenu.Admin.Players.Player.Main, true)
			end, true)

			Context:AddItem(submenuAdminActions, "Réanimer", function()
				Events.TriggerServer("player:revive", serverId, 100)
			end, true)

			Context:AddItem(submenuAdminActions, "Tuer", function()
				Events.TriggerServer("player:update", "health", 0, serverId)
			end, true)

			Context:AddItem(submenuAdminActions, "Nourrir", function()
				Events.TriggerServer("player:update", "hunger", 100, serverId)
				Events.TriggerServer("player:update", "thirst", 100, serverId)
			end, true)

			if player:permissions() > Config.Permissions.MOD then
				Context:AddItem(submenuAdminActions, "Troll", function()
					MainMenu.Admin.Players.Player.Troll.onOpen(serverId)
					Menus:Visible(MainMenu.Admin.Players.Player.Troll.Main, true)
				end, true)
			end

			Context:AddItem(submenuAdminActions, "Kick", function()
				Events.TriggerServer("admin:kick", serverId, Utils.KeyboardInput("Raison du kick", 255, "") or "")
			end, true)

			--[[ ADMIN INFOS ]]
			Context:AddItem(submenuAdminInfos, ("ID Discord: %s"):format(target:identifiers().discord), function()
				UI:AddNotification("basic", "~b~ID Discord copié dans le presse-papiers !~s~", "info", 5000)
				UI:CopyToClipboard(target:identifiers().discord)
			end, true)

			Context:AddItem(submenuAdminInfos, ("ID Serveur: %d"):format(serverId), function()
				UI:AddNotification("basic", "~b~ID Serveur copié dans le presse-papiers !~s~", "info", 5000)
				UI:CopyToClipboard(tostring(serverId))
			end, true)

			Context:AddItem(submenuAdminInfos, ("ID Personnage: %d"):format(target:id()), function()
				UI:AddNotification("basic", "~b~ID Personnage copié dans le presse-papiers !~s~", "info", 5000)
				UI:CopyToClipboard(tostring(target:id()))
			end, true)

			Context:AddItem(submenuAdminInfos, ("Nom: %s"):format(target:fullname()), function()
				UI:AddNotification("basic", "~b~Nom copié dans le presse-papiers !~s~", "info", 5000)
				UI:CopyToClipboard(tostring(target:fullname()))
			end, true)

			Context:AddItem(submenuAdminInfos, ("Job: %s"):format(target:job().label), function()
				UI:AddNotification("basic", "~b~Job copié dans le presse-papiers !~s~", "info", 5000)
				UI:CopyToClipboard(tostring(target:job().label))
			end, true)

			Context:AddItem(submenuAdminInfos, ("Grade: %s"):format(target:job_grade().label), function()
				UI:AddNotification("basic", "~b~Grade copié dans le presse-papiers !~s~", "info", 5000)
				UI:CopyToClipboard(tostring(target:job_grade().label))
			end, true)

			Context:AddItem(submenuAdminInfos, ("Groupe: %s"):format((targetGroup or { label = "Aucun" }).label), function()
				UI:AddNotification("basic", "Groupe copié dans le presse-papiers !~s~", "info", 5000)
				UI:CopyToClipboard(tostring((targetGroup or { label = "Aucun" }).label))
			end, true)
		end
	end)
end)
