local pedInSameVehicleLast=false
local vehicle, lastVehicle, vehicleClass, vehicleModel
local fCollisionDamageMult = 0.0
local fDeformationDamageMult = 0.0
local fEngineDamageMult = 0.0
local fBrakeForce = 1.0

local healthEngineLast = 1000.0
local healthEngineCurrent = 1000.0
local healthEngineNew = 1000.0
local healthEngineDelta = 0.0
local healthEngineDeltaScaled = 0.0

local healthBodyLast = 1000.0
local healthBodyCurrent = 1000.0
local healthBodyNew = 1000.0
local healthBodyDelta = 0.0
local healthBodyDeltaScaled = 0.0

local healthPetrolTankLast = 1000.0
local healthPetrolTankCurrent = 1000.0
local healthPetrolTankNew = 1000.0
local healthPetrolTankDelta = 0.0
local healthPetrolTankDeltaScaled = 0.0

math.randomseed(GetGameTimer());

local function isPedDrivingAVehicle()
	local ped = PlayerPedId()
	vehicle = GetVehiclePedIsIn(ped, false)
	if IsPedInAnyVehicle(ped, false) then
		if GetPedInVehicleSeat(vehicle, -1) == ped then
			local class = GetVehicleClass(vehicle)

			if class ~= 15 and class ~= 16 and class ~=21 and class ~=13 then
				return true
			end
		end
	end
	return false
end

local function multiplyTorque()
	local factor = 1.0
	if Config.VehicleFailure.torqueMultiplierEnabled and healthEngineNew < 900 then
		factor = (healthEngineNew+200.0) / 1100
	end
	SetVehicleCheatPowerIncrease(vehicle, factor)
end

local function disableAirControl()
	local roll = GetEntityRoll(vehicle)

	if (
		((roll > 75.0 or roll < -75.0) and GetEntitySpeed(vehicle) < 2)
		or (not IsThisModelABoat(vehicleModel) and not IsThisModelAHeli(vehicleModel) and not IsThisModelAPlane(vehicleModel) and not IsThisModelABike(vehicleModel) and not IsThisModelABicycle(vehicleModel) and IsEntityInAir(vehicle))
	) then
		DisableControlAction(0, 59, true) -- Disable left/right
		DisableControlAction(0, 60, true) -- Disable up/down
	end
end

if Config.VehicleFailure.torqueMultiplierEnabled or Config.VehicleFailure.disableAirControl then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)

			if Config.VehicleFailure.torqueMultiplierEnabled and pedInSameVehicleLast then
				multiplyTorque()
			end

			if Config.VehicleFailure.disableAirControl then
				disableAirControl()
			end
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(50)
		local ped = PlayerPedId()
		if isPedDrivingAVehicle() then
			vehicle = GetVehiclePedIsIn(ped, false)
			vehicleClass = GetVehicleClass(vehicle)
			vehicleModel = GetEntityModel(vehicle)
			healthEngineCurrent = GetVehicleEngineHealth(vehicle)

			if healthEngineCurrent == 1000 then
				healthEngineLast = 1000.0
			end

			healthEngineNew = healthEngineCurrent
			healthEngineDelta = healthEngineLast - healthEngineCurrent
			healthEngineDeltaScaled = healthEngineDelta * Config.VehicleFailure.damageFactorEngine * Config.VehicleFailure.classDamageMultiplier[vehicleClass]

			healthBodyCurrent = GetVehicleBodyHealth(vehicle)
			if healthBodyCurrent == 1000 then
				healthBodyLast = 1000.0
			end

			healthBodyNew = healthBodyCurrent
			healthBodyDelta = healthBodyLast - healthBodyCurrent
			healthBodyDeltaScaled = healthBodyDelta * Config.VehicleFailure.damageFactorBody * Config.VehicleFailure.classDamageMultiplier[vehicleClass]

			healthPetrolTankCurrent = GetVehiclePetrolTankHealth(vehicle)

			if healthPetrolTankCurrent == 1000 then
				healthPetrolTankLast = 1000.0
			end

			healthPetrolTankNew = healthPetrolTankCurrent
			healthPetrolTankDelta = healthPetrolTankLast-healthPetrolTankCurrent
			healthPetrolTankDeltaScaled = healthPetrolTankDelta * Config.VehicleFailure.damageFactorPetrolTank * Config.VehicleFailure.classDamageMultiplier[vehicleClass]

			if healthEngineCurrent > Config.VehicleFailure.engineSafeGuard+1 then
				SetVehicleUndriveable(vehicle,false)
			end

			if healthEngineCurrent <= Config.VehicleFailure.engineSafeGuard + 1 then
				SetVehicleUndriveable(vehicle,true)
			end

			-- If ped spawned a new vehicle while in a vehicle or teleported from one vehicle to another, handle as if we just entered the car
			if vehicle ~= lastVehicle then
				pedInSameVehicleLast = false
			end

			if pedInSameVehicleLast == true then
				-- Damage happened while in the car = can be multiplied

				-- Only do calculations if any damage is present on the car. Prevents weird behavior when fixing using trainer or other script
				if healthEngineCurrent ~= 1000.0 or healthBodyCurrent ~= 1000.0 or healthPetrolTankCurrent ~= 1000.0 then

					-- Combine the delta values (Get the largest of the three)
					local healthEngineCombinedDelta = math.max(healthEngineDeltaScaled, healthBodyDeltaScaled, healthPetrolTankDeltaScaled)

					-- If huge damage, scale back a bit
					if healthEngineCombinedDelta > (healthEngineCurrent - Config.VehicleFailure.engineSafeGuard) then
						healthEngineCombinedDelta *= 0.7
					end

					-- If complete damage, but not catastrophic (ie. explosion territory) pull back a bit, to give a couple of seconds og engine runtime before dying
					if healthEngineCombinedDelta > healthEngineCurrent then
						healthEngineCombinedDelta = healthEngineCurrent - (Config.VehicleFailure.cascadingFailureThreshold / 5)
					end

					------- Calculate new value

					healthEngineNew = healthEngineLast - healthEngineCombinedDelta

					------- Sanity Check on new values and further manipulations

					-- If somewhat damaged, slowly degrade until slightly before cascading failure sets in, then stop

					if healthEngineNew > (Config.VehicleFailure.cascadingFailureThreshold + 5) and healthEngineNew < Config.VehicleFailure.degradingFailureThreshold then
						healthEngineNew -= 0.038 * Config.VehicleFailure.degradingHealthSpeedFactor
					end

					-- If Damage is near catastrophic, cascade the failure
					if healthEngineNew < Config.VehicleFailure.cascadingFailureThreshold then
						healthEngineNew -= 0.1 * Config.VehicleFailure.cascadingFailureSpeedFactor
					end

					-- Prevent Engine going to or below zero. Ensures you can reenter a damaged car.
					if healthEngineNew < Config.VehicleFailure.engineSafeGuard then
						healthEngineNew = Config.VehicleFailure.engineSafeGuard
					end

					-- Prevent Explosions
					if healthPetrolTankCurrent < 750 then
						healthPetrolTankNew = 750.0
					end

					-- Prevent negative body damage.
					if healthBodyNew < 0  then
						healthBodyNew = 0.0
					end
				end
			else
				-- Just got in the vehicle. Damage can not be multiplied this round
				-- Set vehicle handling data
				fDeformationDamageMult = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDeformationDamageMult')
				fBrakeForce = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce')
				local newFDeformationDamageMult = (fDeformationDamageMult ^ Config.VehicleFailure.deformationExponent)	-- Pull the handling file value closer to 1

				if Config.VehicleFailure.deformationMultiplier ~= -1 then
					SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDeformationDamageMult', newFDeformationDamageMult * Config.VehicleFailure.deformationMultiplier)
				end

				if Config.VehicleFailure.weaponsDamageMultiplier ~= -1 then
					SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fWeaponDamageMult', Config.VehicleFailure.weaponsDamageMultiplier/Config.VehicleFailure.damageFactorBody)
				end

				-- Get the CollisionDamageMultiplier
				fCollisionDamageMult = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fCollisionDamageMult')

				-- Modify it by pulling all number a towards 1.0
				local newFCollisionDamageMultiplier = fCollisionDamageMult ^ Config.VehicleFailure.collisionDamageExponent	-- Pull the handling file value closer to 1
				SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fCollisionDamageMult', newFCollisionDamageMultiplier)

				-- Get the EngineDamageMultiplier
				fEngineDamageMult = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fEngineDamageMult')

				-- Modify it by pulling all number a towards 1.0
				local newFEngineDamageMult = (fEngineDamageMult ^ Config.VehicleFailure.engineDamageExponent)	-- Pull the handling file value closer to 1
				SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fEngineDamageMult', newFEngineDamageMult)

				-- If body damage catastrophic, reset somewhat so we can get new damage to multiply
				if healthBodyCurrent < Config.VehicleFailure.cascadingFailureThreshold then
					healthBodyNew = Config.VehicleFailure.cascadingFailureThreshold
				end

				pedInSameVehicleLast = true
			end

			-- set the actual new values
			if healthEngineNew ~= healthEngineCurrent then
				SetVehicleEngineHealth(vehicle, healthEngineNew)
			end

			if healthBodyNew ~= healthBodyCurrent then
				SetVehicleBodyHealth(vehicle, healthBodyNew)
			end

			if healthPetrolTankNew ~= healthPetrolTankCurrent then
				SetVehiclePetrolTankHealth(vehicle, healthPetrolTankNew)
			end

			-- Store current values, so we can calculate delta next time around
			healthEngineLast = healthEngineNew
			healthBodyLast = healthBodyNew
			healthPetrolTankLast = healthPetrolTankNew
			lastVehicle=vehicle
		else
			if pedInSameVehicleLast == true then

				-- We just got out of the vehicle
				lastVehicle = GetVehiclePedIsIn(ped, true)
				if Config.VehicleFailure.deformationMultiplier ~= -1 then
					SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fDeformationDamageMult', fDeformationDamageMult)
				end

				SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fBrakeForce', fBrakeForce)

				if Config.VehicleFailure.weaponsDamageMultiplier ~= -1 then
					SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fWeaponDamageMult', Config.VehicleFailure.weaponsDamageMultiplier)
				end

				SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fCollisionDamageMult', fCollisionDamageMult) -- Restore the original CollisionDamageMultiplier
				SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fEngineDamageMult', fEngineDamageMult) -- Restore the original EngineDamageMultiplier
			end

			pedInSameVehicleLast = false
		end
	end
end)
