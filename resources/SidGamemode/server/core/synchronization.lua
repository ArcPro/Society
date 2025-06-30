local function SaveAll()
    Citizen.CreateThread(function()
        BankAccounts.SaveAll()
    end)

    Citizen.CreateThread(function()
        Inventories.SaveAll()
    end)

    Citizen.CreateThread(function()
        Properties.SaveAll()
    end)

    Citizen.CreateThread(function()
        Vehicles.SaveAll()
    end)

    Citizen.CreateThread(function()
        Players.SaveAll()
    end)

    Console.Log("Synchronisation effectuée")
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5 * 60 * 1000)
        SaveAll()
    end
end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        Citizen.CreateThread(function()
            Citizen.Wait(50 * 1000)

            for _, player in pairs(Players._list) do
                DropPlayer(player:source(), "Redémarrage du serveur")
            end

            SaveAll()
        end)
    end
end)

RegisterCommand("sync", function()
    SaveAll()
end, true)
