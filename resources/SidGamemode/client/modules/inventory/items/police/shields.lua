local CurrentShield = nil

local Shield = {}

setmetatable(Shield, {})

local items = {
	lspd_shield = "lspd_ballistic_shieldon_h",
	lssd_shield = "lssd_ballistic_shieldon_b",
	riot_shield = "riot_shield"
}

local params = {
	[GetHashKey("lspd_ballistic_shieldon_h")] = {
		offset = vector3(0, 0, -0.03999999),
		rotation = vector3(53.49982452392578, 394.204833984375, 101.29967498779297),
		animDict = "smo@shield_pistol_req_01",
		animName = "shield_pistol_req_01_clip",
		disableMelee = true,
		allowedWeapons = {
			GetHashKey("WEAPON_COMBATPISTOL"),
			GetHashKey("WEAPON_UNARMED")
		}
	},
	[GetHashKey("lssd_ballistic_shieldon_b")] = {
		offset = vector3(0, 0, -0.03999999),
		rotation = vector3(53.49982452392578, 394.204833984375, 101.29967498779297),
		animDict = "smo@shield_pistol_req_01",
		animName = "shield_pistol_req_01_clip",
		disableMelee = true,
		allowedWeapons = {
			GetHashKey("WEAPON_COMBATPISTOL"),
			GetHashKey("WEAPON_UNARMED")
		}
	},
	[GetHashKey("riot_shield")] = {
		offset = vector3(-0.02999999932944, -0.08000000566244, 0.08000000566244),
		rotation = vector3(30.04000091552734, 127.16999816894531, -33.47999954223633),
		animDict = "beachanims@molly",
		animName = "beachanim_surf_clip",
		disableMelee = false,
		allowedWeapons = {
			GetHashKey("WEAPON_NIGHTSTICK"),
			GetHashKey("WEAPON_BATON"),
			GetHashKey("WEAPON_UNARMED")
		}
	}
}

function Shield:DestroyShield()
	self.loop = false
	Citizen.Wait(100)
	DetachEntity(self.shield, false, false)
	DeleteEntity(self.shield)
	ClearPedTasksImmediately(self.ped)
	self.shield = nil
	self = nil
end

function Shield:CreateShield(modelName)
	self.ped = PlayerPedId()
	self.propName = modelName
	self.propModelHash =  GetHashKey(self.propName)

	self.param = params[self.propModelHash]

	Utils.Streaming.RequestAnimDict(self.param.animDict)

	self.shield = SharedModules.Entities:Create(self.propModelHash, player:position())

	TaskPlayAnim(self.ped, self.param.animDict, self.param.animName, 1.0, 4.0, -1, 49, 0.0, false, false, false)

	AttachEntityToEntity(self.shield, self.ped, GetPedBoneIndex(self.ped, 18905), self.param.offset.x, self.param.offset.y, self.param.offset.z, self.param.rotation.x, self.param.rotation.y, self.param.rotation.z, false, false, false, true, 1, true)

	Citizen.CreateThread(function()
		while true do
			-- Disable getting into vehicles
			DisableControlAction(0, 23, true)

			if IsDisabledControlJustPressed(0, 23) then
				UI:AddNotification("basic", "Vous ne pouvez pas faire cela dans un véhicule.", "info", 5000)
			end

			if not IsEntityPlayingAnim(self.ped, self.param.animDict, self.param.animName, 3) then
				Utils.Streaming.RequestAnimDict(self.param.animDict)

				TaskPlayAnim(self.ped, self.param.animDict, self.param.animName, 1.0, 4.0, -1, 49, 0.0, false, false, false)
			end

			if self.loop == false then
				break
			end

			Citizen.Wait(100)
		end
	end)

	return self
end

for k, item in pairs(items) do
	Item.RegisterUsable(k, function(data)
		if CurrentShield ~= nil then
			UI:AddNotification("basic", "Bouclier déséquippé", "info", 3000)
			CurrentShield:DestroyShield()
			CurrentShield = nil
		else
			UI:AddNotification("basic", "Bouclier équipé", "info", 3000)
			CurrentShield = Shield:CreateShield(item)
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if CurrentShield ~= nil then
			local param = CurrentShield.param
			if param.disableMelee then
				DisableControlAction(0, 140, true)
				DisableControlAction(0, 141, true)
				DisableControlAction(0, 142, true)
			end

			-- Prevent jumping 
			DisableControlAction(0, 22, true)

			if param.allowedWeapons then
				local currentWeapon = GetSelectedPedWeapon(PlayerPedId())
				if currentWeapon == GetHashKey("WEAPON_UNARMED") then
					DisableControlAction(0, 25, true) -- Disable aim
					DisableControlAction(0, 24, true) -- Disable attack
				end
				if not Table.has(param.allowedWeapons, currentWeapon) then
					UI:AddNotification("basic", "~r~Vous ne pouvez pas utiliser cette arme avec ce bouclier.", "info", 5000)
					GiveWeaponToPed(ped, `WEAPON_UNARMED`, 0, false, true)
				end
			end
		end
	end
end)
