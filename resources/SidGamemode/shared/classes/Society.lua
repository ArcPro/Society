---@alias Grade { id: integer, label: string, salary: integer, grade: integer, can_manage: 0 | 1 }
---@alias Employee { id: integer, firstname: string, lastname: string, grade: integer }

---@class Society
---@field private _id integer | nil
---@field private _bank_account_id integer | nil
---@field private _name string | nil
---@field private _label string | nil
---@field private _phone_blip vector2 | nil
---@field private _phone_can_message boolean | nil
---@field private _phone_can_call boolean | nil
---@field private _phone_custom_icon { customIcon: string, onCustomIconClick: string } | nil
---@field private _grades Grade[] | nil
---@field private _employees Employee[] | nil
---@field private _duties integer[] | nil
Society = {
	_id = nil,
	_bank_account_id = nil,
	_name = "",
	_label = "",
	_phone_blip = nil,
	_phone_can_message = true,
	_phone_can_call = true,
	_phone_custom_icon = {},
	_grades = {},
	_employees = {},
	_duties = {}
}
Society.__index = Society

---@param data { id: integer, bank_account_id: integer, name: string, label: string, phone_blip: vector2, phone_can_message: true, phone_can_call: true, phone_custom_icon: { customIcon: string, onCustomIconClick : string }, grades: Grade[], employees: Employee[], duties: integer[] }
---@return Society
function Society:new(data)
    local self = setmetatable({}, Society)

	self:id(data.id)
	self:bank_account_id(data.bank_account_id or Society._bank_account_id)
	self:name(data.name or Society._name)
	self:label(data.label or Society._label)
	self:phone_blip(data.phone_blip or Functions.DeepCopy(Society._phone_blip))
	self:phone_can_message(data.phone_can_message)
	self:phone_can_call(data.phone_can_call)
	self:phone_custom_icon(data.phone_custom_icon or Functions.DeepCopy(Society._phone_custom_icon))
	self:grades(data.grades or Functions.DeepCopy(Society._grades))
	self:employees(data.employees or Functions.DeepCopy(Society._employees))
	self:duties(data.duties or Functions.DeepCopy(Society._duties))

	if Config.Env == "server" then
		ServerModules.Societies.List[self:id()] = self
	else
		ClientModules.Societies.List[self:id()] = self
	end

    return self
end

---@param id integer | nil
---@return integer | nil
function Society:id(id)
	if id ~= nil then
        self._id = id
    end

    return self._id
end

---@param bank_account_id integer | nil
---@return integer | nil
function Society:bank_account_id(bank_account_id)
	if bank_account_id ~= nil then
        self._bank_account_id = bank_account_id
    end

    return self._bank_account_id
end

---@param name string | nil
---@return string | nil
function Society:name(name)
	if name ~= nil then
        self._name = name
    end

    return self._name
end

---@param label string | nil
---@return string | nil
function Society:label(label)
	if label ~= nil then
        self._label = label
    end

    return self._label
end

---@param phone_blip vector2 | nil
---@return vector2 | nil
function Society:phone_blip(phone_blip)
	if phone_blip ~= nil then
        self._phone_blip = phone_blip
    end

    return self._phone_blip
end

---@param phone_can_message boolean | nil
---@return boolean | nil
function Society:phone_can_message(phone_can_message)
	if phone_can_message ~= nil then
        self._phone_can_message = phone_can_message
    end

    return self._phone_can_message
end

---@param phone_can_call boolean | nil
---@return boolean | nil
function Society:phone_can_call(phone_can_call)
	if phone_can_call ~= nil then
        self._phone_can_call = phone_can_call
    end

    return self._phone_can_call
end

---@param phone_custom_icon { customIcon: string, onCustomIconClick : string } | nil
---@return { customIcon: string, onCustomIconClick : string } | nil
function Society:phone_custom_icon(phone_custom_icon)
	if phone_custom_icon ~= nil then
        self._phone_custom_icon = phone_custom_icon
    end

    return self._phone_custom_icon
end

---@param grades Grade[] | nil
---@return Grade[] | nil
function Society:grades(grades)
	if grades ~= nil then
        self._grades = grades
    end

    return self._grades
end

---@param grade Grade
---@return Grade | nil
function Society:add_grade(grade)
	table.insert(self._grades, grade)

    return grade
end

---@param grade Grade
---@return Grade | nil
function Society:update_grade(grade)
	for k, v in pairs(self._grades) do
		if v.id == grade.id then
			self._grades[k] = grade
			break
		end
	end

    return grade
end

---@param grade integer
---@return integer | nil
function Society:delete_grade(grade)
	for k, v in pairs(self._grades) do
		if v.id == grade then
			self._grades[k] = nil
			break
		end
	end

    return grade
end

---@param employees Employee[] | nil
---@return Employee[] | nil
function Society:employees(employees)
	if employees ~= nil then
        self._employees = employees
    end

    return self._employees
end

---@param employee Employee
---@return Employee | nil
function Society:add_employee(employee)
	table.insert(self._employees, employee)

    return employee
end

---@param employee Employee
---@return Employee | nil
function Society:update_employee(employee)
	for k, v in pairs(self._employees) do
		if v.id == employee.id then
			self._employees[k] = employee
			break
		end
	end

    return employee
end

---@param employee integer
---@return integer | nil
function Society:delete_employee(employee)
	for k, v in pairs(self._employees) do
		if v.id == employee then
			self._employees[k] = nil
			break
		end
	end

    return employee
end

---@param duties integer[] | nil
---@return integer[] | nil
function Society:duties(duties)
	if duties ~= nil then
        self._duties = duties
    end

    return self._duties
end

---@param id integer
---@return integer
function Society:add_duty(id)
	table.insert(self._duties, id)

	return id
end

---@param id integer
---@return integer
function Society:delete_duty(id)
	for k, v in pairs(self._duties) do
		if v == id then
			table.remove(self._duties, k)
			break
		end
	end

	return id
end
