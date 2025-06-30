local extrasMenu = Menus:Create("Gestion extras", "default")
local vehicle = nil
local extras = {}

Menus:OnOpen(extrasMenu, function()
	vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	local foundExtra = false

	if DoesEntityExist(vehicle) == false then
		UI:AddNotification("basic", "~r~Vous devez être dans un véhicule~s~", "info", 5000)
		return
	end

	for extra = 0, 20 do
        if DoesExtraExist(vehicle, extra) then
            extras[extra] = IsVehicleExtraTurnedOn(vehicle, extra)
			foundExtra = true
        end
    end

	if foundExtra == false then
		UI:AddNotification("basic", "~r~Ce véhicule n'a aucun extra.~s~", "info", 5000)
		return
	end
end)

Menus:CreateThread(extrasMenu, function()
	Menus:IsVisible(extrasMenu, function ()
		if vehicle ~= GetVehiclePedIsIn(PlayerPedId(), false) then
			Menus:AddButton("~r~Vous n'êtes plus dans le même véhicule.~s~", true, "", "", function()end)
			return
		end

		for id, selected in pairs(extras) do
			Menus:AddCheckbox(("Extra #%d"):format(id), false, selected, function (checked)
				extras[id] = checked
				SetVehicleExtra(vehicle, id, not checked)
				ClientModules.Vehicles:Synchronize(vehicle)
			end)
		end
	end)
end)

Events.Register("vehicle:manageExtras", function(source, toggle)
	Menus:Visible(extrasMenu, toggle)
end)
