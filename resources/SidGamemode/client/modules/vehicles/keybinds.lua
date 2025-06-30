Core.Player:OnLoad(function()
	Utils.KeyRegister("x", "seat_belt", "Attacher/Détacher la ceinture", function()
		ClientModules.Vehicles.Speedometer:SetSeatBelt(not ClientModules.Vehicles.Speedometer.HasSeatBelt)
	end)

	Utils.KeyRegister("1", "driver_seat", "Place conducteur", function()
		ClientModules.Vehicles.Speedometer:SwitchSeat(-1)
	end)

	Utils.KeyRegister("2", "passenger_seat", "Place passager", function()
		ClientModules.Vehicles.Speedometer:SwitchSeat(0)
	end)

	Utils.KeyRegister("3", "back_left_seat", "Place arrière gauche", function()
		ClientModules.Vehicles.Speedometer:SwitchSeat(1)
	end)

	Utils.KeyRegister("4", "back_right_seat", "Place arrière droite", function()
		ClientModules.Vehicles.Speedometer:SwitchSeat(2)
	end)

	Utils.KeyRegister("left", "indicator_left", "Clignotant gauche", function()
		if DoesEntityExist(ClientModules.Vehicles.Speedometer.CurrentVehicle) == false then return end
		if GetPedInVehicleSeat(ClientModules.Vehicles.Speedometer.CurrentVehicle, -1) ~= PlayerPedId() then return end

		SharedModules.Entities:SetStatebag(
			ClientModules.Vehicles.Speedometer.CurrentVehicle,
			"indicator_left",
			not Entity(ClientModules.Vehicles.Speedometer.CurrentVehicle).state.indicator_left
		)
	end)

	Utils.KeyRegister("right", "indicator_right", "Clignotant droit", function()
		if DoesEntityExist(ClientModules.Vehicles.Speedometer.CurrentVehicle) == false then return end
		if GetPedInVehicleSeat(ClientModules.Vehicles.Speedometer.CurrentVehicle, -1) ~= PlayerPedId() then return end

		SharedModules.Entities:SetStatebag(
			ClientModules.Vehicles.Speedometer.CurrentVehicle,
			"indicator_right",
			not Entity(ClientModules.Vehicles.Speedometer.CurrentVehicle).state.indicator_right
		)
	end)

	Utils.KeyRegister("down", "indicator_hazard", "Clignotant de détresse", function()
		if DoesEntityExist(ClientModules.Vehicles.Speedometer.CurrentVehicle) == false then return end
		if GetPedInVehicleSeat(ClientModules.Vehicles.Speedometer.CurrentVehicle, -1) ~= PlayerPedId() then return end

		SharedModules.Entities:SetStatebag(
			ClientModules.Vehicles.Speedometer.CurrentVehicle,
			"indicator_left",
			not Entity(ClientModules.Vehicles.Speedometer.CurrentVehicle).state.indicator_left
		)

		SharedModules.Entities:SetStatebag(
			ClientModules.Vehicles.Speedometer.CurrentVehicle,
			"indicator_right",
			not Entity(ClientModules.Vehicles.Speedometer.CurrentVehicle).state.indicator_left -- not a mispell, this is for synchronization
		)

	end)

	Utils.KeyRegister("K", "wire_car", "Démarrer une voiture avec les fils", function()
		if DoesEntityExist(ClientModules.Vehicles.Speedometer.CurrentVehicle) == false then return end
		if GetPedInVehicleSeat(ClientModules.Vehicles.Speedometer.CurrentVehicle, -1) ~= PlayerPedId() then return end

		if LocalPlayer.state.handcuffed then return end

		if GetIsVehicleEngineRunning(ClientModules.Vehicles.Speedometer.CurrentVehicle) == true then return end

		if (ClientModules.Vehicles:HasKey(ClientModules.Vehicles.Speedometer.CurrentVehicle) == false) then
			ClientModules.Illegal.QuicktimeEvents:Lockpick(function (success)
				if success then
					UI:AddNotification("basic", "~b~Vous avez démarré avec les fils !~s~", "info", 5000)
					ClientModules.Vehicles.Speedometer.IsHotwired = true

					if Callbacks.Trigger("vehicle:get", SharedModules.Vehicles:GetRealPlate(ClientModules.Vehicles.Speedometer.CurrentVehicle)) == nil then
						ClientModules.Vehicles:Register(ClientModules.Vehicles.Speedometer.CurrentVehicle, "Inconnu")
					end

				else
					UI:AddNotification("basic", "~r~Vous n'avez pas réussi à démarrer avec les fils...~s~", "info", 5000)
					ClientModules.Vehicles.Actions:Call("alarm", ClientModules.Vehicles.Speedometer.CurrentVehicle)
				end
			end)
		end
	end)
end)
