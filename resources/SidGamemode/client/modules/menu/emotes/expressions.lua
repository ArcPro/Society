MainMenu = MainMenu or {}
MainMenu.Emotes = MainMenu.Emotes or {}
MainMenu.Emotes.Expressions = {}

MainMenu.Emotes.Expressions.Create = function ()
    MainMenu.Emotes.Expressions.Main = Menus:CreateSub(MainMenu.Emotes.Main, "Expressions", "default")

    Menus:CreateThread(MainMenu.Emotes.Expressions.Main, function()
        Menus:IsVisible(MainMenu.Emotes.Expressions.Main, function()
            Menus:AddButton("Réinitialiser", false, "", "", function()
                ClientModules.Misc.Animations:ResetExpression()
            end)

            for displayName, expression in Table.PairsByKeys(Lists.Emotes.Expressions) do
                Menus:AddButton(expression[2] or displayName, false, "", player:metadata().expression == expression[1] and "check" or "", function()
                    ClientModules.Misc.Animations:SetExpression(expression[1], true)
                end)
            end
        end)
    end)
end
