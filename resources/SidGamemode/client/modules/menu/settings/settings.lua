MainMenu = MainMenu or {}
MainMenu.Settings = MainMenu.Settings or {}

local colorNames	= { "Vert" }
local colors		= { "green" }
local colorIndex 	= 1

local fontIndexes	= { Utils.Fonts.chalet, Utils.Fonts.sign_painter, Utils.Fonts.slab_serif, Utils.Fonts.chalet_comprime, Utils.Fonts.pricedown, Utils.Fonts.archivo }
local fonts 		= { "Chalet", "Sign Painter", "Slab Serif", "Chalet Comprimé", "Pricedown", "Archivo" }
local fontIndex 	= 1

local settings = nil

MainMenu.Settings.Create = function()
    MainMenu.Settings.Main = Menus:CreateSub(MainMenu.Main, "Paramètres", "default")

    Menus:CreateThread(MainMenu.Settings.Main, function()
        Menus:IsVisible(MainMenu.Settings.Main, function()

			if settings == nil then return end

			Menus:AddList("Couleur des /me", colorNames, colorIndex, false, function(isClicked, index)
				if isClicked then
					ClientModules.Misc.Settings:Set("me_color", colors[colorIndex])
				end

				colorIndex = index
			end)

			Menus:AddList("Police des /me", fonts, fontIndex, false, function(isClicked, index)
				if isClicked then
					ClientModules.Misc.Settings:Set("me_font", fontIndexes[fontIndex])
				end

				fontIndex = index
			end)

			Menus:AddCheckbox("HUD Compass", false, settings.compass, function (checked)
				settings.compass = checked

				ClientModules.Misc.Settings:Set("compass", settings.compass)
			end)

			Menus:AddCheckbox("HUD Streetnames", false, settings.streetnames, function (checked)
				settings.streetnames = checked

				ClientModules.Misc.Settings:Set("streetnames", settings.streetnames)
			end)

			Menus:AddCheckbox("Afficher la map", false, settings.radar, function (checked)
				settings.radar = checked

				ClientModules.Misc.Settings:Set("radar", settings.radar)
				UI:ToggleRadar(checked)
			end)

			Menus:AddCheckbox("Bandes noires", false, settings.black_bands, function (checked)
				settings.black_bands = checked

				ClientModules.Misc.Settings:Set("black_bands", settings.black_bands)
			end)

			Menus:AddCheckbox("Effet de drogue illimité", false, settings.disable_drug_down, function (checked)
				settings.disable_drug_down = checked

				ClientModules.Misc.Settings:Set("disable_drug_down", settings.disable_drug_down)
			end)
        end)
    end)

	Menus:OnOpen(MainMenu.Settings.Main, function()
		settings = ClientModules.Misc.Settings:All()

		local colorNames	= { "Vert" }
		local colors		= { "green" }
		colorIndex	= 1

		fontIndexes	= { Utils.Fonts.chalet, Utils.Fonts.sign_painter, Utils.Fonts.slab_serif, Utils.Fonts.chalet_comprime, Utils.Fonts.pricedown, Utils.Fonts.archivo }
		fonts 		= { "Chalet", "Sign Painter", "Slab Serif", "Chalet Comprimé", "Pricedown", "Archivo" }
		fontIndex 	= 1

		colorIndex = Table.index(colors, settings.me_color)
		fontIndex = Table.index(fontIndexes, settings.me_font)
	end)
end
