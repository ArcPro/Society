local spawnedNpcs = {}
local playerMissions = {} -- [npcId] = mission

-- Variables d'état pour la mission beatup_gang
local beatupGangActive = false
local beatupGangPeds = {}
local beatupGangMarker = nil
local beatupGangMarkerActive = false
local beatupGangReward = { item = "lockpick", count = 1 }

function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

-- Menu Missions (utilise un namespace séparé pour éviter les conflits)
IllegalMenu = IllegalMenu or {}
IllegalMenu.Missions = IllegalMenu.Missions or {}

-- S'assure qu'il y a un menu principal pour les missions illégales
if not IllegalMenu.Main then
    IllegalMenu.Main = exports['SidMenus']:Create("Menu Missions Illégales", "default")
    print("[DEBUG] Création IllegalMenu.Main, ID:", IllegalMenu.Main)
else
    print("[DEBUG] IllegalMenu.Main déjà existant, ID:", IllegalMenu.Main)
end

-- Fonction utilitaire pour vérifier si un ped est mort
local function IsPedDead(ped)
    return DoesEntityExist(ped) and IsPedDeadOrDying(ped, true)
end

-- Fonction pour supprimer les PNJ du gang
local function DeleteBeatupGangPeds()
    for _, ped in ipairs(beatupGangPeds) do
        if DoesEntityExist(ped) then
            DeleteEntity(ped)
        end
    end
    beatupGangPeds = {}
end

-- Fonction pour faire spawn les PNJ de la mission "Tabasser un gang"
function StartBeatupGangMission()
    beatupGangActive = true
    DeleteBeatupGangPeds() -- Nettoie d'abord
    beatupGangMarker = nil
    beatupGangMarkerActive = false
    local gangPeds = {
        { model = "g_m_y_ballaeast_01", coords = vector3(-195.64, -1717.48, 32.66), heading = 62.99 },
        { model = "g_m_y_ballaorig_01", coords = vector3(-195.64, -1717.48, 32.66), heading = 62.99 },
        { model = "g_m_y_ballasout_01", coords = vector3(-195.64, -1717.48, 32.66), heading = 62.99 },
    }
    for _, pedData in ipairs(gangPeds) do
        local modelHash = GetHashKey(pedData.model)
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do Wait(10) end
        local ped = CreatePed(4, modelHash, pedData.coords.x, pedData.coords.y, pedData.coords.z, pedData.heading, true, true)
        SetEntityAsMissionEntity(ped, true, true)
        SetPedCombatAttributes(ped, 46, true) -- Always fight
        SetPedCombatAbility(ped, 2) -- Professional
        SetPedCombatRange(ped, 2) -- Far
        SetPedFleeAttributes(ped, 0, false)
        SetPedAsEnemy(ped, true)
        GiveWeaponToPed(ped, GetHashKey("WEAPON_BAT"), 1, false, true)
        TaskCombatPed(ped, PlayerPedId(), 0, 16)
        table.insert(beatupGangPeds, ped)
    end
    print("[MISSIONS] PNJ du gang spawn pour la mission beatup_gang")
    -- Thread de surveillance KO et mort des PNJ
    Citizen.CreateThread(function()
        local lastDeadCoords = nil
        while beatupGangActive do
            Wait(300)
            -- KO joueur
            if player and player.ko and player:ko() then
                print("[MISSIONS] Mission beatup_gang échouée : joueur KO")
                ShowHelpNotification("~r~Mission échouée : tu as été mis KO !")
                beatupGangActive = false
                DeleteBeatupGangPeds()
                for k, v in pairs(playerMissions) do
                    if v.id == "beatup_gang" then
                        playerMissions[k] = nil
                    end
                end
                break
            end
            -- Vérifie la mort des PNJ
            local deadCount = 0
            for _, ped in ipairs(beatupGangPeds) do
                if IsPedDead(ped) then
                    deadCount = deadCount + 1
                    lastDeadCoords = GetEntityCoords(ped)
                end
            end
            if deadCount == #beatupGangPeds and not beatupGangMarkerActive and lastDeadCoords then
                -- Tous morts, spawn marker
                beatupGangMarker = lastDeadCoords
                beatupGangMarkerActive = true
                print("[MISSIONS] Tous les PNJ du gang sont morts, marker spawn.")
                break
            end
        end
    end)
end

-- Thread pour gérer le marker et l'interaction pickup
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if beatupGangMarkerActive and beatupGangMarker then
            -- Affiche le marker
            DrawMarker(20, beatupGangMarker.x, beatupGangMarker.y, beatupGangMarker.z + 0.3, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.4, 0, 200, 50, 150, false, true, 2, false, nil, nil, false)
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local dist = #(playerCoords - beatupGangMarker)
            if dist < 1.2 then
                ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ramasser la carte")
                if IsControlJustPressed(0, 38) then -- E
                    -- Animation pickup
                    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_BUM_PICKUP_COINS", 0, true)
                    Wait(1800)
                    ClearPedTasks(playerPed)
                    -- Donne l'item

                    player:inventory():addItem(Item.Create("access_card", {}, 1))
                    ShowHelpNotification("~g~Tu as ramassé une carte !")

                    beatupGangMarkerActive = false
                    beatupGangMarker = nil
                    beatupGangActive = false
                    DeleteBeatupGangPeds()
                    -- Retire la mission du joueur
                    for k, v in pairs(playerMissions) do
                        if v.id == "beatup_gang" then
                            playerMissions[k] = nil
                        end
                    end
                end
            end
        end
    end
end)

-- Patch : Appeler la fonction lors de l'acceptation de la mission beatup_gang
IllegalMenu.Missions.Create = function(missions)
    if not IllegalMenu.Missions.Main then
        IllegalMenu.Missions.Main = exports['SidMenus']:CreateSub(IllegalMenu.Main, "Missions illégales", "default")
        print("[DEBUG] Création IllegalMenu.Missions.Main, ID:", IllegalMenu.Missions.Main)
    else
        print("[DEBUG] IllegalMenu.Missions.Main déjà existant, ID:", IllegalMenu.Missions.Main)
    end
    for i, mission in ipairs(missions) do
        if not mission.menuId then
            mission.menuId = exports['SidMenus']:CreateSub(IllegalMenu.Missions.Main, mission.label, "default")
            exports['SidMenus']:CreateThread(mission.menuId, function()
                exports['SidMenus']:IsVisible(mission.menuId, function()
                    exports['SidMenus']:AddButton(mission.description or "Aucune description.", true, "", "", function() end)
                    exports['SidMenus']:AddButton("Accepter la mission", false, "", "check", function()
                        print("[MISSIONS] Mission acceptée :", mission.label)
                        local npcId = mission.npcId or mission.id or nil
                        if not npcId then
                            print("[ERROR] npcId est nil lors de l'acceptation de la mission !")
                        else
                            playerMissions[npcId] = mission
                            if mission.id == "beatup_gang" then
                                StartBeatupGangMission()
                            end
                        end
                        exports['SidMenus']:Visible(mission.menuId, false)
                        exports['SidMenus']:Visible(IllegalMenu.Missions.Main, false)
                    end)
                end)
            end)
        end
    end
    exports['SidMenus']:CreateThread(IllegalMenu.Missions.Main, function()
        exports['SidMenus']:IsVisible(IllegalMenu.Missions.Main, function()
            for _, mission in ipairs(missions) do
                exports['SidMenus']:AddButton(mission.label, false, "", "chevron_right", function()
                    if mission.menuId and type(mission.menuId) == "number" then
                        exports['SidMenus']:Visible(mission.menuId, true)
                    else
                        print("[ERROR] Tentative d'ouverture d'un sous-menu mission avec un ID invalide :", mission.menuId)
                    end
                end)
            end
        end)
    end)
end

IllegalMenu.Missions.OpenResponseMenu = function(mission, npcId)
    if not npcId then
        print("[ERROR] npcId est nil lors de l'ouverture du menu de réponse !")
        return
    end
    if not mission.responseMenuId then
        mission.responseMenuId = exports['SidMenus']:CreateSub(IllegalMenu.Main, "Mission en cours", "default")
        exports['SidMenus']:CreateThread(mission.responseMenuId, function()
            exports['SidMenus']:IsVisible(mission.responseMenuId, function()
                exports['SidMenus']:AddButton("As-tu ce qu'il a demandé ?", true, "", "", function() end)
                -- Récupère le vrai nombre d'objets dans l'inventaire
                local itemName = mission.requiredItemName or "money"
                local invItem = player:inventory():findItem(function(item)
                    return item.name == itemName
                end)
                
                local playerAmount = invItem.quantity or 0
                
                local requiredAmount = mission.requiredAmount or 1
                invItem.quantity = requiredAmount
                print(invItem.quantity)
                exports['SidMenus']:AddButton(("%d/%d %s"):format(playerAmount, requiredAmount, itemName), true, "", "", function() end)
                exports['SidMenus']:AddButton("Donner l'objet", false, "", "check", function()
                    if playerAmount >= requiredAmount then
                        local removed = player:inventory():removeItem(invItem)
                        if removed then
                            print("[MISSIONS] Objet donné pour la mission :", mission.label)
                            -- Appel serveur pour la récompense
                            TriggerServerEvent('missions:rewardPlayer', mission.id)
                            playerMissions[npcId] = nil -- mission terminée
                            if mission.responseMenuId and type(mission.responseMenuId) == "number" then
                                exports['SidMenus']:Visible(mission.responseMenuId, false)
                            else
                                print("[ERROR] Tentative de fermeture d'un menu de réponse avec un ID invalide :", mission.responseMenuId)
                            end
                        else
                            print("[MISSIONS] Erreur lors du retrait de l'objet !")
                        end
                    else
                        print("[MISSIONS] Pas assez d'objets pour valider la mission !")
                    end
                end)
            end)
        end)
    end
    if mission.responseMenuId and type(mission.responseMenuId) == "number" then
        exports['SidMenus']:Visible(mission.responseMenuId, true)
    else
        print("[ERROR] Tentative d'ouverture d'un menu de réponse avec un ID invalide :", mission.responseMenuId)
    end
end

RegisterCommand('dev', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local vectorStr = string.format('vector4(%.2f, %.2f, %.2f, %.2f)', coords.x, coords.y, coords.z, heading)
    print('[DEV] Copie vector4 :', vectorStr)
end, false)

-- Demande la liste au server au chargement du client
Citizen.CreateThread(function()
    TriggerServerEvent('missions:getNpcs')
end)

RegisterNetEvent('missions:sendNpcs', function(npcs)
    for _, npc in ipairs(npcs) do
        local modelHash = GetHashKey(npc.model)
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(10)
        end
        local ped = CreatePed(4, modelHash, npc.coords.x, npc.coords.y, npc.coords.z - 1, npc.heading, false, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
        table.insert(spawnedNpcs, {ped = ped, data = npc})
    end
end)

RegisterNetEvent('missions:sendMissions', function(missions)
    IllegalMenu.Missions.Create(missions)
    if IllegalMenu.Missions.Main and type(IllegalMenu.Missions.Main) == "number" then
        exports['SidMenus']:Visible(IllegalMenu.Missions.Main, true)
    else
        print("[ERROR] Tentative d'ouverture du menu missions principal avec un ID invalide :", IllegalMenu.Missions.Main)
    end
end)

RegisterNetEvent('missions:rewardNotification', function(label, reward)
    -- Affiche une notification ou un print pour la récompense
    print(("[MISSIONS] Récompense reçue pour %s : %d %s"):format(label, reward.count, reward.item))
    player:inventory():addItem(Item.Create(reward.item, {}, reward.count))
end)

-- Détection de proximité et interaction E
local menuOpen = false
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local nearNpc = false
        local closestNpc = nil
        for _, npc in ipairs(spawnedNpcs) do
            local ped = npc.ped
            local npcCoords = GetEntityCoords(ped)
            local dist = #(playerCoords - npcCoords)
            if dist < 2.0 then
                nearNpc = true
                closestNpc = npc
                ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour parler")
                if IsControlJustPressed(0, 38) and not menuOpen and not exports['SidMenus']:Visible(IllegalMenu.Main) then -- E
                    menuOpen = true
                    local npcId = npc.data.model or npc.data.id or nil
                    if not npcId then
                        print("[ERROR] npcId est nil lors de l'interaction avec le PNJ !")
                    elseif playerMissions[npcId] then
                        IllegalMenu.Missions.OpenResponseMenu(playerMissions[npcId], npcId)
                    else
                        if not playerMissions[npcId] then
                            TriggerServerEvent('missions:getMissions')
                        end
                    end
                end
            end
        end
        -- Si le joueur s'éloigne du PNJ, ferme le menu missions
        if menuOpen and not nearNpc and exports['SidMenus']:Visible(IllegalMenu.Missions.Main) then
            print("[DEBUG] Fermeture du menu missions (éloignement)")
            exports['SidMenus']:Visible(IllegalMenu.Missions.Main, false)
            menuOpen = false
        end
        -- Si un autre menu s'ouvre, ferme le menu missions
        if menuOpen then
            print("[DEBUG] Fermeture du menu missions (autre menu ouvert)")
            menuOpen = false
        end
    end
end)


-- 

-- MISSION TABASSAGE

-- 

