ServerModules = ServerModules or {}
ServerModules.Societies = ServerModules.Societies or {}
ServerModules.Societies.Employees = {}

local function SetPlayerJob(player, job, grade)
    player:job(job)
    player:job_grade(grade)

    if player:source() then
        Events.TriggerClient("player:update", player:source(), "job_grade", player:job_grade())
        Events.TriggerClient("player:update", player:source(), "job", player:job())
    else
        DB.Player.UpdateCharacter(player)
    end
end

function ServerModules.Societies.Employees:Add(source, id, employee, grade_id, is_source)
	if is_source == true then
		employee = Players.Get(employee):id()
	end

	local grade = ServerModules.Societies.Grades:Get(id, grade_id)
	local society = ServerModules.Societies.List[id]
    local player = Players.Find(function(ply)
        return ply:id() == employee
    end)

    if player == nil then
        player = DB.Player.GetCharacterById(employee)
    end

    if player == nil or society == nil or grade == nil then return end

    if player:job().id ~= nil then
        self:Delete(source, id, employee)
    end

	SetPlayerJob(player, {
        id = society:id(),
        label = society:label(),
        name = society:name(),
    }, {
        grade = grade.grade,
        label = grade.label,
    })

	society:add_employee({ id = player:id(), firstname = player:firstname(), lastname = player:lastname(), grade = grade.grade })

	Events.TriggerClient("society:employees:add", -1, society:id(), employee, player:firstname(), player:lastname(), grade.grade)

	SharedModules.Log:Create(source, "societies", "employees_add", {
		["Entreprise"] = society:label(),
		["Employé"] = player:fullname(),
		["Grade"] = grade.grade,
	})
end

function ServerModules.Societies.Employees:Update(source, id, employee, grade_id)
	local grade = ServerModules.Societies.Grades:Get(id, grade_id)
	local society = ServerModules.Societies.List[id]
    local player = Players.Find(function(ply)
        return ply:id() == employee
    end)

    if player == nil then
        player = DB.Player.GetCharacterById(employee)
    end

    if player == nil or player:job().id == nil or society == nil or grade == nil then return end

	SetPlayerJob(player, {
        id = society:id(),
        label = society:label(),
        name = society:name(),
    }, {
        grade = grade.grade,
        label = grade.label,
    })

	society:update_employee({ id = player:id(), firstname = player:firstname(), lastname = player:lastname(), grade = grade.grade })

	Events.TriggerClient("society:employees:update", -1, society:id(), employee, player:firstname(), player:lastname(), grade.grade)

	SharedModules.Log:Create(source, "societies", "employees_setgrade", {
		["Entreprise"] = society:label(),
		["Employé"] = player:fullname(),
		["Grade"] = grade.grade,
	})
end

function ServerModules.Societies.Employees:Delete(source, id, employee)
	local society = ServerModules.Societies.List[id]
    local player = Players.Find(function(ply)
        return ply:id() == employee
    end)

    if player == nil then
        player = DB.Player.GetCharacterById(employee)
    end

    if player == nil or society == nil then return end

	local current_society = ServerModules.Societies.List[player:job().id]

	if current_society and Table.has(current_society:duties(), player:id()) then
		ServerModules.Societies.Duty:Toggle(source, current_society:id(), player:id())
	end

	SetPlayerJob(player, {
        label = nil,
        name = nil,
        id = nil,
    }, {
        grade = nil,
        label = nil,
    })

	society:delete_employee(player:id())

	Events.TriggerClient("society:employees:delete", -1, society:id(), player:id())

	SharedModules.Log:Create(source, "societies", "employees_remove", {
		["Entreprise"] = society:label(),
		["Employé"] = player:fullname(),
	})
end

function ServerModules.Societies.Employees:Initialize()
	Events.Register("society:employees:add", function(source, id, employee, grade, is_source)
		self:Add(source, id, employee, grade, is_source)
	end)

	Events.Register("society:employees:update", function(source, id, employee, grade)
		self:Update(source, id, employee, grade)
	end)

	Events.Register("society:employees:delete", function(source, id, employee)
		self:Delete(source, id, employee)
	end)
end

ServerModules.Societies.Employees:Initialize()
