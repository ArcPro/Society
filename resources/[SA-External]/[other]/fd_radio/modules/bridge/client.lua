PlayerData = nil
Outro = exports["SidGamemode"]

function bridge.beforeOpen()
    return Outro:hasRadio()
end

function bridge.beforeClose()
    return true
end

function bridge.opened()

end

function bridge.notify(message, type)
    Outro:notify(message, 5000, "info")
end

function bridge.standaloneCheckRestrictedChannel(channel)
    local allowed = callback.await("fd_radio:isAceAllowed", false, channel)

    return allowed
end

function bridge.checkRestrictedChannel(channel)
    return false
end

function bridge.isDead()
    return IsEntityDead(cache.ped)
end

function bridge.hasItem(item, amount)
    if item == Config.UseItemName then
        return Outro:hasRadio()
    elseif item == Config.JammerItemName then
        return Outro:hasJammer()
    else
        return false
    end
end

function bridge.getIdentifier()
    local license, steamid = callback.await("fd_radio:getIdentifiers", false)

    if not license then
        license = GetPlayerServerId(cache.player)
    end

    return license
end

function bridge.loadSettings()
    local loadedSettings = GetResourceKvpString(settingsName())
    if not loadedSettings then
        return loadSettings()
    end

    settings = json.decode(loadedSettings)
    Wait(100)

    loadSettings()
end

function bridge.hasJob(table)
    return Outro:hasJob(table)
end

function bridge.getJob()
    return Outro:getJob()
end

RegisterNetEvent('fd_radio:use', function()
    toggleRadio()
end)

RegisterNetEvent('fd_radio:usedJammer', function()
    placeJammer()
end)