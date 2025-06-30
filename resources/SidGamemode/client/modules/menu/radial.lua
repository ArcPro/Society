MainMenu.Radial = {}

MainMenu.Radial.Data = {}
MainMenu.Radial.Opened = false

MainMenu.Radial.Open = function()
    UI:Toggle("radial_menu", true, {
        items = MainMenu.Radial.Data
    }, true, true)

    Citizen.CreateThread(function()
        while MainMenu.Radial.Opened do
            Utils.DisableControlsForUI()
            Citizen.Wait(0)
        end
    end)
end

MainMenu.Radial.Close = function()
    UI:Toggle("radial_menu", false, {}, false, true)
end

MainMenu.Radial.Register = function(data)
	local society = ClientModules.Societies:Get(player:job().id)

	table.insert(data,  {
		callback = "announce",
		icon = "megaphone",
		title = "Annonce",
	})

	-- table.insert(data, {
	-- 	callback = "mdt",
	-- 	title = "MDT",
	-- 	icon = "mdt",
	-- })

		table.insert(data, {
			callback = "dispatch",
			title = "Dispatch",
			icon = "dispatch",
		})

		Events.Trigger("dispatch:load")

	MainMenu.Radial.Data = data
end

MainMenu.Radial.Unregister = function()
	Events.Trigger("dispatch:clear")
	MainMenu.Radial.Data = nil
end

Utils.KeyRegister("X", "radial_menu", "Ouvrir le menu radial", function()

    if not MainMenu.Radial.Data or #MainMenu.Radial.Data < 2 then
        return
    end

    if MainMenu.Radial.Opened then
        MainMenu.Radial.Close()
    else
        MainMenu.Radial.Open()
    end

    MainMenu.Radial.Opened = not MainMenu.Radial.Opened
end)

UI:RegisterCallback("radial_menu:clicked", function(data, cb)
    MainMenu.Radial.Opened = false
    MainMenu.Radial.Close()
	cb(true)
end)

UI:RegisterCallback("radial_menu:closed", function(data, cb)
	Citizen.Wait(100)
    MainMenu.Radial.Opened = false
	cb(true)
end)
