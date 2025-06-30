local models = { -870868698, 506770882, -1126237515, -1364697528 }

local function isAtm(model)
    for _, v in pairs(models) do
        if v == model then
            return true
        end
    end
    return false
end

local function CreateAtmSubMenu(cards, entity)

    local subMenu = Context:AddSubmenu(0, "Utiliser l'ATM")

    for _, card in pairs(cards) do
        Context:AddItem(subMenu, ("%s (%d)"):format(card.metadata.name or card.label, card.metadata.linkedAccount), function()
            if Math.Distance(player:position(), GetEntityCoords(entity, false)) > 1.5 then
                return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
            end

            Bank.OpenUI(card)
        end, true)
    end
end

local function CreateAtmItem(entity)
    Context:AddItem(0, "Utiliser l'ATM", function()
        if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 1.5 then
            return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
        end

        Bank.OpenUI()
    end, true)
end

Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then
        return
    end

    if not isAtm(GetEntityModel(hitEntity)) then
        return
    end

    local cards = player:inventory():findItems(function(item)
        return item.name == "credit_card"
    end)

    if #cards > 1 then
        CreateAtmSubMenu(cards, hitEntity)
    else
        CreateAtmItem(hitEntity)
    end

	if player:inventory():findItem(function(item)
		return item.name == "nfcscanner"
	end) ~= nil then
		Context:AddItem(0, "Pirater l'ATM", function()
			ClientModules.Illegal.ATMs:StartRobbing(hitEntity)
		end, true)
	end
end)
