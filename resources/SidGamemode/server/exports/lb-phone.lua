local function hasItem(source)
    local player = Players.Get(source)

    if player == nil then
        return false
    end

    local inventory = Inventories.Get(player:inventory_id())

    if inventory == nil then
        return false
    end

    local phone = inventory:findItem(function(item)
        return item.name == "phone"
    end)

    return phone ~= nil

end

local function hasPhone(source, number)
    local player = Players.Get(source)

    if player == nil then
        return false
    end

    local inventory = Inventories.Get(player:inventory_id())

    if inventory == nil then
        return false
    end

    local phone = inventory:findItem(function(item)
        return item.name == "phone" and item.metadata.number == number
    end)

    return phone ~= nil
end

local function setPhoneNumber(source, number)
    local player = Players.Get(source)

    if player == nil then
        return false
    end

    local inventory = Inventories.Get(player:inventory_id())

    if inventory == nil then
        return false
    end

    local phone = inventory:findItem(function(item)
        return item.name == "phone" and item.metadata.number == nil
    end)

    if phone == nil then
        return false
    end

	local updatedPhone = Functions.DeepCopy(phone)
    updatedPhone.metadata.number = number

    return inventory:updateItem(phone, updatedPhone)
end

local function getIdentifier(source)
    local player = Players.Get(source)

	while player == nil or player:id() == nil do
		player = Players.Get(source)
		Citizen.Wait(500)
	end

    return tostring(player:id())
end

local function getCharacterName(source)
    local player = Players.Get(source)

    if player == nil then
        return nil
    end

    return player:firstname(), player:lastname()
end

local function getBalance(source)
    local player = Players.Get(source)

    if player == nil then
        return -1
    end

    local bankAccount = BankAccounts.Get(player:bank_account_id())

    if bankAccount == nil then
        return -1
    end

    return bankAccount:balance()
end

local function addMoney(source, amount)
	local player = Players.Get(source)

    if player == nil then
        return false
    end

    local bankAccount = BankAccounts.Get(player:bank_account_id())

    if bankAccount == nil then
        return false
    end

	bankAccount:balance(bankAccount:balance() + amount)

    return true
end

local function removeMoney(source, amount)
    local player = Players.Get(source)

    if player == nil then
        return false
    end

    local bankAccount = BankAccounts.Get(player:bank_account_id())

    if bankAccount == nil then
        return false
    end

    return bankAccount:withdraw(amount, false)
end

local function getJob(source)
    local player = Players.Get(source)

    if player == nil then
        return nil
    end

    return player:job().name
end

local function isAdmin(source)
    local player = Players.Get(source)

    if player == nil then
        return false
    end

    return player:permissions() >= Config.Permissions.ADMIN
end

local function isMod(source)
    local player = Players.Get(source)

    if player == nil then
        return false
    end

    return player:permissions() >= Config.Permissions.MOD
end

local function getPlayerVehicles(source)

    local player = Players.Get(source)

    if player == nil then
        return {}
    end

    local all = DB.Vehicle.All(player:fullname())
    local list = {}

    for _, vehicle in pairs(all) do
        if vehicle.owner:lower() == player:fullname():lower() then
            table.insert(list, {
                model = vehicle.model,
                plate = vehicle.plate,
                location = "out",
                type = "car",
            })
        end
    end

    return list
end

local function getVehicle(plate)
    return DB.Vehicle.Get(plate)
end

local function getCompanies()
    local list = {}

    for _, society in pairs(ServerModules.Societies.List) do
		local boss_grades = {}

        for _, grade in pairs(society:grades() or {}) do
            if grade.can_manage then
				table.insert(boss_grades, grade.label)
			end
        end

        table.insert(list, {
			onCustomIconClick = (society:phone_custom_icon() or {}).onCustomIconClick or nil,
			icon = ("https://cdnrv.sysscripts.com/societies/%s.webp"):format(society:name()),
			customIcon = (society:phone_custom_icon() or {}).customIcon or nil,
			canMessage = society:phone_can_message(),
			canCall = society:phone_can_call(),
			open = #society:duties() > 0,
			bossRanks = boss_grades,
			name = society:label(),
			job = society:name(),
			location = {
				coords = {
					x = society:phone_blip().x or 0.0,
					y = society:phone_blip().y or 0.0
				},
				name = "",
			},
		})
    end

    table.sort(list, function(a, b)
        return a.name < b.name
    end)

    return list
end

local function getLocations()
    local list = {}

    for _, company in pairs(ServerModules.Societies.List) do
        if company:phone_blip() ~= nil then
            table.insert(list, {
                position = vector2(company:phone_blip().x or 0.0, company:phone_blip().y or 0.0),
                icon = ("https://cdnrv.sysscripts.com/societies/%s.webp"):format(company:name()),
                name = company:label(),
                description = "",
            })
        end
    end

	return list
end

local function getEmployees(job)
	---@type Society | nil
    local society = nil

    for _, company in pairs(ServerModules.Societies.List) do
        if company:name() == job then
            society = company
            break
        end
    end

    if society == nil then
        return {}
    end

    local list = {}
    for _, employee in pairs(society:duties() or {}) do
        local player = Players.Find(function(p)
            return p:id() == employee
        end)

        if player ~= nil then
            table.insert(list, player:source())
        end

		Citizen.Wait(0)
    end

    return list
end

---@param job string
---@return { firstname: string, lastname: string, grade: string, number: string, online: boolean }[] employees
local function getAllEmployees(job)
    ---@type Society | nil
    local society = nil

    for _, company in pairs(ServerModules.Societies.List) do
        if company:name() == job then
            society = company
            break
        end
    end

    if society == nil then
        return {}
    end

    local list = {}
    for _, employee in pairs(society:employees() or {}) do
        local player = Players.Find(function(p)
            return p:id() == employee.id
        end)

        table.insert(list, {
			number = player and exports["lb-phone"]:GetEquippedPhoneNumber(player:source()) or nil,
			online = player and player:loaded() or false,
			firstname = employee.firstname,
			lastname = employee.lastname,
			grade = employee.grade,
		})

		Citizen.Wait(0)
    end

    return list
end

exports('getPlayerVehicles', getPlayerVehicles)
exports('getVehicle', getVehicle)
exports('getCharacterName', getCharacterName)
exports('getAllEmployees', getAllEmployees)
exports('setPhoneNumber', setPhoneNumber)
exports('getIdentifier', getIdentifier)
exports('getCompanies', getCompanies)
exports('getEmployees', getEmployees)
exports('getLocations', getLocations)
exports('removeMoney', removeMoney)
exports('getBalance', getBalance)
exports('hasItem', hasItem)
exports('hasPhone', hasPhone)
exports('addMoney', addMoney)
exports('isAdmin', isAdmin)
exports('getJob', getJob)
exports('isMod', isMod)
