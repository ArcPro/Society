AddStateBagChangeHandler("disable_phone", "global", function(bagName, key, value, reserved, replicated)
	exports["lb-phone"]:ToggleDisabled(value)
end)

Core.Player:OnLoad(function()
	
	exports["lb-phone"]:ToggleDisabled(GlobalState["disable_phone"])
	
end)
