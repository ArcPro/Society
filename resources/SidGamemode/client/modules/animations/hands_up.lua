local inHandsup = false

local function IsPlayerAiming(player)
    return (IsPlayerFreeAiming(player) or IsAimCamActive() or IsAimCamThirdPersonActive()) and tonumber(GetSelectedPedWeapon(player)) ~= tonumber(GetHashKey("WEAPON_UNARMED"))
end

local function HandsUpLoop()
    Citizen.CreateThread(function()
        while inHandsup do
            if IsPlayerAiming(PlayerId()) or IsPedInAnyVehicle(PlayerPedId(), false) then
                ClearPedSecondaryTask(PlayerPedId())
                Citizen.CreateThread(function()
                    Citizen.Wait(350)
                    inHandsup = false
                end)
            end

            Citizen.Wait(0)
        end
    end)
end

Utils.KeyRegister("H", "handsup", "Lever les mains", function()
	local playerPed = PlayerPedId()
	if not IsPedHuman(playerPed) or IsPedInAnyVehicle(PlayerPedId(), false) then
		return
	end

	inHandsup = not inHandsup

	ClientModules.Misc.Animations:Stop()

	if inHandsup then
		local dict = "random@mugging3"
		RequestAnimDict(dict)
		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end

		TaskPlayAnim(PlayerPedId(), dict, "handsup_standing_base", 2.0, 2.0, -1, 49, 0.0, false, IsThisModelABike(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false))) and 4127 or false, false)
		HandsUpLoop()
	else
		ClearPedSecondaryTask(PlayerPedId())
	end
end)
