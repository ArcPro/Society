MainMenu = MainMenu or {}
MainMenu.Emotes = MainMenu.Emotes or {}
MainMenu.Emotes.Favorites = {}

local list, listIndex = {}, 1

local function loadFavorites()
	local raw_list = ClientModules.Misc.Animations.Favorites:Get()
	local emote = nil
	list = {}

	if #raw_list == 0 then
		list = nil
		return
	end

	for _, e in pairs(raw_list) do
		if emote == nil then
			emote = e
		end

		list[e] = ClientModules.Misc.Animations:Find(e)[3]
	end

	emote = ClientModules.Misc.Animations:Find(emote)

	Utils.Clone.Create(4.0, 3.5, 1.5, nil)
	TaskPlayAnim(Utils.Clone.ped, emote[1], emote[2], 5.0, 5.0, -1, 1, 0.0, false, false, false)
end

MainMenu.Emotes.Favorites.Create = function ()
    MainMenu.Emotes.Favorites.Main = Menus:CreateSub(MainMenu.Emotes.Main, "Favoris", "default")

	Menus:OnOpen(MainMenu.Emotes.Favorites.Main, loadFavorites)

    Menus:OnClose(MainMenu.Emotes.Favorites.Main, function()
        ClearPedTasksImmediately(Utils.Clone.ped)
        Utils.Clone.Destroy()
    end)

	Menus:OnIndexChange(MainMenu.Emotes.Favorites.Main, function(index)
		local emote, i = nil, 1

		for k, _ in pairs(list) do
			if i == index then
				emote = ClientModules.Misc.Animations:Find(k)
				break
			end

			i += 1
		end

		if emote == nil then return end

		Utils.Streaming.RequestAnimDict(emote[1])
		TaskPlayAnim(Utils.Clone.ped, emote[1], emote[2], 5.0, 5.0, -1, 1, 0.0, false, false, false)
	end)

    Menus:CreateThread(MainMenu.Emotes.Favorites.Main, function()
        Menus:IsVisible(MainMenu.Emotes.Favorites.Main, function()
			if list == nil then
				Menus:AddButton("~r~Vous n'avez aucun favori.~s~", true, "", "", function()end)
				return
			end

            for emote, displayName in pairs(list) do
                Menus:AddList(displayName, { "Jouer", "~r~Retirer des favoris~s~" }, listIndex, false, function(isClicked, index)
                    listIndex = index

					if isClicked ~= true then return end

					if listIndex == 1 then
						ClientModules.Misc.Animations:Play(emote)
					else
						ClientModules.Misc.Animations.Favorites:Delete(emote)
						loadFavorites()
					end
                end)
            end
        end)
    end)
end
