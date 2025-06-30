local tokens = {}
local token = promise.new()

local Internal = {}

Internal.TriggerEvent = function(eventName, ...)
    local args = msgpack.pack({...})
    TriggerEventInternal(eventName, args, args:len())
end

Internal.TriggerClientEvent = function(eventName, target, ...)
    local args = msgpack.pack({...})
    TriggerClientEventInternal(eventName, target, args, args:len())
end

Internal.TriggerLatentClientEvent = function(eventName, target, ...)
    local args = msgpack.pack({...})
    TriggerLatentClientEventInternal(eventName, target, args, args:len(), 65536)
end

Internal.TriggerServerEvent = function(eventName, ...)
    local args = msgpack.pack({...})
    TriggerServerEventInternal(eventName, args, args:len())
end

Internal.TriggerLatentServerEvent = function(eventName, ...)
    local args = msgpack.pack({...})
    TriggerLatentServerEventInternal(eventName, args, args:len(), 65536)
end

local function TriggerEventReport(_src, _token, _event, ...)

    if Config.Env == "client" then
        Internal.TriggerServerEvent("outro:security:report", _token, _event, ...)
        return
    end

    local args = {...}
    local fields = {
        {
            name = "�v�nement",
            value = ("```%s```"):format(_event)
        },
        {
            name = "Nom du joueur",
            value = ("```%s```"):format(GetPlayerName(_src))
        },
        {
            name = "Discord du joueur",
            value = ("<@%s>"):format(Identifiers.Parse(GetPlayerIdentifiers(_src)).discord)
        },
        {
            name = "Param�tre 0",
            value = ("```%s```"):format(_token)
        }
    }

    for i = 1, #args do
        table.insert(fields, {
            name = "Param�tre " .. i,
            value = ("```%s```"):format(args[i])
        })
    end

    PerformHttpRequest(
        Config.Webhooks.SECURITY.EVENTS,
        function(err, text, header)end,
        'POST',
        json.encode({
            username = "San Andraes Stories S�curit�",
            embeds = {
                {
                    description = "Un joueur a essay� de d�clencher un �v�nement sans authentification, cela signifie qu'il y a de grandes chances que le joueur triche",
                    fields = fields,
                    author = {
                        name = "San Andraes Stories S�curit�"
                    },
					avatar_url = "https://cdnrv.sysscripts.com/other/logo.webp",
                    title = "Trigger event",
                    color = 16711680,
                    footer = {
                        text = "San Andraes Stories s�curit�"
                    },
                    timestamp = os.date('!%Y-%m-%dT%H:%M:%S.000Z')
                }
            }
        }),
        {['Content-Type'] = 'application/json'}
    )

    DropPlayer(_src, "Vous avez �t� d�tect� comme un tricheur potentiel, merci d'ouvrir un ticket avant de vous reconnecter afin de clarifier la situation.")
end

local function BypassAuthReport(_src, report_type)

    local message = "";

    if report_type == "request" then
        message = "Un joueur a essay� de contourner l'authentification, cela signifie qu'il y a de grandes chances que le joueur tente de tricher"
    elseif report_type == "revoke" then
        message = "Un joueur a essay� de r�voquer son token, cela signifie qu'il y a de grandes chances que le joueur tente ensuite de le r�cup�rer dans un environnement externe, et l'utilise pour tricher"
    end

    PerformHttpRequest(
        Config.Webhooks.SECURITY.EVENTS,
        function(err, text, header)end,
        'POST',
        json.encode({
            username = "San Andraes Stories s�curit�",
            embeds = {
                {
                    description = message,
                    fields = {
                        {
                            name = "Nom du joueur",
                            value = ("```%s```"):format(GetPlayerName(_src))
                        },
                        {
                            name = "Discord du joueur",
                            value = ("<@%s>"):format(Identifiers.Parse(GetPlayerIdentifiers(_src)).discord)
                        }
                    },
                    author = {
                        name = "San Andraes Stories s�curit�"
                    },
					avatar_url = "https://cdnrv.sysscripts.com/other/logo.webp",
                    title = "Bypass Auth",
                    color = 16711680,
                    footer = {
                        text = "San Andraes Stories s�curit�"
                    },
                    timestamp = os.date('!%Y-%m-%dT%H:%M:%S.000Z')
                }
            }
        }),
        {['Content-Type'] = 'application/json'}
    )

    DropPlayer(_src, "Vous avez �t� d�tect� comme un tricheur potentiel, merci d'ouvrir un ticket avant de vous reconnecter afin de clarifier la situation.")
end

Events = {}

if Config.Env == "server" then
    RegisterNetEvent("outro:security:getToken")
    AddEventHandler("outro:security:getToken", function()
        local _src = source
        local _token = ""

        if tokens[source] then
            BypassAuthReport(_src, "request")
            return
        end

        for _ = 1, 64 do
            _token = _token .. string.char(math.random(30, 90))
        end

        tokens[_src] = _token
        Internal.TriggerClientEvent("outro:security:receiveToken", _src, _token)
    end)

    RegisterNetEvent("outro:security:revokeToken")
    AddEventHandler("outro:security:revokeToken", function(src)
        local _src = source

        if _src ~= nil then
            BypassAuthReport(_src, "revoke")
            return
        end

        if tokens[src] then
            tokens[src] = nil
        end
    end)

    RegisterNetEvent("outro:security:report")
    AddEventHandler("outro:security:report", function(_token, _event, ...)
        local _src = source

        if tokens[_src] == nil or tokens[_src] ~= _token then
            return
        end

        TriggerEventReport(_src, _token, _event, ...)
    end)
else
    RegisterNetEvent("outro:security:receiveToken")
    AddEventHandler("outro:security:receiveToken", function(_token)
        token:resolve(_token)
    end)

    Internal.TriggerServerEvent("outro:security:getToken")
end

Events.Register = function(name, callback)
    RegisterNetEvent(("outro:%s"):format(name))
    if callback then
        Events.Handle(name, callback)
    end
end

Events.Handle = function(name, callback)
    name = ("outro:%s"):format(name)

    AddEventHandler(name, function(...)
        local _src = source
        local _token = nil
        local params;

        if Config.Env == "server" then
            if (type(_src) == "string" and #_src == 0) then
                params = {...}
            else
                _token = ({...})[1]

                params = {...}
				table.remove(params, 1)

                if tokens[_src] == nil or tokens[_src] ~= _token then

                    TriggerEventReport(_src, token.value, ("%s (C -> S)"):format(name), ...)

                    return
                end
            end
        else
            if (type(_src) == "string" and #_src == 0) then
                _token = ({...})[1]

                params = {}
                for i = 2, #({...}) do
                    table.insert(params, ({...})[i])
                end
            else
                params = {...}
            end

            if (token.value == nil or token.value ~= _token) and not _src then

                TriggerEventReport(_src, token.value, ("%s (C -> C)"):format(name), ...)

                return
            end
        end

        callback(_src, table.unpack(params))
    end)
end

Events.Trigger = function(name, ...)
    name = ("outro:%s"):format(name)

    if Config.Env == "server" then
        Internal.TriggerEvent(name, ...)
    else
        Citizen.Await(token)
        Internal.TriggerEvent(name, token.value, ...)
    end
end

Events.TriggerExternal = function(name, ...)
    Internal.TriggerEvent(name, ...)
end

Events.TriggerExternalServer = function(name, ...)
    Internal.TriggerServerEvent(name, ...)
end

Events.TriggerExternalClient = function(name, ...)
    Internal.TriggerClientEvent(name, ...)
end

Events.TriggerServer = function(name, ...)
    Citizen.Await(token)
    Internal.TriggerServerEvent(("outro:%s"):format(name), token.value, ...)
end

Events.TriggerClient = function(name, target, ...)
    Internal.TriggerClientEvent(("outro:%s"):format(name), target, ...)
end

Events.TriggerServerLatent = function(name, ...)
    Citizen.Await(token)
    Internal.TriggerLatentServerEvent(("outro:%s"):format(name), token.value, ...)
end

Events.TriggerClientLatent = function(name, target, ...)
    Internal.TriggerLatentClientEvent(("outro:%s"):format(name), target, ...)
end
