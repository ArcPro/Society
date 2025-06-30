MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.BankAccounts = MainMenu.Admin.BankAccounts or {}
MainMenu.Admin.BankAccounts.BankAccount = MainMenu.Admin.BankAccounts.BankAccount or {}

---@type BankAccount | nil
local currentBankAccount = nil
local typesLabels = { "Personnel", "Entreprise" }
local types = { "personnal", "society" }
local typeIndex = 1

MainMenu.Admin.BankAccounts.BankAccount.onOpen = function (id)
    currentBankAccount = Bank.GetAccount(id)

    if currentBankAccount == nil then
        return
    end

    typeIndex = currentBankAccount:type() == "personnal" and 1 or 2
end

MainMenu.Admin.BankAccounts.BankAccount.Create = function()
    MainMenu.Admin.BankAccounts.BankAccount.Main = Menus:CreateSub(MainMenu.Admin.BankAccounts.Main, "Compte bancaire", "default")

    Menus:CreateThread(MainMenu.Admin.BankAccounts.BankAccount.Main, function()
        Menus:IsVisible(MainMenu.Admin.BankAccounts.BankAccount.Main, function()
            if currentBankAccount == nil then
                return
            end

            Menus:AddButton("Solde", false, tostring(currentBankAccount:balance()), "", function()
                local balance = tonumber(Utils.KeyboardInput("Solde", 20, tostring(currentBankAccount:balance())))

                if balance == nil then
                    return
                end

                currentBankAccount:balance(balance)

                Events.TriggerServer("bank:update", currentBankAccount)
            end)

            Menus:AddButton("Code", false, currentBankAccount:code(), "", function()
                local code = Utils.KeyboardInput("Code", 4, currentBankAccount:code())

                if code == nil then
                    return
                end

                currentBankAccount:code(code)

                Events.TriggerServer("bank:update", currentBankAccount)
            end)

            Menus:AddList("Type", typesLabels, typeIndex, false, function(isClicked, index)
                if isClicked then
                    currentBankAccount:type(types[typeIndex])

                    Events.TriggerServer("bank:update", currentBankAccount)
                end

                typeIndex = index
            end)

            Menus:AddButton("~r~Supprimer~s~", false, "🗑️", "", function()
				Utils.ValidateDeletion(function()
					Events.TriggerServer("bank:delete", currentBankAccount:id())
					Citizen.Wait(500)

					MainMenu.Admin.BankAccounts.onOpen()
					Menus:Back()
				end)
            end)
        end)
    end)
end
