local phoneVersion = GetResourceMetadata(GetCurrentResourceName(), "version", 0) or ""

local function IsResourceStartedOrStarting(resource)
    local state = GetResourceState(resource)
    return state == "started" or state == "starting"
end

local infoLevels = {
    success = "^2[SUCCESS]",
    info = "^5[INFO]",
    warning = "^3[WARNING]",
    error = "^1[ERROR]"
}

---@param level "success" | "info" | "warning" | "error"
---@param text string
function infoprint(level, text, ...)
    local prefix = infoLevels[level]

    if not prefix then
        prefix = "^5[INFO]^7:"
    end

    print("^6[LB Phone " .. phoneVersion .. "] " .. prefix .. "^7: " .. text, ...)
end

function debugprint(...)
    if Config.Debug then
        local data = {...}
        local str = ""

        for i = 1, #data do
            if type(data[i]) == "table" then
                str = str .. json.encode(data[i], { indent = true })
            elseif type(data[i]) ~= "string" then
                str = str .. tostring(data[i])
            else
                str = str .. data[i]
            end

            if i ~= #data then
                str = str .. " "
            end
        end

        print("^6[LB Phone " .. phoneVersion .. "] ^3[Debug]^7: " .. str)
    end
end

if Config.HouseScript == "auto" then
    Config.HouseScript = false

    debugprint("Detecting house script")

    local houseScripts = {
        "loaf_housing",
        "qb-houses",
        "qs-housing"
    }

    for i = 1, #houseScripts do
        if IsResourceStartedOrStarting(houseScripts[i]) then
            Config.HouseScript = houseScripts[i]
            debugprint("Detected house script: " .. houseScripts[i])
            break
        end
    end

    if not Config.HouseScript then
        debugprint("No house script detected")
    end
end

if Config.Item.Unique and Config.Item.Inventory == "auto" then
    debugprint("Detecting inventory script")

    local inventoryScripts = {
        "ox_inventory",
        "qb-inventory",
        "lj-inventory",
        "core_inventory",
        "mf-inventory",
        "qs-inventory",
        "codem-inventory"
    }

    for i = 1, #inventoryScripts do
        if IsResourceStartedOrStarting(inventoryScripts[i]) then
            Config.Item.Inventory = inventoryScripts[i]
            debugprint("Detected inventory script: " .. inventoryScripts[i])
            break
        end
    end

    if Config.Item.Inventory == "auto" then
        debugprint("No inventory script detected")
    end
end

if Config.Framework == "auto" then
    debugprint("Detecting framework")

    if IsResourceStartedOrStarting("es_extended") then
        Config.Framework = "esx"
    elseif IsResourceStartedOrStarting("qbx_core") then
        Config.Framework = "qbox"
    elseif IsResourceStartedOrStarting("qb-core") then
        Config.Framework = "qb"
    elseif IsResourceStartedOrStarting("ox_core") then
        Config.Framework = "ox"
    else
        Config.Framework = "standalone"
    end

    debugprint("Detected framework: " .. Config.Framework)
end

if Config.Voice.System == "auto" then
    debugprint("Detecting voice script")

    local voiceScripts = {
        {"pma-voice", "pma"},
        {"mumble-voip", "mumble"},
        {"saltychat", "salty"},
        {"tokovoip_script", "toko"}
    }

    for i = 1, #voiceScripts do
        local resource = voiceScripts[i][1]
        local system = voiceScripts[i][2]

        if IsResourceStartedOrStarting(resource) then
            Config.Voice.System = system
            debugprint("Detected voice script: " .. resource)
            break
        end
    end

    if Config.Voice.System == "auto" then
        debugprint("No voice script detected, defaulting to pma")
        Config.Voice.System = "pma"
    end
end

function table.deep_clone(og)
    local copy = {}

    for k, v in pairs(og) do
        if type(v) == "table" then
            v = table.deep_clone(v)
        end
        copy[k] = v
    end

    return copy
end

function table.contains(t, v)
    for i = 1, #t do
        if t[i] == v then
            return true, i
        end
    end

    return false
end

function math.clamp(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    end

    return value
end

---@param value number
---@param decimals number
function math.round(value, decimals)
    if not value or type(value) ~= "number" then
        return 0
    end

    if not decimals or type(decimals) ~= "number" then
        return math.floor(value + 0.5)
    end

    local mult = 10 ^ (decimals or 0)

    return math.floor(value * mult + 0.5) / mult
end

local function GenerateLocales(localesFile)
    local tempLocals = {}

    local function FormatLocales(localeTable, prefix)
        for k, v in pairs(localeTable) do
            if type(v) == "table" then
                FormatLocales(v, prefix .. k .. ".")
            else
                tempLocals[prefix .. k] = v
            end
        end
    end

    FormatLocales(localesFile, "")
    return tempLocals
end

local function LoadLocales(locale)
    if not locale then
        return {}
    end

    local fileContent = LoadResourceFile(GetCurrentResourceName(), "config/locales/" .. locale .. ".json")
    if not fileContent then
        infoprint("error", "Invalid locale '" .. locale .. "' (file not found)")
        return {}
    end

    local decoded = json.decode(fileContent)
    if not decoded then
        infoprint("error", "Invalid locale '" .. locale .. "' (error decoding file)")
        return {}
    end

    return GenerateLocales(decoded)
end

local locales = LoadLocales(Config.DefaultLocale or "en")
local defaultLocales
if Config.DefaultLocale ~= "en" then
    defaultLocales = LoadLocales("en")
else
    defaultLocales = {}
end

function L(path, args)
    assert(type(path) == "string", "path must be a string")

    local translation = locales[path] or defaultLocales[path] or path

    if args then
        for k, v in pairs(args) do
            local safe_v = tostring(v):gsub("%%", "%%%%")  -- Escape % characters
            translation = translation:gsub("{" .. k .. "}", safe_v)
        end
    end

    return translation
end

function SeperateNumber(number)
    -- https://stackoverflow.com/questions/10989788/format-integer-in-lua
    local res = tostring(number):reverse():gsub("(%d%d%d)", "%1 "):reverse():gsub("^ ", "")
    return res
end

function FormatNumber(number)
    if not number or type(number) ~= "string" then
        return ""
    end

    local format = Config.PhoneNumber.Format
    -- remove any non-numeric characters from the number
    number = number:gsub("%D", "")

    -- iterate through the format string
    local result = {}
    local i = 1
    while i <= #format do
        local c = format:sub(i, i)
        if c == "{" then
            -- get the number of digits specified in the format string
            local j = i + 1
            while j <= #format and format:sub(j, j) ~= "}" do
                j += 1
            end
            local n = tonumber(format:sub(i + 1, j - 1))

            -- add the next n digits from the number to the result
            for k = 1, n do
                local digit = number:sub(k, k)
                if not digit then
                    break
                end
                result[#result+1] = digit
            end
            number = number:sub(n + 1)
            i = j + 1
        else
            -- add the non-digit character to the result
            result[#result+1] = c
            i += 1
        end
    end
    return table.concat(result)
end
exports("FormatNumber", FormatNumber)

local months = { Jan = 1, Feb = 2, Mar = 3, Apr = 4, May = 5, Jun = 6, Jul = 7, Aug = 8, Sep = 9, Oct = 10, Nov = 11, Dec = 12 }
local pattern = "%a+%s+(%a+)%s+(%d+)%s+(%d+)%s+(%d+):(%d+):(%d+)"

function ConvertJSTimestamp(timestamp)
    local month, day, year, hour, min, sec = timestamp:match(pattern)
    local date = {
        year = tonumber(year),
        month = months[month],
        day = tonumber(day),
        hour = tonumber(hour),
        min = tonumber(min),
        sec = tonumber(sec)
    }

    return os.time(date) * 1000
end

exports("GetConfig", function()
    return Config
end)
