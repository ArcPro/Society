local function isFireFighter()
	return player:job().name == "lsfd" and LocalPlayer.state.duty == true
end

exports("isFireFighter", isFireFighter)
