MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Zones = MainMenu.Admin.Zones or {}

local showZones = false
local zoneBlips = {}

local function showZonesThread()
	Citizen.CreateThread(function()
		while showZones == true do
			for k, zone in pairs(Zones.All()) do
				if zoneBlips[zone:id()] == nil then
					zoneBlips[zone:id()] = {
						area = AddBlipForArea(zone:coords().x, zone:coords().y, zone:coords().z, zone:size().y, zone:size().x),
						center = AddBlipForCoord(zone:coords().x, zone:coords().y, zone:coords().z)
					}
				end

				SetBlipCoords(zoneBlips[zone:id()].center, zone:coords().x, zone:coords().y, zone:coords().z)
				SetBlipCoords(zoneBlips[zone:id()].area, zone:coords().x, zone:coords().y, zone:coords().z)

				SetBlipSprite(zoneBlips[zone:id()].center, 1)
				SetBlipScale(zoneBlips[zone:id()].center, 0.75)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentSubstringPlayerName(("Zone %s (%s)"):format(zone:name(), zone:action()))
				EndTextCommandSetBlipName(zoneBlips[zone:id()].center)

				SetBlipRotation(zoneBlips[zone:id()].area, zone:coords().w)
				SetBlipAlpha(zoneBlips[zone:id()].area, 120)

				SetBlipColour(zoneBlips[zone:id()].center, 3)
				SetBlipColour(zoneBlips[zone:id()].area, 3)
			end

			Citizen.Wait(1000)
		end

		for k, blip in pairs(zoneBlips) do
			RemoveBlip(blip.center)
			RemoveBlip(blip.area)
		end

		zoneBlips = {}
	end)
end

MainMenu.Admin.Zones.Create = function()
    MainMenu.Admin.Zones.Main = Menus:CreateSub(MainMenu.Admin.Main, "Zones", "default")
	MainMenu.Admin.Zones.Zone.Create()

    Menus:CreateThread(MainMenu.Admin.Zones.Main, function()
        Menus:IsVisible(MainMenu.Admin.Zones.Main, function()
			Menus:AddButton("Créer une zone", false, "➕", "", function()
				local name = Utils.KeyboardInput("Nom de la zone", 255, "")

				if name == nil then return end

				local id = Callbacks.Trigger("zone:create", name, player:position(), vector2(50.0, 50.0), Zones.Types[1], {}, false)

				MainMenu.Admin.Zones.Zone.onOpen(Zones.Get(id))
				Menus:Visible(MainMenu.Admin.Zones.Zone.Main, true)
			end)

            Menus:AddCheckbox("Afficher les zones", false, showZones, function (checked)
				showZones = checked

				if showZones then
					showZonesThread()
				end
			end)

            Menus:AddSeparator("Liste des zones")

			for k, zone in pairs(Zones.All()) do
				Menus:AddButton(("%s (%s)"):format(zone:name(), zone:action()), false, "", "chevron_right", function()
					MainMenu.Admin.Zones.Zone.onOpen(zone)
				end, MainMenu.Admin.Zones.Zone.Main)
			end
        end)
    end)
end


