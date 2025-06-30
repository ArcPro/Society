local callbacks = {}

Callbacks = {}

Callbacks.Register = function (name, func)
    table.insert(callbacks, Callback:new({
        name = name,
        func = func
    }))
end

Callbacks.Unregister = function(name)
    for i = 1, #callbacks do
        if callbacks[i]:name() == name then
            table.remove(callbacks, i)
            break
        end
    end
end

Callbacks.Get = function(name)
    for i = 1, #callbacks do
        if callbacks[i]:name() == name then
            return callbacks[i]
        end
    end
end

Events.Register('callback', function(src, name, callback_id, ...)
    local callback = Callbacks.Get(name)

    if callback then
        Events.TriggerClient('callback', src, callback_id, callback:trigger(src, ...))
    end
end)
