Markers = {
    ---@type Marker[]
    _list = {},
    functions = {},
	Initialized = false,
}

Markers.Get = function(name)
    return Markers._list[name]
end

Markers.All = function()
    return Markers._list
end

Markers.Clear = function()
    Markers._list = {}
end

Markers.functions.inventory = {
    open = function(data)
        if data.inventoryId == nil then
            return UI:AddNotification("basic", "~r~Aucun inventaire lié~s~", "info", 5000)
        end

		ClientModules.Inventory:Open(data.inventoryId, "Coffre")
    end,
    close = function()
		ClientModules.Inventory:Close()
    end,
}

Markers.functions.bank = {
    open = function(data)
        Events.Trigger("bank:interact", true)
    end,
    close = function()
        Events.Trigger("bank:interact", false)
    end,
}

Markers.functions.craft = {
    open = function(data)
        Events.Trigger("craft:toggle", data, true)
    end,
    close = function()
        Events.Trigger("craft:toggle", {}, false)
    end,
}

Markers.functions.mechanic = {
    open = function(data)
        Events.Trigger("mechanic:toggle", true)
    end,
    close = function()
        Events.Trigger("mechanic:toggle", false)
    end,
}

Markers.functions.house_keys = {
    open = function(data)
        if MainMenu.Admin.Properties.Main == nil then
			MainMenu.Admin.Properties.Create()
		end

		MainMenu.Admin.Properties.onOpen(false)
		Menus:Visible(MainMenu.Admin.Properties.Main, true)
    end,
    close = function()
		Menus:Visible(MainMenu.Admin.Properties.Main, false)
    end,
}

Markers.functions.cloakroom = {
    open = function(data)
        local sex = player:sex()
        if data.cloakroom and data.cloakroom[sex] then
            print(player:sex())
            print(json.encode(data, {indent=true}))
            Events.Trigger("cloakroom:toggle", data.cloakroom[sex], data.free, true)
        else
            print("Erreur: data.cloakroom est nil ou la clé pour le sexe '" .. sex .. "' est manquante!")
        end
    end,
    close = function()
        Events.Trigger("cloakroom:toggle", {}, false, false)
    end,
}

Markers.functions.dmv_school = {
    open = function(data, toggled)
        toggled = true
        Events.Trigger("dmv_school:toggle", toggled)
    end,
    close = function(data, toggled)
        toggled = false
        Events.Trigger("dmv_school:toggle", toggled)
    end,
}

Markers.functions.public_job_listing = {
    open = function(data, toggled)
        toggled = true
        Events.Trigger("job_listing:toggle", data, toggled)
    end,
    close = function(data, toggled)
        toggled = false
        Events.Trigger("job_listing:toggle", data, toggled)
    end,
}

Markers.functions.shop = {
    open = function(data)
        Events.Trigger("shop:toggle", data, true)
    end,
    close = function()
        Events.Trigger("shop:toggle", {}, false)
    end,
}

Markers.functions.cardealer = {
    open = function(data)
        Events.Trigger("cardealer:toggleCatalog", data, true)
    end,
    close = function()
        Events.Trigger("cardealer:toggleCatalog", {}, false)
    end,
}

Markers.functions.manage_greycard = {
    open = function(data)
        Events.Trigger("cardealer:toggleGreycardManagement", true)
    end,
    close = function()
        Events.Trigger("cardealer:toggleGreycardManagement", false)
    end,
}

Markers.functions.manage_extras = {
    open = function(data)
        Events.Trigger("vehicle:manageExtras", true)
    end,
    close = function()
        Events.Trigger("vehicle:manageExtras", false)
    end,
}

Markers.functions.identity_card = {
    open = function(data)
        PaymentPopup(SharedModules.Variables:Get("items", "id_card") or 20, function ()
			player:inventory():addItem(Item.Create('id_card', {
				birthdate = player:birthdate(),
				firstname = player:firstname(),
				lastname = player:lastname(),
				name = "Carte d'identité",
				height = player:height(),
				weight = player:weight(),
				photo = CharacterPhoto(),
				isDriverLicense = false,
				sex = player:sex(),
			}, 1))
		end, {type = "card", iban = "Centre des titres d'identité"})
    end,
    close = function()end,
}

---@type Marker[]
local drawables = {}

local function shouldDrawMarker(data)
	if data.job then
		return (data.job == player:job().name and LocalPlayer.state.duty == true)
	end

	if data.group then
		return data.group == player:group()
	end

	return true
end

Citizen.CreateThread(function()
	while player == nil do
		Citizen.Wait(500)
	end

    while true do
        for k in pairs(drawables) do
            drawables[k] = nil
        end

        for _, marker in pairs(Markers._list) do
            if Math.Distance(player:position(), marker:coords()) < marker:maxDistance() and marker:visible() then
                drawables[#drawables + 1] = marker
            end
        end

        Citizen.Wait(500)
    end
end)

Citizen.CreateThread(function()
    local timeout = 500
	local dist = nil

    while true do
        if #drawables == 0 then
            timeout = 500
        else
            timeout = 0

            for _, marker in pairs(drawables) do
                if (
                    shouldDrawMarker(marker:data())
					and marker:bucket() == player:metadata().instance
                ) then

					dist = Math.Distance(player:position(), marker:coords())
                    marker:draw(dist)

                    if dist < 2.0 then
                        if IsControlJustPressed(0, 46) then
                            marker:onInteract()(marker:data())
                            marker:opened(true)
                        end
                    elseif marker:opened() then
                        marker:onLeave()()
                        marker:opened(false)
                    end
                end
            end
        end

        Citizen.Wait(timeout)
    end
end)

Events.Register("marker:create", function(source, name, type, coords, data, bucket)
    Marker:new({
        name = name,
        action = type,
        coords = coords,
        data = data,
        editable = true,
		bucket = bucket
    })
end)

Events.Register("marker:update", function(source, name, type, coords, data, bucket)
    local marker = Markers.Get(name)

    if marker ~= nil then
        marker:action(type)
        marker:coords(coords)
        marker:data(data)
		marker:bucket(bucket)

		if type and Markers.functions[type] then
			marker:onInteract(Markers.functions[type].open)
			marker:onLeave(Markers.functions[type].close)
		end
    end
end)

Events.Register("marker:delete", function(source, name)
    local marker = Markers.Get(name)

    if marker ~= nil then
        marker:delete()
    end
end)

Core.Player:OnLoad(function()
	if Markers.Initialized == true then return end

	Events.Register("marker:load", function(source, markers)
		for _, marker in pairs(markers) do
			marker.data = json.decode(marker.data)
			marker.coords = json.decode(marker.coords)

			Marker:new({
				name = marker.name,
				action = marker.type,
				coords = vector3(marker.coords.x, marker.coords.y, marker.coords.z),
				data = marker.data,
				onInteract = Markers.functions[marker.type] and Markers.functions[marker.type].open or function()end,
				onLeave = Markers.functions[marker.type] and Markers.functions[marker.type].close or function()end,
				editable = true,
				bucket = marker.bucket,
			})
		end
	end)

    Events.TriggerServer("marker:load")

	Markers.Initialized = true
end)
