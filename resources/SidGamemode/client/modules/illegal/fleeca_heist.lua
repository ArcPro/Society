ClientModules = ClientModules or {}
ClientModules.Illegal = ClientModules.Illegal or {}
ClientModules.Illegal.FleecaHeist = {}
ClientModules.Illegal.FleecaHeist.Initialized = false
ClientModules.Illegal.FleecaHeist.Agencies = {
	vector3(-1207.8, -336.3, 36.9),
	vector3(149.1, -1048.3, 28.5),
	vector3(1173.3, 2714.0, 37.2),
	vector3(-2955.3, 484.5, 14.8),
	vector3(313.3, -286.5, 53.3),
	vector3(-351.6, -57.3, 48.2),
}

ClientModules.Illegal.FleecaHeist.DoorModels = {
	Glass = 159592337,
	Safe = -219621528
}

function ClientModules.Illegal.FleecaHeist:GetNearestAgency(coords)
	local nearest, distance = nil, nil
	local current_distance = nil

	for id, agency_coords in pairs(self.Agencies) do
		current_distance = Math.Distance(coords, agency_coords)
		if distance == nil or current_distance < distance then
			distance = current_distance
			nearest = id
		end
	end

	return nearest, self.Agencies[nearest]
end

function ClientModules.Illegal.FleecaHeist:IsValidGlassDoor(entity)
	local id, coords = self:GetNearestAgency(player:position())

	return GetClosestObjectOfType(coords.x, coords.y, coords.z, 10.0, self.DoorModels.Glass, false, false, false) == entity
end

function ClientModules.Illegal.FleecaHeist:IsValidSafeDoor(entity)
	local _, coords = self:GetNearestAgency(player:position())

	return GetClosestObjectOfType(coords.x, coords.y, coords.z, 10.0, self.DoorModels.Safe, false, false, false) == entity
end

function ClientModules.Illegal.FleecaHeist:CanRob(id)
	if Callbacks.Trigger("fleeca:is_robbed", id) == true then
		UI:AddNotification("basic", "~r~La porte semble être en mode sécurité~s~", "basic", 5000)
		return false
	end

	return ClientModules.Illegal:CheckForPolice("fleeca_heist_cops")
end

function ClientModules.Illegal.FleecaHeist:HackGlassDoor(entity)
	local id, _ = self:GetNearestAgency(player:position())

	if self:CanRob(id) == false then return end

	ClientModules.Misc.Animations:Play("gsign345")

	ClientModules.Illegal.QuicktimeEvents:HackingPhone(function(success)
		if success then
			UI:AddNotification("basic", "Les sécurités sont désactivées pour ~b~20 minutes~s~.", "basic", 5000)
			Events.TriggerServer("fleeca:started", id, GetDoor(entity).id)
		end

		ClientModules.Misc.Animations:Stop()
	end)

	ClientModules.Illegal:AlertPolice("Braquage de banque")
end

function ClientModules.Illegal.FleecaHeist:HackSafeDoor(entity)
	local id, _ = self:GetNearestAgency(player:position())
	local card_model = Utils.Streaming.RequestModel(GetHashKey("p_ld_id_card_002"))
	local forward, right, up, pos = GetEntityMatrix(entity)
	local card_coords = pos - forward * 2.425 - right * 0.025 + up * 0.1
	local ped_coords = pos - forward * 2.25 - right * 0.7
	local door_heading = GetEntityHeading(entity)
	local ped = PlayerPedId()

	local _, groundZ = GetGroundZFor_3dCoord(pos.x, pos.y, pos.z, false)

	TaskGoStraightToCoord(ped, ped_coords.x, ped_coords.y, groundZ, 1.0, 1000, door_heading - 90, 0.0)

	Utils.RealWait(2000)

	local card_item = player:inventory():findItem(function(item)
		return item.name == "access_card"
	end)

	if card_item == nil then
		UI:AddNotification("basic", "~r~Vous n'avez pas de carte d'accès~s~", "info", 5000)
		return
	end

	card_item.quantity = 1
	if player:inventory():removeItem(card_item) == false then
		UI:AddNotification("basic", "~r~Une erreur s'est produite~s~", "info", 5000)
		return
	end

	local card = CreateObject(card_model, player:position().x, player:position().y, player:position().z, true, true, false)
	AttachEntityToEntity(card, ped, GetPedBoneIndex(ped, 28422), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
	TaskStartScenarioInPlace(ped, "PROP_HUMAN_ATM", 0, true)
	Citizen.Wait(1500)
	DetachEntity(card, false, false)
	SetEntityCoords(card, card_coords.x, card_coords.y, card_coords.z, false, false, false, false)
	SetEntityRotation(card, 90.0, 0.0, door_heading, 1, true)
	FreezeEntityPosition(card, true)
	Citizen.Wait(500)
	ClearPedTasksImmediately(ped)

	ClientModules.Misc.Animations:Play("gsign345")

	ClientModules.Illegal.QuicktimeEvents:Fingerprint(3, 3, 5, function (success)
		if success then
			Events.TriggerServer("fleeca:safe_opened", id, GetDoor(entity).id, {
				vector3(pos.x, pos.y, groundZ) - forward * 1.9 + right * 6.0,
				vector3(pos.x, pos.y, groundZ) - forward * 1.9 + right * 2.0,
				vector3(pos.x, pos.y, groundZ) + right * 2.0,
				vector3(pos.x, pos.y, groundZ) + right * 5.0,
			})
		end

		ClientModules.Misc.Animations:Stop()
		TaskStartScenarioInPlace(ped, "PROP_HUMAN_ATM", 0, true)
		Citizen.Wait(500)
		DeleteEntity(card)
		ClearPedTasks(ped)
	end)

end

function ClientModules.Illegal.FleecaHeist:RegisterEvents()
	Events.Register("fleeca:add_mastermind", function(source, id, index, coords)
		Marker:new({
			name = ("fleeca_%d_mastermind_%d"):format(id, index),
			onLeave = function()end,
			action = "safecracking",
			coords = coords,

			onInteract = function()
				local code = Utils.KeyboardInput("Code", 4, "")

				if code == nil then return end

				UI:AddNotification("basic", tostring(Callbacks.Trigger("fleeca:try_code", id, index, code)), "info", 5000)
			end,
		})
	end)
end

function ClientModules.Illegal.FleecaHeist:Initialize()
	if self.Initialized == true then return end

	self:RegisterEvents()

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Illegal.FleecaHeist:Initialize()
end)
