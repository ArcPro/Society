ClientModules = ClientModules or {}
ClientModules.Admin = ClientModules.Admin or {}
ClientModules.Admin.Report = {}

ClientModules.Admin.Report.initialized = false

function ClientModules.Admin.Report:RegisterUICallbacks()
	UI:RegisterCallback("report:new", function (data, cb)
		Events.TriggerServer("report:new", { author = GetPlayerName(PlayerId()), author_id = player:id(), content = data.message })
		cb(true)
	end)

	UI:RegisterCallback("report:addMessage", function (data, cb)
		Events.TriggerServer("report:addMessage", data.id, { author = GetPlayerName(PlayerId()), author_id = player:id(), content = data.message })
		cb(true)
	end)

	UI:RegisterCallback("report:goto", function (data, cb)
		ExecuteCommand(("goto %d"):format(data.target))
		cb(true)
	end)

	UI:RegisterCallback("report:bring", function (data, cb)
		ExecuteCommand(("bring %d"):format(data.target))
		cb(true)
	end)

	UI:RegisterCallback("report:revive", function (data, cb)
		Events.TriggerServer("player:revive", data.target, 100)
		cb(true)
	end)

	UI:RegisterCallback("report:view", function (data, cb)
		cb(true)
		UI:Toggle("report", false, {}, false, false)
		Citizen.Wait(50)

		MainMenu.Admin.Players.Player.onOpen(data.target, true)
		Menus:Visible(MainMenu.Admin.Players.Player.Main, true)
	end)

	UI:RegisterCallback("report:close", function (data, cb)
		Events.TriggerServer("report:close", data.report_id)
		cb(true)
	end)
end

function ClientModules.Admin.Report:RegisterEvents()
	Events.Register("report:new", function(source, report)
		UI:AddNotification("basic", "Nouveau report", "info", 5000)
		UI:SendMessage("report:new", { report = report })
	end)

	Events.Register("report:addMessage", function(source, id, message)
		UI:AddNotification("basic", "Nouveau message dans un report", "info", 5000)
		UI:SendMessage("report:addMessage", { id = id, message = message })
	end)

	Events.Register("report:close", function(source, id)
		UI:AddNotification("basic", "Report fermé", "info", 5000)
		UI:SendMessage("report:close", { id = id })
	end)
end

function ClientModules.Admin.Report:Initialize()
	if self.Initialized == true then return end

	RegisterCommand("report", function()
		UI:Toggle("report", true, { reports = Callbacks.Trigger("report:all") or {}, self_id = player:id(), staff = player:permissions() >= Config.Permissions.MOD }, true, false)
	end, false)

	Events.TriggerExternal("chat:addSuggestion", "/report", "Faire un report", {})

	ClientModules.Admin.Report:RegisterUICallbacks()
	ClientModules.Admin.Report:RegisterEvents()

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Admin.Report:Initialize()
end)
