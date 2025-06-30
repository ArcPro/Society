local function hasRadio()
    return player:inventory():findItem(function(item)
        return item.name == "radio"
    end) ~= nil
end

local function hasJammer()
    return player:inventory():findItem(function(item)
        return item.name == "radio_jammer"
    end) ~= nil
end

local function getJob()
    return player:job().name
end

exports('hasRadio', hasRadio)
exports('hasJammer', hasJammer)
exports('getJob', getJob)
