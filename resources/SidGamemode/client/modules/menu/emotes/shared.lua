MainMenu = MainMenu or {}
MainMenu.Emotes = MainMenu.Emotes or {}
MainMenu.Emotes.Shared = {}

MainMenu.Emotes.Shared.Create = function ()
    MainMenu.Emotes.Shared.Main = Menus:CreateSub(MainMenu.Emotes.Main, "Animations partagées", "default")

    Menus:CreateThread(MainMenu.Emotes.Shared.Main, function()
        Menus:IsVisible(MainMenu.Emotes.Shared.Main, function()
            for emoteName, emote in Table.PairsByKeys(Lists.Emotes.Shared) do
                Menus:AddButton(emote[3], false, ("(%s)"):format(emoteName), "", function()
                    Events.TriggerServer("animations:sharedRequest", emoteName)
                end)
            end
        end)
    end)

    Menus:OnOpen(MainMenu.Emotes.Shared.Main, function()
        Utils.Clone.Create(4.0, 3.5, 1.5, nil)
        ClientModules.Misc.Animations:Preview(Lists.Emotes.Shared, 1)
    end)

    Menus:OnClose(MainMenu.Emotes.Shared.Main, function()
        ClearPedTasksImmediately(Utils.Clone.ped)
        Utils.Clone.Destroy()
    end)

    Menus:OnIndexChange(MainMenu.Emotes.Shared.Main, function (index)
        ClientModules.Misc.Animations:Preview(Lists.Emotes.Shared, index)
    end)
end
