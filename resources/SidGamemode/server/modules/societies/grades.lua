ServerModules = ServerModules or {}
ServerModules.Societies = ServerModules.Societies or {}
ServerModules.Societies.Grades = {}

function ServerModules.Societies.Grades:Get(id, grade)
	local society = ServerModules.Societies.List[id]

	if society == nil then
		return nil
	end

	for k, v in pairs(society:grades() or {}) do
		if v.grade == grade then
			return v
		end
	end

	return nil
end

function ServerModules.Societies.Grades:Create(source, society, grade, label)
	society = ServerModules.Societies.List[society]
	local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.HM then return end
	if society == nil then return end

	local id = DB.Society.Grades.Add(society:id(), grade, label)

	society:add_grade({ id = id, grade = grade, label = label, salary = 100, can_manage = 0 })

	Events.TriggerClient("society:grades:add", -1, society:id(), id, grade, label)

	SharedModules.Log:Create(source, "societies", "society_addgrade", {
		["Entreprise"] = society:label(),
		["Grade"] = grade,
		["Label"] = label,
	})
end

function ServerModules.Societies.Grades:Update(source, society, id, grade, label, salary, can_manage)
	society = ServerModules.Societies.List[society]
	local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.HM then return end
	if society == nil then return end

	society:update_grade({ id = id, grade = grade, label = label, salary = salary, can_manage = can_manage })

	DB.Society.Grades.Update(id, grade, label, salary, can_manage)
	Events.TriggerClient("society:grades:update", -1, society:id(), id, grade, label, salary, can_manage)

	SharedModules.Log:Create(source, "societies", "society_updategrade", {
		["Entreprise"] = society:label(),
		["Gestion"] = can_manage and "✅" or "❌",
		["Salaire"] = salary,
		["Grade"] = grade,
		["Label"] = label,
	})
end

function ServerModules.Societies.Grades:Delete(source, society, id)
	society = ServerModules.Societies.List[society]
	local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.HM then return end
	if society == nil then return end

	society:delete_grade(id)

	DB.Society.Grades.Delete(id)
	Events.TriggerClient("society:grades:delete", -1, society:id(), id)

	SharedModules.Log:Create(source, "societies", "society_delgrade", {
		["Entreprise"] = society:label(),
		["Grade"] = grade,
	})
end

function ServerModules.Societies.Grades:Initialize()
	Events.Register("society:grades:add", function(source, society, grade, label)
		self:Create(source, society, grade, label)
	end)

	Events.Register("society:grades:update", function(source, society, id, grade, label, salary, can_manage)
		self:Update(source, society, id, grade, label, salary, can_manage)
	end)

	Events.Register("society:grades:delete", function(source, society, id)
		self:Delete(source, society, id)
	end)
end

ServerModules.Societies.Grades:Initialize()
