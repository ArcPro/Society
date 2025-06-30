MainMenu = MainMenu or {}
MainMenu.Emotes = MainMenu.Emotes or {}
MainMenu.Emotes.Walks = {}

MainMenu.Emotes.Walks.Create = function ()
    MainMenu.Emotes.Walks.Main = Menus:CreateSub(MainMenu.Emotes.Main, "Démarches", "default")

    Menus:CreateThread(MainMenu.Emotes.Walks.Main, function()
        Menus:IsVisible(MainMenu.Emotes.Walks.Main, function()
            Menus:AddButton("Réinitialiser", false, "", "", function()
                ClientModules.Misc.Animations:ResetClipset(true)
            end)

            for displayName, walk in Table.PairsByKeys(Lists.Emotes.Walks) do
                Menus:AddButton(walk[2] or displayName, false, "", player:metadata().walk_style == walk[1] and "check" or "", function()
                    ClientModules.Misc.Animations:SetClipset(walk[1], true)
                end)
            end
        end)
    end)
end
