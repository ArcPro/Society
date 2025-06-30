ClientModules = ClientModules or {}
ClientModules.Illegal = ClientModules.Illegal or {}
ClientModules.Illegal.Carjack = {}
ClientModules.Illegal.Carjack.LastJackedCar = nil

function ClientModules.Illegal.Carjack:Start(npc, vehicle)
	if self.LastJackedCar == vehicle then return end

	TaskLeaveVehicle(npc, vehicle, 256)

	while IsPedInVehicle(npc, vehicle, false) do
		Citizen.Wait(0)
	end

	if math.random(0, 100) < SharedModules.Variables:Get("global", "npc_shot_chance") then
		GiveWeaponToPed(npc, GetHashKey("weapon_pistol"), 256, false, true)
		TaskShootAtEntity(npc, PlayerPedId(), 5000, GetHashKey("FIRING_PATTERN_BURST_FIRE"))
	else
		TaskReactAndFleePed(npc, PlayerPedId())
	end

	ClientModules.Vehicles.Actions:Call("lock_doors", vehicle, { Config.VehicleDoors.OPEN, true })
	ClientModules.Vehicles.Actions:Call("toggle_engine", vehicle, { false })
	ClientModules.Illegal:AlertPolice("Vol de véhicule à main armée")

	self.LastJackedCar = vehicle
end
