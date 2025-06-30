Item.RegisterUsable("ttsplayer", function()
	local text = Utils.KeyboardInput("Texte à lire", 512, "")
	local radioChannel = exports["pma-voice"]:getRadioChannel()

	if text == nil then
		return false
	end

	if radioChannel ~= 0 then
		UI:Popup(
			"En radio",
			"Le texte de la liseuse doit-il être entendu par les personnes connectées à la même radio que vous ?",
			{
				text = "Oui",
				cb = function ()
					Events.TriggerServer("tts:play", text, exports["pma-voice"]:getCallAndRadioData(false), MumbleGetTalkerProximity())
				end
			},
			{
				text = "Non",
				cb = function ()
					Events.TriggerServer("tts:play", text, exports["pma-voice"]:getCallAndRadioData(true), MumbleGetTalkerProximity())
				end
			},
			0
		)
	else
		Events.TriggerServer("tts:play", text, exports["pma-voice"]:getCallAndRadioData(true), MumbleGetTalkerProximity())
	end

	return false
end)
