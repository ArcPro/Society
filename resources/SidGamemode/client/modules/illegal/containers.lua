ClientModules = ClientModules or {}
ClientModules.Illegal = ClientModules.Illegal or {}
ClientModules.Illegal.Containers = {}
ClientModules.Illegal.Containers.initialized = false
ClientModules.Illegal.Containers.ThreadInterval = 500
ClientModules.Illegal.Containers.List = {}
ClientModules.Illegal.Containers.Loaded = {}
ClientModules.Illegal.Containers.States = {
	CLOSED = 0,
	OPENED = 1
}

ClientModules.Illegal.Containers.models = {
	container = GetHashKey("tr_prop_tr_container_01c"),
	collisions = GetHashKey("prop_ld_container"),
	crate = GetHashKey("ex_prop_crate_ammo_sc"),
	lock = GetHashKey('tr_prop_tr_lock_01a'),
}

function ClientModules.Illegal.Containers:LoadStreams()
	Utils.Streaming.RequestAnimDict("anim@scripted@player@mission@tunf_train_ig1_container_p1@male@")
	Utils.Streaming.RequestNamedPtfxAsset("scr_tn_tr")

	Utils.Streaming.RequestModel(self.models.collisions)
	Utils.Streaming.RequestModel(self.models.container)
	Utils.Streaming.RequestModel(self.models.crate)
	Utils.Streaming.RequestModel(self.models.lock)
end

function ClientModules.Illegal.Containers:UnloadStreams()
	RemoveAnimDict("anim@scripted@player@mission@tunf_train_ig1_container_p1@male@")
	RemoveNamedPtfxAsset("scr_tn_tr")

	SetModelAsNoLongerNeeded(self.models.collisions)
	SetModelAsNoLongerNeeded(self.models.container)
	SetModelAsNoLongerNeeded(self.models.crate)
	SetModelAsNoLongerNeeded(self.models.lock)
end

function ClientModules.Illegal.Containers:Create(id, coords, rotation, state)
	self.List[id] = {
		rotation = rotation,
		coords = coords,
		state = state,
	}
end

function ClientModules.Illegal.Containers:Update(id, coords, rotation)
	if self.List[id] == nil then return end

	self.List[id] = {
		state = self.States.CLOSED,
		rotation = rotation,
		coords = coords,
	}
end

function ClientModules.Illegal.Containers:SetState(id, state)
	if self.List[id] == nil or self.List[id].state == state then return end

	self.List[id].state = state

	if self.Loaded[id] ~= nil then
		self:Unload(id)

		if state == self.States.CLOSED then
			self:Load(id, self.List[id].coords, self.List[id].rotation)
		else
			self:KeepOpen(id, self.List[id].coords, self.List[id].rotation)
		end
	end
end

function ClientModules.Illegal.Containers:Load(id, coords, rotation)
	if self.Loaded[id] ~= nil then return end

	self.Loaded[id] = {}

	self.Loaded[id].container = CreateObject(self.models.container, coords.x, coords.y, coords.z, false, false, false)
	SharedModules.Entities:Wait(self.Loaded[id].container)

	SetEntityRotation(self.Loaded[id].container, rotation.x, rotation.y, rotation.z, 2, false)
	PlaceObjectOnGroundProperly(self.Loaded[id].container)

	self.Loaded[id].lock = CreateObject(self.models.lock, coords.x, coords.y, coords.z, false, false, false)
	SharedModules.Entities:Wait(self.Loaded[id].lock)

	SetEntityRotation(self.Loaded[id].lock, rotation.x, rotation.y, rotation.z, 2, false)
	PlaceObjectOnGroundProperly(self.Loaded[id].lock)

	local crate_coords = vector3(coords.x, coords.y, coords.z) + GetEntityForwardVector(self.Loaded[id].container) * 1.0
	self.Loaded[id].crate = CreateObject(self.models.crate, crate_coords.x, crate_coords.y, crate_coords.z, false, false, false)
	SharedModules.Entities:Wait(self.Loaded[id].crate)

    SetEntityRotation(self.Loaded[id].crate, rotation.x, rotation.y, rotation.z, 2, false)
	PlaceObjectOnGroundProperly(self.Loaded[id].crate)

	FreezeEntityPosition(self.Loaded[id].container, true)
	FreezeEntityPosition(self.Loaded[id].lock, true)
    FreezeEntityPosition(self.Loaded[id].crate, true)
end

function ClientModules.Illegal.Containers:Unload(id)
	if self.Loaded[id] == nil then return end

	DeleteEntity(self.Loaded[id].collisions)
	DeleteEntity(self.Loaded[id].container)
	DeleteEntity(self.Loaded[id].crate)
	DeleteEntity(self.Loaded[id].lock)

	self.Loaded[id] = nil
end

function ClientModules.Illegal.Containers:GetContainerIDFromEntity(entity)
	local model = GetEntityModel(entity)

	if model ~= self.models.container and model ~= self.models.crate then
		return nil
	end

	for id, v in pairs(self.Loaded) do
		if v.container == entity or v.crate == entity then
			return id
		end
	end

	return nil
end

function ClientModules.Illegal.Containers:KeepOpen(id, coords, rotation)
    local animDict = 'anim@scripted@player@mission@tunf_train_ig1_container_p1@male@'

	self:LoadStreams()

	self.Loaded[id] = {}

	self.Loaded[id].container = CreateObject(self.models.container, coords.x, coords.y, coords.z, false, false, false)
	SharedModules.Entities:Wait(self.Loaded[id].container)

	SetEntityRotation(self.Loaded[id].container, rotation.x, rotation.y, rotation.z, 2, false)
	PlaceObjectOnGroundProperly(self.Loaded[id].container)

	local container_coords = GetEntityCoords(self.Loaded[id].container, false)
	local scene = CreateSynchronizedScene(container_coords.x, container_coords.y, container_coords.z, rotation.x, rotation.y, rotation.z, 2)

	self.Loaded[id].collisions = CreateObject(self.models.collisions, container_coords.x, container_coords.y, container_coords.z, false, false, false)
	SharedModules.Entities:Wait(self.Loaded[id].collisions)

	SetEntityRotation(self.Loaded[id].collisions, rotation.x, rotation.y, rotation.z, 2, false)

	self.Loaded[id].lock = CreateObject(self.models.lock, coords.x, coords.y, coords.z, false, false, false)
	SharedModules.Entities:Wait(self.Loaded[id].lock)

	SetEntityRotation(self.Loaded[id].lock, rotation.x, rotation.y, rotation.z, 2, false)
	PlaceObjectOnGroundProperly(self.Loaded[id].lock)

	local crate_coords = vector3(coords.x, coords.y, coords.z) + GetEntityForwardVector(self.Loaded[id].container) * 1.0
	self.Loaded[id].crate = CreateObject(self.models.crate, crate_coords.x, crate_coords.y, crate_coords.z, false, false, false)
	SharedModules.Entities:Wait(self.Loaded[id].crate)

    SetEntityRotation(self.Loaded[id].crate, rotation.x, rotation.y, rotation.z, 2, false)
	PlaceObjectOnGroundProperly(self.Loaded[id].crate)

	FreezeEntityPosition(self.Loaded[id].container, true)
	FreezeEntityPosition(self.Loaded[id].lock, true)
    FreezeEntityPosition(self.Loaded[id].crate, true)

    PlaySynchronizedEntityAnim(self.Loaded[id].container, scene, "action_container", animDict, 1.0, -1.0, 0, 1148846080.0)
    ForceEntityAiAndAnimationUpdate(self.Loaded[id].container)
    PlaySynchronizedEntityAnim(self.Loaded[id].lock, scene, "action_lock", animDict, 1.0, -1.0, 0, 1148846080.0)
    ForceEntityAiAndAnimationUpdate(self.Loaded[id].lock)

    SetSynchronizedScenePhase(scene, 0.99)
	SetEntityCollision(self.Loaded[id].container, false, true)
	SetEntityVisible(self.Loaded[id].collisions, false, false)

	self:UnloadStreams()
end

function ClientModules.Illegal.Containers:Open(id)
	if self.Loaded[id] == nil then return end

	if ClientModules.Illegal:CheckForPolice("cops_container") == false then return end

	ClientModules.Illegal:AlertPolice("Braquage de conteneur")

	if Callbacks.Trigger("container:tryToOpen", id) ~= true then
		UI:AddNotification("basic", "~r~Ce conteneur a déja été ouvert.~s~", "info", 5000)
		return
	end

	local coords, rot = GetEntityCoords(self.Loaded[id].container, false), GetEntityRotation(self.Loaded[id].container, 2)
	local pedCoords = GetEntityCoords(PlayerPedId(), true)

	local grinder = CreateObject(GetHashKey("tr_prop_tr_grinder_01a"), pedCoords.x, pedCoords.y, pedCoords.z, true, true, false)
    local bag = CreateObject(GetHashKey("ch_p_m_bag_var04_arm_s"), pedCoords.x, pedCoords.y, pedCoords.z, true, true, false)
	local animDict = 'anim@scripted@player@mission@tunf_train_ig1_container_p1@male@'
	local ped = PlayerPedId()

	local scene, sparks = nil, nil

	SetEntityRotation(self.Loaded[id].lock, rot.x, rot.y, rot.z, 2, false)
	self:LoadStreams()

	scene = NetworkCreateSynchronisedScene(coords.x, coords.y, coords.z, rot.x, rot.y, rot.z, 2, true, false, 1065353216.0, 0.0, 1065353216.0)

	NetworkRegisterEntityAsNetworked(self.Loaded[id].container)
    NetworkRegisterEntityAsNetworked(self.Loaded[id].lock)

	NetworkAddPedToSynchronisedScene(ped, scene, animDict, 'action', 4.0, -4.0, 1033, 0, 1000.0, 0)
	NetworkAddEntityToSynchronisedScene(self.Loaded[id].container, scene, animDict, 'action_container', 1.0, -1.0, 1148846080)
	NetworkAddEntityToSynchronisedScene(self.Loaded[id].lock, scene, animDict, 'action_lock', 1.0, -1.0, 1148846080)
	NetworkAddEntityToSynchronisedScene(grinder, scene, animDict, 'action_angle_grinder', 1.0, -1.0, 1148846080)
	NetworkAddEntityToSynchronisedScene(bag, scene, animDict, 'action_bag', 1.0, -1.0, 1148846080)

	SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, false)
	NetworkStartSynchronisedScene(scene)
	Citizen.Wait(4000)
	UseParticleFxAsset('scr_tn_tr')
	sparks = StartParticleFxLoopedOnEntity("scr_tn_tr_angle_grinder_sparks", grinder, 0.0, 0.25, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false)
	Citizen.Wait(1000)
	StopParticleFxLooped(sparks, true)
	Citizen.Wait(GetAnimDuration(animDict, 'action') * 1000 - 5000)
	Events.TriggerServer("container:opened", id)
	DeleteObject(grinder)
	DeleteObject(bag)
	ClearPedTasks(ped)

	self:UnloadStreams()
end

function ClientModules.Illegal.Containers:RegisterEvents()
	Events.Register("container:create", function(_, id, coords, rotation)
		self:Create(id, coords, rotation)
	end)

	Events.Register("container:update", function(_, id, coords, rotation, state)
		self:Update(id, coords, rotation)
	end)

	Events.Register("container:delete", function(_, id)
		self:Delete(id)
	end)

	Events.Register("container:opened", function(_, id)
		self:SetState(id, self.States.OPENED)
	end)

	Events.Register("container:close", function(_, id)
		self:SetState(id, self.States.CLOSED)
	end)
end

function ClientModules.Illegal.Containers:LoadAll()
	local list = Callbacks.Trigger("container:all") or {}

	for k, container in pairs(list) do
		self:Create(container.id, container.coords, container.rotation, container.open == true and self.States.OPENED or self.States.CLOSED)
	end
end

function ClientModules.Illegal.Containers:ProximityThread()
	Citizen.CreateThread(function()
		while true do
			for id, container in pairs(self.List) do
				if Math.Distance(player:position(), container.coords) < 50 then
					if self.Loaded[id] == nil then
						if container.state == self.States.OPENED then
							self:KeepOpen(id, container.coords, container.rotation)
						else
							self:Load(id, container.coords, container.rotation)
						end
					end
				else
					if self.Loaded[id] ~= nil then
						self:Unload(id)
					end
				end
			end

			Citizen.Wait(self.ThreadInterval)
		end
	end)
end

function ClientModules.Illegal.Containers:Initialize()
	if self.initialized == true then return end

	self:RegisterEvents()
	self:LoadAll()

	self:ProximityThread()

	self.initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Illegal.Containers:Initialize()
end)
