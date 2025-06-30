Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (
		DoesEntityExist(hitEntity) == false
		or IsEntityAnObject(hitEntity) == false
		or ClientModules.World.Stretcher:IsThisModelAStretcher(GetEntityModel(hitEntity)) == false
	) then return end

	Context:AddItem(0, ("%s le brancard"):format(GetEntityModel(hitEntity) == ClientModules.World.Stretcher.Models.LOWERED and "Relever" or "Baisser"), function()
		ClientModules.World.Stretcher:ModelSwap(hitEntity)
	end, true)

	Context:AddItem(0, "Prendre le brancard", function()
		ClientModules.World.Stretcher:Grab(hitEntity)
	end, true)

	Context:AddItem(0, "S'allonger sur le brancard", function()
		ClientModules.World.Stretcher:Lay(hitEntity)
	end, true)
end)

Context:Register(function(screenPosition, hitSomething, worldPosition, vehicle, normalDirection)
    if (
		DoesEntityExist(vehicle) == false
		or IsEntityAVehicle(vehicle) == false
		or ClientModules.World.Stretcher:IsThisModelAValidAmbulance(GetEntityModel(vehicle)) == false
	) then return end

    if not (GetVehicleDoorAngleRatio(vehicle, 2) > 0.5 and GetVehicleDoorAngleRatio(vehicle, 3) > 0.5) then return end

    -- Stretcher into ambulance code here
	if ClientModules.World.Stretcher:IsThereAStretcherInThisAmbulance(vehicle) then
		Context:AddItem(0, "Prendre le brancard", function()
			ClientModules.World.Stretcher:GrabFromVehicle(vehicle)
		end, true)
	elseif DoesEntityExist(ClientModules.World.Stretcher.Attached) then
		Context:AddItem(0, "Installer le brancard", function()
			ClientModules.World.Stretcher:PlaceInVehicle(vehicle)
		end, true)
	end
end)
