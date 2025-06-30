---@type Player | nil
local currentPlayer = nil
local isMenuOpen = false

local baseTattoos = {}
local inkBottlesNeeded = 0

local function resetDefaultTattoos()
	if not currentPlayer then return end

	Events.TriggerServer("player:updateSkin", "tattoos", baseTattoos, currentPlayer:source())
end

Events.Register("tattoo:request", function(src, id)
	UI:Popup("Tatouages", "La personne devant vous aimerait vous tatouer.", {
        text = "Accepter",
        cb = function()
            Events.TriggerServer("tattoo:accept", id)
        end
    }, {
        text = "Refuser",
        cb = function()end
    }, 0)
end)

Events.Register("tattoo:accept", function(src, id)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(id))

	currentPlayer = Core.Player:Get(id, true)

	if not currentPlayer then return end

	baseTattoos = currentPlayer:skin():tattoos()
	inkBottlesNeeded = 0
	isMenuOpen = true;

	UI:Toggle("tattoo", true, {
		playerTattoos = baseTattoos,
		sex = currentPlayer:sex(),
		list = Lists.Tattoos,
	}, true, false, false)

	Citizen.CreateThread(function()
		while isMenuOpen do
			Citizen.Wait(250)
			if Math.Distance(GetEntityCoords(targetPed, true), player:position()) > 2.5 then
				UI:Toggle("tattoo", false, {}, false, false, false)
				resetDefaultTattoos()
				isMenuOpen = false
			end
		end
	end)
end)

UI:RegisterCallback("tattoo:add", function(data, cb)
	if not currentPlayer then return end

	local tattoos = Functions.DeepCopy(currentPlayer:skin():tattoos())

	table.insert(tattoos, data.tattoo)

	currentPlayer:skin()._tattoos = tattoos

	if Table.find(baseTattoos, function(tattoo)
		return tattoo[player:sex() == "m" and "male" or "female"] == data.tattoo[player:sex() == "m" and "male" or "female"]
	end) == nil then
		inkBottlesNeeded += 1
	end

	Events.TriggerServer("player:updateSkin", "tattoos", currentPlayer:skin():tattoos(), currentPlayer:source())

	cb(true)
end)

UI:RegisterCallback("tattoo:remove", function(data, cb)
	if not currentPlayer then return end

	local tattoos = Functions.DeepCopy(currentPlayer:skin():tattoos())

	for k, tattoo in pairs(tattoos) do
		if (tattoo[player:sex() == "m" and "male" or "female"] == data.tattoo[player:sex() == "m" and "male" or "female"]) then
			table.remove(tattoos, k)
		end
	end

	if Table.find(baseTattoos, function(tattoo)
		return tattoo[player:sex() == "m" and "male" or "female"] == data.tattoo[player:sex() == "m" and "male" or "female"]
	end) == nil then
		inkBottlesNeeded -= 1
	end

	currentPlayer:skin()._tattoos = tattoos

	Events.TriggerServer("player:updateSkin", "tattoos", currentPlayer:skin():tattoos(), currentPlayer:source())

	cb(true)
end)

UI:RegisterCallback("tattoo:validate", function(data, cb)
	if not currentPlayer then return end


	UI:Toggle("tattoo", false, {}, false, false, false)
	isMenuOpen = false

	local inkBottles = player:inventory():findItem(function(item)
		return item.name == "tattoo_ink" and item.quantity >= inkBottlesNeeded
	end)

	if inkBottles == nil then
		UI:AddNotification("basic", "~r~Vous n'avez pas assez d'encre sur vous.~s~", "info", 5000)
		resetDefaultTattoos()
		return
	end

	inkBottles.quantity = inkBottlesNeeded
	player:inventory():removeItem(inkBottles)

	cb(true)
end)

UI:RegisterCallback("tattoo:closed", function(data, cb)
	resetDefaultTattoos()
	isMenuOpen = false;
end)
