local rangeLabels = { '~g~chuchotez', '~y~parlez', '~r~criez' }
local distances = { 1.5, 4.5, 13.5 }
local isThreadRunning = false
local timer, range = 0, 2

local function DrawDist()
    timer = GetGameTimer() + 1000

    if isThreadRunning then
        return
    end

    Citizen.CreateThread(function()
        isThreadRunning = true
        local pos = nil

        while GetGameTimer() < timer do
            pos = GetEntityCoords(PlayerPedId(), true)

            DrawMarker(1, pos.x, pos.y, pos.z - 0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, distances[range] * math.pi, distances[range] * math.pi, distances[range] / 4, 34, 197, 94, 255, false, false, 2, false, false, false, false)
            Citizen.Wait(0)
        end
        isThreadRunning = false
    end)
end

AddEventHandler('pma-voice:setTalkingMode', function(newRange)
    UI:AddNotification('basic', 'Vous ' .. rangeLabels[newRange] .. '~s~.', 'info', 1000)
    range = newRange
    DrawDist()
end)
