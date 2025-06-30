---@class Context
---@field Register fun(self: Context, func: fun(screenPosition: { x: number, y: number }, hitSomething: boolean, worldPosition: vector3, hitEntity: integer, normalDirection)): integer
---
---@field AddSeparator fun(self: Context, menuId: integer): integer
---@field AddTextItem fun(self: Context, menuId: integer, title: string): integer
---@field AddItem fun(self: Context, menuId: integer, title: string, func?: fun(), closeOnActivate?: boolean): integer
---@field AddItems fun(self: Context, itemList: table): table<integer>
---@field AddSpriteItem fun(self: Context, menuId: integer, textureDict: string, textureName: string): integer
---@field AddCheckboxItem fun(self: Context, menuId: integer, title: string, checked: boolean): integer
---@field AddSubmenu fun(self: Context, parentMenuId: integer, title: string): integer, integer
---@field AddScrollSubmenu fun(self: Context, parentMenuId: integer, title: string, maxItems: integer): integer, integer
---@field AddPageSubmenu fun(self: Context, parentMenuId: integer, title: string, maxItems: integer): integer, integer
---
---@field OnActivate fun(self: Context, itemId: integer, func: fun())
---@field OnRelease fun(self: Context, itemId: integer, func: fun())
---@field OnValueChanged fun(self: Context, itemId: integer, func: fun())
---@field Enabled fun(self: Context, itemId: integer, enabled: boolean)
---@field CloseOnActivate fun(self: Context, itemId: integer, closeOnActivate: boolean)
---@field RightText fun(self: Context, itemId: integer, text: string): string | nil
local Context = exports["ContextMenu"]

local function isRack(model)
    for _, v in pairs(POOL_RACKS) do
        if v == model then
            return true
        end
    end
    return false
end

local function isTable(model)
    for _, v in pairs(ALLOWED_MODELS) do
        if v == model then
            return true
        end
    end
    return false
end

Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then
		return
	end

	if not isRack(GetEntityModel(hitEntity)) then
		return
	end

	if HasPoolCueInHand then
		Context:AddItem(0, "Poser la queue", function()
			if #(GetEntityCoords(PlayerPedId(), true) - GetEntityCoords(hitEntity, false)) > 2.0 then
				return exports["SidGamemode"]:notify("~r~Trop loin.~s~", 5000, "info")
			end

			TriggerEvent("rcore_pool:target:returnCue")
		end, true)
	else
		Context:AddItem(0, "Prendre une queue", function()
			if #(GetEntityCoords(PlayerPedId(), true) - GetEntityCoords(hitEntity, false)) > 2.0 then
				return exports["SidGamemode"]:notify("~r~Trop loin.~s~", 5000, "info")
			end

			TriggerEvent("rcore_pool:target:takeCue")
		end, true)
	end
end)

Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then
		return
	end

	if not isTable(GetEntityModel(hitEntity)) then
		return
	end

	if ClosestTableAddress and CurrentState == STATE_NONE and HasPoolCueInHand and not TableData[ClosestTableAddress].player and #TableData[ClosestTableAddress].balls > 0 then
		Context:AddItem(0, "Jouer", function()
			if #(GetEntityCoords(PlayerPedId(), true) - GetEntityCoords(hitEntity, false)) > 4.0 then
				return exports["SidGamemode"]:notify("~r~Trop loin.~s~", 5000, "info")
			end

			TriggerEvent("rcore_pool:target:playTable")
		end, true)
	end

	if ClosestTableAddress and CurrentState == STATE_NONE and HasPoolCueInHand and not TableData[ClosestTableAddress].player then
		Context:AddItem(0, "Installer: Classique", function()
			if #(GetEntityCoords(PlayerPedId(), true) - GetEntityCoords(hitEntity, false)) > 4.0 then
				return exports["SidGamemode"]:notify("~r~Trop loin.~s~", 5000, "info")
			end

			TriggerEvent("rcore_pool:target:setupStraightPool")
		end, true)

		Context:AddItem(0, "Installer: 9 ball", function()
			if #(GetEntityCoords(PlayerPedId(), true) - GetEntityCoords(hitEntity, false)) > 4.0 then
				return exports["SidGamemode"]:notify("~r~Trop loin.~s~", 5000, "info")
			end

			TriggerEvent("rcore_pool:target:setup8ball")
		end, true)
	end
end)

AddEventHandler('rcore_pool:target:playTable', function()
    if ClosestTableAddress then
        RequestPlayTable(ClosestTableAddress)
    else
        print("ERROR: NO CLOSEST TABLE")
    end
end)
AddEventHandler('rcore_pool:target:setupStraightPool', function()
    TriggerEvent('rcore_pool:setupTable', 'BALL_SETUP_STRAIGHT_POOL')
end)
AddEventHandler('rcore_pool:target:setup8ball', function()
    TriggerEvent('rcore_pool:setupTable', 'BALL_SETUP_9_BALL')
end)

AddEventHandler('rcore_pool:target:takeCue', function()
    TriggerServerEvent('rcore_pool:requestPoolCue')
end)

AddEventHandler('rcore_pool:target:returnCue', function()
    TriggerServerEvent('rcore_pool:requestRemoveCue')
end)