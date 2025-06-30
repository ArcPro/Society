mhackingCallback = {}
showHelp = false
helpTimer = 0
helpCycle = 4000

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if showHelp then
			Hint("Utilisez ~INPUT_MOVE_UP_ONLY~~INPUT_MOVE_LEFT_ONLY~~INPUT_MOVE_DOWN_ONLY~~INPUT_MOVE_RIGHT_ONLY~ pour vous déplacer, et ~INPUT_DIVE~ pour confirmer le bloc de gauche.~n~Utilisez ~INPUT_CELLPHONE_UP~~INPUT_CELLPHONE_LEFT~~INPUT_CELLPHONE_DOWN~~INPUT_CELLPHONE_RIGHT~ pour vous déplacer, et ~INPUT_FRONTEND_RDOWN~ pour confirmer le bloc de droite")
			if IsEntityDead(PlayerPedId()) then
				nuiMsg = {}
				nuiMsg.fail = true
				SendNUIMessage(nuiMsg)
			end
		end
	end
end)

function Hint(message)
    AddTextEntry('mhacking', message)
    BeginTextCommandDisplayHelp('mhacking')
    EndTextCommandDisplayHelp(0, false, false, -1)
end

AddEventHandler('mhacking:show', function()
    nuiMsg = {}
	nuiMsg.show = true
	SendNUIMessage(nuiMsg)
	SetNuiFocus(true, false)
end)

AddEventHandler('mhacking:hide', function()
    nuiMsg = {}
	nuiMsg.show = false
	SendNUIMessage(nuiMsg)
	SetNuiFocus(false, false)
	showHelp = false
end)

AddEventHandler('mhacking:start', function(solutionlength, duration, callback)
    mhackingCallback = callback
	nuiMsg = {}
	nuiMsg.s = solutionlength
	nuiMsg.d = duration
	nuiMsg.start = true
	SendNUIMessage(nuiMsg)
	showHelp = true
end)

AddEventHandler('mhacking:setmessage', function(msg)
    nuiMsg = {}
	nuiMsg.displayMsg = msg
	SendNUIMessage(nuiMsg)
end)

RegisterNUICallback('callback', function(data, cb)
	print("test")
	mhackingCallback(data.success, data.remainingtime)
    cb('ok')
end)
