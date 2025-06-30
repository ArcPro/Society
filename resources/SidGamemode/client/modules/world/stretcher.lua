ClientModules = ClientModules or {}
ClientModules.World = ClientModules.World or {}
ClientModules.World.Stretcher = {}
ClientModules.World.Stretcher.Initialized = false
ClientModules.World.Stretcher.Attached = nil
ClientModules.World.Stretcher.Distance = 3.5

ClientModules.World.Stretcher.Models = {
    LOWERED = `loweredstrykergurney`,
    NORMAL	= `strykergurney`,
}

ClientModules.World.Stretcher.AmbulanceOffsets = {
	[`sandbulance`]	= vector3(0.0, -3.0, 0.1),
	[`emsnspeedo`]	= vector3(0.0, -1.0, -0.3),
	[`ambulance`]	= vector3(0.0, -2.0, -0.4),
}

ClientModules.World.Stretcher.LayOffsets = {
    [`loweredstrykergurney`]	= vector3(0.0, 0.0, 1.7),
    [`strykergurney`]			= vector3(0.0, 0.0, 2.1),
}


---Check if a model is a supported ambulance
---@param model integer
---@return boolean
function ClientModules.World.Stretcher:IsThisModelAValidAmbulance(model)
	return self.AmbulanceOffsets[model] ~= nil
end

---Check if a model is a stretcher or not
---@param model integer
---@return boolean
function ClientModules.World.Stretcher:IsThisModelAStretcher(model)
	return model == self.Models.LOWERED or model == self.Models.NORMAL
end

---Check if a player is close enough of the stretcher to perform the action
---@param entity integer
---@return boolean
function ClientModules.World.Stretcher:DistanceCheck(entity)
	local distance = self.Distance

	if IsEntityAVehicle(entity) then
		distance *= 1.5
	end

	local close_enough = Math.Distance(player:position(), GetEntityCoords(entity, false)) <= distance

	if close_enough == false then
		UI:AddNotification("basic", "~r~Vous êtes trop loin.~s~", "info", 5000)
	end

	return close_enough
end

---Create a stretcher
---@param type "lowered" | "normal"
---@param coords vector3
---@param heading? number
---@return boolean success
function ClientModules.World.Stretcher:Create(type, coords, heading)
	local stretcher = SharedModules.Entities:Create(self.Models[type:upper()], coords)

	if stretcher == nil then
		UI:AddNotification("basic", "~r~Erreur lors de la création du prop~s~", "info", 5000)
		return false
	end

	SetEntityHeading(stretcher, heading or 0.0)
	PlaceObjectOnGroundProperly(stretcher)

	Utils.RealWait(500)

	SharedModules.Entities:SetStatebag(stretcher, "pickupItem", "stretcher")
	SharedModules.Entities:SetStatebag(stretcher, "pickupDistance", 2.5)

	return true
end

---ModelSwap a stretcher
---@param entity integer
function ClientModules.World.Stretcher:ModelSwap(entity)
	local target_model = self.Models.LOWERED

	if self:DistanceCheck(entity) == false then return end

	if GetEntityModel(entity) == target_model then
		target_model = self.Models.NORMAL
	end

	if IsEntityAttached(entity) then return end

	Events.TriggerServer("stretcher:model_swap", NetworkGetNetworkIdFromEntity(entity), target_model)

	while GetEntityModel(entity) ~= target_model do
		Citizen.Wait(0)
	end
end

---Grab a stretcher from ground to player hands
---@param entity any
function ClientModules.World.Stretcher:Grab(entity)
	local ped = PlayerPedId()

	if self:DistanceCheck(entity) == false then return end

	if SharedModules.Entities:Control(entity) == false then
		UI:AddNotification("basic", "~r~Une erreur s'est produite~s~", "info", 5000)
		return
	end

	self.Attached = entity

	Citizen.CreateThread(function()
		ClientModules.HUD.InstructionalButtons:Add("Poser le brancard", 47)

		while DoesEntityExist(self.Attached) do
			if IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 51) == false then
				ClientModules.Misc.Animations:Stop(false, true)
				ClientModules.Misc.Animations:Play("carry3", false, function()end, true)
			end

			if IsControlJustPressed(0, 47) then
				self:Drop()
			end

			Citizen.Wait(0)
		end

		ClientModules.Misc.Animations:Stop(false, true)
		ClientModules.HUD.InstructionalButtons:Delete(47)
	end)

	Utils.RealWait(150)

	if GetEntityModel(self.Attached) == self.Models.LOWERED then
		self:ModelSwap(self.Attached)
	end

	SharedModules.Entities:AttachToEntityClientSided(
		self.Attached, ped, GetPedBoneIndex(ped, 28422),
		vector3(0.0, -1.0, -1.4), vector3(0.0, 15.0, -90.0), true, false
	)
end

---Drop the stretcher player has in hands to the floor
function ClientModules.World.Stretcher:Drop()
	if DoesEntityExist(self.Attached) == false then return end

	DetachEntity(self.Attached, false, true)
	PlaceObjectOnGroundProperly(self.Attached)

	self.Attached = nil
end

---Lay on the stretcher
---@param entity integer
function ClientModules.World.Stretcher:Lay(entity)
	local ped = PlayerPedId()

	if self:DistanceCheck(entity) == false then return end

	ClientModules.Misc.Animations:Play("passout3", false, function()end, true)

	SharedModules.Entities:AttachToEntityClientSided(ped, entity, 0, self.LayOffsets[GetEntityModel(entity)], vector3(0.0, 0.0, -90.0), true, false)

	Citizen.CreateThread(function ()
		local model = GetEntityModel(entity)

		ClientModules.HUD.InstructionalButtons:Add("Descendre du brancard", 47)

		while IsEntityAttachedToEntity(ped, entity) do
			if model ~= GetEntityModel(entity) then
				model = GetEntityModel(entity)

				DetachEntity(ped, true, true)

				SharedModules.Entities:AttachToEntityClientSided(ped, entity, 0, self.LayOffsets[model], vector3(0.0, 0.0, -90.0), true, false)
			end

			if IsControlJustPressed(0, 47) then
				self:StopLaying()
			end

			Citizen.Wait(0)
		end

		ClientModules.HUD.InstructionalButtons:Delete(47)
	end)
end

---Stop laying on the stretcher
function ClientModules.World.Stretcher:StopLaying()
	if IsEntityAttachedToAnyObject(PlayerPedId()) == false then  return end

	ClientModules.Misc.Animations:Stop(false, true)
	Citizen.Wait(1000)
	DetachEntity(PlayerPedId(), true, false)
end

function ClientModules.World.Stretcher:IsThereAStretcherInThisAmbulance(entity)
	if self:IsThisModelAValidAmbulance(GetEntityModel(entity)) == false then
		return false
	end

	local net_stretcher = Entity(entity).state.attached_stretcher

	if net_stretcher == nil then
		return false
	end

	return DoesEntityExist(NetworkGetEntityFromNetworkId(net_stretcher))
end

---Place current attached stretcher in ambulance
---@param vehicle any
function ClientModules.World.Stretcher:PlaceInVehicle(vehicle)
	local net_stretcher = NetworkGetNetworkIdFromEntity(self.Attached)
	local model = GetEntityModel(vehicle)

	if self:IsThisModelAValidAmbulance(model) == false then return end
	if self:DistanceCheck(vehicle) == false then return end

	SetEntityCollision(self.Attached, false, false)
	DetachEntity(self.Attached, false, false)

	if GetEntityModel(self.Attached) == self.Models.NORMAL then
		self:ModelSwap(self.Attached)
	end

	SharedModules.Entities:AttachToEntity(
		net_stretcher, NetworkGetNetworkIdFromEntity(vehicle), 0,
		self.AmbulanceOffsets[model], vector3(0.0, 0.0, -90.0), false, false
	)

	ClientModules.Misc.Animations:Stop(false, true)

	SharedModules.Entities:SetStatebag(vehicle, "attached_stretcher", net_stretcher)

	self.Attached = nil
end

function ClientModules.World.Stretcher:GrabFromVehicle(vehicle)
	if self:IsThisModelAValidAmbulance(GetEntityModel(vehicle)) == false then return end
	if self:IsThereAStretcherInThisAmbulance(vehicle) == false then return end
	if self:DistanceCheck(vehicle) == false then return end

	local entity = NetworkGetEntityFromNetworkId(Entity(vehicle).state.attached_stretcher)

	SharedModules.Entities:Detach(entity, false, false)
	SetEntityCollision(entity, false, false)

	SharedModules.Entities:SetStatebag(vehicle, "attached_stretcher", nil)
	self:Grab(entity)
end

function ClientModules.World.Stretcher:RegisterEvents()
	Events.Register("stretcher:model_swap", function(_, net_id, target_model)
		local entity = SharedModules.Entities:WaitForNetworkId(net_id)

		if entity == nil or DoesEntityExist(entity) == false then return end

		local coords = GetEntityCoords(entity, false)
		local model = GetEntityModel(entity)

		local temp_coords = vector3(coords.x + math.random(), coords.y + math.random(), coords.z + math.random())

		SetEntityCoords(entity, temp_coords.x, temp_coords.y, temp_coords.z, false, false, false, false)

		if model ~= target_model then
			CreateModelSwap(temp_coords.x, temp_coords.y, temp_coords.z, 0.01, model, target_model, false)
		end

		if GetEntityModel(entity) ~= target_model then
			RemoveModelSwap(temp_coords.x, temp_coords.y, temp_coords.z, 0.01, target_model, model, false)
		end

		SetEntityCoords(entity, coords.x, coords.y, coords.z, false, false, false, false)
	end)
end

function ClientModules.World.Stretcher:Initialize()
	if self.Initialized == true then return end

	self:RegisterEvents()

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.World.Stretcher:Initialize()
end)
