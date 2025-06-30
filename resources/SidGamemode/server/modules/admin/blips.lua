ServerModules = ServerModules or {}
ServerModules.Admin = ServerModules.Admin or {}
ServerModules.Admin.Blips = {}
ServerModules.Admin.Blips.EnabledPlayers = {}
ServerModules.Admin.Blips.TickTime = 1000

function ServerModules.Admin.Blips:Update()
	local data = self:Get()
	for source, _ in pairs(self.EnabledPlayers) do
		Events.TriggerClient("admin:blips", source, data)
	end
end

function ServerModules.Admin.Blips:Get()
	local list = {}

	for source, player in pairs(Players._list) do
		table.insert(list, { source = source, name = player:fullname(), position = player:position() })
	end

	return list
end

function ServerModules.Admin.Blips:WatchForChanges()
	AddStateBagChangeHandler("blips", "", function(bag, key, value, reserved, replicated)
		local source = bag:gsub("player:", "")

		if value == true then
			self.EnabledPlayers[source] = true
		else
			self.EnabledPlayers[source] = nil
		end
	end)
end

function ServerModules.Admin.Blips:Initialize()
	self:WatchForChanges()

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(self.TickTime)
			self:Update()
		end
	end)
end

ServerModules.Admin.Blips:Initialize()
