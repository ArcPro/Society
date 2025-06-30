local function CreatePropertyMarker(property)
    if type(property.position) == "string" then
        property.position = json.decode(property.position)
    end

    Marker:new({
        coords = vector3(property.position.x, property.position.y, property.position.z),
		textureName = "marker_property",
        name = ("property_%d"):format(property.id),
        action = "property",
        onInteract = function ()
            Events.Trigger("property:menu", property.id, true)
        end,
        onLeave = function ()
            Events.Trigger("property:menu", property.id, false)
        end,
    })
end

function HasPropertyKeys(property, society, group)

	if society ~= nil and player:job().id == society then
		return true
	end

	if group ~= nil and player:group() == group then
		return true
	end

    return player:inventory():findItem(function(item)
        return item.name == "house_keys" and item.metadata.instance == property
    end) ~= nil
end

Core.Player:OnLoad(function()
	
    local properties = Callbacks.Trigger("property:all")

    if properties == nil then
        return
    end

    for _, property in pairs(properties) do
        CreatePropertyMarker(property)
    end
	
end)

Events.Register("property:create", function(source, property)
    CreatePropertyMarker(property)
end)

Events.Register("property:delete", function(source, property)
    local marker = Markers.Get(("property_%d"):format(property))

	if marker then
		marker:delete()
	end
end)

Events.Register("property:enter", function(source, property)
	local marker = Markers.Get(("property_%d"):format(property.id))
    local coords = Config.Properties[property.type].position
    local storage = Config.Properties[property.type].storage

    DoScreenFadeOut(500)
    Utils.RealWait(500)

	player:position(vector4(coords.x, coords.y, coords.z, coords.w), true)
    DoScreenFadeIn(500)

    if marker ~= nil then
        marker:onLeave()()
    end

    Marker:new({
        coords = vector3(coords.x, coords.y, coords.z),
		textureName = "marker_property",
        name = "property:leave",
        action = "property",
		bucket = property.id,
        onInteract = function ()
            Events.Trigger("property:menu", property.id, true)
        end,
        onLeave = function ()
            Events.Trigger("property:menu", property.id, false)
        end,
    })

	if storage then
		Marker:new({
			coords = vector3(storage.x, storage.y, storage.z),
			textureName = "marker_chest",
			name = "property:storage",
			action = "inventory",
			bucket = property.id,
			onInteract = function()
				Markers.functions.inventory.open({ inventoryId = property.inventory_id })
			end,
			onLeave = function()
				Markers.functions.inventory.close()
			end,
		})
	end
end)

Events.Register("property:leave", function(source, property)
    DoScreenFadeOut(500)
    Citizen.Wait(500)
    DoScreenFadeIn(500)

    player:position(vector3(property.position.x, property.position.y, property.position.z), true)

    local leave_marker = Markers.Get("property:leave")
    local storage_marker = Markers.Get("property:storage")

    if leave_marker ~= nil then
        leave_marker:onLeave()()
        leave_marker:delete()
    end

    if storage_marker ~= nil then
        storage_marker:onLeave()()
        storage_marker:delete()
    end
end)
