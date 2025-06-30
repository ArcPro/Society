MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Vehicles = MainMenu.Admin.Vehicles or {}

local vehicles = {}

MainMenu.Admin.Vehicles.onOpen = function(filter)
    vehicles = Callbacks.Trigger("vehicle:all", filter)
end

MainMenu.Admin.Vehicles.Create = function()
    MainMenu.Admin.Vehicles.Main = Menus:CreateSub(MainMenu.Admin.Main, "Véhicules", "default")
    MainMenu.Admin.Vehicles.Vehicle.Create()

    Menus:CreateThread(MainMenu.Admin.Vehicles.Main, function()
        Menus:IsVisible(MainMenu.Admin.Vehicles.Main, function()
            Menus:AddButton("Rechercher", false, "🔍", "", function()
                local filter = Utils.KeyboardInput("Recherche", 50, "")

				if filter then
					filter = filter:lower()
				end

                vehicles = Callbacks.Trigger("vehicle:all", filter)
            end)

            Menus:AddSeparator("Véhicules")

            if #vehicles == 0 then
                Menus:AddButton("~r~Aucun véhicule trouvé~s~", true, "", "", function()end)
                return
            end

            for _, v in pairs(vehicles) do
                Menus:AddButton(("[%s] %s"):format(v.plate, GetLabelText(GetDisplayNameFromVehicleModel(tonumber(v.model)))), false, v.owner, "", function()
                    MainMenu.Admin.Vehicles.Vehicle.onOpen(v.plate)
                end, MainMenu.Admin.Vehicles.Vehicle.Main)
            end
        end)
    end)
end
