function ToggleRadar(toggle)
	if ClientModules.Misc.Settings:Get("radar") == true then
		UI:ToggleRadar(toggle)
	end
end
