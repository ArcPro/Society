ClientModules = ClientModules or {}
ClientModules.Vehicles = ClientModules.Vehicles or {}
ClientModules.Vehicles.Fuel = {}

function ClientModules.Vehicles.Fuel:Get(vehicle)
	if not DecorExistOn(vehicle, "_FUEL_LEVEL") then
		return math.random(200, 650) / 10
	end

	return DecorGetFloat(vehicle, "_FUEL_LEVEL")
end

function ClientModules.Vehicles.Fuel:Set(vehicle, fuel)
	SetVehicleFuelLevel(vehicle, fuel + 0.0)
	DecorSetFloat(vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicle))
end

function ClientModules.Vehicles.Fuel:StartRefilling(vehicle)
	Citizen.CreateThread(function()
        local vehicleCoords = GetEntityCoords(vehicle, true)
        local baseFuel = GetVehicleFuelLevel(vehicle)
        local fuel = GetVehicleFuelLevel(vehicle)
        local ped = PlayerPedId()

        if (Math.Distance(GetEntityCoords(ped, true), vehicleCoords) > 5.0) then
            return
        end

        UI:AddNotification("basic", "Appuyez sur ~b~E~s~ pour arrêter", "info", 3000)
        TaskTurnPedToFaceEntity(ped, vehicle, 1000)

        Citizen.Wait(1000)

        ClientModules.Misc.Animations:Play("fuelcar")

        while true do
            fuel += 0.025
            Utils.Draw3DText(vehicleCoords, string.format("%.1f", fuel) .. "/ 65.0L", 1.0, 5.0, false)
            Citizen.Wait(0)

            if (IsControlJustReleased(0, 38) or fuel > 65.0) then
                if (fuel > 65.0) then
                    fuel = 65.0
                end

                ClientModules.Misc.Animations:Stop()
                break
            end
        end

		PaymentPopup(math.floor((fuel - baseFuel) * SharedModules.Variables:Get("global", "fuel_price")), function()
			ClientModules.Vehicles.Actions:Call("refill", vehicle, { fuel })
		end, { type = "card", iban = "Station service" })
    end)
end

function ClientModules.Vehicles.Fuel:Initialize(entity)
	if not DecorExistOn(entity, "_FUEL_LEVEL") then
		Citizen.Wait(500)

		if not DecorExistOn(entity, "_FUEL_LEVEL") then
			self:Set(entity, self:Get(entity))
		end
	end
end

exports("GetFuel", function(entity)
	return ClientModules.Vehicles.Fuel:Get(entity)
end)

exports("SetFuel", function(entity, level)
	return ClientModules.Vehicles.Fuel:Set(entity, level)
end)
