MainMenu = MainMenu or {}
MainMenu.Emotes = MainMenu.Emotes or {}

MainMenu.Emotes.translations = {
    Dances			= "💃 Danses",
	Animal 			= "🐕 Animaux",
	Gestures 		= "🏃‍♂️Gestes",
    Positions		= "🗿 Poses",
    Other			= "🌐 Autres",
    Activities		= "🎭 Activités",
    Gang			= "🔫 Gang",
    Sport			= "🎾 Sport",
    Health 			= "❤️‍🩹 Santé",
    Props 			= "📦 Objets",
}

local index = 1

local function createSubMenu(displayName, listName)

    MainMenu.Emotes[listName] = Menus:CreateSub(MainMenu.Emotes.Main, displayName, "default")

    Menus:CreateThread(MainMenu.Emotes[listName], function()
        Menus:IsVisible(MainMenu.Emotes[listName], function()
            for emoteName, emote in Table.PairsByKeys(Lists.Emotes[listName]) do
                Menus:AddList(("%s (%s)"):format(emote[3], emoteName), { "Jouer", "Favori" }, index, false, function(isClicked, i)
					index = i

					if isClicked ~= true then return end

					if index == 1 then
						ClientModules.Misc.Animations:Play(emoteName, false)
					else
						ClientModules.Misc.Animations.Favorites:Add(emoteName)
					end
                end)
            end
        end)
    end)

    Menus:OnOpen(MainMenu.Emotes[listName], function()
        Utils.Clone.Create(4.0, 3.5, 1.5, nil)
        ClientModules.Misc.Animations:Preview(Lists.Emotes[listName], 1)
    end)

    Menus:OnClose(MainMenu.Emotes[listName], function()
        ClearPedTasksImmediately(Utils.Clone.ped)
        Utils.Clone.Destroy()
    end)

    Menus:OnIndexChange(MainMenu.Emotes[listName], function (index)
        ClientModules.Misc.Animations:Preview(Lists.Emotes[listName], index)
    end)
end

MainMenu.Emotes.Create = function()
    MainMenu.Emotes.Main = Menus:CreateSub(MainMenu.Main, "Animations", "default")

	MainMenu.Emotes.Favorites.Create()
    MainMenu.Emotes.Expressions.Create()
    MainMenu.Emotes.Search.Create()
    MainMenu.Emotes.Shared.Create()
    MainMenu.Emotes.Walks.Create()
    MainMenu.Emotes.HolsterStyle.Create()

    for listName, displayName in pairs(MainMenu.Emotes.translations) do
        createSubMenu(displayName, listName)
    end

    Menus:CreateThread(MainMenu.Emotes.Main, function()
        Menus:IsVisible(MainMenu.Emotes.Main, function()
            Menus:AddButton("Rechercher", false, "🔍", "", function()end, MainMenu.Emotes.Search.Main)

            Menus:AddButton("⭐ Favoris", false, "", "chevron_right", function()end, MainMenu.Emotes.Favorites.Main)

            for listName, displayName in Table.PairsByKeys(MainMenu.Emotes.translations) do
                Menus:AddButton(displayName, false, "", "chevron_right", function()end, MainMenu.Emotes[listName])
            end

            Menus:AddButton("👥 Partagées", false, "", "chevron_right", function()end, MainMenu.Emotes.Shared.Main)

            Menus:AddButton("🚶 Démarches", false, "", "chevron_right", function()end, MainMenu.Emotes.Walks.Main)

            Menus:AddButton("🙍 Expressions", false, "", "chevron_right", function()end, MainMenu.Emotes.Expressions.Main)

			Menus:AddButton("🔫 Style de sortie d'arme", false, "", "chevron_right", function()end, MainMenu.Emotes.HolsterStyle.Main)
        end)
    end)
end
