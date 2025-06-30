local reports = {}

Events.Register("report:new", function(source, message)
	local id = math.random(1, 2147483647)
	local player = Players.Get(source)
	local balance = -1

	if player == nil then return end

	local bank_account = BankAccounts.Get(player:bank_account_id())

	if bank_account ~= nil then
		balance = bank_account:balance()
	end

	local report = {
		messages = { message },
		informations = {
			group 			= (DB.Group.Get(player:group()) or { label = "Aucun" }).label,
			discord_id		= player:identifiers().discord,
			job 			= player:job().label,
			name 			= player:fullname(),
			server_id		= player:source(),
			character_id	= player:id(),
			balance			= balance,
		},
		id = id,
	}

	table.insert(reports, report)

	for k, staff in pairs(Players._list) do
		if staff:permissions() >= Config.Permissions.MOD then
			Events.TriggerClient("report:new", staff:source(), report)
		end
	end

	if player:permissions() < Config.Permissions.MOD then
		Events.TriggerClient("report:new", source, report)
	end
end)

Events.Register("report:addMessage", function(source, id, message)
	local player = Players.Get(source)
	local targetReport = nil

	if player == nil then return end

	for k, report in pairs(reports) do
		if report.id == id then
			table.insert(reports[k].messages, message)
			targetReport = report
			break
		end
	end

	if targetReport == nil then return end

	for k, staff in pairs(Players._list) do
		if staff:permissions() >= Config.Permissions.MOD then
			Events.TriggerClient("report:addMessage", staff:source(), id, message)
		end
	end

	if player:permissions() < Config.Permissions.MOD then
		Events.TriggerClient("report:addMessage", source, id, message)
	end

	if player:id() ~= targetReport.informations.character_id then
		Events.TriggerClient("report:addMessage", targetReport.informations.server_id, id, message)
	end
end)

Events.Register("report:close", function(source, id)
	local player = Players.Get(source)
	local targetReport = nil
	local newReports = {}

	if player == nil then return end


	for k, report in pairs(reports) do
		if report.id ~= id then
			table.insert(newReports, report)
		else
			targetReport = report
		end
	end

	if targetReport == nil then return end

	reports = newReports

	for k, staff in pairs(Players._list) do
		if staff:permissions() >= Config.Permissions.MOD then
			Events.TriggerClient("report:close", staff:source(), id)
		end
	end

	if player:permissions() < Config.Permissions.MOD then
		Events.TriggerClient("report:close", source, id)
	end

	if player:id() ~= targetReport.informations.character_id then
		Events.TriggerClient("report:close", targetReport.informations.server_id, id)
	end
end)

Callbacks.Register("report:all", function(source)
	local player = Players.Get(source)

	if player == nil then return end

	if player:permissions() >= Config.Permissions.MOD then
		return reports
	end

	local filteredReports = {}

	for k, report in pairs(reports) do
		if report.informations.character_id == player:id() then
			table.insert(filteredReports, report)
		end
	end

	return filteredReports
end)
