-- Liste de NPCs (tu pourras en ajouter d'autres)
local missionNpcs = {
    {
        model = "cs_stretch", -- modèle de base
        coords = vector3(-201.36, -1709.17, 32.66), -- position (modifie si besoin)
        heading = 139.05,
        gang = "",
        requiredItemLabel = "money"
    }
}

local illegalMissions = {
    {
        id = "beatup_gang",
        label = "Tabasser un gang",
        description = "Tabasse un gang pour prouver ta loyauté.",
        requiredAmount = 1,
        requiredItemName = "access_card",
        reward = { item = "money", count = 200 },
        npcId = "cs_stretch"
    },
    {
        id = "steal_car",
        label = "Voler une voiture",
        description = "Trouve une voiture et ramène-la au point indiqué.",
        requiredAmount = 1,
        requiredItemLabel = "Voiture",
        requiredItemName = "car",
        reward = { item = "money", count = 500 },
        npcId = "cs_stretch"
    }
}

-- Event pour récupérer la liste de NPCs
RegisterNetEvent('missions:getNpcs', function()
    TriggerClientEvent('missions:sendNpcs', source, missionNpcs)
end)

RegisterNetEvent('missions:getMissions', function()
    TriggerClientEvent('missions:sendMissions', source, illegalMissions)
end)

RegisterNetEvent('missions:rewardPlayer', function(missionId)
    local src = source
    for _, mission in ipairs(illegalMissions) do
        if mission.id == missionId then
            -- Ici tu peux ajouter la récompense au joueur (exemple : addItem)
            -- Ex : Player(src):inventory():addItem(Item.Create(mission.reward.item, {}, mission.reward.count))
            print(("[MISSIONS] Le joueur %d reçoit la récompense : %d %s"):format(src, mission.reward.count, mission.reward.item))
            TriggerClientEvent('missions:rewardNotification', src, mission.label, mission.reward)
            break
        end
    end
end)


