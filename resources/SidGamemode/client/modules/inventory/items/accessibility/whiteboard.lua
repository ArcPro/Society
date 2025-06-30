Item.RegisterUsable("whiteboard", function()
	local text = Utils.KeyboardInput("Texte à écrire", 75, "")

	if text ~= nil then
		ClientModules.Misc.Animations:Play("mugshot")
		Citizen.Wait(250)

		Events.TriggerServer("whiteboard:write", text)
	end

	return false
end)