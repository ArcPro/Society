Callbacks.Register("rich_presence:info", function()
	return {
		name = GetConvar("sv_hostname", "San Andreas Stories"),
		max = GetConvarInt("sv_maxclients", 512),
		count = #GetPlayers(),
	}
end)
