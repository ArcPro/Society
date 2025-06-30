local models = { -468629664, -206690185, 1437508529, -14708062, 682791951, 1919238784, 354692929, -1426008804, -329415894, -1830793175, -341442425, 1143474856, -1187286639, 1792999139, -93819890, 1511880420, 218085040, -1096777189, 1614656839, -130812911, 122303831, -58485588, -413198204, 666561306, -228596739, -115771139, 1329570871 }

local function isBin(model)
    for _, v in pairs(models) do
        if v == model then
            return true
        end
    end
    return false
end

function GetGridZoneIdForBin(posX, posY)
    return 100 + math.ceil((posX + posY) / (3 * 2))
end

Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then
        return
    end

    if not isBin(GetEntityModel(hitEntity)) then
        return
    end

    Context:AddItem(0, "Fouiller ", function()
        local entityCoords = GetEntityCoords(hitEntity, true)

        if Math.Distance(player:position(), entityCoords) > 1.5 then
            return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
        end

        local id = GetGridZoneIdForBin(entityCoords.x, entityCoords.y) .. "_bin"

        Events.TriggerServer("inventory:createTemporary", id, 30.0, true, 30)

        TaskTurnPedToFaceEntity(PlayerPedId(), hitEntity, 1000)
        Citizen.Wait(1000)
        Events.TriggerServer("me", "fouille")
        ClientModules.Misc.Animations:Play("search3")

		ClientModules.Inventory:Open(id, "Poubelle", hitEntity)
    end, true)
end)
