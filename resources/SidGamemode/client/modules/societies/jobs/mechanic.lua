local defaultProps = {}
local total_price = 0

local function GetUpdatedPrice(props, default, vehicle)
    local total = 0
    local vehiclePrice = SharedModules.Variables:Get("vehicles", GetEntityModel(vehicle))

    local function addPartPrice(price, key)
        total = total + (price * (SharedModules.Variables:Get("mechanic", key) / 100))
    end

    for _, key in pairs({"interiorColor", "wheelColor", "pearlescentColor", "plateIndex", "windowTint", "xenonColor",
                         "wheels"}) do
        if props[key] ~= default[key] then
            addPartPrice(vehiclePrice, key)
        end
    end

    for _, key in pairs({"rgbcolor1", "rgbcolor2", "neonColor", "tyreSmokeColor"}) do
        if table.concat(props[key]) ~= table.concat(default[key]) then
            addPartPrice(vehiclePrice, key)
        end
    end

    for _, key in pairs({"neonEnabled", "extras"}) do
        for index, value in pairs(props[key]) do
            if default[key][index] ~= value then
                addPartPrice(vehiclePrice, key)
            end
        end
    end

    for key, value in pairs(props.mods) do
        if value ~= default.mods[key] then
            if key == "engine" or key == "brakes" or key == "suspension" or key == "transmission" then
                total = total +
                            (vehiclePrice * (SharedModules.Variables:Get("mechanic", ("mods_%s"):format(key)) / 100) *
                                (value + 1))
            else
                addPartPrice(vehiclePrice, ("mods_%s"):format(key))
            end
        end
    end

    return total
end

Events.Register("mechanic:toggle", function(source, toggle)

    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    if toggle == false then
        UI:Toggle("mechanic", false, {}, false, false, false)
        ToggleRadar(true)
        return
    end

    if DoesEntityExist(vehicle) == false then
        return UI:AddNotification("basic", "~r~Vous devez être dans un véhicule~s~", "info", 5000)
    end

    local data = Functions.DeepCopy(ClientModules.Vehicles.Properties:Get(vehicle))

    defaultProps = data

    Citizen.CreateThread(function()
        local ped = PlayerPedId()
        while IsPedInAnyVehicle(ped, true) do
            Citizen.Wait(0)
        end

        ClientModules.Vehicles.Properties:Set(vehicle, defaultProps, true)
        UI:Toggle("mechanic", false, {}, false, false, false)
    end)

    SetVehicleModKit(vehicle, 0)

    data.total_price = 0
    data.max_mods = {
        spoiler = GetNumVehicleMods(vehicle, 0),
        frontBumper = GetNumVehicleMods(vehicle, 1),
        rearBumper = GetNumVehicleMods(vehicle, 2),
        sideSkirt = GetNumVehicleMods(vehicle, 3),
        exhaust = GetNumVehicleMods(vehicle, 4),
        frame = GetNumVehicleMods(vehicle, 5),
        grille = GetNumVehicleMods(vehicle, 6),
        hood = GetNumVehicleMods(vehicle, 7),
        fender = GetNumVehicleMods(vehicle, 8),
        rightFender = GetNumVehicleMods(vehicle, 9),
        roof = GetNumVehicleMods(vehicle, 10),
        frontWheels = GetNumVehicleMods(vehicle, 23),
        backWheels = GetNumVehicleMods(vehicle, 24),
        plateHolder = GetNumVehicleMods(vehicle, 25),
        vanityPlate = GetNumVehicleMods(vehicle, 26),
        trimA = GetNumVehicleMods(vehicle, 27),
        ornaments = GetNumVehicleMods(vehicle, 28),
        dashboard = GetNumVehicleMods(vehicle, 29),
        dial = GetNumVehicleMods(vehicle, 30),
        doorSpeaker = GetNumVehicleMods(vehicle, 31),
        seats = GetNumVehicleMods(vehicle, 32),
        steeringWheel = GetNumVehicleMods(vehicle, 33),
        shifterLeavers = GetNumVehicleMods(vehicle, 34),
        aPlate = GetNumVehicleMods(vehicle, 35),
        speakers = GetNumVehicleMods(vehicle, 36),
        trunk = GetNumVehicleMods(vehicle, 37),
        hydrolic = GetNumVehicleMods(vehicle, 38),
        engineBlock = GetNumVehicleMods(vehicle, 39),
        airFilter = GetNumVehicleMods(vehicle, 40),
        struts = GetNumVehicleMods(vehicle, 41),
        archCover = GetNumVehicleMods(vehicle, 42),
        aerials = GetNumVehicleMods(vehicle, 43),
        trimB = GetNumVehicleMods(vehicle, 44),
        tank = GetNumVehicleMods(vehicle, 45),
        livery = GetNumVehicleMods(vehicle, 48),
        livery2 = GetVehicleLiveryCount(vehicle)
    }

    UI:Toggle("mechanic", true, data, true, false, false)
    ToggleRadar(false)
end)

UI:RegisterCallback("mechanic:update", function(data, cb)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local props = ClientModules.Vehicles.Properties:Get(vehicle)

    props[data.key] = data.value

    if data.key == "wheels" then
        props.wheels = tonumber(data.value)
        props.mods.frontWheels = -1
        props.mods.backWheels = -1
    end

    total_price = GetUpdatedPrice(props, defaultProps, vehicle)

    UI:SendMessage("mechanic:update", {
        total_price = total_price
    })

    ClientModules.Vehicles.Properties:Set(vehicle, props, false)

    if data.key == "wheels" then
        UI:SendMessage("mechanic:update", {
            mods = props.mods
        })
        local max_mods = {
            spoiler = GetNumVehicleMods(vehicle, 0),
            frontBumper = GetNumVehicleMods(vehicle, 1),
            rearBumper = GetNumVehicleMods(vehicle, 2),
            sideSkirt = GetNumVehicleMods(vehicle, 3),
            exhaust = GetNumVehicleMods(vehicle, 4),
            frame = GetNumVehicleMods(vehicle, 5),
            grille = GetNumVehicleMods(vehicle, 6),
            hood = GetNumVehicleMods(vehicle, 7),
            fender = GetNumVehicleMods(vehicle, 8),
            rightFender = GetNumVehicleMods(vehicle, 9),
            roof = GetNumVehicleMods(vehicle, 10),
            frontWheels = GetNumVehicleMods(vehicle, 23),
            backWheels = GetNumVehicleMods(vehicle, 24),
            plateHolder = GetNumVehicleMods(vehicle, 25),
            vanityPlate = GetNumVehicleMods(vehicle, 26),
            trimA = GetNumVehicleMods(vehicle, 27),
            ornaments = GetNumVehicleMods(vehicle, 28),
            dashboard = GetNumVehicleMods(vehicle, 29),
            dial = GetNumVehicleMods(vehicle, 30),
            doorSpeaker = GetNumVehicleMods(vehicle, 31),
            seats = GetNumVehicleMods(vehicle, 32),
            steeringWheel = GetNumVehicleMods(vehicle, 33),
            shifterLeavers = GetNumVehicleMods(vehicle, 34),
            aPlate = GetNumVehicleMods(vehicle, 35),
            speakers = GetNumVehicleMods(vehicle, 36),
            trunk = GetNumVehicleMods(vehicle, 37),
            hydrolic = GetNumVehicleMods(vehicle, 38),
            engineBlock = GetNumVehicleMods(vehicle, 39),
            airFilter = GetNumVehicleMods(vehicle, 40),
            struts = GetNumVehicleMods(vehicle, 41),
            archCover = GetNumVehicleMods(vehicle, 42),
            aerials = GetNumVehicleMods(vehicle, 43),
            trimB = GetNumVehicleMods(vehicle, 44),
            tank = GetNumVehicleMods(vehicle, 45),
            livery = GetNumVehicleMods(vehicle, 48),
            livery2 = GetVehicleLiveryCount(vehicle)
        }
        UI:SendMessage("mechanic:update", {
            max_mods = max_mods
        })
    end
end)

UI:RegisterCallback("mechanic:toogleDoors", function(data, cb)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    if GetVehicleDoorAngleRatio(vehicle, 0) > 0.01 then
        SetVehicleDoorsShut(vehicle, false)
    else
        for i = 0, GetNumberOfVehicleDoors(vehicle) do
            SetVehicleDoorOpen(vehicle, i, false, false)
        end
    end
end)

UI:RegisterCallback("mechanic:closed", function(data, cb)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    ClientModules.Vehicles.Properties:Set(vehicle, defaultProps, false)
    ToggleRadar(true)
end)

UI:RegisterCallback("mechanic:save", function(data, cb)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local props = ClientModules.Vehicles.Properties:Get(vehicle)

    local function payUsingSocietyAccount()
        local society = ClientModules.Societies:Get(player:job().id)

        if society == nil then
            return
        end

        local bank_account = Bank.GetAccount(society:bank_account_id() or -1)

        if bank_account == nil then
            return
        end

        if bank_account:withdraw(total_price) == false then
            UI:AddNotification("basic", "~r~Il n'y a pas assez d'argent sur le compte de l'entreprise", "info", 5000)
        else
            ClientModules.Vehicles.Properties:Set(GetVehiclePedIsIn(PlayerPedId(), true), props, true)
            defaultProps = props
        end

        total_price = 0
    end

    UI:Toggle("mechanic", false, {}, false, false, false)

    if player:permissions() < Config.Permissions.MOD then
        payUsingSocietyAccount()
    else
        UI:Popup("Paiement", "Choisisez votre mode de paiement", {
            text = "Compte entreprise",
            cb = function()
                payUsingSocietyAccount()
            end
        }, {
            text = "Staff",
            cb = function()
                ClientModules.Vehicles.Properties:Set(GetVehiclePedIsIn(PlayerPedId(), true), props, true)
                defaultProps = props
            end
        }, 0)
    end
end)

UI:RegisterCallback("mechanic:closed", function(data, cb)
    ClientModules.Vehicles.Properties:Set(GetVehiclePedIsIn(PlayerPedId(), true), defaultProps, true)
    cb(true)
end)
