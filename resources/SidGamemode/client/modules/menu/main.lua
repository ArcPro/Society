MainMenu = MainMenu or {}

Core.Player:OnLoad(function()
	if MainMenu.Main ~= nil then return end

    MainMenu.Main = Menus:Create("Menu principal", "default")

    if player:permissions() >= Config.Permissions.MOD then
        MainMenu.Admin.Create()
    end

    MainMenu.Emotes.Create()
    MainMenu.Editor.Create()
    MainMenu.Props.Create()
	MainMenu.Characters.Create()
	MainMenu.Settings.Create()

	local can_edit_props = false

	Menus:OnOpen(MainMenu.Main, function()
		can_edit_props = ClientModules.World.Decoration:CanEdit() or false
	end)

    Menus:CreateThread(MainMenu.Main, function()
        Menus:IsVisible(MainMenu.Main, function()

            Menus:AddButton("💃 Animations", false, "", "chevron_right", function()end, MainMenu.Emotes.Main)

			if can_edit_props then
				Menus:AddButton("🏠 Props", false, "", "chevron_right", function()end, MainMenu.Props.Main)
			end

            Menus:AddButton("🎬 Rockstar Editor", false, "", "chevron_right", function()end, MainMenu.Editor.Main)

			Menus:AddButton("🐻 Mes personnages", false, "", "chevron_right", function()end, MainMenu.Characters.Main)

            if player:permissions() >= Config.Permissions.MOD then
                Menus:AddButton("🛠️ Administration", false, "", "chevron_right", function()end, MainMenu.Admin.Main)
            end

			Menus:AddButton("⚙️ Paramètres", false, "", "chevron_right", function()end, MainMenu.Settings.Main)
        end)
    end)

    Utils.KeyRegister('F1', 'main_menu', 'Ouvrir le menu principal', function()
        Menus:Visible(MainMenu.Main, not Menus:Visible(MainMenu.Main))
    end)
end)
