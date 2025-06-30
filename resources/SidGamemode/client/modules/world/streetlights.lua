local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

local props = {
	[`prop_streetlight_10`] = true,
	[`prop_streetlight_09`] = true,
	[`prop_streetlight_15a`] = true,
	[`prop_streetlight_07b`] = true,
	[`prop_streetlight_06`] = true,
	[`prop_streetlight_12a`] = true,
	[`prop_streetlight_11a`] = true,
	[`prop_streetlight_08`] = true,
	[`prop_streetlight_07a`] = true,
	[`prop_streetlight_12b`] = true,
	[`prop_streetlight_11b`] = true,
	[`prop_streetlight_11c`] = true,
	[`prop_streetlight_03d`] = true,
	[`prop_streetlight_03b`] = true,
	[`prop_streetlight_02`] = true,
	[`prop_streetlight_01`] = true,
	[`prop_streetlight_03c`] = true,
	[`prop_streetlight_16a`] = true,
	[`prop_streetlight_03`] = true,
	[`prop_streetlight_05_b`] = true,
	[`prop_streetlight_01b`] = true,
	[`prop_streetlight_04`] = true,
	[`prop_streetlight_05`] = true,
	[`prop_streetlight_14a`] = true,
	[`prop_streetlight_03e`] = true,
	[`sum_prop_ac_ind_light_04`] = true,
	[`prop_ind_light_05`] = true,
	[`prop_ind_light_02b`] = true,
	[`prop_ind_light_01a`] = true,
	[`prop_ind_light_02a`] = true,
	[`prop_ind_light_02c`] = true,
	[`prop_ind_light_03b`] = true,
	[`prop_ind_light_03c`] = true,
	[`sum_prop_ac_ind_light_03c`] = true,
	[`sum_prop_ac_ind_light_02a`] = true,
	[`prop_ind_light_01b`] = true,
	[`prop_ind_light_04`] = true,
	[`prop_ind_light_01c`] = true,
	[`prop_ind_light_03a`] = true,
	[`prop_traffic_01a`] = true,
	[`prop_traffic_03a`] = true,
	[`prop_traffic_01b`] = true,
	[`prop_traffic_01d`] = true,
	[`prop_traffic_03b`] = true
}

local cachedPlayerCoords = vector3(0,0,0)

Citizen.CreateThread(function()
	while true do
		local pCoords = GetEntityCoords(PlayerPedId(), true)

		if #(pCoords - cachedPlayerCoords) >= 50.0 then
			cachedPlayerCoords = pCoords

			for v in EnumerateObjects() do
				if DoesEntityExist(v) == true and props[GetEntityModel(v)] == true then
					SetEntityCanBeDamaged(v, false)
					FreezeEntityPosition(v, true)
				end
			end
		end

		Citizen.Wait(500)
	end
end)
