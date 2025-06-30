local RCCar = {}
local player = nil

Attached = false

AddEventHandler('lb-phone:OnDeath', function()
	RCCar.AttachPlayer(false)
end)

RCCar.Start = function()
	if DoesEntityExist(RCCar.Entity) then return end

	RCCar.Spawn()

	while DoesEntityExist(RCCar.Entity) and DoesEntityExist(RCCar.Driver) do
		Citizen.Wait(0)

		RCCar.HandleKeys()

		if Attached then
			if not NetworkHasControlOfEntity(RCCar.Driver) then
				NetworkRequestControlOfEntity(RCCar.Driver)
			elseif not NetworkHasControlOfEntity(RCCar.Entity) then
				NetworkRequestControlOfEntity(RCCar.Entity)
			end
		else
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 6, 2500)
		end
	end
end

RCCar.MustRagdoll = function()
	local x = GetEntityRotation(RCCar.Entity, 0).x
	if ((-60.0 < x and x > 60.0)) and IsEntityInAir(RCCar.Entity) and RCCar.Speed < 5.0 then
		return true
	end

	if (HasEntityCollidedWithAnything(PlayerPedId()) and RCCar.Speed > 5.0) then return true end
	if IsPedDeadOrDying(player, false) then return true end
	return false
end

RCCar.HandleKeys = function()
	if Attached then
		local overSpeed = (GetEntitySpeed(RCCar.Entity)*3.6) > Config.MaxSpeedKmh

		TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 1, 1)

		Citizen.CreateThread(function()
			player = PlayerPedId()
			Citizen.Wait(0)
			SetEntityInvincible(RCCar.Entity, true)
			StopCurrentPlayingAmbientSpeech(RCCar.Driver)	
			if Attached then
				RCCar.Speed = GetEntitySpeed(RCCar.Entity) * 3.6

				if RCCar.MustRagdoll() then
					RCCar.AttachPlayer(false)
					SetPedToRagdoll(player, 5000, 4000, 0, true, true, false)
					Attached = false
				end
			end

		end)

		if IsControlJustReleased(0, 113) then
			RCCar.AttachPlayer(false)
		end

		if IsControlPressed(0, 172) and not IsControlPressed(0, 173) and not overSpeed then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 9, 1)
		end

		if IsControlPressed(0, 22) and Attached then
			if not IsEntityInAir(RCCar.Entity) then	
				local vel = GetEntityVelocity(RCCar.Entity)
				TaskPlayAnim(PlayerPedId(), "move_crouch_proto", "idle_intro", 5.0, 8.0, -1, 0, 0.0, false, false, false)
				local duration = 0
				local boost = 0
				while IsControlPressed(0, 22) do
					Citizen.Wait(10)
					duration += 10.0
				end
				boost = Config.maxJumpHeigh * duration / 250.0
				if boost > Config.maxJumpHeigh then boost = Config.maxJumpHeigh end
				StopAnimTask(PlayerPedId(), "move_crouch_proto", "idle_intro", 1.0)
				if(Attached) then
					SetEntityVelocity(RCCar.Entity, vel.x, vel.y, vel.z + boost)
					TaskPlayAnim(player, "move_strafe@stealth", "idle", 8.0, 2.0, -1, 1, 1.0, false, false, false)
				end
			end
		end

		if overSpeed then return end

		if IsControlJustReleased(0, 32) or IsControlJustReleased(0, 33) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 6, 2500)
		end

		if IsControlPressed(0, 33) and not IsControlPressed(0, 32) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 22, 1)
		end

		if IsControlPressed(0, 32) and not IsControlPressed(0, 33) and not IsControlPressed(0, 34) and not IsControlPressed(0, 35) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 9, 1)
		end

		if IsControlPressed(0, 34) and IsControlPressed(0, 33) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 13, 1)
		end

		if IsControlPressed(0, 35) and IsControlPressed(0, 33) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 14, 1)
		end

		if IsControlPressed(0, 32) and IsControlPressed(0, 33) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 30, 100)
		end

		if IsControlPressed(0, 34) and IsControlPressed(0, 32) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 7, 1)
		end

		if IsControlPressed(0, 35) and IsControlPressed(0, 32) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 8, 1)
		end

		if IsControlPressed(0, 34) and not IsControlPressed(0, 32) and not IsControlPressed(0, 33) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 4, 1)
		end

		if IsControlPressed(0, 35) and not IsControlPressed(0, 32) and not IsControlPressed(0, 33) then
			TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 5, 1)
		end
	end
end

RCCar.Spawn = function()
	-- models to load
	RCCar.LoadModels({ GetHashKey("rcbandito"), 68070371, GetHashKey("p_defilied_ragdoll_01_s"), "pickup_object", "move_strafe@stealth", "move_crouch_proto"})

	local spawnCoords, spawnHeading = GetEntityCoords(PlayerPedId(), false) + GetEntityForwardVector(PlayerPedId()) * 2.0, GetEntityHeading(PlayerPedId())

	RCCar.Entity = CreateVehicle(GetHashKey("rcbandito"), spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnHeading, true, false)
	RCCar.Skate = CreateObject(GetHashKey("p_defilied_ragdoll_01_s"), 0.0, 0.0, 0.0, true, true, true)

	while not DoesEntityExist(RCCar.Entity) do
		Citizen.Wait(0)
	end

	while not DoesEntityExist(RCCar.Skate) do
		Citizen.Wait(0)
	end

	SetEntityNoCollisionEntity(RCCar.Entity, player, false) -- disable collision between the player and the rc
	SetEntityCollision(RCCar.Entity, false, true)
	SetEntityVisible(RCCar.Entity, false, false)
	AttachEntityToEntity(RCCar.Skate, RCCar.Entity, GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, -0.175, 0.0, 0.0, 90.0, false, true, true, true, 1, true)

	RCCar.Driver = CreatePed(12	, 68070371, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnHeading, true, true)

	-- Driver properties
	SetEnableHandcuffs(RCCar.Driver, true)
	SetEntityInvincible(RCCar.Driver, true)
	SetEntityVisible(RCCar.Driver, false, false)
	FreezeEntityPosition(RCCar.Driver, true)
	TaskWarpPedIntoVehicle(RCCar.Driver, RCCar.Entity, -1)

	while not IsPedInVehicle(RCCar.Driver, RCCar.Entity, false) do
		Citizen.Wait(0)
	end

	RCCar.Attach("place")
end


RCCar.Attach = function(param)
	if not DoesEntityExist(RCCar.Entity) then
		return
	end

	if param == "place" then
		-- Place longboard
		AttachEntityToEntity(RCCar.Entity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), -0.1, 0.0, -0.2, 70.0, 0.0, 270.0, true, true, false, false, 2, true)

		TaskPlayAnim(PlayerPedId(), "pickup_object", "pickup_low", 8.0, -8.0, -1, 0, 0.0, false, false, false)

		Citizen.Wait(800)

		DetachEntity(RCCar.Entity, false, true)

		PlaceObjectOnGroundProperly(RCCar.Entity)
	elseif param == "pick" then
		-- Pick longboard
		Citizen.Wait(100)

		TaskPlayAnim(PlayerPedId(), "pickup_object", "pickup_low", 8.0, -8.0, -1, 0, 0.0, false, false, false)

		Citizen.Wait(600)

		AttachEntityToEntity(RCCar.Entity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), -0.1, 0.0, -0.2, 70.0, 0.0, 270.0, true, true, false, false, 2, true)

		Citizen.Wait(900)

		RCCar.Clear()

	end

end

RCCar.Clear = function(models)
	DetachEntity(RCCar.Entity, true, false)
	DeleteEntity(RCCar.Skate)
	DeleteVehicle(RCCar.Entity)
	DeleteEntity(RCCar.Driver)

	RCCar.UnloadModels()
	Attach = false
	Attached  = false
	SetPedRagdollOnCollision(player, false)
end


RCCar.LoadModels = function(models)
	for modelIndex = 1, #models do
		local model = models[modelIndex]

		if not RCCar.CachedModels then
			RCCar.CachedModels = {}
		end

		table.insert(RCCar.CachedModels, model)

		if IsModelValid(model) then
			while not HasModelLoaded(model) do
				RequestModel(model)
				Citizen.Wait(50)
			end
		else
			while not HasAnimDictLoaded(model) do
				RequestAnimDict(model)
				Citizen.Wait(50)
			end
		end
	end
end

RCCar.UnloadModels = function()
	for modelIndex = 1, #RCCar.CachedModels do
		local model = RCCar.CachedModels[modelIndex]

		if IsModelValid(model) then
			SetModelAsNoLongerNeeded(model)
		else
			RemoveAnimDict(model)
		end
	end
end

RCCar.AttachPlayer = function(toggle)
	player = PlayerPedId()

	if toggle then
		TaskPlayAnim(player, "move_strafe@stealth", "idle", 8.0, 8.0, -1, 1, 1.0, false, false, false)
		AttachEntityToEntity(player, RCCar.Entity, 20, 0.0, 0.0, 0.95, 0.0, 0.0, -15.0, true, true, false, true, 1, true)
		SetEntityCollision(player, true, true)
		SetPedRagdollOnCollision(player, true)
		exports.SidGamemode:AddInstructional("Avancer/Reculer", 30)
		exports.SidGamemode:AddInstructional("Gauche/Droite", 31)
		exports.SidGamemode:AddInstructional("Descendre", 113)
		exports.SidGamemode:AddInstructional("Sauter", 22)
	elseif not toggle then
		DetachEntity(player, false, false)
		SetPedRagdollOnCollision(player, false)
		StopAnimTask(player, "move_strafe@stealth", "idle", 1.0)
		StopAnimTask(PlayerPedId(), "move_crouch_proto", "idle_intro", 1.0)
		TaskVehicleTempAction(RCCar.Driver, RCCar.Entity, 3, 1)
		exports.SidGamemode:DeleteInstructional(30)
		exports.SidGamemode:DeleteInstructional(31)
		exports.SidGamemode:DeleteInstructional(113)
		exports.SidGamemode:DeleteInstructional(22)
	end

	Attached = toggle
end

exports("IsASkate", function(entity)
	return entity == RCCar.Entity
end)

exports("UseSkate", function()
	if not IsPedRagdoll(PlayerPedId()) then
		Citizen.Wait(200)
		RCCar.AttachPlayer(true)

	end
end)

exports("PickupSkate", function()
	RCCar.Attach("pick")
end)

exports("PlaceSkate", function()
	Citizen.CreateThread(RCCar.Start)
end)
