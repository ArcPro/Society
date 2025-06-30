local isUsingItem = false
local auto_actions = {}

local function lockEmote(emote, locked)
	for listName, list in pairs(Lists.Emotes) do
		for emoteName, emoteData in pairs(list) do
			if emoteName == emote then
				if Lists.Emotes[listName][emote] ~= nil then
					Lists.Emotes[listName][emote].AnimationOptions.Whitelist = locked
				end

				return
			end
		end
	end
end

Item = {
    _list = {},
    _usableItems = {},
	_weapons = {},
}

if Config.Env == "server" then
    Citizen.CreateThread(function()
        while MySQL == nil do
            Citizen.Wait(100)
        end

        local list = MySQL.query.await("SELECT * FROM items")
        for _, item in pairs(list) do
            item.metadata = json.decode(item.metadata)
            item.action = json.decode(item.action)
            Item._list[item.name] = item
        end

        while Callbacks == nil do
            Citizen.Wait(100)
        end

        Callbacks.Register("items:get", function()
            return Item._list
        end)
    end)
else
	auto_actions.consumable = function (item)
		Item.RegisterUsable(item.name, function()
			Citizen.CreateThread(function()
				for k, v in pairs(item.action) do
					if player[k] ~= nil and v and v ~= 0 then
						player[k](player, player[k](player) + v)
					end
				end

				ClientModules.Misc.Animations:Play(item.action.emote, true)
				if item.action.emote_unlimited ~= true then
                    Utils.RealWait(5000)
                    ClientModules.Misc.Animations:Stop()
                end
			end)

			return item.action.dont_remove ~= true
		end)
	end

	auto_actions.prop = function(item)
		Item.RegisterPlacable(item.name, item.action.model)
	end

	auto_actions.weapon = function(item)
		Item.RegisterWeapon(item.name, item.action.model, item.action.ammo)
	end

    Citizen.CreateThread(function()
        while Callbacks == nil do
            Citizen.Wait(100)
        end

        Item._list = Callbacks.Trigger("items:get")

		for name, data in pairs(Item._list) do
			if data.action.type ~= "undefined" then
				data.name = name

				if auto_actions[data.action.type] ~= nil then
					auto_actions[data.action.type](data)

					if data.action.lock_emote ~= nil then
						lockEmote(data.action.emote, data.action.lock_emote)
					end
				end
			end
		end
    end)
end

Item.Get = function(name)
    return Item._list[name]
end

Item.Create = function(name, metadata, quantity, slot)
    if Item.Get(name) == nil then
        return nil
    end

    local item = Functions.DeepCopy(Item.Get(name))

    item.metadata = item.metadata or {}

    for k, v in pairs(metadata) do
        item.metadata[k] = v
    end

    item.metadata.category = item.category
    item.quantity = quantity
    item.slot = slot

    item.category = nil
	item.action = nil

    return item
end

if Config.Env == "client" then

    ---@param name string
    ---@param cb function Should return true if the item can be used, false otherwise
    Item.RegisterUsable = function(name, cb, type)
        Item._usableItems[name] = {
            type = type,
            cb = cb,
        }
    end

	Item.RegisterWeapon = function(name, model, ammo)
        Item._weapons[name] = {
            model = GetHashKey(model),
			ammo = ammo
        }
    end

    Item.IsWeapon = function(name)
        return Item._weapons[name] ~= nil
    end

	Item.GetWeaponNameFromModel = function(model)
        for name, data in pairs(Item._weapons) do
			if data.model == model then
				return name
			end
		end

		return nil
    end

	Item.GetWeaponAmmoFromModel = function(model)
        for name, data in pairs(Item._weapons) do
			if data.model == model then
				return data.ammo
			end
		end

		return nil
    end

    Item.IsUsable = function(name)
        return Item._usableItems[name] ~= nil
    end

    Item.Use = function(item, entity, coords)
        if Item.IsUsable(item.name) then

            if isUsingItem then
                UI:AddNotification("basic", "~r~Vous faites cela trop vite.~s~", "info", 5000)
                return false
            end

            isUsingItem = true
            if Item._usableItems[item.name].cb(item, entity, coords) == true then
                local newItem = Functions.DeepCopy(item)
                newItem.quantity = 1
                player:inventory():removeItem(newItem)
            end
            isUsingItem = false
        end
    end

	Item.RegisterPlacable = function(name, model)
		Item.RegisterUsable(name, function(item, entity, coords)

			if coords == nil then
				coords = GetEntityCoords(PlayerPedId(), true) + GetEntityForwardVector(PlayerPedId()) * 1.5
			end

			if Math.Distance(player:position(), coords) > 2.0 then
				UI:AddNotification("basic", "Vous êtes trop loin", "info", 5000)
				return false
			end

			local netProp = Callbacks.Trigger("entities:createObject", model, coords)

			if netProp == nil then
				UI:AddNotification("basic", "~r~Une erreur s'est produite lors de la création du prop (ServerCallback).~s~", "info", 5000)
				return
			end

            local prop = SharedModules.Entities:WaitForNetworkId(netProp)

			if prop == nil then
				UI:AddNotification("basic", "~r~Une erreur s'est produite lors de la création du prop (LocalCreation).~s~", "info", 5000)
				Events.TriggerServer("entities:delete", netProp)
				return
			end

            if SharedModules.Entities:Control(prop) == false then
				UI:AddNotification("basic", "~r~Une erreur s'est produite lors du création du prop (NetworkControl).~s~", "info", 5000)
				SharedModules.Entities:Delete(prop)
				return
			end

			PlaceObjectOnGroundProperly(prop)
			FreezeEntityPosition(prop, true)
			Events.Trigger('gizmo', prop)

			SharedModules.Entities:SetStatebag(prop, "isPlacedByPlayer", true)
			SharedModules.Entities:SetStatebag(prop, "pickupItem", name)

			return true
		end, "ground")
	end

end

if Config.Env == "server" then
    Events.Register("items:new", function(source, name, label, category, weight, image, action)
        local player = Players.Get(source)

        if player == nil or player:permissions() < Config.Permissions.HM then return end

        local item = Item.Get(name)

        if item ~= nil then
            return
        end

        PerformHttpRequest("https://cdnrv.sysscripts.com/upload", function(statusCode, response, headers)
            if statusCode == 200 then
                MySQL.Async.execute("INSERT INTO items (name, label, weight, category, metadata, action) VALUES (@name, @label, @weight, @category, '{}', @action)", {
                    ["@name"] = name,
                    ["@label"] = label,
                    ["@weight"] = weight,
                    ["@category"] = category,
                    ["@action"] = json.encode(action),
                }, function(rowsChanged)
                    print(rowsChanged)
                    if rowsChanged > 0 then
                        Item._list[name] = {
                            name = name,
                            label = label,
                            weight = weight,
                            category = category,
							action = action
                        }

                        Events.TriggerClient("items:new", -1, name, label, weight, category, action)
                        DB.Variable.Create(("variables.items.%s"):format(name), label, 100)
                    end
                end)
            end
        end, "POST", json.encode({
            url = image,
            filename = ("items/%s"):format(name)
        }), {
            ["Content-Type"] = "application/json",
            ["Authorization"] = "VkZSSmQwc3dUV3RTV0hoR1dERkZjVnA2TlhwYWJsSk1WekZDZEVsV2JFbEpWVkpJWld4Rk5XSXhVWHBYYW14V1VFUkdRbGhZZUROTGJWcDRXVmg0T0ZWcE5EMD0="
        })
    end)

    Events.Register("items:remove", function(source, name)
        local player = Players.Get(source)

        if player == nil or player:permissions() < Config.Permissions.HM then return end

        local item = Item.Get(name)

        if item == nil then
            return
        end

        MySQL.Async.execute("DELETE FROM items WHERE name = @name", {
            ["@name"] = name
        }, function(rowsChanged)
            if rowsChanged > 0 then
                Item._list[name] = nil
                Events.TriggerClient("items:remove", -1, name)
            end
        end)
    end)

    Events.Register("items:update", function(source, item)
        local player = Players.Get(source)

        if player == nil or player:permissions() < Config.Permissions.HM then return end

        if Item.Get(item.name) == nil then
            return
        end

        MySQL.Async.execute("UPDATE items SET label = @label, weight = @weight, category = @category, action = @action WHERE name = @name", {
            ["@name"] = item.name,
            ["@label"] = item.label,
            ["@weight"] = item.weight,
            ["@category"] = item.category,
            ["@action"] = json.encode(item.action),
        }, function(rowsChanged)
            if rowsChanged > 0 then
                Item._list[item.name] = {
                    name = item.name,
                    label = item.label,
                    weight = item.weight,
                    category = item.category,
                    action = item.action
                }
                Events.TriggerClient("items:update", -1, item)
            end
        end)
    end)

    Events.Register("items:changeImage", function(source, name, image)
        local player = Players.Get(source)

        if player == nil or player:permissions() < Config.Permissions.HM then return end

        local item = Item.Get(name)

        if item == nil then
            return
        end

        PerformHttpRequest("https://cdnrv.sysscripts.com/upload", function(statusCode, response, headers)end, "POST", json.encode({
            url = image,
            filename = ("items/%s"):format(name)
        }), {
            ["Content-Type"] = "application/json",
            ["Authorization"] = "VkZSSmQwc3dUV3RTV0hoR1dERkZjVnA2TlhwYWJsSk1WekZDZEVsV2JFbEpWVkpJWld4Rk5XSXhVWHBYYW14V1VFUkdRbGhZZUROTGJWcDRXVmg0T0ZWcE5EMD0="
        })
    end)
else

	Events.Register("items:update", function(source, item)
		Item._list[item.name] = item

		if item.action.type ~= "undefined" and auto_actions[item.action.type] then
			auto_actions[item.action.type](item)

			if item.action.lock_emote ~= nil then
				lockEmote(item.action.emote, item.action.lock_emote)
			end
		end
	end)

    Events.Register("items:new", function(source, name, label, weight, category, action)
        Item._list[name] = {
            name = name,
            label = label,
            weight = weight,
            category = category,
			action = action,
        }
    end)

    Events.Register("items:remove", function(source, name)
        Item._list[name] = nil
    end)
end
