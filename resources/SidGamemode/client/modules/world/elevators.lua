local elevators = {}
local currentElevator = nil
local elevatorMenu = Menus:Create("Ascenseur", "default")

Menus:CreateThread(elevatorMenu, function()
	Menus:IsVisible(elevatorMenu, function()
		if currentElevator == nil then return end

		for id, data in pairs(currentElevator) do
			Menus:AddButton(data.label, false, "", "", function()
				player:position(vector3(data.coords.x, data.coords.y, data.coords.z - 0.95), true)
			end)
		end
	end)
end)

local function CreateMarker(id, point, tp_points)
	return Marker:new({
		name = ("elevator_%d_%s"):format(id, point.label),
		action = "elevator",
		data = tp_points,
		coords = vector3(point.coords.x, point.coords.y, point.coords.z - 0.95),
		onInteract = function(data)
			currentElevator = data
			Menus:Visible(elevatorMenu, true)
		end,
		onLeave = function()
			currentElevator = nil
			Menus:Visible(elevatorMenu, false)
		end,
	})
end

Events.Register("elevator:create", function(source, id, name, tp_points)

    elevators[id] = {
		name = name,
		tp_points = {},
	}

	if type(tp_points) == "string" then
		tp_points = json.decode(tp_points)
	end

	for _, point in pairs(tp_points) do
		table.insert(elevators[id].tp_points, CreateMarker(id, point, tp_points))
	end
end)

Events.Register("elevator:update", function(source, id, name, tp_points)

	for k, marker in pairs(elevators[id].tp_points) do
		marker:delete()
	end

    elevators[id] = {
		name = name,
		tp_points = {},
	}

	if type(tp_points) == "string" then
		tp_points = json.decode(tp_points)
	end

	for _, point in pairs(tp_points) do
		table.insert(elevators[id].tp_points, CreateMarker(id, point, tp_points))
	end
end)

Events.Register("elevator:delete", function(source, id)
    for k, v in pairs(elevators[id].tp_points) do
		v:delete()
		table.remove(elevators[id].tp_points, k)
	end

    elevators[id] = nil
end)

Core.Player:OnLoad(function()
	
    local rawElevators = Callbacks.Trigger("elevator:all")

    if rawElevators == nil then
        return
    end

    for _, rawElevator in pairs(rawElevators) do
		Events.Trigger("elevator:create", rawElevator.id, rawElevator.name, rawElevator.tp_points)
    end

	
end)
