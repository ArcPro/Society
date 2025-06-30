local Natives = {}

for _, name in pairs(NativesNames) do
    Natives[name] = _G[name]
end

Citizen.CreateThread(function()
    while true do
        for _, name in pairs(NativesNames) do
            _G[name] = Natives[name]
        end
        Citizen.Wait(500)
    end
end)
