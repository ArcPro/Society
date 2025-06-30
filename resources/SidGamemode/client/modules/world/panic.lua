local function TogglePanic(toggle)
	if toggle ~= true then return end

	Citizen.CreateThread(function()
		while GlobalState["panic"] ~= false do
			for k, npc in pairs(GetGamePool("CPed")) do
				if IsPedAPlayer(npc) == false then
					if IsPedInAnyVehicle(npc, false) then
						SetDriveTaskDrivingStyle(npc, 524800)
					else
						TaskReactAndFleePed(npc, npc)
					end

					PlayPain(npc, 8, 0.0)
				end

				Citizen.Wait(0)
			end

			Utils.RealWait(10000)
		end

		for k_, npc in pairs(GetGamePool("CPed")) do
			if IsPedAPlayer(npc) == false then
				if IsPedInAnyVehicle(npc, false) then
					SetDriveTaskDrivingStyle(npc, 786603)
				end

				ClearPedTasks(npc)
			end

			Citizen.Wait(0)
		end
	end)
end

AddStateBagChangeHandler("panic", "global", function(bagName, key, value, reserved, replicated)
	TogglePanic(value)
end)

Core.Player:OnLoad(function()
	
	TogglePanic(GlobalState["panic"])
	
end)
