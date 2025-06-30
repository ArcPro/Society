Utils = Utils or {}
Utils.Streaming = {}

-- yoink, credits to https://github.com/overextended/ox_lib/blob/master/resource/streaming/client.lua

local function request(native, hasLoaded, requestType, name, timeout)
    native(name)

    if coroutine.running() then
        if not timeout then
            timeout = 500
        end

        for i = 1, timeout do
            Citizen.Wait(0)
            if hasLoaded(name) then
                return name
            end
        end
    end

    return name
end

---Load an animation dictionary. When called from a thread, it will yield until it has loaded.
---@param animDict string
---@param timeout number? Number of ticks to wait for the dictionary to load. Default is 500.
---@return string? animDict
function Utils.Streaming.RequestAnimDict(animDict, timeout)

	if animDict == nil then return end

    if HasAnimDictLoaded(animDict) then return animDict end

    if not DoesAnimDictExist(animDict) then
        Console.Error(("Attempted to load invalid animDict (%s)"):format(animDict))
        return nil
    end

    return request(RequestAnimDict, HasAnimDictLoaded, 'animDict', animDict, timeout), nil
end

---Load an animation clipset. When called from a thread, it will yield until it has loaded.
---@param animSet string
---@param timeout number? Number of ticks to wait for the clipset to load. Default is 500.
---@return string? animSet
function Utils.Streaming.RequestAnimSet(animSet, timeout)
    if HasAnimSetLoaded(animSet) then return animSet end
    return request(RequestAnimSet, HasAnimSetLoaded, 'animSet', animSet, timeout)
end

---Load a model. When called from a thread, it will yield until it has loaded.
---@param model number
---@param timeout number? Number of ticks to wait for the model to load. Default is 500.
---@return number? model
function Utils.Streaming.RequestModel(model, timeout)
    if not tonumber(model) then model = joaat(model) end
    if HasModelLoaded(model) then return model end

    if not IsModelValid(model) then
        return nil
    end

    return request(RequestModel, HasModelLoaded, 'model', model, timeout)
end

---Load a texture dictionary. When called from a thread, it will yield until it has loaded.
---@param textureDict string
---@param timeout number? Number of ticks to wait for the dictionary to load. Default is 500.
---@return string? textureDict
function Utils.Streaming.RequestStreamedTextureDict(textureDict, timeout)
    if HasStreamedTextureDictLoaded(textureDict) then return textureDict end
    return request(RequestStreamedTextureDict, HasStreamedTextureDictLoaded, 'textureDict', textureDict, timeout)
end

---Load a named particle effect. When called from a thread, it will yield until it has loaded.
---@param fxName string
---@param timeout number? Number of ticks to wait for the particle effect to load. Default is 500.
---@return string? fxName
function Utils.Streaming.RequestNamedPtfxAsset(fxName, timeout)
    if HasNamedPtfxAssetLoaded(fxName) then return fxName end
    return request(RequestNamedPtfxAsset, HasNamedPtfxAssetLoaded, 'fxName', fxName, timeout)
end

---Load the collisions around a given entity
---@param entity Entity
---@return boolean success
function Utils.Streaming.LoadCollisionsAroundEntity(entity)
	local coords = GetEntityCoords(entity, false)
	local timer = GetGameTimer() + 5000

	SetFocusPosAndVel(coords.x, coords.y, coords.z, 0.0, 0.0, 0.0)

    while not HasCollisionLoadedAroundEntity(entity) do
		if GetGameTimer() > timer then
			break
		end

		RequestCollisionAtCoord(coords.x, coords.y, coords.z)
		Citizen.Wait(100)
	end

	ClearFocus()

	return HasCollisionLoadedAroundEntity(entity)
end
