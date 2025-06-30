MainMenu = MainMenu or {}
MainMenu.Admin = MainMenu.Admin or {}
MainMenu.Admin.Vehicles = MainMenu.Admin.Vehicles or {}
MainMenu.Admin.Vehicles.Vehicle = {}

---@type Vehicle | nil
local currentVehicle = nil
local vehicleCoords = nil
local deleteIndex = 1

local societies, societyLabels, societyIndex = {}, {}, 1;

MainMenu.Admin.Vehicles.Vehicle.onOpen = function (plate)
    currentVehicle = ClientModules.Vehicles:Get(plate)

    if currentVehicle == nil then
        return
    end

	vehicleCoords = exports.AdvancedParking:GetVehiclePosition(plate)

	societies, societyLabels, societyIndex = { 0 }, { "Aucune" }, 1

	for k, v in pairs(ClientModules.Societies:All()) do
		table.insert(societies, v:id())
		table.insert(societyLabels, v:label())

		if currentVehicle:linked_society() == v:id() then
			societyIndex = #societies
		end
	end
end

MainMenu.Admin.Vehicles.Vehicle.Create = function()
    MainMenu.Admin.Vehicles.Vehicle.Main = Menus:CreateSub(MainMenu.Admin.Vehicles.Main, "Véhicule", "default")

    Menus:CreateThread(MainMenu.Admin.Vehicles.Vehicle.Main, function()
        Menus:IsVisible(MainMenu.Admin.Vehicles.Vehicle.Main, function()
            if currentVehicle == nil then
                Menus:AddButton("~r~Erreur lors de la récupération du véhicule~s~", true, "", "", function()end)
                return
            end

            Menus:AddSeparator("Informations")

            Menus:AddButton("Plaque", true, currentVehicle:plate(), "", function()end)

			Menus:AddButton("Bucket", false, tostring(currentVehicle:props().bucket or 1), "", function()
				local bucket = tonumber(Utils.KeyboardInput("Bucket", 5, ""))

				if bucket then
					currentVehicle:props().bucket = bucket
					currentVehicle:update("props", currentVehicle:props())

					if DoesEntityExist(currentVehicle:entity()) then
						Events.TriggerServer("bucket:change_entity", NetworkGetNetworkIdFromEntity(currentVehicle:entity()), bucket)
					else
						UI:AddNotification("basic", "~r~Véhicule introuvable dans la pool, la modification sera appliquée au prochain spawn du véhicule.~s~", "info", 5000)
					end
				end
			end)

            Menus:AddButton("Propriétaire", false, currentVehicle:owner(), "", function()
                local owner = Utils.KeyboardInput("Propriétaire", 50, currentVehicle:owner())

                if owner == nil then return end

                currentVehicle:update("owner", owner)
            end)

			Menus:AddList("Entreprise liée", societyLabels, societyIndex, false, function(isClicked, index)
                if isClicked then
					currentVehicle:update("linked_society", societies[index])

					if DoesEntityExist(currentVehicle:entity()) then
						SharedModules.Entities:SetStatebag(currentVehicle:entity(), "linked_society", societies[index])
					else
						UI:AddNotification("basic", "~r~Véhicule introuvable dans la pool, la modification sera appliquée au prochain spawn du véhicule.~s~", "info", 5000)
					end
				end

				societyIndex = index
            end)

            Menus:AddSeparator("Actions")

			Menus:AddButton("Voir le coffre", false, "", "chevron_right", function()
                MainMenu.Admin.Inventories.Inventory.onOpen(currentVehicle:trunk_id())
				Menus:Visible(MainMenu.Admin.Inventories.Inventory.Main, true)
            end)

			Menus:AddButton("Voir la boite à gants", false, "", "chevron_right", function()
                MainMenu.Admin.Inventories.Inventory.onOpen(currentVehicle:glovebox_id())
				Menus:Visible(MainMenu.Admin.Inventories.Inventory.Main, true)
            end)

            if vehicleCoords == nil then
                Menus:AddButton("Faire apparaitre le véhicule", false, "", "", function()
                    currentVehicle:entity(ClientModules.Vehicles:Create(
                        currentVehicle:model(),
                        GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0),
                        0.0,
                        currentVehicle:props(),
                        player:fullname(),
                        currentVehicle:plate()
                    ))
                end)
            else
                Menus:AddButton("Se téléporter au véhicule", false, "", "", function(onSelected)
                    player:position(vehicleCoords, true)
                end)
            end

            Menus:AddList("~r~Supprimer le véhicule~s~", { "Temporairement", "Définitivement" }, deleteIndex, false, function (isClicked, index)
                if isClicked then
                    if deleteIndex == 1 then
                        if currentVehicle:entity() ~= nil then
							ClientModules.Vehicles:Delete(currentVehicle:entity(), false)
                        end
                    else
                        if currentVehicle:entity() ~= nil then
							ClientModules.Vehicles:Delete(currentVehicle:entity(), true)
                        else
                            Events.TriggerServer("vehicle:delete", currentVehicle:plate())
                        end

                        Citizen.Wait(500)

                        MainMenu.Admin.Vehicles.onOpen()
                        Menus:Back()
                    end

                    UI:AddNotification("basic", "~b~Véhicule supprimé~s~", "info", 5000)
                end

                deleteIndex = index
            end)

        end)
    end)
end
