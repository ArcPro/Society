local currentVariations = {}
local isFree = false

local function UpdateCloneVariation(component, drawable, step)
    local componentId = Lists.Variations.Clothes[component:upper()]
    local isProp = false
    local max = 0

    if componentId == nil then
        componentId = Lists.Variations.Props[component:upper()]
        isProp = true
    end

    if currentVariations[component] == nil then
        currentVariations[component] = 0
    end

    if isProp then
		max = GetNumberOfPedPropTextureVariations(Utils.Clone.ped, componentId, drawable)
	else
		max = GetNumberOfPedTextureVariations(Utils.Clone.ped, componentId, drawable)
	end
    currentVariations[component] = currentVariations[component] + step

    if currentVariations[component] < 0 then
        currentVariations[component] = max
    elseif currentVariations[component] > max then
        currentVariations[component] = 0
    end

    Utils.Clone.ApplyOutfit(componentId, drawable, currentVariations[component], isProp)
end

Events.Register("cloakroom:toggle", function(source, allowedClothes, free, toggle)
    local data = {}

	if free ~= true then
		free = false
	end

	isFree = free

    for category, list in pairs(allowedClothes) do
        data[category] = {}

        for k, item in pairs(list) do
            table.insert(data[category], {
                price = isFree == true and 0 or (Lists.ClothesPrice[player:sex()][category] or 0),
				displayVariation = item.variation,
                component = item.component,
            })
        end
    end

	SetGameplayCamRelativePitch(0.0, 1.0)

    UI:Toggle("cloakroom", toggle, {
        sex = player:sex(),
        allowed = data,
    }, toggle, false, false)

    ToggleRadar(not toggle)

    if toggle then
        Utils.Clone.Create(2.25, 0.5, 0.5, 2)

        for k, v in pairs(Lists.Variations.Naked[player:sex()]) do
            Utils.Clone.ApplyOutfit(k, v, 0, false)
        end

        ClearAllPedProps(Utils.Clone.ped)
    else
        Utils.Clone.Destroy()
    end
end)

UI:RegisterCallback("cloakroom:changeComponent", function(data, cb)
    local componentId = Lists.Variations.Clothes[data.category:upper()]
    local isProp = false

    if (componentId == nil) then
        componentId = Lists.Variations.Props[data.category:upper()]
        isProp = true
    end

	currentVariations[data.category] = data.defaultVariation or 0

    Utils.Clone.ApplyOutfit(componentId, data.component, currentVariations[data.category], isProp)
    cb(true)
end)

UI:RegisterCallback("cloakroom:changeVariation", function(data, cb)
    UpdateCloneVariation(data.category, data.component, data.value)
    cb(true)
end)

UI:RegisterCallback("cloakroom:closed", function(data, cb)
    Utils.Clone.Destroy()
	ToggleRadar(true)
	isFree = false
    cb(true)
end)

UI:RegisterCallback("cloakroom:rotate", function(data, cb)
	Utils.Clone.heading += data.value * 2
    cb(true)
end)

UI:RegisterCallback("cloakroom:validate", function(data, cb)
	local count, price = 0, 0
	local outfitsWeight = 0.0
    local componentId = nil
	for k, v in pairs(data) do
		price += Lists.ClothesPrice[player:sex()][k] or 0
		outfitsWeight += (Item.Get(k) or { weight = 0.0 }).weight
		count += 1
    end

	if isFree then
		price = 0
	end

	if (
		player:inventory():max_weight() - player:inventory():weight() < outfitsWeight
		or player:inventory():freeSlots("clothes") < count
	) then
		UI:AddNotification("basic", "~r~Pas assez de place.~s~", "info", 5000)
		return
	end

	Events.Trigger("cloakroom:toggle", {}, false, false)

	PaymentPopup(price, function()
		for k, v in pairs(data) do
			componentId = Lists.Variations.Clothes[k:upper()]

			player:inventory():addItem(Item.Create(k, {
				componentId = componentId or Lists.Variations.Props[k:upper()],
				variation = currentVariations[k] or 0,
				isProp = componentId == nil,
				component = v.component,
				sex = player:sex(),
			}, 1))
		end

		UI:AddNotification("basic", "Vous avez acheté des vêtements", "info", 5000)
	end, {type = "card", iban = "Vetements"})

    cb(true)
end)
