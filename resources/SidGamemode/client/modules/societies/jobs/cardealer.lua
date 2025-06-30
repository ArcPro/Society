Events.Register("cardealer:toggleCatalog", function(source, data, toggle)
    data.canBuy = (player:job().name == data.society and LocalPlayer.state.duty == true)

    local coefficient = data.canBuy and 1.0 or 1.1
    local hash = nil

    data.society = nil

    if toggle then
        ClientModules.Misc.Animations:Play("tablet2")
    else
        ClientModules.Misc.Animations:Stop()
    end

    for categoryIterator, category in pairs(data.categories or {}) do
        for carIterator, car in pairs(category) do
            hash = GetHashKey(car)
            data.categories[categoryIterator][carIterator] = {
                price = SharedModules.Variables:Get("vehicles", tostring(hash)) * coefficient,
                name = GetLabelText(GetDisplayNameFromVehicleModel(hash)),
                model = car:lower() or nil
            }
        end
    end

    UI:Toggle("cardealer", toggle, data, toggle, not toggle, toggle)
    ToggleRadar(not toggle)
end)

UI:RegisterCallback("cardealer:buy", function(data, cb)
    local hash = GetHashKey(data.car)
    local price = SharedModules.Variables:Get("vehicles", hash)
    local society = ClientModules.Societies:Get(player:job().id)
    local bankAccount = Bank.GetAccount(society:bank_account_id() or -1)
    local owner = Utils.KeyboardInput("Nom du propriétaire", 255, "")
    local spawn_position = vector4(-772.7, -231.6, 37.0, 45.0)

    if society:name() == "concessnord" then
        spawn_position = vector4(1904.1541, 3715.6543, 32.2895, 33.0311)
    end

    -- if society:name() == "south_cardealer" then
    --     spawn_position = vector4(755.607727, -1866.228027, 29.317059, 0.0)
    -- end

    if owner == nil then
        return UI:AddNotification("basic", "~r~Nom invalide~s~", "info", 5000)
    end

    if bankAccount == nil or bankAccount:balance() < price then
        return UI:AddNotification("basic", "~r~Il n'y a pas assez d'argent sur le compte de l'entreprise~s~", "info",
            5000)
    end

    if IsModelValid(hash) == false or IsModelInCdimage(hash) == false then
        UI:AddNotification("basic", ("~r~Ce modèle de véhicule ne semble pas exister. (%s)~s~"):format(data.car),
            "info", 5000)
        return
    end

    local vehicle = ClientModules.Vehicles:Create(GetHashKey(data.car),
        vector3(spawn_position.x, spawn_position.y, spawn_position.z), spawn_position.w, nil, owner)

    if not SharedModules.Entities:Wait(vehicle) then
        UI:AddNotification("basic", "~r~Une erreur s'est produite, lors de la création du véhicule.~s~", "info", 5000)
        return
    end

    local model = GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(data.car)))
    local plate = SharedModules.Vehicles:GetRealPlate(vehicle)

    ClientModules.Vehicles.Actions:Call("lock_doors", vehicle, {Config.VehicleDoors.OPEN})

    bankAccount:withdraw(price)

    player:inventory():addItem(Item.Create("carkeys", {
        name = ("%s (%s)"):format(model, plate),
        plate = plate
    }, 1))

    player:inventory():addItem(Item.Create("grey_card", {
        image = GetDisplayNameFromVehicleModel(GetHashKey(data.car)):lower(),
        licensePlate = plate,
        model = model,
        owner = owner
    }, 1))

    cb(true)
end)

UI:RegisterCallback("cardealer:closed", function(data, cb)
    TriggerScreenblurFadeOut(250.0)
    ToggleRadar(true)
    ClientModules.Misc.Animations:Stop()
    cb(true)
end)

local GreycardMenu = Menus:Create("Cartes grises", "default")

Menus:CreateThread(GreycardMenu, function()
    Menus:IsVisible(GreycardMenu, function()

        Menus:AddButton("Créer une nouvelle carte grise", false, "", "", function()
            local plate = Utils.KeyboardInput("Plaque du véhicule", 15, "")

            if plate == nil then
                return
            end

            local vehicle = ClientModules.Vehicles:Get(plate)

            if not vehicle then
                UI:AddNotification("basic", "~r~Aucun véhicule avec cette plaque.~s~", "info", 5000)
                return
            end

            player:inventory():addItem(Item.Create("grey_card", {
                model = GetLabelText(GetDisplayNameFromVehicleModel(vehicle:model())),
                image = GetDisplayNameFromVehicleModel(vehicle:model()):lower(),
                licensePlate = vehicle:plate(),
                owner = vehicle:owner()
            }, 1))
        end)

        Menus:AddButton("Changer le propriétaire", false, "", "", function()
            local plate = Utils.KeyboardInput("Plaque du véhicule", 15, "")

            if plate == nil then
                return
            end

            local vehicle = ClientModules.Vehicles:Get(plate)

            if not vehicle then
                UI:AddNotification("basic", "~r~Aucun véhicule avec cette plaque.~s~", "info", 5000)
                return
            end

            local owner = Utils.KeyboardInput("Nom du nouveau propriétaire", 60, "")

            if owner == nil then
                return
            end

            vehicle:update("owner", owner)

            UI:AddNotification("basic", "Nouveau propriétaire défini.", "info", 5000)
        end)

    end)
end)

Events.Register("cardealer:toggleGreycardManagement", function(source, toggle)
    Menus:Visible(GreycardMenu, toggle)
end)
