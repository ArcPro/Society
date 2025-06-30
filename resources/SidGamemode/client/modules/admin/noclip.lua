ClientModules = ClientModules or {}
ClientModules.Admin = ClientModules.Admin or {}
ClientModules.Admin.Noclip = {}

ClientModules.Admin.Noclip.speed = GetResourceKvpFloat("noclip_speed") or 2.5
ClientModules.Admin.Noclip.initialized = false
ClientModules.Admin.Noclip.enabled = false
ClientModules.Admin.Noclip.entity = false

---@private
function ClientModules.Admin.Noclip:Prepare()
	local ped = PlayerPedId()
	self.entity = GetVehiclePedIsIn(ped, false)

	if self.entity == 0 or GetPedInVehicleSeat(self.entity, -1) ~= ped then
		self.entity = ped
	end

	FreezeEntityPosition(self.entity, true);
	SetEntityCollision(self.entity, false, false);

	SetEveryoneIgnorePlayer(ped, true);
	SetPoliceIgnorePlayer(ped, true);

	ClientModules.HUD.InstructionalButtons:Add(("Vitesse: %.1f"):format(self.speed), 348)
	ClientModules.HUD.InstructionalButtons:Add("Devant/Derrière", 31)
	ClientModules.HUD.InstructionalButtons:Add("Gauche/Droite", 30)
	ClientModules.HUD.InstructionalButtons:Add("Haut", 22)
	ClientModules.HUD.InstructionalButtons:Add("Bas", 36)
end

---@private
function ClientModules.Admin.Noclip:Release()
	local coords = GetEntityCoords(self.entity, true)
	local ped = PlayerPedId();

	FreezeEntityPosition(self.entity, false);
	SetEntityCollision(self.entity, true, true);

	SetEntityVisible(self.entity, true, false);
	SetLocalPlayerVisibleLocally(true);
	ResetEntityAlpha(self.entity);

	SetEveryoneIgnorePlayer(ped, false);
	SetPoliceIgnorePlayer(ped, false);
	ResetEntityAlpha(self.entity);

	local _, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, false)

	SetEntityCoords(self.entity, coords.x, coords.y, groundZ, true, false, false, false)

	ClientModules.HUD.InstructionalButtons:Delete(348)
	ClientModules.HUD.InstructionalButtons:Delete(22)
	ClientModules.HUD.InstructionalButtons:Delete(36)
	ClientModules.HUD.InstructionalButtons:Delete(31)
	ClientModules.HUD.InstructionalButtons:Delete(30)
end

---@private
function ClientModules.Admin.Noclip:UpdateCoords()
	local rot = GetGameplayCamRot(0)

	-- Get position input
	local moveX = GetDisabledControlNormal(0, 31)
	local moveY = GetDisabledControlNormal(0, 30)
	local moveZ = GetDisabledControlNormal(0, 22) - GetDisabledControlNormal(0, 36)

	local forward = Math.RotationToDirection(rot)
	local _right = Math.RotationToDirection(vector3(0, 0, rot.z + 10.0)) - Math.RotationToDirection(vector3(0, 0, rot.z - 10.0))
	local _up = Math.RotationToDirection(vector3(rot.x + 10.0, rot.y, rot.z)) - Math.RotationToDirection(vector3(rot.x - 10.0, rot.y, rot.z))

	local radians = -(math.rad(rot.y))

	local right = (_right * math.cos(radians)) - (_up * math.sin(radians))
	local up = (_right * math.sin(radians)) + (_up * math.cos(radians))

	local new_coords = GetEntityCoords(self.entity, false)
		+ forward * -moveX * self.speed
		+ right * -moveY * self.speed
		+ up * moveZ * self.speed

	SetEntityCoordsNoOffset(self.entity, new_coords.x, new_coords.y, new_coords.z, true, true, true)
	SetEntityRotation(self.entity, rot.x, rot.y, rot.z, 2, false)
end

---@private
function ClientModules.Admin.Noclip:DisableControls()
	DisableControlAction(0, 30, true)
	DisableControlAction(0, 31, true)
	DisableControlAction(0, 32, true)
	DisableControlAction(0, 33, true)
	DisableControlAction(0, 34, true)
	DisableControlAction(0, 35, true)
	DisableControlAction(0, 36, true)
end

---@private
function ClientModules.Admin.Noclip:UpdateSpeed()
	if IsControlJustPressed(0, 15) then
		self.speed += 0.1
	elseif IsControlJustPressed(0, 14) then
		self.speed -= 0.1
	elseif IsControlJustPressed(0, 348) then
		local input = Utils.KeyboardInput("Vitesse", "Veuillez entrer une nouvelle vitesse", ("%.1f"):format(self.speed), 1)
		if input ~= nil and tonumber(input) > 0 then
			self.speed = tonumber(input)
		else
			UI:AddNotification("basic", "~r~Vitesse invalide.", "info", 2500)
		end
	else
		return
	end

	if self.speed < 0.0 then
		self.speed = 0.0
	end

	ClientModules.HUD.InstructionalButtons:Delete(348)
	ClientModules.HUD.InstructionalButtons:Add(("Vitesse: %.1f"):format(self.speed), 348)
	SetResourceKvpFloat("noclip_speed", self.speed)
end

function ClientModules.Admin.Noclip:Use()
	self.enabled = not self.enabled

	if self.enabled == false then return end

	Citizen.CreateThread(function()
		self:Prepare()

		while self.enabled do
			SetEntityVisible(self.entity, false, false);
			SetEntityAlpha(self.entity, 51, false);
			SetLocalPlayerVisibleLocally(true);

			self:DisableControls()
			self:UpdateCoords()
			self:UpdateSpeed()

			Citizen.Wait(0)
		end

		self:Release()
	end)
end

function ClientModules.Admin.Noclip:Initialize()
	if self.initialized == true then return end

	if player:permissions() < Config.Permissions.MOD then return end

    Utils.KeyRegister("F2", "noclip", "Noclip", function()
		self:Use()
    end)
end

Core.Player:OnLoad(function()
	ClientModules.Admin.Noclip:Initialize()
end)
