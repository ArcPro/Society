local attachHoseEntity = nil

local fireTrucks = {
	GetHashKey("lsfdtruck"),
	GetHashKey("lsfdtruck2"),
	GetHashKey("fdsandstorm"),
}

local tankers = {
	GetHashKey("lsfdtanker"),
	200846641,
	-97646180,
	-366155374,
	GetHashKey("rcnk_waterpump_01")
}

local function isModelAFireTruck(model)
	for k, v in pairs(fireTrucks) do
		if v == model then
			return true
		end
	end

	return false
end

local function isModelATanker(model)
	for k, v in pairs(tankers) do
		if v == model then
			return true
		end
	end

	return false
end

Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if player:job().name ~= "lsfd" then return end

    if (not DoesEntityExist(hitEntity) or IsPedInAnyVehicle(PlayerPedId(), true)) then return end

	if (not IsEntityAnObject(hitEntity) and not IsEntityAVehicle(hitEntity)) then return end

	local model = GetEntityModel(hitEntity)

	if not isModelAFireTruck(model) and not isModelATanker(model) then return end


	local hasHoseInHands = GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_FIREHOSE")

	if Entity(hitEntity).state.hydrantAttached ~= nil and not hasHoseInHands then
		Context:AddItem(0, "Détacher la bouche à incendie", function()
			SetControlNormal(0, 293, 1.0)

			SharedModules.Entities:SetStatebag(hitEntity, "hydrantAttached", nil)

			attachHoseEntity = nil
		end, true)
	end

	if hasHoseInHands then
		if isModelATanker(GetEntityModel(attachHoseEntity)) and isModelAFireTruck(model) then
			Context:AddItem(0, "Attacher la bouche à incendie", function()
				SetControlNormal(0, 293, 1.0)

				SharedModules.Entities:SetStatebag(hitEntity, "hydrantAttached", attachHoseEntity)

				attachHoseEntity = nil
			end, true)
		end

		if attachHoseEntity ~= hitEntity then return end
	end

	if Math.Distance(GetEntityCoords(hitEntity, true), player:position()) > (isModelATanker(model) and 2.0 or 5.5) then return end

	Context:AddItem(0, ("%s la lance"):format(hasHoseInHands and "Poser" or "Prendre"), function()
		SetControlNormal(0, 294, 1.0)

		if hasHoseInHands == false then
			attachHoseEntity = hitEntity
		else
			attachHoseEntity = nil
		end
	end, true)
end)
