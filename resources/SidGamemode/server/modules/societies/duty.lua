ServerModules = ServerModules or {}
ServerModules.Societies = ServerModules.Societies or {}
ServerModules.Societies.Duty = {}

function ServerModules.Societies.Duty:Toggle(source, id, employee, toggle)
	local society = ServerModules.Societies.List[id]
	local player = Players.Find(function(player)
		return player:id() == employee
	end)

	if society == nil then return end

	if toggle == true then
		society:add_duty(employee)
	else
		society:delete_duty(employee)
	end

	if player ~= nil then
		OnesyncPlayer(player:source()).state:set("duty", toggle, true)
	end

	Events.TriggerClient("society:duties:toggle", -1, id, employee, toggle)
	Events.TriggerExternal("lb-phone:RefreshCompanies")

	SharedModules.Log:Create(source, "societies", "duty_toggle", {
		["Entreprise"] = society:label(),
		["Employé"] = employee,
		["Service"] = toggle == true and "Début" or "Fin",
	})
end

function ServerModules.Societies.Duty:Initialize()
	Events.Register("society:duties:toggle", function(source, id, employee, toggle)
		self:Toggle(source, id, employee, toggle)
	end)
end

ServerModules.Societies.Duty:Initialize()
