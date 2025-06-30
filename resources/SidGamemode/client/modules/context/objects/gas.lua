local models = { -2007231801, 1339433404, 1694452750, 1933174915, -462817101, -469694731, -164877493 }

local function isGas(model)
    for _, v in pairs(models) do
        if v == model then
            return true
        end
    end
    return false
end

Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then
        return
    end

    if not isGas(GetEntityModel(hitEntity)) then
        return
    end

    Context:AddItem(0, "Mettre de l'essence", function()

        if Math.Distance(player:position(), GetEntityCoords(hitEntity, true)) > 1.5 then
            return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
        end

        local closestVehicle = ClientModules.Vehicles:GetClosest()

        if closestVehicle == nil or Math.Distance(player:position(), GetEntityCoords(closestVehicle, true)) > 3.0 then
            return UI:AddNotification("basic", "~r~Vous êtes trop loin du véhicule~s~", "info", 3000)
        end

		ClientModules.Vehicles.Fuel:StartRefilling(closestVehicle)

    end, true)
end)
