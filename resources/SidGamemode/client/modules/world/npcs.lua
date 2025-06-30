Citizen.CreateThread(function()
    for _, v in pairs(GetGamePool('CPed')) do
        SetPedDropsWeaponsWhenDead(v, false)
    end
end)

AddEventHandler('populationPedCreating', function(x, y, z)
    Citizen.Wait(500)
    local _, handle = GetClosestPed(x, y, z, 1.0, false, false, false, false, 0)
    SetPedDropsWeaponsWhenDead(handle, false)
end)

Citizen.CreateThread(function()
    while true do
        SetScenarioPedDensityMultiplierThisFrame(GlobalState["npc_density"], GlobalState["npc_density"])
        SetPedDensityMultiplierThisFrame(GlobalState["npc_density"])

        SetRandomVehicleDensityMultiplierThisFrame(GlobalState["traffic_density"])
        SetParkedVehicleDensityMultiplierThisFrame(GlobalState["traffic_density"])
		SetAmbientVehicleRangeMultiplierThisFrame(GlobalState["traffic_density"])
        SetVehicleDensityMultiplierThisFrame(GlobalState["traffic_density"])

		DisablePlayerVehicleRewards(PlayerId())

        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    local SCENARIO_GROUPS = {
		2017590552, -- LSIA planes
		2141866469, -- Sandy Shores planes
		1409640232, -- Grapeseed planes
		"E_Hollywood_39_Bikers",
		"E_Hollywood_39_Cops",
		"E_Hollywood_39_Hookers",
		"E_Hollywood_39_Vagos",
		"Observatory_Bikers",
		"OceanHighway_15_Bikers",
		"OceanHighway_15_Cops",
		"OceanHighway_15_Hookers",
		"OceanHighway_15_Vagos",
		"Cinema_Downtown",
		"Cinema_Morningwood",
		"Cinema_Textile",
		"ng_planes" -- Far up in the skies jets
    }

    local SCENARIO_TYPES = {
		"WORLD_VEHICLE_MILITARY_PLANES_SMALL", -- Zancudo Small Planes
		"WORLD_VEHICLE_MILITARY_PLANES_BIG" -- Zancudo Big Planes
    }

    while true do
		for _, sctyp in next, SCENARIO_TYPES do
			SetScenarioTypeEnabled(sctyp, false)
		end

		for _, scgrp in next, SCENARIO_GROUPS do
			SetScenarioGroupEnabled(scgrp, false)
		end
		Citizen.Wait(10000)
    end
end)

Citizen.CreateThread(function()
    local clearAreaOfPedsArray = {
		{ pos = vector3(-1084.15, -821.88, 5.48), radius = 60.0 },
		{ pos = vector3(326.78, -583.25, 43.4), radius = 50.0 },
		{ pos = vector3(-556.62, 285.77, 82.18), radius = 25.0 },
		{ pos = vector3(338.99, 287.44, 99.80), radius = 25.0 },
		{ pos = vector3(-1572.96, -261.3, 48.48), radius = 50.0 },
		{ pos = vector3(-580.09, -932.8, 23.68), radius = 25.0 },
		{ pos = vector3(-1070.56, -245.15, 40.35), radius = 25.0 },
		{ pos = vector3(-559.68, -199.2, 39.34), radius = 25.0 },
		{ pos = vector3(245.51, -1093.77, 30.21), radius = 25.0 },
		{ pos = vector3(117.96, -1287.3, 28.27), radius = 50.0 },
		{ pos = vector3(322.58, 181.54, 103.59), radius = 6.0 },
		{ pos = vector3(248.62, 220.36, 106.29), radius = 15.0 },
		{ pos = vector3(-1427.299, -245.1012, 16.8039), radius = 20.0 }
    }

	while true do

		while player == nil do
			Citizen.Wait(100)
		end

		Citizen.Wait(1000)
		local playerPosition = player:position()

		ClearAreaOfCops(playerPosition.x, playerPosition.y, playerPosition.z, 500.0, false)

		for key, value in pairs(clearAreaOfPedsArray) do
			if (Math.Distance(playerPosition, value.pos) < 200.0) then
				ClearAreaOfPeds(value.pos.x, value.pos.y, value.pos.z, value.radius, 1)
			end
		end

		SetPedCanLosePropsOnDamage(PlayerPedId(), false, 0)
	end
end)

local disabledPickups = {
    `PICKUP_WEAPON_ADVANCEDRIFLE`,
    `PICKUP_WEAPON_APPISTOL`,
    `PICKUP_WEAPON_ASSAULTRIFLE`,
    `PICKUP_WEAPON_ASSAULTRIFLE_MK2`,
    `PICKUP_WEAPON_ASSAULTSHOTGUN`,
    `PICKUP_WEAPON_ASSAULTSMG`,
    `PICKUP_WEAPON_AUTOSHOTGUN`,
    `PICKUP_WEAPON_BAT`,
    `PICKUP_WEAPON_BATTLEAXE`,
    `PICKUP_WEAPON_BOTTLE`,
    `PICKUP_WEAPON_BULLPUPRIFLE`,
    `PICKUP_WEAPON_BULLPUPRIFLE_MK2`,
    `PICKUP_WEAPON_BULLPUPSHOTGUN`,
    `PICKUP_WEAPON_CARBINERIFLE`,
    `PICKUP_WEAPON_CARBINERIFLE_MK2`,
    `PICKUP_WEAPON_COMBATMG`,
    `PICKUP_WEAPON_COMBATMG_MK2`,
    `PICKUP_WEAPON_COMBATPDW`,
    `PICKUP_WEAPON_COMBATPISTOL`,
    `PICKUP_WEAPON_COMPACTLAUNCHER`,
    `PICKUP_WEAPON_COMPACTRIFLE`,
    `PICKUP_WEAPON_CROWBAR`,
    `PICKUP_WEAPON_DAGGER`,
    `PICKUP_WEAPON_DBSHOTGUN`,
    `PICKUP_WEAPON_DOUBLEACTION`,
    `PICKUP_WEAPON_FIREWORK`,
    `PICKUP_WEAPON_FLAREGUN`,
    `PICKUP_WEAPON_FLASHLIGHT`,
    `PICKUP_WEAPON_GRENADE`,
    `PICKUP_WEAPON_GRENADELAUNCHER`,
    `PICKUP_WEAPON_GUSENBERG`,
    `PICKUP_WEAPON_GOLFCLUB`,
    `PICKUP_WEAPON_HAMMER`,
    `PICKUP_WEAPON_HATCHET`,
    `PICKUP_WEAPON_HEAVYPISTOL`,
    `PICKUP_WEAPON_HEAVYSHOTGUN`,
    `PICKUP_WEAPON_HEAVYSNIPER`,
    `PICKUP_WEAPON_HEAVYSNIPER_MK2`,
    `PICKUP_WEAPON_HOMINGLAUNCHER`,
    `PICKUP_WEAPON_KNIFE`,
    `PICKUP_WEAPON_KNUCKLE`,
    `PICKUP_WEAPON_MACHETE`,
    `PICKUP_WEAPON_MACHINEPISTOL`,
    `PICKUP_WEAPON_MARKSMANPISTOL`,
    `PICKUP_WEAPON_MARKSMANRIFLE`,
    `PICKUP_WEAPON_MARKSMANRIFLE_MK2`,
    `PICKUP_WEAPON_MG`,
    `PICKUP_WEAPON_MICROSMG`,
    `PICKUP_WEAPON_MINIGUN`,
    `PICKUP_WEAPON_MINISMG`,
    `PICKUP_WEAPON_MOLOTOV`,
    `PICKUP_WEAPON_MUSKET`,
    `PICKUP_WEAPON_NIGHTSTICK`,
    `PICKUP_WEAPON_PETROLCAN`,
    `PICKUP_WEAPON_PIPEBOMB`,
    `PICKUP_WEAPON_PISTOL`,
    `PICKUP_WEAPON_PISTOL50`,
    `PICKUP_WEAPON_PISTOL_MK2`,
    `PICKUP_WEAPON_POOLCUE`,
    `PICKUP_WEAPON_PROXMINE`,
    `PICKUP_WEAPON_PUMPSHOTGUN`,
    `PICKUP_WEAPON_PUMPSHOTGUN_MK2`,
    `PICKUP_WEAPON_RAILGUN`,
    `PICKUP_WEAPON_RAYCARBINE`,
    `PICKUP_WEAPON_RAYMINIGUN`,
    `PICKUP_WEAPON_RAYPISTOL`,
    `PICKUP_WEAPON_REVOLVER`,
    `PICKUP_WEAPON_REVOLVER_MK2`,
    `PICKUP_WEAPON_RPG`,
    `PICKUP_WEAPON_SAWNOFFSHOTGUN`,
    `PICKUP_WEAPON_SMG`,
    `PICKUP_WEAPON_SMG_MK2`,
    `PICKUP_WEAPON_SMOKEGRENADE`,
    `PICKUP_WEAPON_SNIPERRIFLE`,
    `PICKUP_WEAPON_SNSPISTOL`,
    `PICKUP_WEAPON_SNSPISTOL_MK2`,
    `PICKUP_WEAPON_SPECIALCARBINE`,
    `PICKUP_WEAPON_SPECIALCARBINE_MK2`,
    `PICKUP_WEAPON_STICKYBOMB`,
    `PICKUP_WEAPON_STONE_HATCHET`,
    `PICKUP_WEAPON_STUNGUN`,
    `PICKUP_WEAPON_SWITCHBLADE`,
    `PICKUP_WEAPON_VINTAGEPISTOL`,
    `PICKUP_WEAPON_WRENCH`,
	`PICKUP_WEAPON_CERAMICPISTOL`,
	`PICKUP_WEAPON_NAVYREVOLVER`,
	`PICKUP_WEAPON_GADGETPISTOL`,
	`PICKUP_WEAPON_PISTOLXM3`,
	`PICKUP_WEAPON_TECPISTOL`,
	`PICKUP_WEAPON_HEAVYRIFLE`,
	`PICKUP_WEAPON_MILITARYRIFLE`,
	`PICKUP_WEAPON_TACTICALRIFLE`,
	`PICKUP_WEAPON_SWEEPERSHOTGUN`
}

local relationships = {
    `GANG_1`,
    `GANG_2`,
    `GANG_9`,
    `GANG_10`,
    `AMBIENT_GANG_LOST`,
    `AMBIENT_GANG_MEXICAN`,
    `AMBIENT_GANG_FAMILY`,
    `AMBIENT_GANG_BALLAS`,
    `AMBIENT_GANG_MARABUNTE`,
    `AMBIENT_GANG_CULT`,
    `AMBIENT_GANG_SALVA`,
    `AMBIENT_GANG_WEICHENG`,
    `AMBIENT_GANG_HILLBILLY`,
    `DEALER`,
    `COP`,
    `PRIVATE_SECURITY`,
    `SECURITY_GUARD`,
    `ARMY`,
    `MEDIC`,
    `FIREMAN`,
    `HATES_PLAYER`,
    `NO_RELATIONSHIP`,
    `SPECIAL`,
    `MISSION2`,
    `MISSION3`,
    `MISSION4`,
    `MISSION5`,
    `MISSION6`,
    `MISSION7`,
    `MISSION8`
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        for _, group in ipairs(relationships) do
            SetRelationshipBetweenGroups(1, `PLAYER`, group)
            SetRelationshipBetweenGroups(1, group, `PLAYER`)
        end

    end
end)

Citizen.CreateThread(function()
	local aiming, targetPed, pedVehicle = nil, nil, nil

	while true do
		aiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId())

		if aiming and IsPedArmed(PlayerPedId(), 4) then
			pedVehicle = GetVehiclePedIsIn(targetPed, false)

			if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) and IsPedInVehicle(targetPed, pedVehicle, false) then
				if DoesEntityExist(pedVehicle) then
					if Math.Distance(player:position(), GetEntityCoords(targetPed, true)) < 10 then
						ClientModules.Illegal.Carjack:Start(targetPed, pedVehicle)
						Citizen.Wait(2000)
					end
				end
			end
		end

		Citizen.Wait(500)
	end
end)

SetAudioFlag('PoliceScannerDisabled', true)
SetGarbageTrucks(false)
SetCreateRandomCops(false)
SetCreateRandomCopsNotOnScenarios(false)
SetCreateRandomCopsOnScenarios(false)
DistantCopCarSirens(false)

Citizen.CreateThread(function()
    for i = 1, 15 do
		EnableDispatchService(i, false)
	end

	SetMaxWantedLevel(0)

    for i = 1, #disabledPickups do
        ToggleUsePickupsForPlayer(PlayerId(), disabledPickups[i], false)
    end
end)
