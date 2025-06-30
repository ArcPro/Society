Date = nil

UI:SendMessage("date")
UI:RegisterCallback("date", function (data, cb)
	Date = data.date
	cb(true)
end)

Citizen.CreateThread(function()
    while true do
		UI:SendMessage("date")
        Utils.RealWait(1000)
    end
end)
