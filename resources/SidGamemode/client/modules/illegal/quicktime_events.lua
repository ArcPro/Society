ClientModules = ClientModules or {}
ClientModules.Illegal = ClientModules.Illegal or {}
ClientModules.Illegal.QuicktimeEvents = {}
ClientModules.Illegal.QuicktimeEvents.active = false

---@param callback fun(success: boolean)
function ClientModules.Illegal.QuicktimeEvents:Lockpick(callback)
	callback(exports['qte-minigames']:startLockpick())
end

---@param difficulty number
---@param callback fun(success: boolean)
function ClientModules.Illegal.QuicktimeEvents:Datacrack(difficulty, callback)
	LocalPlayer.state:set("busy", true, true)
	self.active = true

	Citizen.CreateThread(function()
		while self.active == true do
			Citizen.Wait(0)

			Utils.DisableControlsForUI()
		end
	end)

	Events.TriggerExternal("datacrack:start", difficulty, function(output)
		LocalPlayer.state:set("busy", false, true)
		callback(output)
		self.active = false
	end)
end

---@param levels 1 | 2 | 3 | 4
---@param lifes 1 | 2 | 3 | 4 | 5 | 6
---@param time 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
---@param callback fun(success: boolean)
function ClientModules.Illegal.QuicktimeEvents:Fingerprint(levels, lifes, time, callback)
	ClientModules.Inventory:Close()

	LocalPlayer.state:set("busy", true, true)

	self.active = true

	Citizen.CreateThread(function()
		while self.active == true do
			Utils.DisableControlsForUI()
			Citizen.Wait(0)
		end
	end)

	Events.TriggerExternal("utk_fingerprint:Start", levels, lifes, time, function(outcome, reason)
		LocalPlayer.state:set("busy", false, true)
		self.active = false
		callback(outcome)
	end)
end

---@param size integer
---@param callback fun(success: boolean)
function ClientModules.Illegal.QuicktimeEvents:Safecracking(size, callback)
	local digits = {}

	for i = 1, size, 1 do
		table.insert(digits, math.random(0,99))
	end

	callback(exports['qte-minigames']:safeCracking(digits))
end

---@param callback fun(success: boolean)
function ClientModules.Illegal.QuicktimeEvents:Bruteforce(callback)
	self.active = true

	local function cb(success)
		self.active = false
		callback(success)
	end

	Citizen.CreateThread(function()
		while self.active == true do
			Utils.DisableControlsForUI()
			Citizen.Wait(0)
		end
	end)

	exports['qte-minigames']:Bruteforce(cb)
end

---@param callback fun(success: boolean)
function ClientModules.Illegal.QuicktimeEvents:HackingPhone(callback)
	Events.TriggerExternal("mhacking:show")
	Events.TriggerExternal("mhacking:start", 7, 35, function(success)
		Events.TriggerExternal("mhacking:hide")

		if callback then
			callback(success)
		end
	end)
end
