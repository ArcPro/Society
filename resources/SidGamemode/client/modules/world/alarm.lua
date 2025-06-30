local function ToggleAlarm(toggle)
	if toggle ~= true then return end

	Citizen.CreateThread(function()
		while GlobalState["alarm"] ~= false do
			UI:PlaySound("alarm")
			Utils.RealWait(22000)
		end
	end)
end

AddStateBagChangeHandler("alarm", "global", function(bagName, key, value, reserved, replicated)
	ToggleAlarm(value)
end)

Core.Player:OnLoad(function()
	
	ToggleAlarm(GlobalState["alarm"])
	
end)
