local function hasItem(itemName)
    while player == nil or player:loaded() == false do Citizen.Wait(100) end
    local hasPhoneItem = player:inventory():findItem(function(item)
        return item.name == itemName
    end) ~= nil
    return hasPhoneItem
end

local function hasPhone(number)
    while player == nil or player:loaded() == false do Citizen.Wait(100) end
    local hasPhoneItem = player:inventory():findItem(function(item)
        return item.name == "phone" and item.metadata.number == number
    end) ~= nil
    return hasPhoneItem
end

local function getFirstNumber()
    while player == nil or player:loaded() == false do Citizen.Wait(100) end
    local phone = player:inventory():findItem(function(item)
        return item.name == "phone"
    end)

    if phone == nil then
        return nil
    end

    return phone.metadata.number
end

local function hasJob(jobs)
    for _, job in pairs(jobs) do
        if player:job().name == job then
            return true
        end
    end
end

local function hireEmployee(source)
	Events.TriggerServer("society:employees:add", player:job().id, source, 1, true)
    return true
end

local function fireEmployee(id)
	Events.TriggerServer("society:employees:delete", player:job().id, id)
    return true
end

local function setGrade(id, grade)
	Events.TriggerServer("society:employees:update", player:job().id, id, tonumber(grade))
    return true
end

local function getCompanyData()
    local company = ClientModules.Societies:Get(player:job().id)

    if company == nil then
        return {}
    end

    local bankAccount = Bank.GetAccount(company:bank_account_id() or -1)
    local employees = {}

    for _, data in pairs(company:employees() or {}) do
        table.insert(employees, {
            gradeLabel = (ClientModules.Societies.Grades:Get(company:id(), data.grade) or { label = "Grade inconnu" }).label,
			canInteract = (data.grade or 0) < player:job_grade().grade,
            name = data.firstname .. " " .. data.lastname,
			online = Table.has(company:duties(), data.id),
            grade = data.grade,
            id = data.id,
        })
    end

    return {
        isBoss = ClientModules.Societies.Grades:Get(company:id(), player:job_grade().grade).can_manage,
        balance = bankAccount and bankAccount:balance() or -1,
        duty = LocalPlayer.state.duty == true,
        jobLabel = company:label(),
        grades = company:grades(),
        employees = employees,
        job = company:name(),
    }
end

local function toggleDuty(duty)
	Events.TriggerServer("society:duties:toggle", ClientModules.Societies:Get(player:job().id):id(), player:id(), duty)

    local company = ClientModules.Societies:Get(player:job().id)

    if company:id() == 23 or company:id() == 28 then
        if duty then
            Console.Log("Blip created - N2")
            Events.TriggerExternalServer("eblips:add", {name = player:fullname(), src = player:source(), company = company:id(), color = 38})
        else
            Console.Log("Blip deleted - N2")
            Events.TriggerExternalServer("eblips:remove", player:source())
        end
    end
end

local function getCompany(name)
    local company = ClientModules.Societies:Find(name)

    if company == nil then
        return nil
    end

    return {
        icon = ("https://cdnrv.sysscripts.com/societies/%s.webp"):format(society:name()),
        name = company:label(),
        job = company:name(),
    }
end

local function customIconClicked(name, data)
    PhoneCustomIconActions[name](data)
end

exports('customIconClicked', customIconClicked)
exports('getFirstNumber', getFirstNumber)
exports('getCompanyData', getCompanyData)
exports('hireEmployee', hireEmployee)
exports('fireEmployee', fireEmployee)
exports('toggleDuty', toggleDuty)
exports('getCompany', getCompany)
exports('hasPhone', hasPhone)
exports('hasItem', hasItem)
exports('setGrade', setGrade)
exports('hasJob', hasJob)
