Utils = Utils or {}

Utils.RealWait = function(time)
    local timer = GetGameTimer() + time
    while GetGameTimer() < timer do
        Citizen.Wait(0)
    end
end
