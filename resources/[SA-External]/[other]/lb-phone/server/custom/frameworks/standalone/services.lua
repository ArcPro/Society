if Config.Framework ~= "standalone" then
    return
end

local outro = exports["SidGamemode"]

---@param source number
---@return string
function GetJob(source)
    return outro:getJob(source)
end

---Get all players with a specific job (including offline players)
---@param job string
---@return { firstname: string, lastname: string, grade: string, number: string }[] employees
function GetAllEmployees(job)
    return outro:getAllEmployees(job)
end

---Get all online players with a specific job
---@param job string
---@return number[] # An array of sources with this job
function GetEmployees(job)
    return outro:getEmployees(job)
end

---Refresh all companies and update the open status
function RefreshCompanies()
    Config.Companies.Services = outro:getCompanies()
	Config.Locations = outro:getLocations()
    for i = 1, #Config.Companies.Services do
        local jobData = Config.Companies.Services[i]
        Config.Companies.Services[i].open = #GetEmployees(jobData.job) > 0
        Config.Companies.Services[i].canMessage = #GetEmployees(jobData.job) > 0
        jobData.open = #GetEmployees(jobData.job) > 0
        jobData.canMessage = #GetEmployees(jobData.job) > 0
    end
    TriggerClientEvent('lb-phone:RefreshCompanies', -1, Config.Companies.Services)
end

RegisterNetEvent("lb-phone:RefreshCompanies", function()
	RefreshCompanies()
end)
