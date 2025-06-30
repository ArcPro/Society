local function canToggleDoor(door)
    if door.doorType == "job" then
        return player:job().id == door.job
    end

    if door.doorType == "group" then
        return player:group() == door.job
    end
end

Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
    if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then
        return
    end

    local door = GetDoor(hitEntity)

    if door ~= nil and canToggleDoor(door) then
        Context:AddItem(0, door.locked == 1 and "Déverrouiller" or "Verrouiller", function()
            Events.TriggerServer("doors:toggleLock", door.id, door.locked == 1 and 0 or 1)
        end, true)
    end

    if player:permissions() > Config.Permissions.MOD then
        if door == nil then
            local subMenu = Context:AddSubmenu(0, "Créer un doorlock")
            Context:AddItem(subMenu, "Entreprise", function()
                local coords, model = GetEntityCoords(hitEntity, true), GetEntityModel(hitEntity)
                local job = tonumber(Utils.KeyboardInput("ID du job lié", 5, ""))
                if job == nil then
                    return
                end
                Events.TriggerServer("doors:create", model, coords, "job", job)
            end, true)

            Context:AddItem(subMenu, "Groupe", function()
                local coords, model = GetEntityCoords(hitEntity, true), GetEntityModel(hitEntity)
                local group = tonumber(Utils.KeyboardInput("ID du groupe lié", 5, ""))

                if group == nil then
                    return
                end

                Events.TriggerServer("doors:create", model, coords, "group", group)
            end, true)

            Context:AddItem(subMenu, "Ajouter à une porte existante", function()
                local coords, model = GetEntityCoords(hitEntity, false), GetEntityModel(hitEntity)
                local id = tonumber(Utils.KeyboardInput("ID de la première porte", 5, ""))

                if id == nil then
                    UI:AddNotification("basic", "ID invalide", "info", 3000)
                    return
                end

                local existingDoor = GetDoorById(id)
                if existingDoor == nil then
                    UI:AddNotification("basic", ("L'ID saisit (%s) ne correspond à aucune porte"):format(id), "info",
                        3000)
                    return
                end

                -- check if coords are close enough
                local modelMin, modelMax = GetModelDimensions(model)
                local modelWidth = modelMax.x - modelMin.x

                -- Calculate if the doors are close enough by checking if the distance between the two doors is less than the width of the model
                -- This is a rough approximation, but it should work for most cases

                if Math.Distance(existingDoor.position, coords) > (modelWidth * 2 + 1.0) then
                    UI:AddNotification("basic", "Les portes sont considérées comme trop éloignées.", "info", 3000)
                    return
                end

                existingDoor.double = {
                    [1] = {
                        position = existingDoor.position,
                        model = existingDoor.model
                    },
                    [2] = {
                        position = coords,
                        model = model
                    }
                }
                Events.TriggerServer("doors:addDoorToGroup", existingDoor)
            end, true)
        else
            local submenuDoor, _ = Context:AddSubmenu(0, "Informations porte (Admin)")

            Context:AddItem(submenuDoor, ("ID: %d"):format(door.id), function()
            end, true)

            Context:AddItem(submenuDoor, ("Type: %s"):format(door.doorType), function()
                local newType = Utils.KeyboardInput("Type", 5, "")

                if newType == nil then
                    return
                end

                door.doorType = newType

                Events.TriggerServer("doors:update", door)
            end, true)

            Context:AddItem(submenuDoor, ("ID Job: %d"):format(door.job), function()
                local newJob = tonumber(Utils.KeyboardInput("ID Job lié", 5, ""))

                if newJob == nil then
                    return
                end

                door.job = newJob

                Events.TriggerServer("doors:update", door)
            end, true)

            Context:AddItem(submenuDoor, ("%s la porte"):format(door.locked == 1 and "Déverrouiller" or "Verrouiller"),
                function()
                    Events.TriggerServer("doors:toggleLock", door.id, door.locked == 1 and 0 or 1)
                end, true)

            -- Hold open
            Context:AddItem(submenuDoor, ("Maintenir la porte ouverte: %s"):format(door.holdOpen and "Oui" or "Non"),
                function()
                    local newDoor = Functions.DeepCopy(door)
                    newDoor.holdOpen = not newDoor.holdOpen

                    Events.TriggerServer("doors:update", newDoor)
                end, true)

            -- Automatic
            Context:AddItem(submenuDoor, ("Porte automatique: %s"):format(door.auto and "Oui" or "Non"), function()
                local newDoor = Functions.DeepCopy(door)
                newDoor.auto = not door.auto
                Events.TriggerServer("doors:update", newDoor)
            end, true)

            -- Door rate
            Context:AddItem(submenuDoor, ("Vitesse de la porte: %s"):format(door.doorRate), function()
                local newRate = tonumber(Utils.KeyboardInput("Vitesse de la porte", 5, ""))
                if newRate == nil then
                    return
                end
                local newDoor = Functions.DeepCopy(door)
                newDoor.doorRate = newRate + 0.0

                Events.TriggerServer("doors:update", newDoor)
            end, true)

            Context:AddItem(submenuDoor, "Supprimer le verrouillage", function()
                Events.TriggerServer("doors:delete", door.id)
            end, true)
        end
    end
end)
