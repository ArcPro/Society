local function uptime()
	local hours = GetClockHours()
	local minutes = GetClockMinutes()

	while true do
		Citizen.Wait(0)

		if hours == GlobalState["time.hours"] and minutes == GlobalState["time.minutes"] then
			break
		end

		minutes += 1
		if minutes >= 60 then
			minutes = 0
			hours += 1
		end

		if hours >= 24 then
			hours = 0
		end

		NetworkOverrideClockTime(hours, minutes, 0)
	end
end

local function downtime()
	local hours = GetClockHours()
	local minutes = GetClockMinutes()

	while true do
		Citizen.Wait(0)

		if hours == GlobalState["time.hours"] and minutes == GlobalState["time.minutes"] then
			break
		end

		minutes -= 1
		if minutes < 0 then
			minutes = 60
			hours -= 1
		end

		if hours < 0 then
			hours = 24
		end

		NetworkOverrideClockTime(hours, minutes, 0)
	end
end

local function isGreater()
	local clockHours = GetClockHours()

	if (
		GlobalState["time.hours"] > clockHours
		or (GlobalState["time.hours"] == clockHours and GlobalState["time.minutes"] > GetClockMinutes())
		or clockHours - GlobalState["time.hours"] > 12
	) then
		if GlobalState["time.hours"] - clockHours > 12 then
			return false
		end

		return true
	end

	return false
end

local function SetTime()
	if GetClockHours() == GlobalState["time.hours"] then
		NetworkOverrideClockTime(GlobalState["time.hours"], GlobalState["time.minutes"], 0)
	end

    if isUpdating then
        return
    end

    Citizen.CreateThread(function()
        isUpdating = true

        if isGreater() then
            uptime()
        else
            downtime()
        end

        isUpdating = false
    end)
end

local function SetWeather(weather)
    SetWeatherOwnedByNetwork(false)
    SetWeatherTypeOvertimePersist(weather, 30.0)
end

local function FreezeTime()
	Citizen.CreateThread(function()
		while GlobalState["time.frozen"] == true do
			Citizen.Wait(1000)
			SetTime()
		end
	end)
end

AddStateBagChangeHandler("time.hours", "global", function(bagName, key, value, reserved, replicated)
	SetTime()
end)

AddStateBagChangeHandler("time.minutes", "global", function(bagName, key, value, reserved, replicated)
	SetTime()
end)

AddStateBagChangeHandler("time.frozen", "global", function(bagName, key, value, reserved, replicated)
	if value == false then return end

	FreezeTime()
end)

AddStateBagChangeHandler("weather", "global", function(bagName, key, value, reserved, replicated)
	SetWeather(value)
end)

Core.Player:OnLoad(function()
	SetWeather(GlobalState["weather"])
	FreezeTime()
	SetTime()
end)

