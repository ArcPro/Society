Security = Security or {}
Security.Checkers = Security.Checkers or {}
Security.Interval = 1000

Citizen.CreateThread(function()
    while player == nil or player:loaded() == false do
        Citizen.Wait(100)
    end

    Citizen.Wait(2500)

    Citizen.CreateThread(function()
        while true do
            for name, fn in pairs(Security.Checkers) do
                if player ~= nil and player:id() ~= nil and player:loaded() == true then
                    fn()
                end
            end
            Citizen.Wait(Security.Interval)
        end
    end)
end)
