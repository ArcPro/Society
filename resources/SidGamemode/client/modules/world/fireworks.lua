ClientModules = ClientModules or {}
ClientModules.World = ClientModules.World or {}
ClientModules.World.Fireworks = {}
ClientModules.World.Fireworks.Initialized = false

function ClientModules.World.Fireworks:Place(model, coords, type)
	Utils.Streaming.RequestAnimDict('anim@mp_fireworks')
	Utils.Streaming.RequestModel(model)

	TaskPlayAnim(PlayerPedId(), 'anim@mp_fireworks', 'place_firework_3_box', -1, -8.0, 3000, 0, 0.0, false, false, false)
	Citizen.Wait((GetAnimDuration('anim@mp_fireworks', 'place_firework_3_box') * 1000) - 2050)

	local prop = SharedModules.Entities:Create(model, coords)
	PlaceObjectOnGroundProperly(prop)

	Utils.RealWait(500)

	if prop == nil then return end

	SharedModules.Entities:SetStatebag(prop, "can_firework", player:id())
	SharedModules.Entities:SetStatebag(prop, "firework_type", type)
end

function ClientModules.World.Fireworks:RequestStart(entity)
	SharedModules.Entities:SetStatebag(entity, "can_firework", nil)
end

function ClientModules.World.Fireworks:Start(entity)
	local firework_type = Entity(entity).state.firework_type
	local firework = Config.Fireworks[firework_type]
	local coords = GetEntityCoords(entity, false)
	local shoots = 0

	if firework == nil then return end

	shoots = firework.shoots

	for _, particle in pairs(firework.particles) do
		Utils.Streaming.RequestNamedPtfxAsset(particle.name)
	end

	while shoots ~= 0 do
		shoots -= 1

		for _, particle in pairs(firework.particles) do
			UseParticleFxAsset(particle.name)
			StartNetworkedParticleFxNonLoopedAtCoord(
				particle.effect,
				coords.x + (particle.randomizeXY == true and math.random(-10, 10) or 0.0),
				coords.y + (particle.randomizeXY == true and math.random(-10, 10) or 0.0),
				coords.z + particle.plusHeight,
				0.0, 0.0, 0.0, particle.scale, false, false, false
			)

			Citizen.Wait(particle.timeToNextShoot)
		end

		Citizen.Wait(firework.timeBetweenShoots or 300)
	end

	for _, particle in pairs(firework.particles) do
		RemoveNamedPtfxAsset(particle.name)
	end
end

function ClientModules.World.Fireworks:Initialize()
	if self.Initialized == true then return end

	AddStateBagChangeHandler("can_firework", "", function(bagName, key, value, unused, replicated)
		if (bagName:find("entity") == nil or value ~= nil or Entity()) then return end

		local networkIdString = bagName:gsub("entity:", "")
		local networkId = tonumber(networkIdString)

		if networkId == nil then return end

		local entity = SharedModules.Entities:WaitForNetworkId(networkId)

		if Entity(entity).state.can_firework == nil then return end

		self:Start(entity)
	end)

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.World.Fireworks:Initialize()
end)
