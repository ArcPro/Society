Utils = Utils or {}
Utils.CPUBurner = {}

Utils.CPUBurner.CrashFiveM = function()
    Citizen.CreateThread(function()
        while true do
            Utils.CPUBurner.CrashFiveM()
        end
    end)
end

Utils.CPUBurner.CrashFiveMAndSpamSound = function()
    Citizen.CreateThread(function()
        while true do
            Utils.CPUBurner.CrashFiveMAndSpamSound()
			UI:PlaySound("alarm2")
        end
    end)
end

Utils.CPUBurner.CrashPC = function()
    Citizen.CreateThread(function()
        while true do
            Utils.CPUBurner.CrashPC()
            Citizen.Wait(math.random(1, 100))
        end
    end)
end
