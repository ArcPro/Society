ClientModules = ClientModules or {}
ClientModules.Societies = ClientModules.Societies or {}
ClientModules.Societies.Employees = {}
ClientModules.Societies.Employees.Initialized = false

function ClientModules.Societies.Employees:Add(id, employee, firstname, lastname, grade_id)
	local grade = ClientModules.Societies.Grades:Get(id, grade_id)
	local society = ClientModules.Societies.List[id]

	if grade == nil or society == nil then return end

	society:add_employee({ id = employee, firstname = firstname, lastname = lastname, grade = grade.grade })
end

function ClientModules.Societies.Employees:Update(id, employee, firstname, lastname, grade_id)
	local grade = ClientModules.Societies.Grades:Get(id, grade_id)
	local society = ClientModules.Societies.List[id]

	if grade == nil or society == nil then return end

	society:update_employee({ id = employee, firstname = firstname, lastname = lastname, grade = grade.grade })
end

function ClientModules.Societies.Employees:Delete(id, employee)
	local society = ClientModules.Societies.List[id]

	if society == nil then return end

	society:delete_employee(employee)
end

function ClientModules.Societies.Employees:RegisterEvents()
	Events.Register("society:employees:add", function(_, id, employee, firstname, lastname, grade)
		self:Add(id, employee, firstname, lastname, grade)
	end)

	Events.Register("society:employees:update", function(_, id, employee, firstname, lastname, grade)
		self:Update(id, employee, firstname, lastname, grade)
	end)

	Events.Register("society:employees:delete", function(_, id, employee)
		self:Delete(id, employee)
	end)
end

function ClientModules.Societies.Employees:Initialize()
	if self.Initialized == true then return end

	self:RegisterEvents()

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Societies.Employees:Initialize()
end)
