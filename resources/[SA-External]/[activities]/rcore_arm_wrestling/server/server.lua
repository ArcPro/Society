local ANIM_CLAMP = 0.9

RegisterNetEvent('arm_wrestling:requestPosition')
AddEventHandler('arm_wrestling:requestPosition', function(tableId, positionId)
    local Source = source

	if not TABLES[tableId] then
		TABLES[tableId] = {}
	end

    if not TABLES[tableId].players or not TABLES[tableId].players[positionId] then
        if not TABLES[tableId].players then
            TABLES[tableId].players = {}
        end

        if not TABLES[tableId].strength then
            TABLES[tableId].strength = {}
        end

        TABLES[tableId].players[positionId] = Source
        TABLES[tableId].strength[positionId] = 0
        TABLES[tableId].state = 0

        TriggerClientEvent('arm_wrestling:setPositionTaken', -1, tableId, positionId)
        TriggerClientEvent('arm_wrestling:grantPosition', Source, tableId, positionId)

        if not TABLES[tableId].startedAt and TABLES[tableId].players.a and TABLES[tableId].players.b then
            TABLES[tableId].startedAt = GetGameTimer()
            TABLES[tableId].endsAt = TABLES[tableId].startedAt + MATCH_TIMEOUT

            Citizen.Wait(1000)

            if TABLES[tableId].players.a then
                TriggerClientEvent('arm_wrestling:start', TABLES[tableId].players.a, tableId, 'a')
            end

            if TABLES[tableId].players.b then
                TriggerClientEvent('arm_wrestling:start', TABLES[tableId].players.b, tableId, 'b')
            end

            while GetGameTimer() < TABLES[tableId].endsAt and TABLES[tableId].players.a and TABLES[tableId].players.b do
                local strengthA = TABLES[tableId].strength.a
                local strengthB = TABLES[tableId].strength.b

                TABLES[tableId].strength.a = 0
                TABLES[tableId].strength.b = 0

                local finalStrength = strengthA - strengthB

                TABLES[tableId].state = TABLES[tableId].state + finalStrength
                TABLES[tableId].state = math.min(MATH_FINAL_WIN_COUNT, math.max(-MATH_FINAL_WIN_COUNT, TABLES[tableId].state))

                if TABLES[tableId].state <= -MATH_FINAL_WIN_COUNT then
                    TriggerClientEvent('arm_wrestling:end', TABLES[tableId].players.a, 'win_b')
                    TriggerClientEvent('arm_wrestling:end', TABLES[tableId].players.b, 'win_b')

                    Citizen.Wait(5000)
                    EndGame(tableId)
                    break
                elseif TABLES[tableId].state >= MATH_FINAL_WIN_COUNT then
                    TriggerClientEvent('arm_wrestling:end', TABLES[tableId].players.a, 'win_a')
                    TriggerClientEvent('arm_wrestling:end', TABLES[tableId].players.b, 'win_a')

                    Citizen.Wait(5000)
                    EndGame(tableId)
                    break
                else
                    local floatStrength = math.max(0.0, math.min(1.0, TABLES[tableId].state/(MATH_FINAL_WIN_COUNT*2)+0.5))*ANIM_CLAMP

                    TriggerClientEvent('arm_wrestling:setState', TABLES[tableId].players.a, floatStrength)
                    TriggerClientEvent('arm_wrestling:setState', TABLES[tableId].players.b, floatStrength)
                end
                Citizen.Wait(850)
            end

            if TABLES[tableId].players.a and TABLES[tableId].players.b then
                TriggerClientEvent('arm_wrestling:end', TABLES[tableId].players.a, 'timeout')
                TriggerClientEvent('arm_wrestling:end', TABLES[tableId].players.b, 'timeout')

                Citizen.Wait(5000)
                EndGame(tableId)
            end
        end
    else
        TriggerClientEvent('arm_wrestling:denyPosition', Source)
    end
end)

function EndGame(tableId)
    TABLES[tableId].players = {}
    TABLES[tableId].startedAt = nil

    TriggerClientEvent('arm_wrestling:setPositionReleased', -1, tableId, 'a')
    TriggerClientEvent('arm_wrestling:setPositionReleased', -1, tableId, 'b')
end

RegisterNetEvent('arm_wrestling:quit')
AddEventHandler('arm_wrestling:quit', function()
    local Source = source
    RemovePlayerFromAnyTable(Source)
end)

AddEventHandler('playerDropped', function()
    local Source = source
    RemovePlayerFromAnyTable(Source)
end)

function RemovePlayerFromAnyTable(serverId)
    for tableId, tableData in pairs(TABLES) do
        if tableData.players then
            for idx, posServerId in pairs(tableData.players) do
                if posServerId == serverId then
                    tableData.players[idx] = nil

                    if tableData.startedAt then
                        tableData.startedAt = nil
                        if idx == 'a' then
                            TriggerClientEvent('arm_wrestling:end', TABLES[tableId].players.b, 'stop')
                        else
                            TriggerClientEvent('arm_wrestling:end', TABLES[tableId].players.a, 'stop')
                        end
                        EndGame(tableId)
                    end

                    TriggerClientEvent('arm_wrestling:setPositionReleased', -1, tableId, idx)
                end
            end
        end
    end
end

RegisterNetEvent('arm_wrestling:flush')
AddEventHandler('arm_wrestling:flush', function(presses)
    local Source = source

    for tableId, tableData in pairs(TABLES) do
        if tableData.players then
            for idx, posServerId in pairs(tableData.players) do
                if posServerId == Source then
                    tableData.strength[idx] = presses

                    break
                end
            end
        end
    end
end)
