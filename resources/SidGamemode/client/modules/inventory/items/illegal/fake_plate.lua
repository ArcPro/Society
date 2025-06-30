Item.RegisterUsable("fake_plate", function(item, entity)
    if not entity then
        entity = ClientModules.Vehicles:GetClosest()
    end

    if Math.Distance(player:position(), GetEntityCoords(entity, true)) > 2.5 then
        UI:AddNotification("basic", "~r~Vous êtes trop loin du véhicule", "info", 5000)
        return false
    end

    TaskTurnPedToFaceEntity(PlayerPedId(), entity, 1000)
    Utils.RealWait(1000)

	local real_plate = SharedModules.Vehicles:GetRealPlate(entity)
	local vehicleProps = ClientModules.Vehicles.Properties:Get(entity)

    ClientModules.Misc.Animations:Play("mechanic4")

	vehicleProps.fakePlate = Utils.KeyboardInput("Plaque", 8, "") or ""

	UI:Progress(5)
    Utils.RealWait(5000)

    SharedModules.Entities:SetStatebag(entity, "real_plate", real_plate)

	Events.TriggerServer("vehicle:updatePlate", NetworkGetNetworkIdFromEntity(entity), vehicleProps.fakePlate)

    ClientModules.Misc.Animations:Stop()

    return true
end, "vehicle")
