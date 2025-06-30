
function GetTrunkBone(vehicle)
    local class = GetVehicleClass(vehicle)
	local model = GetEntityModel(vehicle)

    if model == 826114 or model == 1377794 then -- stockade
        return "door_pside_r"
    elseif class == 8 then
        return "swingarm"
    elseif class == 20 then
        return "reversinglight_r"
    elseif class == 14 then --boat
        return "engine"
    elseif class == 16 then -- plane
        return "airbrake_l"
    elseif class == 15 then -- plane
        return "engine"
	elseif class == 11 then
		return "brakelight_r"
	elseif class == 17 then
		return "brakelight_r"
	elseif class == 18 then
		if model == 742120272 or model == -738571007 or model == 1877402183 or model == 478013990 or model == 348244753 then
			return "boot"
		end
		return "brakelight_r"
	elseif class == 12 then
		if model == -810318068 or model == -359759810 or model == 1954121213 or model == -225539375
		or model == 962806693 or model == 106331962 or model == -919704857 then
			return "boot"
		end
        return "door_pside_r"
    else
        return "boot"
    end
end

local function GetOutOfTrunk(vehicle)
	ClientModules.HUD.InstructionalButtons:Delete(Utils.GetControlHash("cancel_emote"))

	SetEntityVisible(PlayerPedId(), true, false)

	SharedModules.Entities:SetStatebag(vehicle, "playerInTrunk", nil)

	LocalPlayer.state:set("invisible", false, true)

	DetachEntity(PlayerPedId())

	player:position(GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, GetTrunkBone(vehicle))) - GetEntityForwardVector(vehicle), true)
end

Context:Register(function(screenPosition, hitSomething, worldPosition, vehicle, normalDirection)
	if (not DoesEntityExist(vehicle) or not IsEntityAVehicle(vehicle)) then
		return
	end

	local trunkOpen = GetVehicleDoorAngleRatio(vehicle, 5) > 0.1
	local boneIndex = GetEntityBoneIndexByName(vehicle, GetTrunkBone(vehicle))
	local bonePosition = GetWorldPositionOfEntityBone(vehicle, boneIndex)

	Context:AddItem(0, GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))

	Context:AddItem(0, "Attacher la corde", function()
		exports["zerodream_towing"]:SetTowVehicle(vehicle)
	end, true)

	-- =============================
	-- ========== Anchor ===========
	-- =============================
	if IsThisModelABoat(GetEntityModel(vehicle)) then
		local anchored = Entity(vehicle).state.anchor

		Context:AddItem(0, anchored == true and "Relever l'ancre" or "Jeter l'ancre", function()

			if Math.Distance(player:position(), GetEntityCoords(vehicle, false)) > 5.0 then
				return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
			end

			if CanAnchorBoatHere(vehicle) == false then
				UI:AddNotification("basic", "~r~Impossible d'ancrer le bateau ici~s~", "info", 5000)
				return
			end

			SharedModules.Entities:SetStatebag(vehicle, "anchor", not anchored == true)
		end, true)
	end

	-- =============================
	-- ======= Lock / Unlock =======
	-- =============================
	if ClientModules.Vehicles:HasKey(vehicle) then
		Context:AddItem(0, ClientModules.Vehicles:IsLocked(vehicle) and "Déverrouiller" or "Verrouiller", function()

			if Math.Distance(player:position(), GetEntityCoords(vehicle, false)) > 50 then
				return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
			end

			ClientModules.Misc.Animations:Play("keyfob")
			ClientModules.Vehicles.Actions:Call("lock_doors", vehicle, { ClientModules.Vehicles:IsLocked(vehicle) and Config.VehicleDoors.OPEN or Config.VehicleDoors.CLOSED })
		end, true)
	end

	-- =============================
	-- =========== Trunk ===========
	-- =============================
	Context:AddItem(0, trunkOpen and "Fermer le coffre" or "Ouvrir le coffre", function()

		if Math.Distance(player:position(), bonePosition) > 2.0 then
			return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
		end

		if GetVehicleDoorLockStatus(vehicle) > 0 then
			return UI:AddNotification("basic", "~r~Le véhicule est verrouillé", "info", 3000)
		end

		if (trunkOpen == false) then
			ClientModules.Vehicles.Actions:Call("toggle_door", vehicle, { 5, true })
			ClientModules.Misc.Animations:Play("search3")

			local veh = ClientModules.Vehicles:Get(SharedModules.Vehicles:GetRealPlate(vehicle))

			if veh == nil then
				return UI:AddNotification("basic", "~r~Ce véhicule n'existe pas", "info", 3000)
			end

			Events.TriggerServer("me", "ouvre le coffre")
			ClientModules.Inventory:Open(veh:trunk_id(), "Coffre de véhicule", vehicle)
		else
			ClientModules.Vehicles.Actions:Call("toggle_door", vehicle, { 5, false })
		end
	end, true)

	-- =============================
	-- ====== Vehicle actions ======
	-- =============================
	if (GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() or GetPedInVehicleSeat(vehicle, 0) == PlayerPedId()) then

		Context:AddItem(0, "Ouvrir la boîte à gants", function()

			local veh = ClientModules.Vehicles:Get(SharedModules.Vehicles:GetRealPlate(vehicle))

			if veh == nil then
				return UI:AddNotification("basic", "~r~Ce véhicule n'existe pas", "info", 3000)
			end

			Events.TriggerServer("me", "ouvre la boîte à gants")
			ClientModules.Inventory:Open(veh:glovebox_id(), "Boite à gants", vehicle)
		end, true)

		if ClientModules.Vehicles:HasKey(vehicle) == true then
			Context:AddItem(0, GetIsVehicleEngineRunning(vehicle) and "Éteindre le moteur" or "Allumer le moteur", function()
				ClientModules.Vehicles.Actions:Call("toggle_engine", vehicle, { not GetIsVehicleEngineRunning(vehicle) })
			end, true)
		end

		Context:AddItem(0, "Gestion véhicule", function()
			Events.Trigger("vehicle:toggleManagementMenu", true)
		end, true)
	end

	-- =============================
	-- =========== Cover ===========
	-- =============================
	if GetVehicleNumberOfPassengers(vehicle) == 0 and IsVehicleSeatFree(vehicle, -1) and player:metadata().instance == 1 then
		Context:AddItem(0, "Bâcher", function()
			ClientModules.Vehicles.Cover:Cover(vehicle)
		end, true)
	end

	-- =============================
	-- ======= Get in trunk ========
	-- =============================
	if IsPedInAnyVehicle(PlayerPedId(), true) == false and IsThisModelABike(GetEntityModel(vehicle)) == false then

		if Entity(vehicle).state.playerInTrunk ~= nil then
			Context:AddItem(0, "Faire sortir du coffre", function()
				Events.TriggerServer("trunk:getOut", NetworkGetNetworkIdFromEntity(vehicle), Entity(vehicle).state.playerInTrunk)
			end, true)
		else

			Context:AddItem(0, "Monter dans le coffre", function()
				local driver = GetPedInVehicleSeat(vehicle, -1)

				if Math.Distance(player:position(), bonePosition) > 1.75 then
					return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
				end

				if GetVehicleDoorLockStatus(vehicle) > 0 then
					return UI:AddNotification("basic", "~r~Le véhicule est verrouillé~s~", "info", 3000)
				end

				if DoesEntityExist(driver) and IsEntityAPed(driver) and not IsPedAPlayer(driver) then
					return UI:AddNotification("basic", "~r~Les PNJ ne sont pas des taxis gratuits . 🫏~s~", "info", 3000)
				end

				SharedModules.Entities:AttachToEntityClientSided(
					PlayerPedId(), vehicle, boneIndex,
					vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), true, false
				)

				LocalPlayer.state:set("invisible", true, true)

				ClientModules.HUD.InstructionalButtons:Add("Sortir du coffre", Utils.GetControlHash("cancel_emote"))

				ClientModules.Misc.Animations:Play("cryinbed", true, function()
					GetOutOfTrunk(vehicle)
				end)

				SharedModules.Entities:SetStatebag(vehicle, "playerInTrunk", player:source())

				Citizen.Wait(500)

				SetEntityVisible(PlayerPedId(), false, false)
			end, true)
		end
	end

	if not IsPedInVehicle(PlayerPedId(), vehicle, false) then
		if (GetNumberOfVehicleDoors(vehicle) > 0 and ClientModules.Vehicles:HasKey(vehicle)) then
			local submenuDoor, _ = Context:AddSubmenu(0, "Gestion des portes")

			for index, label in pairs({ "Avant gauche", "Avant droite", "Arrière gauche", "Arrière droite", "Capot", "Coffre" }) do
				Context:AddItem(submenuDoor, label, function()
					if GetVehicleDoorAngleRatio(vehicle, index - 1) > 0.1 then
						ClientModules.Vehicles.Actions:Call("toggle_door", vehicle, { index - 1, false })
					else
						ClientModules.Vehicles.Actions:Call("toggle_door", vehicle, { index - 1, true })
					end
				end)
			end
		end
	end

	-- =============================
	-- =========== Admin ===========
	-- =============================
	if player:permissions() >= Config.Permissions.MOD then
		local submenuAdmin, _ = Context:AddSubmenu(0, "Actions admin")

		Context:AddItem(submenuAdmin, "Voir la page du véhicule", function()
			MainMenu.Admin.Vehicles.Vehicle.onOpen(SharedModules.Vehicles:GetRealPlate(vehicle))
			Menus:Visible(MainMenu.Admin.Vehicles.Vehicle.Main, true)
		end, true)

		Context:AddItem(submenuAdmin, "Réparer", function()
			ClientModules.Vehicles.Actions:Call("repair", vehicle, { false })
		end, true)

		Context:AddItem(submenuAdmin, "Faire le plein", function()
			ClientModules.Vehicles.Actions:Call("refill", vehicle, { 65.0 })
		end, true)

		Context:AddItem(submenuAdmin, "Retourner", function()
			ClientModules.Vehicles.Actions:Call("flip", vehicle)
		end, true)

		Context:AddItem(submenuAdmin, "Nettoyer", function()
			ClientModules.Vehicles.Actions:Call("clean", vehicle)
		end, true)

		Context:AddItem(submenuAdmin, "Supprimer (définitif)", function()
			ClientModules.Vehicles:Delete(vehicle, true)
		end, true)

		Context:AddItem(submenuAdmin, "Supprimer (temporaire)", function()
			ClientModules.Vehicles:Delete(vehicle, false)
		end, true)

		Context:AddItem(submenuAdmin, "Se téléporter dedans", function()
			if (DoesEntityExist(vehicle)) then
				TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, SharedModules.Vehicles:GetFirstFreeSeat(vehicle))
			end
		end, true)

		Context:AddItem(submenuAdmin, "Récupérer les clés", function()
			if (DoesEntityExist(vehicle)) then
				local model = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
				local plate = SharedModules.Vehicles:GetRealPlate(vehicle)

				if player:inventory():addItem(Item.Create(
					"carkeys",
					{
						plate = plate,
						name = ("%s (%s)"):format(model, plate)
					},
					1
				)) then
					UI:AddNotification("basic", "Vous avez récupéré les clés du véhicule", "info", 3000)
				end
			end
		end, true)

		Context:AddItem(submenuAdmin, "Récupérer la carte grise", function()
			if (DoesEntityExist(vehicle)) then
				local model = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
				local plate = SharedModules.Vehicles:GetRealPlate(vehicle)
				local dbVehicle = ClientModules.Vehicles:Get(plate)

				if not dbVehicle then
					return UI:AddNotification("basic", "~r~Ce véhicule n'existe pas en base de données.~s~", "info", 5000)
				end

				if player:inventory():addItem(Item.Create("grey_card", {
					image = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower(),
					owner = dbVehicle:owner(),
					licensePlate = plate,
					model = model,
				}, 1)) then
					UI:AddNotification("basic", "Vous avez récupéré les clés du véhicule", "info", 3000)
				end
			end
		end, true)

		if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then

			Context:AddItem(submenuAdmin, "Custom", function()
				Events.Trigger("mechanic:toggle", true)
			end)
		end
	end
end)

Events.Register("trunk:getOut", function(source, netVehicle)
	local vehicle = SharedModules.Entities:WaitForNetworkId(netVehicle)

	if not vehicle or not DoesEntityExist(vehicle) then return end

	GetOutOfTrunk(vehicle)
end)
