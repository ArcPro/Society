ClientModules = ClientModules or {}
ClientModules.Weapons = ClientModules.Weapons or {}
ClientModules.Weapons.OnBack = {}
ClientModules.Weapons.OnBack.Initialized = false
ClientModules.Weapons.OnBack.HasBackpack = false
ClientModules.Weapons.OnBack.AttachType = nil
ClientModules.Weapons.OnBack.Attached = {}
ClientModules.Weapons.OnBack.Bone = 24816
ClientModules.Weapons.OnBack.Models = {
	-- Assault Rifles
	[`weapon_specialcarbine`]		= `w_ar_specialcarbinemk2`,
	[`weapon_compactrifle`]			= `w_ar_assaultrifle_smg`,
	[`weapon_tacticalrifle`]		= `w_ar_carbinerifle_reh`,
	[`weapon_assaultrifle_mk2`]		= `w_ar_assaultriflemk2`,
	[`weapon_bullpuprifle_mk2`]		= `w_ar_bullpupriflemk2`,
	[`weapon_carbinerifle_mk2`]		= `w_ar_carbineriflemk2`,
	[`weapon_bullpuprifle`]			= `w_ar_bullpuprifleh4`,
	[`weapon_militaryrifle`]		= `w_ar_bullpuprifleh4`,
	[`weapon_specialcarbine_mk2`]	= `w_ar_specialcarbine`,
	[`weapon_advancedrifle`]		= `w_ar_advancedrifle`,
	[`weapon_assaultrifle`]			= `w_ar_assaultrifle`,
	[`weapon_carbinerifle`]			= `w_ar_carbinerifle`,
	[`weapon_heavyrifle`]			= `w_ar_heavyrifleh`,

	-- Sniper Rifles
	[`weapon_precisionrifle`]		= `w_sr_precisionrifle_reh`,
	[`weapon_marksmanrifle_mk2`]	= `w_sr_marksmanriflemk2`,
	[`weapon_marksmanrifle`]		= `w_sr_marksmanrifle`,
	[`weapon_heavysniper`]			= `w_sr_heavysniper`,
	[`weapon_sniperrifle`]			= `w_sr_sniperrifle`,

	-- Shotguns
	[`weapon_assaultshotgun`]		= `w_sg_assaultshotgun`,
	[`weapon_bullpupshotgun`]		= `w_sg_bullpupshotgun`,
	[`weapon_pumpshotgun_mk2`]		= `w_sg_pumpshotgunmk2`,
	[`weapon_combatshotgun`]		= `w_sg_pumpshotgunh4`,
	[`weapon_dbshotgun`]			= `w_sg_doublebarrel`,
	[`weapon_heavyshotgun`]			= `w_sg_heavyshotgun`,
	[`weapon_pumpshotgun`]			= `w_sg_pumpshotgun`,
	[`weapon_beanbag2`]				= `w_sg_beanbag2`,
	[`weapon_beanbag`]				= `w_sg_beanbag`,
	[`weapon_autoshotgun`]			= `w_sg_sweeper`,
	[`weapon_sawnoffshotgun`]		= `w_sg_sawnoff`,
	[`weapon_musket`]				= `w_ar_musket`,

	-- SMGs
	[`weapon_heavysniper_mk2`]		= `w_sr_heavysnipermk2`,
	[`weapon_assaultsmg`]			= `w_sb_assaultsmg`,
	[`weapon_machinepistol`]		= `w_sb_compactsmg`,
	[`weapon_gusenberg`]			= `w_sb_gusenberg`,
	[`weapon_microsmg`]				= `w_sb_microsmg`,
	[`weapon_minismg`]				= `w_sb_minismg`,
	[`weapon_smg_mk2`]				= `w_sb_smgmk2`,
	[`weapon_combatpdw`]			= `w_sb_pdw`,
	[`weapon_smg`]					= `w_sb_smg`,

	-- Machine Guns
	[`weapon_sledgehammer`]			= `w_me_sledgehammer`,
	[`weapon_combatmg_mk2`]			= `w_mg_combatmgmk2`,
	[`weapon_combatmg`]				= `w_mg_combatmg`,
	[`weapon_mg`]					= `w_mg_mg`,

	-- Launchers
	[`weapon_40mmlesslethal`]		= `w_lr_40mmlesslethal`,
	[`weapon_firework`]				= `w_lr_firework`,

	-- Melee
	[`weapon_candycane`]			= `w_me_candy_xm3`,
	[`weapon_pikepole`]				= `w_me_pikepole`,
	[`weapon_fireaxe`]				= `w_me_fireaxe`,
	[`weapon_pickaxe`]				= `w_me_pickaxe`,
	[`weapon_poolcue`]				= `w_me_poolcue`,
	[`weapon_katana`]				= `w_me_katana`,
	[`weapon_bat`]					= `w_me_bat`,
}

ClientModules.Weapons.OnBack.Offsets = {
	Back = {
		position = vector3(0.2, -0.17, 0.02),
		rotation = vector3(180.0, 165.0, 0.0)
	},

	Front = {
		position = vector3(0.1, 0.2, 0.02),
		rotation = vector3(180.0, 110.0, 0.0)
	},

	Holster = {
		position = vector3(0.2, -0.17, -0.1),
		rotation = vector3(180.0, 0.0, 0.0)
	},
}

ClientModules.Weapons.OnBack.OffsetsOverrides = {
	[`GROUP_MELEE`] = {
		Back = {
			position = vector3(-0.1, -0.17, -0.1),
			rotation = vector3(0.0, 270.0, 180.0),
		},

		Front = {
			position = vector3(-0.1, -0.17, -0.1),
			rotation = vector3(0.0, 270.0, 180.0),
		},

		Holster = {
			position = vector3(-0.1, -0.17, -0.1),
			rotation = vector3(0.0, 270.0, 180.0),
		},
	},

	[`GROUP_PISTOL`] = {
		Back = {
			position = vector3(-0.0, -0.1, -0.02),
			rotation = vector3(0.0, 165.0, -10.0)
		},

		Front = {
			position = vector3(-0.07, 0.15, 0.05),
			rotation = vector3(180.0, 165.0, 15.0)
		},

		Holster = {
			position = vector3(-0.15, 0.0, -0.2),
			rotation = vector3(90.0, 165.0, 15.0)
		},
	},

	[`GROUP_STUNGUN`] = {
		Back = {
			position = vector3(-0.0, -0.1, -0.02),
			rotation = vector3(0.0, 165.0, -10.0)
		},

		Front = {
			position = vector3(-0.07, 0.15, 0.05),
			rotation = vector3(180.0, 165.0, 15.0)
		},

		Holster = {
			position = vector3(-0.15, 0.0, -0.2),
			rotation = vector3(90.0, 165.0, 15.0)
		},
	}
}

function ClientModules.Weapons.OnBack:Attach(weapon)
	if self.Models[weapon] == nil then return end
	if self.Attached[weapon] ~= nil and DoesEntityExist(self.Attached[weapon]) then return end
	if self.HasBackpack == true then return end

	Utils.Streaming.RequestModel(self.Models[weapon] --[[ @as number ]])

	self.Attached[weapon] = CreateObject(self.Models[weapon], 1.0, 1.0, 1.0, true, true, false)

	local offset = (self.OffsetsOverrides[GetWeapontypeGroup(weapon)] or self.Offsets)[self.AttachType]

	SetEntityCollision(self.Attached[weapon], false, false)
	SharedModules.Entities:AttachToEntityClientSided(
		self.Attached[weapon], PlayerPedId(), GetPedBoneIndex(PlayerPedId(), self.Bone),
		offset.position, offset.rotation, false, false
	)

	Utils.RealWait(500)

	SharedModules.Entities:SetStatebag(self.Attached[weapon], "owner", player:source())
end

function ClientModules.Weapons.OnBack:Detach(weapon)
	if self.Models[weapon] == nil then return end
	if self.Attached[weapon] == nil or DoesEntityExist(self.Attached[weapon]) == false then return end

	DeleteEntity(self.Attached[weapon])

	self.Attached[weapon] = nil
end

function ClientModules.Weapons.OnBack:ReAttachAll()
	for weapon, entity in pairs(self.Attached) do
		DeleteEntity(entity)
		self:Attach(weapon)
	end
end

function ClientModules.Weapons.OnBack:DetachAll()
	for weapon, _ in pairs(self.Attached) do
		self:Detach(weapon)
	end
end

function ClientModules.Weapons.OnBack:AttachAll()
	for _, model in pairs(Config.Weapons) do
		if HasPedGotWeapon(PlayerPedId(), model, false) then
			self:Attach(model)
		end
	end
end

function ClientModules.Weapons.OnBack:GetAttachType()
	local holster_style = player:metadata().holster_style or "Gangster"
	local attach_type = "Front"

	if holster_style == "Gangster" then
		attach_type = "Back"
	elseif holster_style == "Police" then
		attach_type = "Holster"
	end

	return attach_type
end

function ClientModules.Weapons.OnBack:GetHasBackpack()
	local backpack = player:skin():outfit().components[Lists.Variations.Clothes.BACKPACK]

	if backpack == nil then
		return false
	end

	return Table.has(Lists.Backpacks[player:sex()], backpack[1])
end

function ClientModules.Weapons.OnBack:WatchForBucketChange()
	Events.Register("bucket:changed", function (_, bucket)
		self:DetachAll()
		self:AttachAll()
	end)
end

function ClientModules.Weapons.OnBack:Initialize()
	if self.Initialized == true then return end

	self.HasBackpack = self:GetHasBackpack()
	self.AttachType = self:GetAttachType()

	self:WatchForBucketChange()

	local current_attach_type = self.AttachType
	local current_has_backpack = self.HasBackpack

	Citizen.CreateThread(function()
		while true do
			current_has_backpack = self:GetHasBackpack()
			current_attach_type = self:GetAttachType()

			if current_attach_type ~= self.AttachType then
				self.AttachType = current_attach_type
				self:ReAttachAll()
			end

			if current_has_backpack ~= self.HasBackpack then
				self.HasBackpack = current_has_backpack

				if self.HasBackpack then
					self:DetachAll()
				else
					self:AttachAll()
				end
			end

			Citizen.Wait(1000)
		end
	end)

	self.Initialized = true
end
