Item.RegisterUsable("empty_carkeys", function(item, entity)
	if player:job().name ~= "pawnshop" then
		UI:AddNotification("basic", "~r~Vous ne savez pas comment utiliser cet item~s~", "info", 5000)
		return false
	end

	if entity == nil then
		entity = ClientModules.Vehicles:GetClosest()
	end

	if DoesEntityExist(entity) == false then
		UI:AddNotification("basic", "~r~Aucun véhicule proche~s~", "info", 5000)
		return false
	end

	local vehicle = ClientModules.Vehicles:Get(SharedModules.Vehicles:GetRealPlate(entity))

	if vehicle == nil then
		UI:AddNotification("basic", "~r~Ce véhicule n'existe pas~s~", "info", 5000)
		return false
	end

	player:inventory():addItem(Item.Create("carkeys", {
		name = ("%s (%s)"):format(GetLabelText(GetDisplayNameFromVehicleModel(vehicle:model())), vehicle:plate()),
		plate = vehicle:plate(),
	}, 1))

    return true
end, "vehicle")