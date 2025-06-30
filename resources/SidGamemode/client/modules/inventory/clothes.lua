ClientModules = ClientModules or {}
ClientModules.Inventory = ClientModules.Inventory or {}

---@param item Item
---@return { clothes: { componentIds: table, components: table, variations: {} }, props: { componentIds: table, components: table, variations: {} } }
function ClientModules.Inventory:ParseClothe(item)
	local data = {
		clothes = {
			componentIds = {},
			components = {},
			variations = {},
		},
		props = {
			componentIds = {},
			components = {},
			variations = {},
		}
	}


	if item.metadata.isProp == true then
		table.insert(data.props.componentIds, item.metadata.componentId)
		table.insert(data.props.components, item.metadata.component)
		table.insert(data.props.variations, item.metadata.variation)
	else
		table.insert(data.clothes.componentIds, item.metadata.componentId)
		table.insert(data.clothes.components, item.metadata.component)
		table.insert(data.clothes.variations, item.metadata.variation)
	end

	return data
end

---@param ped Entity
---@param sex "m" | "f"
---@param index integer
---@param isProp boolean
---@return { component: integer, variation: integer } | nil
local function getCurrentComponentData(ped, sex, index, isProp)

	local data = nil

	if isProp then
		data = { component = GetPedPropIndex(ped, index), variation = GetPedPropTextureIndex(ped, index) }

		if data.component == -1 then
			data = nil
		end
	else
		data = { component = GetPedDrawableVariation(ped, index), variation = GetPedTextureVariation(ped, index) }

		if data.component == Lists.Variations.Naked[sex][index] then
			data = nil
		end
	end

	return data
end

---@param item Item
---@param toggle boolean
---@return boolean
local function handleUseOutfitItem(item, toggle)
	local ped = PlayerPedId()
	local outfit = {
		components = {
			[Lists.Variations.Clothes.MASK]			= { GetPedDrawableVariation(ped, Lists.Variations.Clothes.MASK), GetPedTextureVariation(ped, Lists.Variations.Clothes.MASK) },
			[Lists.Variations.Clothes.DECALS]		= { GetPedDrawableVariation(ped, Lists.Variations.Clothes.DECALS), GetPedTextureVariation(ped, Lists.Variations.Clothes.DECALS) },
			[Lists.Variations.Clothes.TSHIRT]		= { GetPedDrawableVariation(ped, Lists.Variations.Clothes.TSHIRT), GetPedTextureVariation(ped, Lists.Variations.Clothes.TSHIRT) },
			[Lists.Variations.Clothes.UNDERSHIRT]	= { GetPedDrawableVariation(ped, Lists.Variations.Clothes.UNDERSHIRT), GetPedTextureVariation(ped, Lists.Variations.Clothes.UNDERSHIRT) },
			[Lists.Variations.Clothes.PANTS]		= { GetPedDrawableVariation(ped, Lists.Variations.Clothes.PANTS), GetPedTextureVariation(ped, Lists.Variations.Clothes.PANTS) },
			[Lists.Variations.Clothes.SHOES]		= { GetPedDrawableVariation(ped, Lists.Variations.Clothes.SHOES), GetPedTextureVariation(ped, Lists.Variations.Clothes.SHOES) },
			[Lists.Variations.Clothes.SCARF]		= { GetPedDrawableVariation(ped, Lists.Variations.Clothes.SCARF), GetPedTextureVariation(ped, Lists.Variations.Clothes.SCARF) },
			[Lists.Variations.Clothes.KEVLAR]		= { GetPedDrawableVariation(ped, Lists.Variations.Clothes.KEVLAR), GetPedTextureVariation(ped, Lists.Variations.Clothes.KEVLAR) },
			[Lists.Variations.Clothes.TORSO]		= { GetPedDrawableVariation(ped, Lists.Variations.Clothes.TORSO), GetPedTextureVariation(ped, Lists.Variations.Clothes.TORSO) },
			[Lists.Variations.Clothes.BACKPACK]		= { GetPedDrawableVariation(ped, Lists.Variations.Clothes.BACKPACK), GetPedTextureVariation(ped, Lists.Variations.Clothes.BACKPACK) },
		},

		props = {
			[Lists.Variations.Props.HAT] 			= { GetPedPropIndex(ped, Lists.Variations.Props.HAT), GetPedPropTextureIndex(ped, Lists.Variations.Props.HAT) },
			[Lists.Variations.Props.GLASSES]		= { GetPedPropIndex(ped, Lists.Variations.Props.GLASSES), GetPedPropTextureIndex(ped, Lists.Variations.Props.GLASSES) },
			[Lists.Variations.Props.EARS]			= { GetPedPropIndex(ped, Lists.Variations.Props.EARS), GetPedPropTextureIndex(ped, Lists.Variations.Props.EARS) },
			[Lists.Variations.Props.BRACELET]		= { GetPedPropIndex(ped, Lists.Variations.Props.BRACELET), GetPedPropTextureIndex(ped, Lists.Variations.Props.BRACELET) },
			[Lists.Variations.Props.WATCH]			= { GetPedPropIndex(ped, Lists.Variations.Props.WATCH), GetPedPropTextureIndex(ped, Lists.Variations.Props.WATCH) }
		},
	}

	ClientModules.Misc.Animations:Play("adjust")

	if toggle == false then
		local naked = Lists.Variations.NakedOutfits[player:sex()]

		if Lists.BulletProofs[player:sex()][outfit.components[Lists.Variations.Clothes.KEVLAR][1]] ~= nil then
			naked.components[Lists.Variations.Clothes.KEVLAR] = outfit.components[Lists.Variations.Clothes.KEVLAR]
		end

		player:skin():outfit(naked)
		item.metadata.outfit = outfit
	else
		if player:metadata().useOutfit ~= true then
			local componentId, isProp = nil, false
			for k, v in pairs(ClientModules.Inventory:GetCurrentOutfit()) do
				if v ~= nil and k ~= "outfit" then
					componentId = Lists.Variations.Clothes[k:upper()]

					if componentId == nil then
						componentId = Lists.Variations.Props[k:upper()]
						isProp = true
					end

					if (
						componentId == Lists.Variations.Clothes.KEVLAR and Lists.BulletProofs[player:sex()][v.component] == nil
						or componentId ~= Lists.Variations.Clothes.KEVLAR
						or isProp == true
					) then
						player:inventory():addItem(Item.Create(k, { component = v.component, variation = v.variation, componentId = componentId, isProp = isProp }, 1))
					end
				end
			end
		end

		player:skin():outfit(item.metadata.outfit)
	end


	player:metadata().useOutfit = toggle

	Events.TriggerServer("player:updateSkin", "outfit", player:skin():outfit())
	Events.TriggerServer("player:update", "metadata", player:metadata())

	Utils.Clone.UpdatePed()

	return true
end

function ClientModules.Inventory:GetCurrentOutfit()
	local ped = PlayerPedId()
	local sex = GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") and "m" or "f"

	return {
		hat 		= getCurrentComponentData(ped, sex, Lists.Variations.Props.HAT, true),
		mask 		= getCurrentComponentData(ped, sex, Lists.Variations.Clothes.MASK, false),
		glasses 	= getCurrentComponentData(ped, sex, Lists.Variations.Props.GLASSES, true),
		decals 		= getCurrentComponentData(ped, sex, Lists.Variations.Clothes.DECALS, false),
		tshirt 		= getCurrentComponentData(ped, sex, Lists.Variations.Clothes.TSHIRT, false),
		undershirt 	= getCurrentComponentData(ped, sex, Lists.Variations.Clothes.UNDERSHIRT, false),
		pants 		= getCurrentComponentData(ped, sex, Lists.Variations.Clothes.PANTS, false),
		shoes 		= getCurrentComponentData(ped, sex, Lists.Variations.Clothes.SHOES, false),
		ears 		= getCurrentComponentData(ped, sex, Lists.Variations.Props.EARS, true),
		scarf 		= getCurrentComponentData(ped, sex, Lists.Variations.Clothes.SCARF, false),
		kevlar 		= getCurrentComponentData(ped, sex, Lists.Variations.Clothes.KEVLAR, false),
		torso 		= getCurrentComponentData(ped, sex, Lists.Variations.Clothes.TORSO, false),
		backpack 	= getCurrentComponentData(ped, sex, Lists.Variations.Clothes.BACKPACK, false),
		bracelet 	= getCurrentComponentData(ped, sex, Lists.Variations.Props.BRACELET, true),
		watch 		= getCurrentComponentData(ped, sex, Lists.Variations.Props.WATCH, true),
		outfit 		= player:metadata().useOutfit == true,
	}
end

---@param item Item
---@param toggle boolean
---@return boolean
function ClientModules.Inventory:HandleOutfitUpdate(item, toggle)
	local outfit = Functions.DeepCopy(player:skin():outfit())
	local changes = self:ParseClothe(item)

	if item.metadata.sex ~= nil and player:sex() ~= item.metadata.sex then
		UI:AddNotification("basic", "~r~Vous ne pouvez pas équiper un vêtement du sexe opposé.~s~", "info", 5000)
		return false
	end

	if item.name == "outfit" then
		return handleUseOutfitItem(item, toggle)
	end

	if item.metadata.sex == nil then
		item.metadata.sex = player:sex()
	end

	if item.metadata.componentId == Lists.Variations.Clothes.KEVLAR and Lists.BulletProofs[player:sex()][item.metadata.component] ~= nil then
		local bulletProofLevel = Lists.BulletProofs[player:sex()][item.metadata.component]

		if item.metadata.armor ~= nil then
			bulletProofLevel = item.metadata.armor
		end

		if toggle then
			player:armor(bulletProofLevel)
		else
			bulletProofLevel = player:armor()
			player:armor(0)
		end

		item.metadata.armor = bulletProofLevel
	end

	ClientModules.Misc.Animations:Play('adjust')

	for i=1, #changes.props.componentIds do
		if toggle then
			outfit.props[tostring(changes.props.componentIds[i])] = { changes.props.components[i], changes.props.variations[i] }
		else
			outfit.props[tostring(changes.props.componentIds[i])] = { -1, 0 }
		end
	end

	for i=1, #changes.clothes.componentIds do
        if toggle then
            outfit.components[changes.clothes.componentIds[i]] = { changes.clothes.components[i], changes.clothes.variations[i] }
        else
            outfit.components[changes.clothes.componentIds[i]] = { Lists.Variations.Naked[player:sex()][changes.clothes.componentIds[i]], 0 }
        end
    end

    player:skin():outfit(outfit)

    Events.TriggerServer('player:updateSkin', 'outfit', player:skin():outfit())

    Utils.Clone.UpdatePed();

	self:Refresh()

	return true
end

function ClientModules.Inventory:GetCurrentComponent(name)

	if name == "outfit" then
		if player:metadata().useOutfit == true then
			return {}
		else
			return nil
		end
	end

	local ped = PlayerPedId()
	local sex = GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") and "m" or "f"

	local componentId, isProp = Lists.Variations.Clothes[name:upper()], false

	if componentId == nil then
		componentId = Lists.Variations.Props[name:upper()]
		isProp = true
	end

	return getCurrentComponentData(ped, sex, componentId, isProp)
end
