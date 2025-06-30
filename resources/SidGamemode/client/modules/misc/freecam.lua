ClientModules = ClientModules or {}
ClientModules.Misc = ClientModules.Misc or {}
ClientModules.Misc.Freecam = {}

ClientModules.Misc.Freecam.initialized = false

ClientModules.Misc.Freecam.instructional = {}
ClientModules.Misc.Freecam.maxDistance = 10.0
ClientModules.Misc.Freecam.sensivity = 2.5
ClientModules.Misc.Freecam.active = false
ClientModules.Misc.Freecam.speed = 2.5

ClientModules.Misc.Freecam.camInstance = Camera:new({
	position = vector3(0, 0, 0),
	rotation = vector3(0, 0, 0),
	name = "freecam",
	fov = 50.0
})

function ClientModules.Misc.Freecam:Use()
	self.active = true

	self.camInstance:position(GetGameplayCamCoord())
	self.camInstance:rotation(GetGameplayCamRot(0))

	self.camInstance:render()

	self.instructional.move_fb = ClientModules.HUD.InstructionalButtons:Add("Avancer/Reculer", 31)
	self.instructional.move_lr = ClientModules.HUD.InstructionalButtons:Add("Gauche/Droite", 30)
	self.instructional.move_up = ClientModules.HUD.InstructionalButtons:Add("Monter", 22)
	self.instructional.move_down = ClientModules.HUD.InstructionalButtons:Add("Descendre", 36)
	self.instructional.sensivity = ClientModules.HUD.InstructionalButtons:Add(("Sensibilité: %.2f"):format(self.sensivity), Utils.GetControlHash("freecam_sensivity"))
	self.instructional.speed = ClientModules.HUD.InstructionalButtons:Add(("Vitesse: %.2f"):format(self.speed), Utils.GetControlHash("freecam_speed"))

	Citizen.CreateThread(function()

		SetPlayerControl(PlayerId(), false, 0)

		while self.active do
			local rot = self.camInstance:rotation()

			local lookX = GetDisabledControlNormal(0, 1)
			local lookY = GetDisabledControlNormal(0, 2)

			-- Get position input
			local moveX = GetDisabledControlNormal(0, 31)
			local moveY = GetDisabledControlNormal(0, 30)
			local moveZ = GetDisabledControlNormal(0, 22) - GetDisabledControlNormal(0, 36)

			-- Calculate new rotation.
			local rotX = rot.x + (-lookY * self.sensivity)
			local rotZ = rot.z + (-lookX * self.sensivity)
			local rotY = rot.y

            local forward = Math.RotationToDirection(rot)
            local _right = Math.RotationToDirection(vector3(0, 0, rot.z + 10.0)) - Math.RotationToDirection(vector3(0, 0, rot.z - 10.0))
            local _up = Math.RotationToDirection(vector3(rot.x + 10.0, rot.y, rot.z)) - Math.RotationToDirection(vector3(rot.x - 10.0, rot.y, rot.z))

            local radians = -(math.rad(rot.y))

            local right = (_right * math.cos(radians)) - (_up * math.sin(radians))
            local up = (_right * math.sin(radians)) + (_up * math.cos(radians))

			local new_coords = self.camInstance:position() + forward * -moveX * (self.speed / 10) + right * -moveY * (self.speed / 10) + up * moveZ * (self.speed / 10)

			-- Check if player is too far, or if freecam is going back
			if (
				Math.Distance(player:position(), new_coords) < self.maxDistance
				or Math.Distance(player:position(), new_coords) < Math.Distance(player:position(), self.camInstance:position())
			) then
				-- Adjust position relative to camera rotation.
				self.camInstance:position(new_coords)
			else
				DrawSphere(player:position().x, player:position().y, player:position().z, self.maxDistance, 255, 0, 0, 0.5)
			end

			-- Adjust new rotation
			rot = vector3(rotX, rotY, rotZ)

			self.camInstance:rotation(rot)

			Citizen.Wait(0)
		end

		self.camInstance:stopRendering()
		SetPlayerControl(PlayerId(), true, 0)

		ClientModules.HUD.InstructionalButtons:Delete(31)
		ClientModules.HUD.InstructionalButtons:Delete(30)
		ClientModules.HUD.InstructionalButtons:Delete(22)
		ClientModules.HUD.InstructionalButtons:Delete(36)
		ClientModules.HUD.InstructionalButtons:Delete(Utils.GetControlHash("freecam_sensivity"))
		ClientModules.HUD.InstructionalButtons:Delete(Utils.GetControlHash("freecam_speed"))
	end)
end

function ClientModules.Misc.Freecam:Initialize()
	if self.initialized == true then return end

	Utils.KeyRegister("F7", "freecam", "Utiliser la freecam", function()
		if ClientModules.Misc.Freecam.active then
			self.active = false
		else

			if player:metadata().instance == 1 then
				self.maxDistance = 10.0
			else
				self.maxDistance = 100.0
			end

			self:Use()
		end
	end)

	Utils.KeyRegister("F", "freecam_sensivity", "Sensibilité de la freecam", function()
		if self.active == false then return end

		if self.sensivity >= 5.0 then
			self.sensivity += 1
		elseif self.sensivity >= 2.5 then
			self.sensivity += 0.5
		elseif self.sensivity >= 1.0 then
			self.sensivity += 0.25
		end

		if self.sensivity > 10.0 then
			self.sensivity = 1.0
		end

		ClientModules.HUD.InstructionalButtons:Delete(Utils.GetControlHash("freecam_sensivity"))
		self.instructional.sensivity = ClientModules.HUD.InstructionalButtons:Add(("Sensibilité: %.2f"):format(self.sensivity), Utils.GetControlHash("freecam_sensivity"))
	end)

	Utils.KeyRegister("G", "freecam_speed", "Vitesse de la freecam", function()
		if self.active == false then return end

		if self.speed >= 5.0 then
			self.speed += 1
		elseif self.speed >= 2.5 then
			self.speed += 0.5
		elseif self.speed >= 1.0 then
			self.speed += 0.25
		end

		if self.speed > 10.0 then
			self.speed = 1.0
		end

		ClientModules.HUD.InstructionalButtons:Delete(Utils.GetControlHash("freecam_speed"))
		self.instructional.speed = ClientModules.HUD.InstructionalButtons:Add(("Vitesse: %.2f"):format(self.speed), Utils.GetControlHash("freecam_speed"))
	end)

	self.initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Misc.Freecam:Initialize()
end)
