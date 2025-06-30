AddStateBagChangeHandler("duty", ("player:%d"):format(GetPlayerServerId(PlayerId())), function(bag, key, value, reserved, replicated)
	local company = ClientModules.Societies:Get(player:job().id)

	-- if company:id() == 23 or company:id() == 28 then
    --     if duty then
	-- 		Events.TriggerExternalServer("eblips:add", { name = player:fullname(), src = player:source(), company = company:id(), color = 38 })
    --     else
	-- 		Events.TriggerExternalServer("eblips:remove", player:source())
    --     end
    -- end

	MainMenu.Radial.Unregister()

    Events.Trigger("farm:load", value)

	if company:name():find("realestate_") then
		Events.Trigger("realestate:duty", value)
	else
		Events.Trigger(("%s:duty"):format(company:name()), value)
	end

    UI:AddNotification("basic", ("Vous êtes désormais %s service~s~."):format(value and "~b~en" or "~r~hors"), "info", 2000)

	Citizen.Wait(500)

	if MainMenu.Radial.Data == nil and value then
		MainMenu.Radial.Register({})
	end
end)
