RegisterNUICallback('outro:menu:indexChange', function(index, cb)
    if not Menus.Current then
        return cb(false)
    end

    Menus.Get(Menus.Current):index(index + 1)

    Menus.Get(Menus.Current):onIndexChange()(Menus.Get(Menus.Current):index())

    cb(true)
end)

RegisterNUICallback('outro:menu:selected', function(data, cb)
    if not Menus.Current then
        return cb(false)
    end

    Menus.Get(Menus.Current):select(data.index + 1, data.indexOrChecked)
    cb(true)
end)

RegisterNUICallback('outro:menu:listIndexChange', function(index, cb)
    if not Menus.Current then
        return cb(false)
    end
    Menus.Get(Menus.Current):items():callback(Menus.Get(Menus.Current):index(), index + 1, false)
    cb(true)
end)
