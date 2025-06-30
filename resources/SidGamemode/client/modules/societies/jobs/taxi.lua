local NPCDutyOn = false
local isTaxiRunning = false
local lastNPC = nil
local currentTaxiCompany = nil

-- Nouveau : Variables pour gestion du spawn PNJ au pickup
local pendingPickupBlip = nil
local pendingPickupCoords = nil
local pendingNPC = nil

local dropoffMarkerActive = false
local dropoffMarkerCoords = nil

local taxiPoints = {
    vector3(-1013.520813, -2734.894043, 13.662060),
    vector3(-1277.223755, -1399.732056, 4.400326),
    vector3(-421.313934, 1198.146606, 325.641754),
    vector3(-491.582642, -191.455582, 37.211273),
    vector3(1242.071289, -333.725006, 69.082100),
    vector3(-1406.066284, 92.912544, 53.136021),
    vector3(648.244019, 590.512878, 128.910950),
    vector3(304.300446, 143.979172, 103.698463),
    vector3(31.826141, -1103.198242, 29.372780),
    vector3(904.017151, 34.797173, 80.171585),
}

local function GetTargetCoords()
    local coords = taxiPoints[math.random(1, #taxiPoints)]
    while Math.Distance(player:position(), coords) < 1000 do
        coords = taxiPoints[math.random(1, #taxiPoints)]
    end
    return coords
end

local function PayTaxiRun(amount)
    local society = ClientModules.Societies:Get(player:job().id)
    local playerBankAccount = Bank.GetAccount(player:bank_account_id())
    local societyBankAccount = Bank.GetAccount(society:bank_account_id() or -1)

    if societyBankAccount == nil then
        UI:AddNotification("basic", "~r~L'entreprise n'a pas de compte en banque", "info", 5000)
        return
    end

    if playerBankAccount == nil then
        UI:AddNotification("basic", "~r~Vous n'avez pas de compte en banque", "info", 5000)
        return
    end

    local societyPart = math.floor(amount * 0.4)
    local employeePart = math.floor(amount * 0.6)

    societyBankAccount:deposit(amount, false)
    societyBankAccount:send(employeePart, playerBankAccount:id())
    
    UI:AddNotification(
        "basic",
        ("Vous avez gagné ~b~$%d~s~, l'entreprise a gagné ~b~$%d~s~"):format(employeePart, societyPart),
        "info",
        5000
    )
end

-- Fonction principale de course taxi, ne change pas
local function StartTaxiRun(npc)
    local targetCoords = GetTargetCoords()
    local taxiPricePerKm = SharedModules.Variables:Get("global", "taxi_km_price") or 50
    local price = taxiPricePerKm * (Math.Distance(targetCoords, GetEntityCoords(npc, true)) / 1000)
    local taxi = GetVehiclePedIsIn(PlayerPedId(), false)
    local timer = GetGameTimer() + 15000
    local blip = Blip:new({
        coords = targetCoords,
        title = "Course taxi",
        showOnList = false,
        shortRange = false,
        editable = false,
        id = 2147483647,
        size = 0.75,
        sprite = 1,
        color = 26,
    })

    lastNPC = npc
    isTaxiRunning = true

    -- Bloquer réactions et garder la tâche
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetPedKeepTask(npc, true)

    -- Faire monter le PNJ sans panique (il est déjà dans le véhicule ici normalement)
    SetPedCanBeDraggedOut(npc, false)
    SetPedCanBeKnockedOffVehicle(npc, 1)
    SetPedFleeAttributes(npc, 0, false)
    SetPedCombatAttributes(npc, 17, true)
    SetPedCombatAttributes(npc, 46, true)
    SetPedCombatAttributes(npc, 5, true)
    
    -- Bloquer complètement la sortie du véhicule
    SetPedConfigFlag(npc, 60, false)
    SetPedConfigFlag(npc, 61, false)
    SetPedConfigFlag(npc, 122, true)
    SetPedConfigFlag(npc, 184, true)
    SetPedConfigFlag(npc, 185, true)
    SetPedConfigFlag(npc, 186, true)
    SetPedConfigFlag(npc, 187, true)
    SetPedConfigFlag(npc, 188, true)
    SetPedConfigFlag(npc, 189, true)
    SetPedConfigFlag(npc, 190, true)
    SetPedConfigFlag(npc, 191, true)
    SetPedConfigFlag(npc, 192, true)
    SetPedConfigFlag(npc, 193, true)
    SetPedConfigFlag(npc, 194, true)
    SetPedConfigFlag(npc, 195, true)
    SetPedConfigFlag(npc, 196, true)
    SetPedConfigFlag(npc, 197, true)
    SetPedConfigFlag(npc, 198, true)
    SetPedConfigFlag(npc, 199, true)
    SetPedConfigFlag(npc, 200, true)

    ClearGpsMultiRoute()
    StartGpsMultiRoute(9, true, true)
    blip:show()

    AddPointToGpsMultiRoute(targetCoords.x, targetCoords.y, targetCoords.z)
    SetGpsMultiRouteRender(true)

    UI:AddNotification("basic", ("Course en cours - Prix estimé: ~b~$%d~s~"):format(math.floor(price)), "info", 3000)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName("Ton message ici !")
    EndTextCommandDisplayHelp(0, false, true, -1)
    
    dropoffMarkerActive = true
    dropoffMarkerCoords = targetCoords

    Citizen.CreateThread(function()
        local dropOffStarted = false
        while isTaxiRunning and DoesEntityExist(npc) do
            -- Vérifier si le PNJ est toujours dans le véhicule
            if not IsPedInVehicle(npc, taxi, false) then
                TaskEnterVehicle(npc, taxi, -1, 1, 1.0, 1, 0)
                Citizen.Wait(1000)
            end
            
            -- Vérifier si on est arrivé à destination
            if not dropOffStarted
               and Math.Distance(GetEntityCoords(taxi, false), targetCoords) < 5.0
               and GetEntitySpeed(taxi) < 2.0
            then
                dropOffStarted = true
                -- Faire descendre le PNJ à destination
                TaskLeaveVehicle(npc, taxi, 1)
                while IsPedInVehicle(npc, taxi, false) do
                    Citizen.Wait(100)
                end
                TaskGoToCoordAnyMeans(npc, targetCoords.x, targetCoords.y, targetCoords.z, 1.0, 0, false, 786603, 0xbf800000)
                PayTaxiRun(price)
                blip:delete()
                dropoffMarkerActive = false
                dropoffMarkerCoords = nil
                break
            end
            Citizen.Wait(250)
        end
        ClearGpsMultiRoute()
        isTaxiRunning = false
    end)
end

-- Nouvelle fonction pour la gestion d'un appel client avec spawn à l'arrivée
local function CreatePickupRequest()
    pendingPickupCoords = taxiPoints[math.random(1, #taxiPoints)]
    pendingPickupBlip = Blip:new({
        coords = pendingPickupCoords,
        title = "Client à prendre",
        showOnList = false,
        shortRange = false,
        editable = false,
        id = 2147483647,
        size = 0.8,
        sprite = 280,
        color = 46,
    })
    pendingPickupBlip:show()
    SetNewWaypoint(pendingPickupCoords.x, pendingPickupCoords.y)
    UI:AddNotification("basic", "~g~Un client attend d'être pris en charge, direction le point GPS !", "info", 3000)

    Citizen.CreateThread(function()
        while pendingPickupCoords and not isTaxiRunning do
            local playerPos = GetEntityCoords(PlayerPedId())
            if #(playerPos - pendingPickupCoords) < 200.0 and not pendingNPC then
                RequestModel("a_m_m_business_01")
                while not HasModelLoaded("a_m_m_business_01") do
                    Citizen.Wait(10)
                end
                local groundZ = pendingPickupCoords.z
                local foundGround, z = GetGroundZFor_3dCoord(pendingPickupCoords.x, pendingPickupCoords.y, pendingPickupCoords.z, 0)
                if foundGround then
                    groundZ = z
                end
                pendingNPC = CreatePed(4, "a_m_m_business_01", pendingPickupCoords.x, pendingPickupCoords.y, groundZ, 0.0, true, false)
                SetBlockingOfNonTemporaryEvents(pendingNPC, true)
                TaskStartScenarioInPlace(pendingNPC, "WORLD_HUMAN_STAND_MOBILE", 0, true)
            end

            -- Si le PNJ existe et que le joueur est à moins de 6m et a un taxi arrêté
            if pendingNPC and #(playerPos - pendingPickupCoords) < 6.0 then
                local taxi = GetVehiclePedIsIn(PlayerPedId(), false)
                if taxi ~= 0 then
                    TaskGoToEntity(pendingNPC, taxi, -1, 2.0, 1.0, 1073741824, 0)
                    Citizen.Wait(2000)
                    TaskWarpPedIntoVehicle(pendingNPC, taxi, 1)
                    pendingPickupBlip:delete()
                    pendingPickupCoords = nil
                    pendingPickupBlip = nil
                    StartTaxiRun(pendingNPC)
                    pendingNPC = nil
                    break
                else
                    UI:AddNotification("basic", "~b~Arrêtez-vous en voiture à proximité du client pour qu'il monte", "info", 2000)
                end
            end
            Citizen.Wait(250)
        end
    end)
end

local function CreateTaxiDutyHandler(companyName)
    Events.Register(("%s:duty"):format(companyName), function(source, duty)
        if not duty then
            MainMenu.Radial.Unregister()
            NPCDutyOn = false
            isTaxiRunning = false
            lastNPC = nil
            currentTaxiCompany = nil
            -- Nettoyage variables pickup si duty off
            if pendingPickupBlip then pendingPickupBlip:delete() end
            if pendingNPC then DeleteEntity(pendingNPC) end
            pendingPickupCoords = nil
            pendingPickupBlip = nil
            pendingNPC = nil
            ClearGpsMultiRoute()
            return
        end

        currentTaxiCompany = companyName

        MainMenu.Radial.Register({
            {
                icon = "taxi",
                title = "Appeler un client",
                callback = "taxi:callClient",
            },
            {
                icon = "cancel",
                title = "Annuler la course",
                callback = "taxi:cancelRun",
            },
        })
    end)
end

-- Créer les gestionnaires pour les entreprises de taxi connues
CreateTaxiDutyHandler("taxidowntown")
CreateTaxiDutyHandler("taxi")
CreateTaxiDutyHandler("yellowcab")

UI:RegisterCallback("taxi:callClient", function(data, cb)
    if not NPCDutyOn then
        NPCDutyOn = true
        UI:AddNotification("basic", "~g~Mode taxi activé - Appel d'un client", "info", 3000)
    end

    if isTaxiRunning or pendingPickupCoords then
        UI:AddNotification("basic", "~r~Vous avez déjà une course en cours ou un client en attente", "info", 3000)
        return
    end

    CreatePickupRequest()
end)

UI:RegisterCallback("taxi:cancelRun", function(data, cb)
    if isTaxiRunning then
        isTaxiRunning = false
        lastNPC = nil
        ClearGpsMultiRoute()
        UI:AddNotification("basic", "~r~Course annulée", "info", 3000)
    elseif pendingPickupCoords then
        if pendingPickupBlip then pendingPickupBlip:delete() end
        if pendingNPC then DeleteEntity(pendingNPC) end
        pendingPickupCoords = nil
        pendingPickupBlip = nil
        pendingNPC = nil
        UI:AddNotification("basic", "~r~Client annulé", "info", 3000)
    else
        UI:AddNotification("basic", "~r~Aucune course en cours", "info", 3000)
    end
end)

RegisterCommand("testtaxi", function()
    if player:job().id == nil then
        UI:AddNotification("basic", "~r~Vous devez avoir un emploi pour tester le taxi", "info", 3000)
        return
    end

    local society = ClientModules.Societies:Get(player:job().id)
    if society == nil then
        UI:AddNotification("basic", "~r~Société non trouvée", "info", 3000)
        return
    end

    UI:AddNotification("basic", ("Société: %s (ID: %d)"):format(society:name(), society:id()), "info", 5000)
    UI:AddNotification("basic", ("Prix taxi par km: $%d"):format(SharedModules.Variables:Get("global", "taxi_km_price") or 50), "info", 5000)
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if dropoffMarkerActive and dropoffMarkerCoords then
            local markerZ = dropoffMarkerCoords.z
            local foundGround, z = GetGroundZFor_3dCoord(dropoffMarkerCoords.x, dropoffMarkerCoords.y, dropoffMarkerCoords.z, 0)
            if foundGround then
                markerZ = z
            end
            DrawMarker(1, dropoffMarkerCoords.x, dropoffMarkerCoords.y, markerZ + 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0, 0, 255, 0, 100, false, true, 2, false, nil, nil, false)
        end
    end
end)
