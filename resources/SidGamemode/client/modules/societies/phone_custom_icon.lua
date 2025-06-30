PhoneCustomIconActions = PhoneCustomIconActions or {}

function PhoneCustomIconActions.RegiserNewAction(name, handler)
	PhoneCustomIconActions._list = PhoneCustomIconActions._list or {}
	table.insert(PhoneCustomIconActions._list, name)

	PhoneCustomIconActions[name] = handler
end

PhoneCustomIconActions.RegiserNewAction("sendPosToDispatch", function(company)
	if not company then
		Console.Error("PhoneCustomIconActions : No company provided")
		return
	end

	exports["lb-phone"]:ToggleOpen(false, false)

	Citizen.Wait(100)

	local text = Utils.KeyboardInput("Votre message", 150, "")

	Citizen.Wait(100)

	exports["lb-phone"]:ToggleOpen(true, false)

	if text == "" or text == nil then
		UI:AddNotification("basic", "~r~Vous devez entrer un message.~s~", "info", 5000)
		return
	end

	Events.TriggerServer(
		"dispatch:add",
		company,
		GetStreetNameFromHashKey(GetStreetNameAtCoord(player:position().x, player:position().y, player:position().z)),
		text
	)
end)

