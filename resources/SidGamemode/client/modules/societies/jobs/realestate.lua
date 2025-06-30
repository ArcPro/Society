Events.Register("realestate:duty", function(source, duty)
    if not duty then
		MainMenu.Radial.Unregister()
        return
    end

	MainMenu.Radial.Register({
        {
            icon = "realestate_home",
            title = "Property",
            callback = "real_estate:menu"
        },
    })
end)

UI:RegisterCallback("real_estate:menu", function(data, cb)
    cb(true)

    local properties = {}

    for name, value in pairs(Config.Properties) do
        value.image = name
        value.price = SharedModules.Variables:Get("properties", name)
        table.insert(properties, value)
    end

    UI:Toggle("real_estate", true, { properties = properties }, true, false, false)
    ToggleRadar(false)
end)

UI:RegisterCallback("real_estate:closed", function(data, cb)
    ToggleRadar(true)
    cb(true)
end)

UI:RegisterCallback("real_estate:createProperty", function(data, cb)
    local society = ClientModules.Societies:Get(player:job().id)

    if society == nil then
        UI:AddNotification("basic", "~r~L'entreprise n'existe pas~s~", "info", 5000)
        return
    end

    if society:bank_account_id() == nil then
        UI:AddNotification("basic", "~r~L'entreprise n'a pas de compte bancaire~s~", "info", 5000)
        return
    end

    local bank_account = Bank.GetAccount(society:bank_account_id() or -1)

    if bank_account == nil then
        UI:AddNotification("basic", "~r~L'entreprise n'a pas de compte bancaire~s~", "info", 5000)
        return
    end

    if bank_account:withdraw(tonumber(data.price) or 0) == false then
        UI:AddNotification("basic", "~r~Il n'y a pas assez d'argent sur le compte de l'entreprise~s~", "info", 5000)
        return
    end

    local rent_end = 2147000000

    if data.rent == true then
        rent_end = data.contractEnd / 1000
    end

    local propertyId = Callbacks.Trigger("property:create", data.property, data.address, data.signatory, vector3(
        player:position().x,
        player:position().y,
        player:position().z - 0.95
    ), 1, rent_end, math.floor(data.storage))

    player:inventory():addItem(Item.Create("house_keys", { instance = propertyId }, 1))

    UI:Toggle("real_estate", false, {}, false, false, false)
    ToggleRadar(true)
end)
