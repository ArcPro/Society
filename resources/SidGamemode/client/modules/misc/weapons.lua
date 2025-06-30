ClientModules = ClientModules or {}
ClientModules.Weapons = ClientModules.Weapons or {}
ClientModules.Weapons.Initialized = false
ClientModules.Weapons.AnimComplete = false
ClientModules.Weapons.CurrentWeapon = nil

local function IsPlayerAiming(player)
    return (IsPlayerFreeAiming(player) or IsAimCamActive() or IsAimCamThirdPersonActive()) and tonumber(GetSelectedPedWeapon(player)) ~= tonumber(GetHashKey("WEAPON_UNARMED"))
end

function ClientModules.Weapons:GetTotalQuantity(weapon)
	local quantity = 0
	local items = player:inventory():findItems(function(item)
		return item.name == weapon
	end)

	for _, item in pairs(items) do
		quantity = quantity + item.quantity
	end

	return quantity
end

function ClientModules.Weapons:StartAnim(ped, info)
	local coords = GetEntityCoords(ped, true)
    Utils.Streaming.RequestAnimDict(info.dict)

    TaskPlayAnimAdvanced(ped, info.dict, info.clip, coords.x, coords.y, coords.z, 0.0, 0.0, GetEntityHeading(ped), 8.0, 3.0, info.duration * 2, 50, 0.1, false, false)
    RemoveAnimDict(info.dict)

	Citizen.Wait(info.duration)

    if info.cancel then
        StopAnimTask(ped, info.dict, info.clip, 2.0)
    end
end

function ClientModules.Weapons:HolsterThread(variant)
	local player_id = PlayerId()
	local ped = PlayerPedId()

	Citizen.CreateThread(function()
		if variant == "holster" then
			SetPedCurrentWeaponVisible(ped, false, false, false, false)
		end

		DisablePlayerFiring(player_id, true)

		while not self.AnimComplete do
			DisableControlAction(1, 25, true)
			DisableControlAction(1, 68, true)
			DisableControlAction(1, 70, true)
			DisableControlAction(1, 91, true)
			Citizen.Wait(0)
		end

		DisablePlayerFiring(player_id, false)

		if variant == "holster" then
			SetPedCurrentWeaponVisible(ped, true, false, false, false)
		end
	end)
end

_, ClientModules.Weapons.CurrentWeapon = GetCurrentPedWeapon(PlayerPedId(), true)

function ClientModules.Weapons:PlayAnim(weapon, isTakingOut)
	local animation = player:metadata().holster_style or "Gangster"
	local group = GetWeapontypeGroup(weapon)

	if animation == nil or animation ~= "Gangster" and group ~= 'GROUP_PISTOL' and group ~= 'GROUP_MELEE' and group ~= 'GROUP_STUNGUN' and group ~= 'GROUP_UNARMED' then
		return
	end

	if isTakingOut == true then
		self:HolsterThread("holster")
		self:StartAnim(PlayerPedId(), Lists.Emotes.HolsterStyles[animation].unholster)
	else
		self:HolsterThread("unholster")
		self:StartAnim(PlayerPedId(), Lists.Emotes.HolsterStyles[animation].holster)
	end
end

function ClientModules.Weapons:WeaponChanged(current_weapon, next_weapon)
	self.AnimComplete = false

	if current_weapon ~= 'WEAPON_UNARMED' then
		self:PlayAnim(current_weapon, next_weapon ~= 'WEAPON_UNARMED')
	end

	if next_weapon ~= 'WEAPON_UNARMED' then
		self:PlayAnim(next_weapon, true)

		local weapon_name = Item.GetWeaponNameFromModel(next_weapon)

		local weaponItem = player:inventory():findItem(function(item)
			return item.name == weapon_name
		end)

		if weaponItem ~= nil then
			LocalPlayer.state:set("current_weapon", weaponItem.metadata.id, true)
		end
	else
		LocalPlayer.state:set("current_weapon", nil, true)
	end

	self.AnimComplete = true

	SharedModules.Log:Create(player:source(), "weapons", "equip", {
		["Arme"] = next_weapon,
	})
end

function ClientModules.Weapons:EquipLoadout()
	self.OnBack:DetachAll()

	for k, item in pairs(player:inventory():content()) do
		if Item.IsWeapon(item.name) then
			group = GetWeapontypeGroup(Item._weapons[item.name].model)

			if group == 'GROUP_THROWN' then
				ammo = item.quantity
			elseif group == 'GROUP_PETROLCAN' or group == 'GROUP_FIREEXTINGUISHER' then
				ammo = item.metadata.ammo
			end

			GiveWeaponToPed(PlayerPedId(), Item._weapons[item.name].model, ammo, false, false)
			self.OnBack:Attach(Item._weapons[item.name].model)
		end
	end
end

function ClientModules.Weapons:CheckForWeaponChange()
	Citizen.CreateThread(function()
		while true do
			local _, currentWeapon = GetCurrentPedWeapon(PlayerPedId(), true)

			if currentWeapon ~= self.CurrentWeapon then
				self:WeaponChanged(self.CurrentWeapon, currentWeapon)

				self.OnBack:Attach(self.CurrentWeapon)
				self.OnBack:Detach(currentWeapon)

				self.CurrentWeapon = currentWeapon
			end

			Citizen.Wait(0)
		end
	end)
end

function ClientModules.Weapons:SyncAmmo()
	Citizen.CreateThread(function()
		local quantity = nil
		local group = nil
		local ammo = nil
		local item = nil
		local isDifferentWeapon = false
		while true do
			local _, weaponHash = GetCurrentPedWeapon(PlayerPedId(), true)
			isDifferentWeapon = self.currentWeapon == weaponHash

			local waitTime = isDifferentWeapon and 0 or 2000
			for _, model in pairs(Config.Weapons) do
				ammo = Item.GetWeaponAmmoFromModel(model)
				group = GetWeapontypeGroup(model)

				if HasPedGotWeapon(PlayerPedId(), model, false) and player:loaded() == true then
					if ammo ~= nil then
						local ammo_in_inventory = 0

						for k, v in pairs(player:inventory():findItems(function(i) return i.name == ammo end)) do
							ammo_in_inventory = ammo_in_inventory + v.quantity
						end

						SetPedAmmo(PlayerPedId(), model, ammo_in_inventory)
						if isDifferentWeapon then
							SetAmmoInClip(PlayerPedId(), model, 6)
						end
					end

					if group == 'GROUP_PARACHUTE' or group == 'GROUP_PETROLCAN' or group == 'GROUP_FIREEXTINGUISHER' then
						item = player:inventory():findItem(function(i)
							return i.name == Item.GetWeaponNameFromModel(model)
						end)

						if group == 'GROUP_PARACHUTE' then
							if item and GetPedParachuteState(PlayerPedId()) == 1 then
								item.quantity = 1
								player:inventory():removeItem(item)
							end
						else
							ammo = GetAmmoInPedWeapon(PlayerPedId(), model)

							if item ~= nil then
								quantity = item.metadata.ammo

								if quantity ~= ammo then
									local newWeaponItem = Functions.DeepCopy(item)
									newWeaponItem.metadata.ammo = ammo
									player:inventory():updateItem(item, newWeaponItem)
								end
							end
						end
					else
						ammo = GetAmmoInPedWeapon(PlayerPedId(), model)

							if item ~= nil then
								quantity = item.metadata.ammo

								if quantity ~= ammo then
									local _, inClip = GetAmmoInClip(PlayerPedId(), currentWeapon)
									local newWeaponItem = Functions.DeepCopy(item)
									newWeaponItem.metadata.ammo = ammo
									newWeaponItem.metadata.ammoInClip = inClip
									player:inventory():updateItem(item, newWeaponItem)
								end
							end
					end
				end
			end
			Citizen.Wait(waitTime)
		end
	end)
end

function ClientModules.Weapons:DisableCombatControls()
	Citizen.CreateThread(function()
		local ped = nil

		while true do
			Citizen.Wait(0)
			ped = PlayerPedId()
			SetPedSuffersCriticalHits(ped, false)

			if IsPedArmed(ped, 4 | 2) then
				DisableControlAction(0, 142, true)
				DisableControlAction(0, 140, true)
				DisableControlAction(0, 22, true)

				if IsPlayerAiming(ped) then
					Utils.Sprites.DrawCrosshair()
				end
			elseif GetPedStealthMovement(ped) then
				DisableControlAction(0, 24, true)
				DisableControlAction(0, 140, true)
				DisableControlAction(0, 141, true)
				DisableControlAction(0, 142, true)
				DisableControlAction(0, 257, true)
				DisableControlAction(0, 263, true)
				DisableControlAction(0, 264, true)
			end
		end
	end)
end

function ClientModules.Weapons:CheckForWeaponShots()
	local shootTimer = 0

	GameEvents.OnPlayerShoot(function(args)
		local _, weaponHash = GetCurrentPedWeapon(PlayerPedId(), true)
		local weaponItem = player:inventory():findItem(function(i)
			return i.metadata.id == LocalPlayer.state.current_weapon
		end)

		if not weaponItem then return end

		local weaponItemData = Item.Get(weaponItem.name)

		Events.TriggerServer("weapons:shot", weaponItem.metadata.id, weaponHash, weaponItemData.name)

		if weaponItemData.action.disable_alerts ~= true then
			ClientModules.Illegal:AlertPolice("Tir entendu")

			LocalPlayer.state:set("recentlyShot", true, true)
			shootTimer = GetGameTimer()

			Citizen.SetTimeout(30 * 60 * 1000, function()
				-- 29 minutes just to be sure
				if GetGameTimer() - shootTimer > 29 * 60 * 1000 then
					LocalPlayer.state:set("recentlyShot", false, true)
				end
			end)
		end

		local ammo = Item.GetWeaponAmmoFromModel(weaponHash)
		local ammo_item = player:inventory():findItem(function(item)
			return item.name == ammo
		end)

		if ammo ~= nil then
			ammo_item.quantity = 1
			player:inventory():removeItem(ammo_item)
		end
	end)

	Citizen.CreateThread(function()
		local weapon, group, ammo = nil, nil, nil

		while true do
			weapon = GetSelectedPedWeapon(PlayerPedId())
			group = GetWeapontypeGroup(weapon)
			ammo = GetAmmoInPedWeapon(PlayerPedId(), weapon)

			if IsPedShooting(PlayerPedId()) and group == 'GROUP_THROWN' then
				local item = player:inventory():findItem(function(i)
					return i.name == Item.GetWeaponNameFromModel(weapon)
				end)

				if self:GetTotalQuantity(Item.GetWeaponNameFromModel(weapon)) ~= ammo then
					Utils.RealWait(500) -- Wait for the throw animation to be finished

					item.quantity = 1
					player:inventory():removeItem(item)
				end
			end

			Citizen.Wait(0)
		end
	end)
end

function ClientModules.Weapons:CheckForPedChanges()
	Citizen.CreateThread(function()
		local ped = PlayerPedId()

		while true do
			if ped ~= PlayerPedId() then
				ped = PlayerPedId()
				self:EquipLoadout()
			end

			Citizen.Wait(1000)
		end
	end)
end

function ClientModules.Weapons:Initialize()
	self.OnBack:Initialize()
	self:EquipLoadout()

	if self.Initialized == true then return end

	self:DisableCombatControls()
	self:CheckForWeaponChange()
	self:CheckForWeaponShots()
	self:CheckForPedChanges()
	self:SyncAmmo()

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Weapons:Initialize()
end)
