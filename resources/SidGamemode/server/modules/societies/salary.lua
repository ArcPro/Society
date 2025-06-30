ServerModules = ServerModules or {}
ServerModules.Societies = ServerModules.Societies or {}
ServerModules.Societies.Salary = {}
ServerModules.Societies.Salary.Interval = 5 * 60 * 1000
ServerModules.Societies.Salary.BankAccount = nil
ServerModules.Societies.Salary.DefaultValue = 5

function ServerModules.Societies.Salary:GetSalaryForSocietyRank(job, rank)
	local society = ServerModules.Societies.List[job]

	if society == nil then
		return self.DefaultValue
	end

	return (ServerModules.Societies.Grades:Get(society:id(), rank) or { salary = 0 }).salary
end

function ServerModules.Societies.Salary:PaySalary(source, iban, job, rank)
    local salary = self:GetSalaryForSocietyRank(job, rank)
    local player = Players.Get(source)

    if iban == nil then
        Events.TriggerClient("player:notify", source, "basic", "~r~Vous n'avez pas reçu votre salaire car vous n'avez pas de compte en banque~s~", "info", 5000)
        return
    end

    if salary <= 0 or (job ~= nil and OnesyncPlayer(source).state.duty ~= true) then return end

    if player and player:permissions() >= 1 then
		-- if player and player:permissions() >= Config.Permissions.MOD then
        if (job == nil) then salary = 30
        else salary = salary * 2
        end
        Events.TriggerClient(
            "player:notify",
            source,
            "basic",
            ("~s~Vous avez reçu votre salaire ~b~x2 ($%d)~s~ (~y~GOLD~s~)"):format(salary),
            "info",
            5000
        )
    else
        Events.TriggerClient("player:notify", source, "basic", ("~b~Vous avez reçu votre salaire ($%d)~s~"):format(salary), "info", 5000)
    end
    self.BankAccount:send(salary, iban)
end

function ServerModules.Societies.Salary:Initialize()
	MySQL.insert.await("DELETE FROM `bank_logs` WHERE `account` = 1")

	self.BankAccount = BankAccounts.Get(1)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(self.Interval)

			Citizen.CreateThread(function()
				for source, player in pairs(Players._list) do
					self:PaySalary(source, player:bank_account_id(), player:job().id, player:job_grade().grade)
					Citizen.Wait(0)
				end
			end)
		end
	end)
end

RegisterNetEvent("pay:salary")
AddEventHandler("pay:salary", function()
    local source = source
    local player = Players.Get(source)
    if not player then return end

    local iban = player:bank_account_id()
    local job = player:job().id
    local rank = player:job_grade().grade
    ServerModules.Societies.Salary:PaySalary(source, iban, job, rank)
end)

ServerModules.Societies.Salary:Initialize()

