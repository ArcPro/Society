local hostage = {
	InProgress = false,
	type = "",
	targetSrc = -1,
	agressor = {
		animDict = "anim@gangops@hostage@",
		anim = "perp_idle",
		flag = 49,
	},
	hostage = {
		animDict = "anim@gangops@hostage@",
		anim = "victim_idle",
		attachX = -0.24,
		attachY = 0.11,
		attachZ = 0.0,
		flag = 49,
	}
}

local function GetClosestPlayer(radius)
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed, true)

    for _,playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed, true)
            local distance = #(targetCoords-playerCoords)
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = playerId
                closestDistance = distance
            end
        end
    end
	if closestDistance ~= -1 and closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

local function ensureAnimDict(animDict)
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)

        while not HasAnimDictLoaded(animDict) do
            Citizen.Wait(0)
        end
    end

    return animDict
end

function callTakeHostage()
    local currentWeapon = GetSelectedPedWeapon(PlayerPedId())
    local group = GetWeapontypeGroup(currentWeapon)
	local canTakeHostage = false

	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)

	if group == GetHashKey("GROUP_PISTOL") then
		canTakeHostage = true
    end

	if not canTakeHostage then
		UI:AddNotification("basic", "~r~Vous ne pouvez pas le prendre en otage~s~", "info", 5000)
	end

	if not hostage.InProgress and canTakeHostage then
		local closestPlayer = GetClosestPlayer(3)
		if closestPlayer then
			local targetSrc = GetPlayerServerId(closestPlayer)
			if targetSrc ~= -1 then
				SetCurrentPedWeapon(PlayerPedId(), foundWeapon, true)
				hostage.InProgress = true
				hostage.targetSrc = targetSrc
				Events.TriggerServer("hostage:sync", targetSrc)
				ensureAnimDict(hostage.agressor.animDict)
				hostage.type = "agressor"
			else
				UI:AddNotification("basic", "~r~Il n'y a personne près de vous~s~", "info", 5000)
			end
		else
			UI:AddNotification("basic", "~r~Il n'y a personne près de vous~s~", "info", 5000)
		end
	end
end

Events.Register("hostage:syncTarget", function(src, target)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	hostage.InProgress = true
	ensureAnimDict(hostage.hostage.animDict)
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, hostage.hostage.attachX, hostage.hostage.attachY, hostage.hostage.attachZ, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
	hostage.type = "hostage"
end)

Events.Register("hostage:releaseHostage", function(src)
	hostage.InProgress = false
	hostage.type = ""
	DetachEntity(PlayerPedId(), true, false)
	ensureAnimDict("reaction@shove")
	TaskPlayAnim(PlayerPedId(), "reaction@shove", "shoved_back", 8.0, -8.0, -1, 0, 0.0, false, false, false)
	Citizen.Wait(250)
	ClearPedSecondaryTask(PlayerPedId())
end)

Events.Register("hostage:killHostage", function(src)
	hostage.InProgress = false
	hostage.type = ""
	SetEntityHealth(PlayerPedId(),0)
	DetachEntity(PlayerPedId(), true, false)
	ensureAnimDict("anim@gangops@hostage@")
	TaskPlayAnim(PlayerPedId(), "anim@gangops@hostage@", "victim_fail", 8.0, -8.0, -1, 168, 0.0, false, false, false)
end)

Events.Register("hostage:cl_stop", function(src)
	hostage.InProgress = false
	hostage.type = ""
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

Citizen.CreateThread(function()
	while true do
		if hostage.type == "agressor" then
			if not IsEntityPlayingAnim(PlayerPedId(), hostage.agressor.animDict, hostage.agressor.anim, 3) then
				TaskPlayAnim(PlayerPedId(), hostage.agressor.animDict, hostage.agressor.anim, 8.0, -8.0, 100000, hostage.agressor.flag, 0.0, false, false, false)
			end
		elseif hostage.type == "hostage" then
			if not IsEntityPlayingAnim(PlayerPedId(), hostage.hostage.animDict, hostage.hostage.anim, 3) then
				TaskPlayAnim(PlayerPedId(), hostage.hostage.animDict, hostage.hostage.anim, 8.0, -8.0, 100000, hostage.hostage.flag, 0.0, false, false, false)
			end
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	local instructionalDisplayed = false

	while true do
		if hostage.type == "agressor" then
			DisableControlAction(0,24,true)
			DisableControlAction(0,25,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,21,true)
			DisablePlayerFiring(PlayerPedId(),true)

			if instructionalDisplayed == false then
				ClientModules.HUD.InstructionalButtons:Add("Tuer", 74)
				ClientModules.HUD.InstructionalButtons:Add("Relâcher", 47)
				instructionalDisplayed = true
			end

			if IsEntityDead(PlayerPedId()) then
				hostage.type = ""
				hostage.InProgress = false
				ensureAnimDict("reaction@shove")
				TaskPlayAnim(PlayerPedId(), "reaction@shove", "shove_var_a", 8.0, -8.0, -1, 168, 0.0, false, false, false)
				Events.TriggerServer("hostage:releaseHostage", hostage.targetSrc)
				ClientModules.HUD.InstructionalButtons:Delete(47)
				ClientModules.HUD.InstructionalButtons:Delete(74)
				instructionalDisplayed = false
			end

			if IsDisabledControlJustPressed(0,47) then
				hostage.type = ""
				hostage.InProgress = false
				ensureAnimDict("reaction@shove")
				TaskPlayAnim(PlayerPedId(), "reaction@shove", "shove_var_a", 8.0, -8.0, -1, 168, 0.0, false, false, false)
				Events.TriggerServer("hostage:releaseHostage", hostage.targetSrc)
				ClientModules.HUD.InstructionalButtons:Delete(47)
				ClientModules.HUD.InstructionalButtons:Delete(74)
				instructionalDisplayed = false
			elseif IsDisabledControlJustPressed(0,74) then
				hostage.type = ""
				hostage.InProgress = false
				ensureAnimDict("anim@gangops@hostage@")
				TaskPlayAnim(PlayerPedId(), "anim@gangops@hostage@", "perp_fail", 8.0, -8.0, -1, 168, 0.0, false, false, false)
				Events.TriggerServer("hostage:killHostage", hostage.targetSrc)
				Events.TriggerServer("hostage:stop",hostage.targetSrc)
				Citizen.Wait(100)
				SetPedShootsAtCoord(PlayerPedId(), 0.0, 0.0, 0.0, true)
				ClientModules.HUD.InstructionalButtons:Delete(47)
				ClientModules.HUD.InstructionalButtons:Delete(74)
				instructionalDisplayed = false
			end
		elseif hostage.type == "hostage" then
			DisableControlAction(0,21,true)
			DisableControlAction(0,24,true)
			DisableControlAction(0,25,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,263,true)
			DisableControlAction(0,264,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,141,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			DisableControlAction(0,75,true)
			DisableControlAction(27,75,true)
			DisableControlAction(0,22,true)
			DisableControlAction(0,32,true)
			DisableControlAction(0,268,true)
			DisableControlAction(0,33,true)
			DisableControlAction(0,269,true)
			DisableControlAction(0,34,true)
			DisableControlAction(0,270,true)
			DisableControlAction(0,35,true)
			DisableControlAction(0,271,true)
		end
		Citizen.Wait(0)
	end
end)
