Events.Register("dmv_school:toggle", function(source, toggled)
	if toggled then
		PaymentPopup(SharedModules.Variables:Get("global", "dmv_price") or 0, function()
			UI:Toggle("dmv_school", true, {}, true, false, true)
		end, { type = "card", iban = "Department of Motor Vehicles" })
	else
		UI:Toggle("dmv_school", false, {}, false, false)
	end
end)

UI:RegisterCallback("dmv_school:end", function(data, cb)
    if data.success == true then
		Citizen.Wait(500)
		UI:Toggle("dmv_school", false, {}, false, false)

		TriggerScreenblurFadeOut(250.0)
		Citizen.Wait(250)

		player:inventory():addItem(Item.Create('id_card', {
			birthdate = player:birthdate(),
			firstname = player:firstname(),
			lastname = player:lastname(),
			name = "Permis de conduire",
			height = player:height(),
			weight = player:weight(),
			photo = CharacterPhoto(),
			isDriverLicense = true,
			sex = player:sex(),
		}, 1))
	end

	cb(true)
end)

UI:RegisterCallback("dmv_school:closed", function(data, cb)
    TriggerScreenblurFadeOut(250.0)
	cb(true)
end)
