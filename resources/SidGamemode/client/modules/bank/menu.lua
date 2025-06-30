Core.Player:OnLoad(function()
    local BankMenu = Menus:Create("Banque", "default")
    local CreateAccountMenu = Menus:CreateSub(BankMenu, "Créer un compte", "default")

    local code = ""

    Menus:CreateThread(BankMenu, function()
        Menus:IsVisible(BankMenu, function()
            Menus:AddButton("Créer un compte", player:bank_account_id() ~= nil, "", "chevron_right", function()end, CreateAccountMenu)

            Menus:AddButton("Récupérer une deuxième carte", player:bank_account_id() == nil, "", "chevron_right", function()
                local bankAccount = Bank.GetAccount(player:bank_account_id())

                if not bankAccount then
                    return UI:AddNotification("basic", "~r~Une erreur est survenue", "info", 5000)
                end

                player:inventory():addItem(Item.Create("credit_card", {
                    linkedAccount = player:bank_account_id()
                }, 1))

                UI:AddNotification("basic", "~b~Vous avez récupéré votre nouvelle carte bancaire", "info", 5000)
            end)
        end)
    end)

    Menus:CreateThread(CreateAccountMenu, function()
        Menus:IsVisible(CreateAccountMenu, function()
            Menus:AddButton("Choisir un code", false, code, "", function()
                local newCode = Utils.KeyboardInput("Code", 4, code) or ""

                if newCode:len() ~= 4 then
                    return UI:AddNotification("basic", "~r~Le code doit être composé de 4 chiffres~s~", "info", 5000)
                end

                if not string.match(newCode, "^[0-9]*$") then
                    return UI:AddNotification("basic", "~r~Le code doit être composé de chiffres uniquement~s~", "info", 5000)
                end

                code = newCode
            end)

            Menus:AddButton("Valider", code == "", "", "", function()
                local accountId = Callbacks.Trigger("bank:register", code)

                if accountId == nil then
                    return UI:AddNotification("basic", "~r~Une erreur est survenue", "info", 5000)
                end

                player:bank_account_id(accountId)
                player:inventory():addItem(Item.Create("credit_card", { linkedAccount = accountId }, 1))
                UI:AddNotification("basic", "~b~Votre compte a bien été créé", "info", 5000)

                Menus:Back()
            end)
        end)
    end)

    Events.Register("bank:interact", function(_, toggle)
        if (Menus:Visible(BankMenu) or Menus:Visible(CreateAccountMenu)) and not toggle then
            return Menus:Close()
        end

        Menus:Visible(BankMenu, toggle)
    end)
end)
