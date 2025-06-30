Core = Core or {}
Core.Death = {}
Core.Death.Initialized = false
Core.Death.KOWeapons = {
	-1569615261,
    -1600701090,
    126349499,
    4194021054,
    -100946242,
    -1600701090,
    2694266206,
    -37975472,
    539292904,
    0
}

function Core.Death:SetPlayerDead()
	if player:dead() == false then
		player:dead(true)
	end

    local ped = PlayerPedId()
    local cause = GetPedCauseOfDeath(ped)
	local killer = GetPedSourceOfDeath(ped)
	local time = (SharedModules.Variables:Get("global", "respawn_time") or 600) * 1000
	local deathTick = GetGameTimer()
	local log = {
		["Raison"] = Lists.DeathMessages[Lists.DeathCauses[cause]] or "Inconnu",
	}

	if GetDutyCount("sams") == 0 and GetDutyCount("lsfd") == 0 then
		time /= 2
	end

    Citizen.CreateThread(function()
        Events.TriggerExternal("lb-phone:OnDeath")

		if DoesEntityExist(killer) and IsEntityAPed(killer) and IsPedAPlayer(killer) then
			log["Joueur qui l'a tué"] = ("<@%s>"):format(Callbacks.Trigger("player:getDiscord", GetPlayerServerId(NetworkGetPlayerIndexFromPed(killer))))
		end

		SharedModules.Log:Create(player:source(), "player", "die", log)

        UI:Toggle('deathscreen', true, {
            reason = Lists.DeathMessages[Lists.DeathCauses[cause]] or "un événement inconnu",
			time = math.floor(((deathTick + time) - GetGameTimer()) / 1000),
			timestamp = Date
        }, true, false)

		SetPedDiesInWater(ped, false)

        while player:health() <= 0 do
            SetPedToRagdoll(ped, 1000, 1000, 0, false, false, false)
            DisableAllControlActions(0)
			ResetPedRagdollTimer(ped)
            Citizen.Wait(0)
        end

        UI:Toggle('deathscreen', false, {}, false, false)
    end)
end

function Core.Death:SetPlayerKo()
	if player:ko() == false then
		player:ko(true)
	end

	local ko_time = SharedModules.Variables:Get("global", "ko_time")
    local ped = PlayerPedId()

	UI:AddNotification("basic", "Vous êtes KO.", "info", 5000)

    Citizen.CreateThread(function()
		SetEntityInvincible(ped, true)
		player:health(20)

		Citizen.SetTimeout(ko_time - 500, function()
			player:ko(false)
		end)

		SetPedToRagdoll(ped, ko_time, ko_time, 0, false, false, false)

        while player:ko() == true do
            DisableAllControlActions(0)
            Citizen.Wait(0)
        end

		local pos = GetEntityCoords(ped, true)
		NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z, GetEntityHeading(ped), 0, false)
		SetPedToRagdoll(ped, 1000, 0, 0, false, false, false)
		Citizen.Wait(500)
		player:health(20)

		ResetPedRagdollTimer(ped)
		SetEntityInvincible(ped, false)

    end)
end

function Core.Death:BringBackToSurface()
	local ped = PlayerPedId()
	local pos = GetEntityCoords(ped, true)
	local retval, ground = GetGroundZFor_3dCoord(pos.x, pos.y, pos.z, false)

	pos = vector3(pos.x, pos.y, retval and ground - 1.5 or pos.z)
	SetEntityCoords(ped, pos.x, pos.y, pos.z, false, false, false, false)
end

function Core.Death:Init()
	if self.Initialized == true then return end

	Events.Register("player:revive", function(_, hp)
		local ped = PlayerPedId()

		if IsEntityInWater(ped) then
			self:BringBackToSurface()
		end

		player:health(hp or 20)

		if player:hunger() < 25 then
			player:hunger(25)
		end

		if player:thirst() < 25 then
			player:thirst(25)
		end

		local pos = GetEntityCoords(ped, true)
		NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z, GetEntityHeading(ped), 0, false)

		ClearPedTasksImmediately(ped)
		SetPedDiesInWater(ped, true)
		ClearPedBloodDamage(ped)

		player:dead(false)
		player:ko(false)
	end)

	Citizen.CreateThread(function()
		while GameEvents == nil do
			Citizen.Wait(100)
		end

		GameEvents.OnPlayerDamage(function(args)
			local victimEntity, attackEntity, x1, x2, x3, fatalBool, weaponUsed, x4, x5, x6, x7, x8, entityType = table.unpack(args)
			local ped = PlayerPedId()

			player:armor(GetPedArmour(ped))
			player:health(GetEntityHealth(ped) - 100)

			UI:SendMessage("hud:update", {
				armor = player:armor(),
				health = player:health(),
			})

			if player:health() <= 0 then
				if not player:dead() and not player:ko() then
					if weaponUsed == 0 or Lists.DeathCauses[weaponUsed] == "melee" then
						player:ko(true)
						self:SetPlayerKo()
					else
						player:dead(true)
						self:SetPlayerDead()
					end
				end
			end
		end)
	end)

	UI:RegisterCallback("hud:callEmergency", function(data, cb)
		Events.TriggerServer(
			"dispatch:add",
			"lsfd",
			GetStreetNameFromHashKey(GetStreetNameAtCoord(player:position().x, player:position().y, player:position().z)),
			"Individu inconscient"
		)
		cb(true)
	end)

	UI:RegisterCallback("hud:respawn", function(data, cb)
		Events.Trigger("player:revive")
		cb(true)
	end)

	self.Initialized = true
end

Core.Player:OnLoad(function()
    Core.Death:Init()
end)
