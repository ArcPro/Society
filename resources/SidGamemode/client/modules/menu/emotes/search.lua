MainMenu = MainMenu or {}
MainMenu.Emotes = MainMenu.Emotes or {}
MainMenu.Emotes.Search = {}

MainMenu.Emotes.Search.Create = function ()
    MainMenu.Emotes.Search.Main = Menus:CreateSub(MainMenu.Emotes.Main, "Recherche", "default")

    local filteredEmotes = {}

    local function filterEmotes(str)
        filteredEmotes = {}

        if str == nil then
            str = ""
        end

        for listName, list in Table.PairsByKeys(Lists.Emotes) do
            if MainMenu.Emotes.translations[listName] ~= nil then
                for emoteName, emote in Table.PairsByKeys(list) do
                    if emoteName:lower():find(str:lower()) or emote[3]:lower():find(str:lower()) then
                        filteredEmotes[emoteName] = emote
                    end
                end
            end
        end
    end

    Menus:CreateThread(MainMenu.Emotes.Search.Main, function()
        local isAnyEmote = false
        Menus:IsVisible(MainMenu.Emotes.Search.Main, function()
            for emoteName, emote in Table.PairsByKeys(filteredEmotes) do
                Menus:AddButton(emote[3], false, ("(%s)"):format(emoteName), "", function()
                    ClientModules.Misc.Animations:Play(emoteName)
                end)
                isAnyEmote = true
            end

            if not isAnyEmote then
                Menus:AddButton("~r~Aucune emote trouvée", true, "", "", function()end)
            end
        end)
    end)

    Menus:OnOpen(MainMenu.Emotes.Search.Main, function()
        filterEmotes(Utils.KeyboardInput("Recherche", 20, ""))
        Utils.Clone.Create(4.0, 3.5, 1.5, nil)
        ClientModules.Misc.Animations:Preview(filteredEmotes, 1)
    end)

    Menus:OnClose(MainMenu.Emotes.Search.Main, function()
        ClearPedTasksImmediately(Utils.Clone.ped)
        Utils.Clone.Destroy()
    end)

    Menus:OnIndexChange(MainMenu.Emotes.Search.Main, function (index)
        ClientModules.Misc.Animations:Preview(filteredEmotes, index)
    end)
end
