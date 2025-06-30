MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.BankAccounts = MainMenu.Admin.BankAccounts or {}

local bankAccounts = {}

MainMenu.Admin.BankAccounts.onOpen = function(filter)
    bankAccounts = Callbacks.Trigger("bank:all", filter) or {}

    table.sort(bankAccounts, function(a, b)
        return a.type < b.type
    end)
end

MainMenu.Admin.BankAccounts.Create = function()
    MainMenu.Admin.BankAccounts.Main = Menus:CreateSub(MainMenu.Admin.Main, "Comptes bancaires", "default")
    MainMenu.Admin.BankAccounts.BankAccount.Create()

    Menus:CreateThread(MainMenu.Admin.BankAccounts.Main, function()
        Menus:IsVisible(MainMenu.Admin.BankAccounts.Main, function()
            Menus:AddButton("Rechercher", false, "🔍", "", function()
				MainMenu.Admin.BankAccounts.onOpen(Utils.KeyboardInput("Recherche", 50, ""))
            end)

            Menus:AddButton("Créer", false, "➕", "", function()
                local code = Utils.KeyboardInput("Code", 50, "")

                if code == "" or code == nil then
                    code = "0000"
                end

                UI:AddNotification("basic", ("Compte ~b~%d~s~ créé"):format(Callbacks.Trigger("bank:create", code)), "info", 5000)
                MainMenu.Admin.BankAccounts.onOpen()
            end)

            if #bankAccounts == 0 then return end

            Menus:AddSeparator("Comptes")

            for _, account in pairs(bankAccounts) do
                Menus:AddButton(("Compte %d"):format(account.id), false, account.type == "society" and "~g~Entreprise~s~" or "~b~Personnel~s~", "", function()
                    MainMenu.Admin.BankAccounts.BankAccount.onOpen(account.id)
                end, MainMenu.Admin.BankAccounts.BankAccount.Main)
            end
        end)
    end)
end
