
if Config.Framework ~= "standalone" then
    return
end

local outro = exports["SidGamemode"]

---@return string
function GetJob()
    return outro:getJob()
end

---CompanyData can be found in lb-phone/client/apps/framework/services.lua
---@param cb fun(companyData: CompanyData)
---@return CompanyData? companyData
function GetCompanyData(cb)
    cb(outro:getCompanyData())
end

---@param amount number
---@param cb fun(newBalance: number)
---@return number? newBalance
function DepositMoney(amount, cb)
    return 0
end

---@param amount number
---@param cb fun(newBalance: number)
---@return number? newBalance
function WithdrawMoney(amount, cb)
    return 0
end

---@param source number
---@param cb fun(employee: { id: number, name: string })
---@return { id: number, name: string } | false | nil employee
function HireEmployee(source, cb)
    cb(outro:hireEmployee(source))
end

---@param id any
---@param cb fun(success: boolean)
---@return boolean? success
function FireEmployee(id, cb)
    cb(outro:fireEmployee(id))
end

---@param id any
---@param newGrade number
---@param cb fun(success: boolean)
---@return boolean? success
function SetGrade(id, newGrade, cb)
    cb(outro:setGrade(identifier, newGrade))
end

---@param duty boolean
function ToggleDuty(duty)
    outro:toggleDuty(duty)
end

RegisterNetEvent('lb-phone:RefreshCompanies', function(data)
    Config.Companies.Services = data
end)
