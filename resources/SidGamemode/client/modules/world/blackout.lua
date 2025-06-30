local function FlickerLight(toggle, t1, t2)
	SetArtificialLightsState(toggle)
	Citizen.Wait(t1)
	SetArtificialLightsState(not toggle)
	Citizen.Wait(t2)
end

local function ToggleBlackout(toggle, useEffect)
	if toggle ~= true then
		toggle = false
	end

	Citizen.CreateThread(function()
		if toggle == true and useEffect == true then
			FlickerLight(toggle, math.random(100, 250), math.random(1750, 2250))
			FlickerLight(toggle, math.random(200, 300), math.random(1250, 1750))
			FlickerLight(toggle, math.random(375, 625), math.random(750, 1250))
			FlickerLight(toggle, math.random(10, 50), math.random(10, 50))
			FlickerLight(toggle, math.random(10, 50), math.random(10, 50))
			FlickerLight(toggle, math.random(10, 50), math.random(10, 50))
			FlickerLight(toggle, math.random(10, 50), math.random(10, 50))
			FlickerLight(toggle, math.random(500, 1500), math.random(500, 1500))
			FlickerLight(toggle, math.random(10, 50), math.random(10, 50))
			FlickerLight(toggle, math.random(10, 50), math.random(10, 50))
			FlickerLight(toggle, math.random(10, 50), math.random(10, 50))
			FlickerLight(toggle, math.random(1500, 2500), math.random(100, 500))
		end

		SetArtificialLightsState(toggle)
		SetArtificialLightsStateAffectsVehicles(false)
	end)
end

AddStateBagChangeHandler("blackout", "global", function(bagName, key, value, reserved, replicated)
	ToggleBlackout(value, true)
end)

Core.Player:OnLoad(function()
	
	ToggleBlackout(GlobalState["blackout"], false)
	
end)
