Date = {};

function Date.now()
    return os.date('*t')
end

function Date.timestamp()
    return os.time()
end

function Date.format(format, timestamp)
    return tostring(os.date(format, timestamp))
end

Callbacks.Register('date', function()
    return Date.timestamp()
end)

Callbacks.Register('date:format', function(src, format, timestamp)
    return Date.format(format, timestamp)
end)
