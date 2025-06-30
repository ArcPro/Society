
Players = {
    ---@type table<number, Player>
    _list = {}
}

---@param id number | nil
---@return Player | nil
Players.Get = function(id)
    if not id then
        return nil
    end

    return Players._list[id]
end

---@param fn function
---@return Player | nil
Players.Find = function(fn)
    for _, player in pairs(Players._list) do
        if fn(player) then
            return player
        end
    end

    return nil
end

Players.GetNearest = function(source, distance)
    local sourceCoords = GetEntityCoords(GetPlayerPed(source), true)
	local sourceBucket = GetPlayerRoutingBucket(source)
    local nearest = nil

    for _, player in pairs(Players._list) do
        if player:source() ~= source then
            local dist = Math.Distance(sourceCoords, GetEntityCoords(GetPlayerPed(player:source()), true))
            if dist <= distance and sourceBucket == GetPlayerRoutingBucket(player:source()) then
                nearest = player
                distance = dist
            end
        end
    end

    return nearest
end

Players.GetInRange = function(src, range)
	local sourcePlayer = Players.Get(src)
    local players = {}

	if sourcePlayer == nil then
		return {}
	end

    for _, player in pairs(Players._list) do
        if player:loaded() then
            if Math.Distance(sourcePlayer:position(), GetEntityCoords(GetPlayerPed(player:source()), true)) <= range and GetPlayerRoutingBucket(player:source()) == GetPlayerRoutingBucket(src) then
                table.insert(players, player)
            end
        end
    end

    return players
end

Players.GetFromPed = function(pedId)
	for _, player in pairs(Players._list) do
		if GetPlayerPed(player:source()) == pedId then
			return player
		end
	end

	return nil
end

Players.SaveAll = function ()
	for k, player in pairs(Players._list) do
		DB.Player.UpdateCharacter(player)
		Citizen.Wait(0)
	end
end

Citizen.CreateThread(function()
	local ped = nil;

    while true do
        Citizen.Wait(1000)

        for _, player in pairs(Players._list) do
            if player:loaded() then
				ped = GetPlayerPed(player:source())

				if DoesEntityExist(ped) then
					player:position(GetEntityCoords(GetPlayerPed(player:source()), true))
					player:alcohol(OnesyncPlayer(player:source()).state.alcohol)
					player:hunger(OnesyncPlayer(player:source()).state.hunger)
					player:thirst(OnesyncPlayer(player:source()).state.thirst)
					player:drugs(OnesyncPlayer(player:source()).state.drugs)
					player:health(GetEntityHealth(ped) - 100)
				end
            end
        end
    end
end)
