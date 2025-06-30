ClientModules = ClientModules or {}
ClientModules.Societies = ClientModules.Societies or {}
ClientModules.Societies.Grades = {}
ClientModules.Societies.Grades.Initialized = false

function ClientModules.Societies.Grades:Get(id, grade)
	local society = ClientModules.Societies:Get(id)

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

function ClientModules.Societies.Grades:Create(society, id, grade, label)
	society = ClientModules.Societies:Get(society)

	if society == nil then return end

	society:add_grade({ id = id, grade = grade, label = label, salary = 100, can_manage = 0 })
end

function ClientModules.Societies.Grades:Update(society, id, grade, label, salary, can_manage)
	society = ClientModules.Societies:Get(society)

	if society == nil then return end

	society:update_grade({ id = id, grade = grade, label = label, salary = salary, can_manage = can_manage })
end

function ClientModules.Societies.Grades:Delete(society, id)
	society = ClientModules.Societies:Get(society)

	if society == nil then return end

	society:delete_grade(id)
end

function ClientModules.Societies.Grades:RegisterEvents()
	Events.Register("society:grades:add", function(source, society, id, grade, label)
		self:Create(society, id, grade, label)
	end)

	Events.Register("society:grades:update", function(source, society, id, grade, label, salary, can_manage)
		self:Update(society, id, grade, label, salary, can_manage)
	end)

	Events.Register("society:grades:delete", function(source, society, id)
		self:Delete(society, id)
	end)
end

function ClientModules.Societies.Grades:Initialize()
	if self.Initialized == true then return end

	self:RegisterEvents()

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Societies.Grades:Initialize()
end)
