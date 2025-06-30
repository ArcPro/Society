local function addFireDispatch(coords, location)
	Events.Trigger(
        "dispatch:add",
        "lsfd",
        location,
        "Feu en cours",
		"",
		coords
    )
end

exports("addFireDispatch", addFireDispatch)
