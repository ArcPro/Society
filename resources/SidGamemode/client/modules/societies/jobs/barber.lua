---@type Player | nil
local currentPlayer = nil
local isMenuOpen = false
local selectedType = nil

local baseData = {
	cuts = {
		eyebrowsOpacity = 0.0,
		beardOpacity = 0.0,
		eyebrows = 0,
		tiedHair = 0,
		beard = 0,
		scalp = 0,
		hair = 0,
	},

	colors = {
		hairAccent = 0,
		eyebrows = 0,
		beard = 0,
		hair = 0,
	},

	isTied = false
}

local function resetDefaultData()
	if currentPlayer == nil then return end

	currentPlayer:skin():eyebrows().opacity = baseData.cuts.eyebrowsOpacity
	currentPlayer:skin():beard().opacity = baseData.cuts.beardOpacity

	currentPlayer:skin():eyebrows().component = baseData.cuts.eyebrows
	currentPlayer:skin():hair().tiedComponent = baseData.cuts.tiedHair
	currentPlayer:skin():beard().component = baseData.cuts.beard
	currentPlayer:skin():scalp().component = baseData.cuts.scalp
	currentPlayer:skin():hair().component = baseData.cuts.hair

	currentPlayer:skin():hair().highlightColor = baseData.colors.hairAccent
	currentPlayer:skin():eyebrows().color = baseData.colors.eyebrows
	currentPlayer:skin():beard().color = baseData.colors.beard
	currentPlayer:skin():hair().color = baseData.colors.hair

	currentPlayer:skin():hair().isTied = baseData.isTied

	Events.TriggerServer("player:updateSkin", "eyebrows", currentPlayer:skin():eyebrows(), currentPlayer:source())
	Events.TriggerServer("player:updateSkin", "beard", currentPlayer:skin():beard(), currentPlayer:source())
	Events.TriggerServer("player:updateSkin", "scalp", currentPlayer:skin():scalp(), currentPlayer:source())
	Events.TriggerServer("player:updateSkin", "hair", currentPlayer:skin():hair(), currentPlayer:source())
end

Events.Register("barber:request", function(src, type, id)
	local message = "La personne devant vous aimerait changer votre coupe de cheveux."

	if type == "colors" then
		message = "La personne devant vous aimerait changer votre couleur de cheveux."
	end

	UI:Popup("Cheveux", message, {
        text = "Accepter",
        cb = function()
            Events.TriggerServer("barber:accept", type, id)
        end
    }, {
        text = "Refuser",
        cb = function()end
    }, 0)
end)

Events.Register("barber:accept", function(src, type, id)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(id))

	currentPlayer = Core.Player:Get(id, true)

	selectedType = type

	if not currentPlayer then return end

	baseData.cuts.eyebrowsOpacity = currentPlayer:skin():eyebrows().opacity
	baseData.cuts.beardOpacity = currentPlayer:skin():beard().opacity

	baseData.cuts.eyebrows = currentPlayer:skin():eyebrows().component
	baseData.cuts.tiedHair = currentPlayer:skin():hair().tiedComponent
	baseData.cuts.beard = currentPlayer:skin():beard().component
	baseData.cuts.scalp = currentPlayer:skin():scalp().component
	baseData.cuts.hair = currentPlayer:skin():hair().component

	baseData.colors.hairAccent = currentPlayer:skin():hair().highlightColor
	baseData.colors.eyebrows = currentPlayer:skin():eyebrows().color
	baseData.colors.beard = currentPlayer:skin():beard().color
	baseData.colors.hair = currentPlayer:skin():hair().color

	baseData.isTied = currentPlayer:skin():hair().isTied == true

	isMenuOpen = true;

	local data = {}

	if type == "haircuts" then
		data = {
			sex = currentPlayer:sex(),
			current = baseData.cuts,
			max = {
				hair = GetNumberOfPedDrawableVariations(targetPed, 2),
				eyebrows = GetPedHeadOverlayNum(2),
				beard = GetPedHeadOverlayNum(1),
				scalp = #Lists.Scalps,
			}
		}
	else
		data = baseData.colors
	end

	UI:Toggle("barber", true, { type = type, data = data }, true, false, false)

	Citizen.CreateThread(function()
		while isMenuOpen do
			Citizen.Wait(250)
			if Math.Distance(GetEntityCoords(targetPed, true), player:position()) > 2.5 then
				UI:Toggle("barber", false, {}, false, false, false)
				resetDefaultData()
				isMenuOpen = false
			end
		end
	end)
end)

UI:RegisterCallback("barber:changeCut", function(data, cb)
	if not currentPlayer then return end

	if data.hair then
		currentPlayer:skin():hair().component = data.hair
		currentPlayer:skin():hair().isTied = false
		Events.TriggerServer("player:updateSkin", "hair", currentPlayer:skin():hair(), currentPlayer:source())
	elseif data.tiedHair then
		currentPlayer:skin():hair().tiedComponent = data.tiedHair
		currentPlayer:skin():hair().isTied = true
		Events.TriggerServer("player:updateSkin", "hair", currentPlayer:skin():hair(), currentPlayer:source())
	elseif data.scalp then
		currentPlayer:skin():scalp().component = data.scalp
		Events.TriggerServer("player:updateSkin", "scalp", currentPlayer:skin():scalp(), currentPlayer:source())
	elseif data.eyebrows then
		currentPlayer:skin():eyebrows().component = data.eyebrows
		Events.TriggerServer("player:updateSkin", "eyebrows", currentPlayer:skin():eyebrows(), currentPlayer:source())
	elseif data.beard then
		currentPlayer:skin():beard().component = data.beard
		Events.TriggerServer("player:updateSkin", "beard", currentPlayer:skin():beard(), currentPlayer:source())
	elseif data.eyebrowsOpacity then
		currentPlayer:skin():eyebrows().opacity = data.eyebrowsOpacity
		Events.TriggerServer("player:updateSkin", "eyebrows", currentPlayer:skin():eyebrows(), currentPlayer:source())
	elseif data.beardOpacity then
		currentPlayer:skin():beard().opacity = data.beardOpacity
		Events.TriggerServer("player:updateSkin", "beard", currentPlayer:skin():beard(), currentPlayer:source())
	end

	cb(true)
end)

UI:RegisterCallback("barber:changeColor", function(data, cb)
	if not currentPlayer then return end

	if data.hair then
		currentPlayer:skin():hair().color = data.hair
		Events.TriggerServer("player:updateSkin", "hair", currentPlayer:skin():hair(), currentPlayer:source())
	elseif data.hairAccent then
		currentPlayer:skin():hair().highlightColor = data.hairAccent
		Events.TriggerServer("player:updateSkin", "hair", currentPlayer:skin():hair(), currentPlayer:source())
	elseif data.beard then
		currentPlayer:skin():beard().color = data.beard
		Events.TriggerServer("player:updateSkin", "beard", currentPlayer:skin():beard(), currentPlayer:source())
	elseif data.eyebrows then
		currentPlayer:skin():eyebrows().color = data.eyebrows
		Events.TriggerServer("player:updateSkin", "eyebrows", currentPlayer:skin():eyebrows(), currentPlayer:source())
	end

	cb(true)
end)

UI:RegisterCallback("barber:validate", function(data, cb)
	if not currentPlayer then return end

	if selectedType == "haircuts" then
		baseData.cuts.eyebrowsOpacity = currentPlayer:skin():eyebrows().opacity
		baseData.cuts.beardOpacity = currentPlayer:skin():beard().opacity

		baseData.cuts.eyebrows = currentPlayer:skin():eyebrows().component
		baseData.cuts.tiedHair = currentPlayer:skin():hair().tiedComponent
		baseData.cuts.beard = currentPlayer:skin():beard().component
		baseData.cuts.scalp = currentPlayer:skin():scalp().component
		baseData.cuts.hair = currentPlayer:skin():hair().component
	elseif selectedType == "colors" then
		local hairColorant = player:inventory():findItem(function(item)
			return item.name == "hair_colorant"
		end)

		local neededColorantBottles = 0

		if not hairColorant then
			UI:AddNotification("basic", "~r~Vous n'avez pas de colorant sur vous~s~", "info", 5000)
			return
		end

		if baseData.colors.beard ~= currentPlayer:skin():beard().color then
			neededColorantBottles += 1;
		end

		if baseData.colors.hair ~= currentPlayer:skin():hair().color then
			neededColorantBottles += 1;
		end

		if baseData.colors.hairAccent ~= currentPlayer:skin():hair().highlightColor then
			neededColorantBottles += 1;
		end

		if baseData.colors.eyebrows ~= currentPlayer:skin():eyebrows().color then
			neededColorantBottles += 1;
		end

		if neededColorantBottles == 0 then
			return resetDefaultData()
		end

		if hairColorant.quantity < neededColorantBottles then
			UI:AddNotification("basic", "~r~Vous n'avez pas assez de colorant sur vous.~s~", "info", 5000)
			resetDefaultData()
			return
		end

		hairColorant.quantity = neededColorantBottles
		if player:inventory():removeItem(hairColorant) == false then
			UI:AddNotification("basic", "~r~Une erreur s'est produite~s~", "info", 5000)
			resetDefaultData()
			return
		end

		baseData.colors.hairAccent = currentPlayer:skin():hair().highlightColor
		baseData.colors.eyebrows = currentPlayer:skin():eyebrows().color
		baseData.colors.beard = currentPlayer:skin():beard().color
		baseData.colors.hair = currentPlayer:skin():hair().color
	end

	UI:Toggle("barber", false, {}, false, false, false)
	resetDefaultData()
	cb(true)
end)

UI:RegisterCallback("barber:closed", function(data, cb)
	resetDefaultData();
	isMenuOpen = false;
end)
