function CharacterPhoto()

	if GetResourceState("screenshot-basic") ~= "started" then
		return nil
	end

    local clone = ClonePed(PlayerPedId(), false, false, true)
    local camera = Camera:new({
        position = vector3(0.0, 0.0, 0.0),
        rotation = vector3(0.0, 0.0, 0.0),
        name = "character_photo",
        fov = 40.0,
    })

	LocalPlayer.state:set("freecam", true, true)

    SetEntityCoords(clone, 353.7366, 4875.7333, -59.6905, true, false, false, false)
    SetEntityHeading(clone, 146.8659)
    FreezeEntityPosition(clone, true)

	SetFocusPosAndVel(353.7366, 4875.7333, -59.6905, 0.0, 0.0, 0.0)
	Utils.RealWait(1000)

    Utils.Streaming.RequestAnimDict("anim@amb@nightclub@peds@")

    TaskPlayAnim(clone, "anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", 8.0, 8.0, -1, 1, 0.0, false, false, false)
    ExecuteCommand("hideChat")
    ToggleRadar(false)

	local forward, _, up, pos = GetEntityMatrix(clone)

	camera:position(pos + forward * 2.0 + up * 0.3)
    camera:focus(pos + up * 0.3)
    camera:render()

	Utils.RealWait(2000)

    local url = nil;
    exports['screenshot-basic']:requestScreenshotUpload("https://cdnrv.sysscripts.com/ig_upload/", 'file', {
		headers = { Authorization = 'Bearer ' .. Config.APIKey },
		encoding = 'webp'
	}, function(data)
		local res = json.decode(data)

		if res ~= nil and res.link then
			url = res.link
		end
	end)

	local limit = 250
    while url == nil and limit > 0 do
		Citizen.Wait(100)
		limit -= 1;
	end

    DeleteEntity(clone)
    ToggleRadar(true)
    camera:destroy()
	ClearFocus()

	LocalPlayer.state:set("freecam", false, true)

    return url
end
