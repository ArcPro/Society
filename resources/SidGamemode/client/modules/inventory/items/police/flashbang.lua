ClientModules = ClientModules or {}
ClientModules.Weapons = ClientModules.Weapons or {}
ClientModules.Weapons.Flashbang = {}
ClientModules.Weapons.Flashbang.Initialized = false
ClientModules.Weapons.Flashbang.Effects = {
	{
		between = {0, 1},
		camShaking = "LARGE_EXPLOSION_SHAKE",
		camShakingIntensity =3.0,
		screenTimeEffect = 5000.0,
		ragdollChance = 0.9999,
	},
	{
		between = {1, 2},
		camShaking = "LARGE_EXPLOSION_SHAKE",
		camShakingIntensity =2.0,
		screenTimeEffect = 5000.0,
		ragdollChance = 0.95,
	},
	{
		between = {2, 3},
		camShaking = "MEDIUM_EXPLOSION_SHAKE",
		camShakingIntensity =1.5,
		screenTimeEffect = 5000.0,
		ragdollChance = 0.8,
	},
	{
		between = {3, 4},
		camShaking = "MEDIUM_EXPLOSION_SHAKE",
		camShakingIntensity =1.25,
		screenTimeEffect = 5000.0,
		ragdollChance = 0.6,
	},
	{
		between = {4, 5},
		camShaking = "MEDIUM_EXPLOSION_SHAKE",
		camShakingIntensity =1.0,
		screenTimeEffect = 4500.0,
		ragdollChance = 0.4,
	},
	{
		between = {5, 6},
		camShaking = "SMALL_EXPLOSION_SHAKE",
		camShakingIntensity =1.5,
		screenTimeEffect = 4000.0,
		ragdollChance = 0.2,
	},
	{
		between = {6, 7},
		camShaking = "SMALL_EXPLOSION_SHAKE",
		camShakingIntensity =1.25,
		screenTimeEffect = 3500.0,
		ragdollChance = 0.1,
	},
	{
		between = {7, 8.5},
		camShaking = "SMALL_EXPLOSION_SHAKE",
		camShakingIntensity =1.0,
		screenTimeEffect = 3500.0,
		ragdollChance = 0.05,
	},
	{
		between = {8.5, 10},
		camShaking = "SMALL_EXPLOSION_SHAKE",
		camShakingIntensity =0.75,
		screenTimeEffect = 3000.0,
		ragdollChance = 0.02,
	},
	{
		between = {0, 12.5},
		camShaking = "SMALL_EXPLOSION_SHAKE",
		camShakingIntensity =0.5,
		screenTimeEffect = 3000.0,
		ragdollChance = 0.01,
	},
}

function ClientModules.Weapons.Flashbang:IsExposed(coords)
	local playerPos = GetPedBoneCoords(PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 25260), 0.0, 0.0, 0.0)
	local handle = StartExpensiveSynchronousShapeTestLosProbe(playerPos.x, playerPos.y, playerPos.z, coords.x, coords.y, coords.z, 19, PlayerPedId(), 0)

	local retval, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(handle)

	if retval == 0 then
		return error("CheckIfIsExposedToFlashBang: Something went wrong with the raycast")
	end

	return hit == false
end

function ClientModules.Weapons.Flashbang:GetEffectIntensity(distance)
	-- Gradually decrease the chance of the player falling based on the distance
	for _, effect in pairs(self.Effects) do
		if distance >= effect.between[1] and distance < effect.between[2] then
			return effect
		end
	end

	return error("GetEffectIntensity: No effect found for the distance", 1)
end

function ClientModules.Weapons.Flashbang:Explode(coords, thrower)
	local distance = Math.Distance(player:position(), coords)
	-- Check if the player is close enough to the flashbang
	if distance > 200.0 then return end

	-- Load the particle effect to simulate the flash (even though a flashbang is more a sound effect, it's a game so we need to simulate it visually too)
	Utils.Streaming.RequestNamedPtfxAsset("core")
	UseParticleFxAsset("core")
	StartParticleFxLoopedAtCoord("ent_anim_paparazzi_flash", coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 25.0, false, false, false, false)

	if thrower == player:source() then
		-- Invisible explosion to have the sound, but only by the thrower because explosion is networked
		AddExplosion(coords.x, coords.y, coords.z, 25, 0.0, true, true, 1.0)
	end

	if distance < 12.5 and self:IsExposed(coords) then
		-- Make the screen shake based on the distance to the flashbang
		local effect = self:GetEffectIntensity(distance)

		if effect == nil then return end

		ShakeGameplayCam(effect.camShaking, effect.camShakingIntensity)

		-- While developing this, sometimes functions seemed to "disappear" so adding extra security
		if AnimpostfxPlay ~= nil then
			AnimpostfxPlay("Dont_tazeme_bro", 0, true)
		elseif StartScreenEffect ~= nil then
			AnimpostfxPlay("Dont_tazeme_bro", 0, true)
		else
			error("No screen effect function found", 2)
		end

		Citizen.Wait(250)

		if effect.ragdollChance > 0.0 and math.random() < effect.ragdollChance then
			Events.Trigger("ragdoll")
		end

		Citizen.Wait(effect.screenTimeEffect)
		AnimpostfxStop("Dont_tazeme_bro")
	end
end

function ClientModules.Weapons.Flashbang:RegisterEvents()
	Events.Register("flashbang:explode", function(_, coords, thrower)
		self:Explode(coords, thrower)
	end)
end

function ClientModules.Weapons.Flashbang:Thread()
	Citizen.CreateThread(function()
		local ped, flashbangWeaponHash, flashbangObjectHash = PlayerPedId(), GetHashKey("WEAPON_FLASHBANG"), GetHashKey("w_ex_flashbang")

		while true do
			if GetSelectedPedWeapon(ped) == flashbangWeaponHash and IsPedShooting(ped) then
				local flashBangObject = GetClosestObjectOfType(player:position().x, player:position().y, player:position().z, 10.0, flashbangObjectHash, false, false, false)

				Citizen.Wait(2500)

				if DoesEntityExist(flashBangObject) then
					Events.TriggerServer("flashbang:explode", GetEntityCoords(flashBangObject, false))
				else
					error("Flashbang object doesn't exist anymore, something went wrong with the thread.", 1)
				end
			end

			ped = PlayerPedId()
			Citizen.Wait(0)
		end
	end)
end

function ClientModules.Weapons.Flashbang:Initialize()
	if self.Initialized == true then return end

	self:RegisterEvents()
	self:Thread()

	self.Initialized = true
end

Core.Player:OnLoad(function ()
	ClientModules.Weapons.Flashbang:Initialize()
end)
