MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.World = {}

local weatherIndex = 1

local function GetWeatherIndex(weather)
    for index, weatherType in pairs(Config.Weather.Types) do
        if weatherType:lower() == weather:lower() then
            return index
        end
    end
end

MainMenu.Admin.World.onOpen = function ()
    weatherIndex = GetWeatherIndex(GlobalState["weather"])
end

MainMenu.Admin.World.Create = function()
    MainMenu.Admin.World.Main = Menus:CreateSub(MainMenu.Admin.Main, "Monde", "default")

    Menus:CreateThread(MainMenu.Admin.World.Main, function()
        Menus:IsVisible(MainMenu.Admin.World.Main, function()
            Menus:AddSeparator("Temps")

            Menus:AddButton("Heure", false, tostring(GetClockHours()), "", function()
                local hours = tonumber(Utils.KeyboardInput("Heure", 2, GetClockHours()))

                if hours ~= nil and hours < 24 and hours >= 0 then
					Events.TriggerServer("onesync:globalState", "time.hours", hours)
                    UI:AddNotification("basic", ("Heure changée (%d:%d)"):format(hours, GetClockMinutes()), "info", 5000)
                end
            end)

            Menus:AddButton("Minutes", false, tostring(GetClockMinutes()), "", function()
                local minutes = tonumber(Utils.KeyboardInput("Minutes", 2, GetClockMinutes()))

                if minutes ~= nil and minutes < 60 and minutes >= 0 then
					Events.TriggerServer("onesync:globalState", "time.minutes", minutes)
                    UI:AddNotification("basic", ("Heure changée (%d:%d)"):format(GetClockHours(), minutes), "info", 5000)
                end
            end)

			Menus:AddCheckbox("Geler le temps", false, GlobalState["time.frozen"], function (checked)
				Events.TriggerServer("onesync:globalState", "time.frozen", checked)
			end)

            Menus:AddSeparator("Météo")

            Menus:AddList("Météo", Config.Weather.Types, weatherIndex, false, function (isClicked, index)
                if isClicked then
					Events.TriggerServer("onesync:globalState", "weather", Config.Weather.Types[index])
                    UI:AddNotification("basic", ("Météo changée (%s)"):format(Config.Weather.Types[index]), "info", 5000)
                else
                    weatherIndex = index
                end
            end)

			Menus:AddCheckbox("Geler la météo", false, GlobalState["weather.frozen"], function (checked)
				Events.TriggerServer("onesync:globalState", "weather.frozen", checked)
			end)

			if player:permissions() >= Config.Permissions.DEV then
				Menus:AddSeparator("Catastrophe")

				Menus:AddButton("Alerte amber", false, "📱", "", function (checked)
					local text = Utils.KeyboardInput("Texte de l'alerte", 255, "")

					if text == nil then return end

					Events.TriggerServer("amber_alert", text)
				end)

				Menus:AddCheckbox("Désactiver le téléphone", false, GlobalState["disable_phone"] == true, function (checked)
					Events.TriggerServer("onesync:globalState", "disable_phone", checked)
				end)

				Menus:AddCheckbox("Blackout", false, GlobalState["blackout"] == true, function (checked)
					Events.TriggerServer("onesync:globalState", "blackout", checked)
				end)

				Menus:AddCheckbox("Alarme", false, GlobalState["alarm"] == true, function (checked)
					Events.TriggerServer("onesync:globalState", "alarm", checked)
				end)

				Menus:AddSeparator("PNJ")

				Menus:AddCheckbox("Faire paniquer les PNJ", false, GlobalState["panic"] == true, function (checked)
					Events.TriggerServer("onesync:globalState", "panic", checked)
				end)

				Menus:AddButton("Densité des piétons", false, tostring(GlobalState["npc_density"]), "", function (checked)
					local density = tonumber(Utils.KeyboardInput("Densité des piétons", 3, ""))

					if density == nil then return end

					Events.TriggerServer("onesync:globalState", "npc_density", density)
				end)

				Menus:AddButton("Densité des véhicules", false, tostring(GlobalState["traffic_density"]), "", function (checked)
					local density = tonumber(Utils.KeyboardInput("Densité des véhicules", 3, ""))

					if density == nil then return end

					Events.TriggerServer("onesync:globalState", "traffic_density", density)
				end)
			end

        end)
    end)
end
