local doors = {}

function GetDoor(entity)
	local doorId = Entity(entity).state.doorId

	if not doorId then return end

	for k, v in pairs(doors) do
		if v.id == doorId then
			return v
		end
	end

	return nil
end

function GetDoorById(id)
	for k, v in pairs(doors) do
		if v.id == id then
			return v
		end
	end

	return nil
end

local function createDoor(door)
	if door.double then
		for i = 1, 2 do
			local id = ("%d_%d"):format(door.id, i)
			AddDoorToSystem(id, door.model, door.double[i].position.x, door.double[i].position.y, door.double[i].position.z, false, false, false)
			DoorSystemSetDoorState(id, 4, false, false)
			DoorSystemSetDoorState(id, door.locked, false, false)
			if door.doorRate or not door.auto then
				DoorSystemSetAutomaticRate(id, door.doorRate or 10.0, false, false)
			end
			if door.holdOpen then
				DoorSystemSetHoldOpen(id, door.locked == 0)
			end
		end
	else
		AddDoorToSystem(door.id, door.model, door.position.x, door.position.y, door.position.z, false, false, false)
		DoorSystemSetDoorState(door.id, 4, false, false)
		DoorSystemSetDoorState(door.id, door.locked, false, false)
		if door.doorRate or not door.auto then
			DoorSystemSetAutomaticRate(door.id, door.doorRate or 10.0, false, false)
		end
		if door.holdOpen then
			DoorSystemSetHoldOpen(door.id, door.locked == 0)
		end
	end
end

Core.Player:OnLoad(function()
	doors = Callbacks.Trigger("doors:all") or {}

	for k, v in pairs(doors) do
		v.position = json.decode(v.position)
		v.double = v.double ~= nil and json.decode(v.double) or nil
		v.model = tonumber(v.model)
	end

	for k, v in pairs(doors) do
		createDoor(v)
	end

	-- Study a grid sort of system to improve performance
	-- TODO: Implement grid system

	Citizen.CreateThread(function()
		while true do
			local position = player:position()

			for k, v in pairs(doors) do
				if Math.Distance(v.position, position) <= 80 then
					if v.double then
						for i = 1, 2 do
							if not v.double[i].entity and IsModelValid(v.double[i].model) then
								local entity = GetClosestObjectOfType(v.double[i].position.x, v.double[i].position.y, v.double[i].position.z, 1.0, v.double[i].model, false, false, false)
								if entity ~= 0 then
									v.double[i].entity = entity
									Entity(entity).state.doorId = v.id
								end
							elseif v.double[i].entity and not DoesEntityExist(v.double[i].entity) then
								v.double[i].entity = nil
							end
						end
					else
						if not v.entity and IsModelValid(v.model) then
							local entity = GetClosestObjectOfType(v.position.x, v.position.y, v.position.z, 1.0, v.model, false, false, false)
							if entity ~= 0 then
								v.entity = entity
								Entity(entity).state.doorId = v.id
							end
						elseif v.entity and not DoesEntityExist(v.entity) then
							v.entity = nil
						end
					end
				end
			end

			Citizen.Wait(1000)
		end
	end)

	Events.Register("doors:create", function(source, door)
		door.position = json.decode(door.position)
		door.double = door.double ~= nil and json.decode(door.double) or nil
		door.model = tonumber(door.model)

		table.insert(doors, door)
		createDoor(door)
	end)

	Events.Register("doors:toggleLock", function(source, id, lock)
		local door = nil

		for k, v in pairs(doors) do
			if v.id == id then
				door = v
				break
			end
		end

		if door == nil then return print(("Trying to toogle door '%s' but the door wasn't found"):format(id)) end

		local double = (door.double ~= nil and true or false)
		door.locked = lock

		if double then
			DoorSystemSetDoorState(("%d_%d"):format(door.id, 1), door.locked, false, false)
			DoorSystemSetDoorState(("%d_%d"):format(door.id, 2), door.locked, false, false)

			if door.holdOpen then
				DoorSystemSetHoldOpen(("%d_%d"):format(door.id, 1), door.locked == 0)
				DoorSystemSetHoldOpen(("%d_%d"):format(door.id, 2), door.locked == 0)
			end

			while door.locked == 1 and (not IsDoorClosed(("%d_%d"):format(door.id, 1)) or not IsDoorClosed(("%d_%d"):format(door.id, 1))) do Citizen.Wait(0) end
		else
			DoorSystemSetDoorState(door.id, door.locked, false, false)

			if door.holdOpen then DoorSystemSetHoldOpen(door.id, door.locked == 0) end
			while door.locked == 1 and not IsDoorClosed(door.id) do Citizen.Wait(0) end
		end
	end)

	Events.Register("doors:update", function(source, door)
		for k, v in pairs(doors) do
			if v.id == door.id then
				if (v.double == nil and door.double ~= nil) or (v.double ~= nil and door.double ~= nil and Table.compare(v.double, door.double))  then
					if v.double then
						if v.double[1].entity then Entity(v.double[1].entity).state.doorId = nil end
						if v.double[1].entity then Entity(v.double[2].entity).state.doorId = nil end
						RemoveDoorFromSystem(("%d_%d"):format(v.id, 1))
						RemoveDoorFromSystem(("%d_%d"):format(v.id, 2))
					else
						if v.entity then Entity(v.entity).state.doorId = nil end
						RemoveDoorFromSystem(v.id)
					end
					table.remove(doors, k)
					createDoor(door)
					return
				end

				if v.doorRate ~= door.doorRate or v.auto ~= door.auto then
					if v.double then
						DoorSystemSetAutomaticRate(("%d_%d"):format(v.id, 1), door.doorRate or 10.0, false, true)
						DoorSystemSetAutomaticRate(("%d_%d"):format(v.id, 2), door.doorRate or 10.0, false, true)
					else
						DoorSystemSetAutomaticRate(v.id, door.doorRate or 10.0, false, true)
					end
					v.doorRate = door.doorRate
					v.auto = door.auto
				end

				if v.locked ~= door.locked then
					if v.double then
						DoorSystemSetDoorState(("%d_%d"):format(v.id, 1), door.locked, false, false)
						DoorSystemSetDoorState(("%d_%d"):format(v.id, 2), door.locked, false, false)
					else
						DoorSystemSetDoorState(v.id, door.locked, false, false)
					end
					v.locked = door.locked
				end

				if v.holdOpen ~= door.holdOpen then
					if v.double then
						DoorSystemSetHoldOpen(("%d_%d"):format(v.id, 1), door.holdOpen)
						DoorSystemSetHoldOpen(("%d_%d"):format(v.id, 2), door.holdOpen)
					else
						DoorSystemSetHoldOpen(v.id, door.holdOpen)
					end
					v.holdOpen = door.holdOpen
				end
				v = door

				break
			end
		end
	end)

	Events.Register("doors:delete", function(source, id)
		for k, v in pairs(doors) do
			if v.id == id then
				if v.double then
					if v.double[1].entity then Entity(v.double[1].entity).state.doorId = nil end
					if v.double[1].entity then Entity(v.double[2].entity).state.doorId = nil end
					RemoveDoorFromSystem(("%d_%d"):format(v.id, 1))
					RemoveDoorFromSystem(("%d_%d"):format(v.id, 2))
				else
					if v.entity then Entity(v.entity).state.doorId = nil end
					RemoveDoorFromSystem(v.id)
				end
				table.remove(doors, k)
				break
			end
		end
	end)
end)
