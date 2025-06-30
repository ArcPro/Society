MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}

MainMenu.Admin.Create = function()
    MainMenu.Admin.Main = Menus:CreateSub(MainMenu.Main, "Administration", "default")
    MainMenu.Admin.Moderation.Create()
    MainMenu.Admin.Players.Create()
    MainMenu.Admin.Vehicles.Create()
    MainMenu.Admin.BankAccounts.Create()
    MainMenu.Admin.Inventories.Create()
	MainMenu.Admin.Properties.Create()
    MainMenu.Admin.World.Create()

	if player:permissions() >= Config.Permissions.MOD2 then
		MainMenu.Admin.Blips.Create()
		MainMenu.Admin.Markers.Create()
		MainMenu.Admin.Items.Create()
		MainMenu.Admin.Societies.Create()
		MainMenu.Admin.FarmCircuits.Create()
		MainMenu.Admin.Elevators.Create()
		MainMenu.Admin.Zones.Create()
		MainMenu.Admin.Groups.Create()
		MainMenu.Admin.Laboratories.Create()
		MainMenu.Admin.Minimarkets.Create()
		MainMenu.Admin.Containers.Create()
		MainMenu.Admin.Tablets.Create()
		MainMenu.Admin.Variables.Create()
	end

	if player:permissions() >= Config.Permissions.MOD2 then
		MainMenu.Admin.Bans.Create()
	end

    Menus:CreateThread(MainMenu.Admin.Main, function()
        Menus:IsVisible(MainMenu.Admin.Main, function()
            Menus:AddButton("⚔️ Modération", false, "", "chevron_right", function()end, MainMenu.Admin.Moderation.Main)
            Menus:AddButton("👥 Joueurs", false, "", "chevron_right", MainMenu.Admin.Players.onOpen, MainMenu.Admin.Players.Main)
			Menus:AddButton("🔨 Bans", false, "", "chevron_right", MainMenu.Admin.Bans.onOpen, MainMenu.Admin.Bans.Main)
            Menus:AddButton("🚗 Véhicules", false, "", "chevron_right", MainMenu.Admin.Vehicles.onOpen, MainMenu.Admin.Vehicles.Main)
			if player:permissions() >= Config.Permissions.HM then
				Menus:AddButton("💰 Comptes bancaires", false, "", "chevron_right", MainMenu.Admin.BankAccounts.onOpen, MainMenu.Admin.BankAccounts.Main)
				Menus:AddButton("📦 Inventaires", false, "", "chevron_right", MainMenu.Admin.Inventories.onOpen, MainMenu.Admin.Inventories.Main)
				Menus:AddButton("📦 Se donner un item", false, "➕", "", function()
					local search = Utils.KeyboardInput("Recherche", 100, "")

					-- if search == nil then return end
					if search == nil then
										search = ''
									end

					Events.TriggerServer("admin:initGiveInventory", search)
					ClientModules.Inventory:Open(("admin_give_inventory_%d"):format(player:source()), "Admin")
				end)
			end
			Menus:AddButton("🏠 Propriété", false, "", "chevron_right", function()
				MainMenu.Admin.Properties.onOpen(true)
			end, MainMenu.Admin.Properties.Main)

					if player:permissions() >= Config.Permissions.HM then
						Menus:AddSeparator("Gestion Serveur")

						Menus:AddButton("🌍 Monde", false, "", "chevron_right", MainMenu.Admin.World.onOpen, MainMenu.Admin.World.Main)
						Menus:AddButton("📍 Blips", false, "", "chevron_right", MainMenu.Admin.Blips.onOpen, MainMenu.Admin.Blips.Main)
						Menus:AddButton("📌 Markers", false, "", "chevron_right", MainMenu.Admin.Markers.onOpen, MainMenu.Admin.Markers.Main)
						Menus:AddButton("📦 Items", false, "", "chevron_right", MainMenu.Admin.Items.onOpen, MainMenu.Admin.Items.Main)
						Menus:AddButton("🏦 Entreprises", false, "", "chevron_right", MainMenu.Admin.Societies.onOpen, MainMenu.Admin.Societies.Main)
						Menus:AddButton("🏭 Farm", false, "", "chevron_right", MainMenu.Admin.FarmCircuits.onOpen, MainMenu.Admin.FarmCircuits.Main)
						Menus:AddButton("🛗 Ascenseurs", false, "", "chevron_right", function()end, MainMenu.Admin.Elevators.Main)
						Menus:AddButton("🗺️ Zones", false, "", "chevron_right", function()end, MainMenu.Admin.Zones.Main)
						Menus:AddButton("🧑‍🤝‍🧑 Groupes", false, "", "chevron_right", function()end, MainMenu.Admin.Groups.Main)
						Menus:AddButton("🛒 Supérettes", false, "", "chevron_right", function()end, MainMenu.Admin.Minimarkets.Main)
						Menus:AddButton("🫙 Conteneurs", false, "", "chevron_right", function()end, MainMenu.Admin.Containers.Main)
						Menus:AddButton("🧪 Laboratoires", false, "", "chevron_right", function()end, MainMenu.Admin.Laboratories.Main)
						Menus:AddButton("💻 Tablettes", false, "", "chevron_right", function()end, MainMenu.Admin.Tablets.Main)
						Menus:AddButton("⚙️ Variables", false, "", "chevron_right", MainMenu.Admin.Variables.onOpen, MainMenu.Admin.Variables.Main)
					end
        end)
    end)
end
