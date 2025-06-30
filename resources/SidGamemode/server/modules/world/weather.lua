local weatherPattern = {
	["clear"] = {
		["clear"]      = 50,
		["clouds"]     = 30,
		["extrasunny"] = 20
	},

	["clouds"] = {
		["clouds"]   = 30,
		["clear"]    = 40,
		["foggy"]    = 10,
		["overcast"] = 20
	},

	["foggy"] = {
		["foggy"]    = 10,
		["clouds"]   = 50,
		["overcast"] = 40
	},

	["overcast"] = {
		["overcast"] = 5,
		["clearing"] = 70,
		["rain"]     = 25,
	},

	["clearing"] = {
		["clearing"] = 10,
		["overcast"] = 10,
		["rain"]     = 20,
		["clouds"]   = 60
	},

	["rain"] = {
		["rain"]     = 10,
		["overcast"] = 20,
		["clearing"] = 55,
		["thunder"]  = 15
	},

	["thunder"] = {
		["thunder"]  = 30,
		["rain"]     = 40,
		["clearing"] = 30
	},

	["extrasunny"] = {
		["extrasunny"] = 25,
		["clear"]      = 75
	}
}

GlobalState["weather.frozen"] = false
GlobalState["time.frozen"] = false

GlobalState["weather"] = "extrasunny"
GlobalState["time.hours"] = 12
GlobalState["time.minutes"] = 0

local function updateTime()
    GlobalState["time.minutes"] = GlobalState["time.minutes"] + 1

    if GlobalState["time.minutes"] >= 60 then
		GlobalState["time.hours"] = GlobalState["time.hours"] + 1
        GlobalState["time.minutes"] = 0
    end

    if GlobalState["time.hours"] >= 24 then
        GlobalState["time.hours"] = 0
    end
end

local function updateWeather(weather)

	local choices = weatherPattern[weather]

	if not choices then
		return weather
	end

	local c = 0
	local r = math.random(1, 100)

	for weatherType, chance in pairs(choices) do
		c += chance
		if r <= c then
			return weatherType
		end
	end

	return weather
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)

		if GlobalState["time.frozen"] ~= true then
			updateTime()
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30 * 60 * 1000)

		if GlobalState["weather.frozen"] ~= true then
			GlobalState["weather"] = updateWeather(GlobalState["weather"])
		end
    end
end)
