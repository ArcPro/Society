MainMenu = MainMenu or {}
MainMenu.Emotes = MainMenu.Emotes or {}
MainMenu.Emotes.HolsterStyle = {}

MainMenu.Emotes.HolsterStyle.Create = function ()
    MainMenu.Emotes.HolsterStyle.Main = Menus:CreateSub(MainMenu.Emotes.Main, "Style de sortie d'arme", "default")

    Menus:CreateThread(MainMenu.Emotes.HolsterStyle.Main, function()
        Menus:IsVisible(MainMenu.Emotes.HolsterStyle.Main, function()
            for displayName, _ in Table.PairsByKeys(Lists.Emotes.HolsterStyles) do
                Menus:AddButton(displayName, false, "", player:metadata().holster_style == displayName and "check" or "", function()
					ClientModules.Misc.Animations:SetHolsterStyle(displayName)
                end)
            end
        end)
    end)
end
