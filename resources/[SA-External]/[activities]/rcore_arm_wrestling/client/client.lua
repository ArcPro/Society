ClosestTableIndices = {}
ACTIVE_TABLE_DATA = nil
ARM_WREST_DICT = 'mini@arm_wrestling'

local stringsplit = function(str, sep)
	local fields = {}
	local pattern = string.format("([^%s]+)", sep)
	str:gsub(pattern, function(c) fields[#fields+1] = c end)

	return fields
end

local function GetEntityFromId(id)
	local nearCoords = stringsplit(id, "_")
	local coords = vector3(tonumber(nearCoords[1]), tonumber(nearCoords[2]), tonumber(nearCoords[3]))
	local table = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, GetHashKey("prop_arm_wrestle_01"), false, false, false)

	if not DoesEntityExist(table) then
		table = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, GetHashKey("bkr_prop_clubhouse_arm_wrestle_01a"), false, false, false)
	end

	if not DoesEntityExist(table) then
		table = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, GetHashKey("bkr_prop_clubhouse_arm_wrestle_02a"), false, false, false)
	end

	return table
end

RegisterNetEvent('arm_wrestling:grantPosition')
AddEventHandler('arm_wrestling:grantPosition', function(tableId, positionId)
    local ped = PlayerPedId()
	local table = GetEntityFromId(tableId)
	local objCoords = GetEntityCoords(table, false)
	local objHeading = GetEntityHeading(table)
	local fightPos = objCoords + GetEntityForwardVector(table) * (positionId == "a" and -0.5 or 0.5)

    -- MovePedToCoordWithBackpressure(ped, fightPos, (objHeading + (positionId == "b" and 180.0 or 0.0)) % 360.0, 2.0, 2)
	SetEntityCoords(ped, fightPos.x, fightPos.y, fightPos.z, true, false, false, false)
	SetEntityHeading(ped, (objHeading + (positionId == "b" and 180.0 or 0.0)) % 360.0)
    StartGameThread(tableId, positionId)
end)

RegisterNetEvent('arm_wrestling:denyPosition')
AddEventHandler('arm_wrestling:denyPosition', function()
	exports["SidGamemode"]:notify("~r~Quelqu'un d'autre se tient déjà de ce côté de la table.~s~", 5000, "info")
end)

RegisterNetEvent('arm_wrestling:start')
AddEventHandler('arm_wrestling:start', function(tableId, positionId)
    Citizen.Wait(2000)

    if ACTIVE_TABLE_DATA and ACTIVE_TABLE_DATA.table == tableId and ACTIVE_TABLE_DATA.position == positionId then
        ACTIVE_TABLE_DATA.startedAt = GetGameTimer() + 3 * 1000
        ACTIVE_TABLE_DATA.secNotified = nil
        ACTIVE_TABLE_DATA.phase = 'fight'
        ACTIVE_TABLE_DATA.state = 0.5
    end
end)

function StartGameThread(tableId, positionId)
    LoadAnimDict(ARM_WREST_DICT)

    local ped = PlayerPedId()
    local startHp = GetEntityHealth(ped)


    if not ACTIVE_TABLE_DATA then
        ACTIVE_TABLE_DATA = {
            table = tableId,
            position = positionId,
            phase = 'idle'
        }

		exports["SidGamemode"]:AddInstructional(CONTROLS.MASH_A.TEXT, 30)
		exports["SidGamemode"]:AddInstructional(CONTROLS.QUIT.TEXT, CONTROLS.QUIT.CONTROL)

        while ACTIVE_TABLE_DATA do

            local gameTime = GetGameTimer()
            local isGameStarted = false

            if startHp ~= GetEntityHealth(ped) then
                FullSelfQuit(ped)
                break
            end

            if ACTIVE_TABLE_DATA.startedAt then
                local secLeft = tonumber(math.floor((gameTime - ACTIVE_TABLE_DATA.startedAt)/1000))

                if secLeft < 0 then
                    local timeToStart = math.abs(secLeft or 0)

                    DisplayCountdown(timeToStart)
                elseif secLeft == 0 then
                    DisplayCountdown(0)
                    isGameStarted = true
                else
                    CleanupScaleform()
                    isGameStarted = true
                end
            end

            if ACTIVE_TABLE_DATA.phase == 'idle' then
                EnsureAnim(ped, 'nuetral_idle_' .. ACTIVE_TABLE_DATA.position, 1, not not ACTIVE_TABLE_DATA.startedAt, not ACTIVE_TABLE_DATA.startedAt)
            elseif ACTIVE_TABLE_DATA.phase == 'fight' then
                AdvancedAnim(ped, 'sweep_' .. ACTIVE_TABLE_DATA.position, ACTIVE_TABLE_DATA.state)
                DrawScaleformMovieFullscreen(instructScaleform, 255, 255, 255, 255, 0)

                if isGameStarted then
                    HandleFightKeypress()
                end
            end

            if IsControlJustPressed(0, CONTROLS.QUIT.CONTROL) or IsDisabledControlJustPressed(0, CONTROLS.QUIT.CONTROL) then
                FullSelfQuit(ped)
            end
            Citizen.Wait(0)
        end

		exports["SidGamemode"]:DeleteInstructional(30)
		exports["SidGamemode"]:DeleteInstructional(CONTROLS.QUIT.CONTROL)
    else
        print("ERROR: Game thread is already active!")
    end
end

function FullSelfQuit(ped)
    TriggerServerEvent('arm_wrestling:quit')
    ClearPedTasks(ped)
    Citizen.Wait(0)
    ClearPedTasks(ped)
    Citizen.Wait(0)
    ClearPedTasks(ped)
    ACTIVE_TABLE_DATA = nil
end

local StoredKeypresses = 0
local expectingA = true
local expectingD = true
local lastFlush = nil

function HandleFightKeypress()
    local nowTime = GetGameTimer()

    if not lastFlush or (nowTime - lastFlush) > 2000 then
        lastFlush = nowTime
    elseif (nowTime - lastFlush) > 500 then
        FlushKeypresses(nowTime)
    end

    if IsControlJustPressed(0, CONTROLS.MASH_A.CONTROL) or IsDisabledControlJustPressed(0, CONTROLS.MASH_A.CONTROL) then
        if expectingA then
            expectingA = false
            expectingD = true
            StoredKeypresses += 1
        end
    end

    if IsControlJustPressed(0, CONTROLS.MASH_B.CONTROL) or IsDisabledControlJustPressed(0, CONTROLS.MASH_B.CONTROL) then
        if expectingD then
            expectingD = false
            expectingA = true
            StoredKeypresses += 1
        end
    end
end

function FlushKeypresses(nowTime)
    TriggerServerEvent('arm_wrestling:flush', StoredKeypresses)
    StoredKeypresses = 0
    lastFlush = nowTime
end


function AdvancedAnim(ped, anim, time)
    local coords = GetEntityCoords(ped, true)
    local rot = GetEntityRotation(ped, 2)

    TaskPlayAnimAdvanced(
        ped, ARM_WREST_DICT, anim, 
        coords.x, coords.y, coords.z,
        rot.x, rot.y, rot.z,
        8.0, 8.0,
        1000, 0, time, false, false
    )
end

function EnsureAnim(ped, anim, flag, fastIn, fastOut)
    if not IsEntityPlayingAnim(ped, ARM_WREST_DICT, anim, 3) then
        TaskPlayAnim(ped, ARM_WREST_DICT, anim, fastIn and 8.0 or 1.0, fastOut and 8.0 or 1.0, -1, flag, 1.0, false, false, false)
    end
end

function MovePedToCoordWithBackpressure(ped, pos, heading, slideDist, backpressureSeconds)
    TaskGoStraightToCoord(ped, pos.x, pos.y, pos.z+0.5, 1.0, -1, heading, slideDist)

    repeat
        Citizen.Wait(0)
        backpressureSeconds -= GetFrameTime()
        local newCoords = GetEntityCoords(ped, true)
        local newHeading = GetEntityHeading(ped)

        local coordsDiff = #(newCoords.xy - pos.xy)
        local headingDiff = math.abs(newHeading - heading)
    until (coordsDiff < 0.1 and headingDiff < 5) or backpressureSeconds < 0.0


    Citizen.Wait(100)

    SetEntityHeading(ped, heading)

    Citizen.Wait(100)

    SetEntityHeading(ped, heading)

    Wait(100)
end

function LoadAnimDict(animDict)
	while (not HasAnimDictLoaded(animDict)) do
		RequestAnimDict(animDict)
		Citizen.Wait(0)
    end

    Citizen.Wait(0)
end

RegisterNetEvent('arm_wrestling:setPositionTaken')
AddEventHandler('arm_wrestling:setPositionTaken', function(tableId, posId)
	if not TABLES[tableId] then
		TABLES[tableId] = {}
	end

    if not TABLES[tableId].players then
        TABLES[tableId].players = {}
    end

    TABLES[tableId].players[posId] = true
end)

RegisterNetEvent('arm_wrestling:setPositionReleased')
AddEventHandler('arm_wrestling:setPositionReleased', function(tableId, posId)
	if not TABLES[tableId] then
		TABLES[tableId] = {}
	end

    if TABLES[tableId].players then
        TABLES[tableId].players[posId] = nil

        if ACTIVE_TABLE_DATA and ACTIVE_TABLE_DATA.table == tableId then
            ACTIVE_TABLE_DATA.startedAt = nil
        end
    end
end)

function lerp(a,b,t) return a * (1-t) + b * t end

stateSetId = 0
RegisterNetEvent('arm_wrestling:setState')
AddEventHandler('arm_wrestling:setState', function(state)
    if ACTIVE_TABLE_DATA then
        local wantedEndTime = GetGameTimer() + 800
        local oldState = ACTIVE_TABLE_DATA.state or 0.5

        stateSetId += 1
        local myStateId = stateSetId

        while ACTIVE_TABLE_DATA and GetGameTimer() < wantedEndTime and myStateId == stateSetId do
            local elapsedTime = 1.0 - math.min(1.0, math.max(0.0, (wantedEndTime - GetGameTimer())/800))

            ACTIVE_TABLE_DATA.state = lerp(oldState, state, elapsedTime)

            if elapsedTime >= 1.0 then
                break
            end

            Citizen.Wait(0)
        end
    end
end)

RegisterNetEvent('arm_wrestling:end')
AddEventHandler('arm_wrestling:end', function(endType)
    LoadAnimDict(ARM_WREST_DICT)
    local myPosition = ACTIVE_TABLE_DATA.position
    ACTIVE_TABLE_DATA = nil

    local ped = PlayerPedId()

    if endType == 'timeout' then
        if myPosition == 'a' then
            TaskPlayAnim(ped, ARM_WREST_DICT, 'win_b_ped_a', 1.0, 1.0, 3000, 0, 0.0, false, false, false )
        else
            TaskPlayAnim(ped, ARM_WREST_DICT, 'win_a_ped_b', 1.0, 1.0, 3000, 0, 0.0, false, false, false )
        end
		exports["SidGamemode"]:notify("Temps écoulé.", 5000, "info")
    elseif endType == 'win_a' then
        if myPosition == 'a' then
            TaskPlayAnim(ped, ARM_WREST_DICT, 'win_a_ped_a', 1.0, 1.0, 3000, 0, 0.0, false, false, false )
			exports["SidGamemode"]:notify("~b~Vous avez gagné !~s~", 5000, "info")
        else
            TaskPlayAnim(ped, ARM_WREST_DICT, 'win_a_ped_b', 1.0, 1.0, 3000, 0, 0.0, false, false, false )
			exports["SidGamemode"]:notify("~r~Vous avez perdu ...~s~", 5000, "info")
        end
    elseif endType == 'win_b' then
        if myPosition == 'a' then
            TaskPlayAnim(ped, ARM_WREST_DICT, 'win_b_ped_a', 1.0, 1.0, 3000, 0, 0.0, false, false, false )
			exports["SidGamemode"]:notify("~r~Vous avez perdu ...~s~", 5000, "info")
        else
            TaskPlayAnim(ped, ARM_WREST_DICT, 'win_b_ped_b', 1.0, 1.0, 3000, 0, 0.0, false, false, false )
			exports["SidGamemode"]:notify("~b~Vous avez gagné !~s~", 5000, "info")
        end
    elseif endType == 'stop' then
        ClearPedTasks(ped)
		exports["SidGamemode"]:notify("Partie arrêtée.", 5000, "info")
    end

    RemoveAnimDict(ARM_WREST_DICT)
end)
