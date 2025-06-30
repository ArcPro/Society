Callbacks.Register("screen", function(source, name)
    exports['screenshot-basic']:requestClientScreenshot(source, {
        fileName = ('cache/%s.jpg'):format(name)
    }, function(err, data)end)

    return true
end)
