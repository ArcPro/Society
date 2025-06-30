MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Elevators = MainMenu.Admin.Elevators or {}
MainMenu.Admin.Elevators.Elevator = MainMenu.Admin.Elevators.Elevator or {}

local elevator = {}

MainMenu.Admin.Elevators.Elevator.onOpen = function(id)
    elevator = Callbacks.Trigger("elevator:get", id) or {}

    if elevator ~= nil then
        elevator.tp_points = json.decode(elevator.tp_points)
    else
        UI:AddNotification("basic", "~s~Une erreur est survenue lors du chargement de l'ascenseur~s~", "info", 5000)
    end
end

MainMenu.Admin.Elevators.Elevator.Create = function()
    MainMenu.Admin.Elevators.Elevator.Main = Menus:CreateSub(MainMenu.Admin.Elevators.Main, "Ascenceur", "default")

    Menus:CreateThread(MainMenu.Admin.Elevators.Elevator.Main, function()
        Menus:IsVisible(MainMenu.Admin.Elevators.Elevator.Main, function()

            Menus:AddButton("Nom", false, elevator.name, "", function()
                local name = Utils.KeyboardInput("Nom de l'ascenseur", 50, elevator.name)

                if name == nil then
                    return
                end

                elevator.name = name

                Events.TriggerServer("elevator:update", elevator.id, elevator.name, elevator.tp_points)
            end)

            Menus:AddButton("Ajouter un étage", false, "➕", "", function()
                local label = Utils.KeyboardInput("Label de l'étage", 50, "")

                if label == nil then
                    return
                end

                table.insert(elevator.tp_points, {
                    label = label,
                    coords = GetEntityCoords(PlayerPedId(), true)
                })

                Events.TriggerServer("elevator:update", elevator.id, elevator.name, elevator.tp_points)
            end)

            Menus:AddButton("Supprimer l'assenseur", false, "🗑️", "", function()
                local confirmation = Utils.KeyboardInput("Confirmer la suppression en ecrivant CONFIRM", 50, nil)

                if confirmation ~= 'CONFIRM' then
                    return
                end
                Events.TriggerServer("elevator:delete", elevator.id)
                UI:AddNotification("basic", "~r~Assenseur supprimé", "success", 5000)
                Wait(50)
                Menus:Back()
            end)

            local tpPoints = elevator.tp_points or {}
            for id, data in pairs(tpPoints) do
                Menus:AddSeparator(("Étage #%d"):format(id))
                Menus:AddButton("Label", false, data.label, "", function()
                    local label = Utils.KeyboardInput("Nom de l'ascenseur", 50, data.label)

                    if label == nil then
                        return
                    end

                    data.label = label
                    Events.TriggerServer("elevator:update", elevator.id, elevator.name, elevator.tp_points)
                end)

                Menus:AddButton("Position", false, "🗺️", "", function()
                    data.coords = GetEntityCoords(PlayerPedId(), true)
                    Events.TriggerServer("elevator:update", elevator.id, elevator.name, elevator.tp_points)
                end)

                Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
                    Utils.ValidateDeletion(function()
                        elevator.tp_points[id] = nil
                        Events.TriggerServer("elevator:update", elevator.id, elevator.name, elevator.tp_points)
                    end)
                end)
            end

        end)
    end)
end
