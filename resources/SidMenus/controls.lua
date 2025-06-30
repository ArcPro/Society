Menus.Controls = {}

Menus.Controls.Update = function(title, banner, index, items)
    SendNUIMessage({
        action = "outro:menu:update",
        data = {
            title = title,
            banner = banner,
            index = index,
            items = items,
        }
    })
end

Menus.Controls.Close = function()
    SendNUIMessage({
        action = "outro:menu:close",
        data = {}
    })
end

Menus.Controls.Up = function()

    if not Menus.Current then
        return
    end

    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

    SendNUIMessage({
        action = "outro:menu:up",
        data = {}
    })
end

Menus.Controls.Down = function()

    if not Menus.Current then
        return
    end

    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

    SendNUIMessage({
        action = "outro:menu:down",
        data = {}
    })
end

Menus.Controls.Left = function()

    if not Menus.Current then
        return
    end

    if Menus.Get(Menus.Current):currentItem().type ~= "list" then
        return
    end

    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

    SendNUIMessage({
        action = "outro:menu:left",
        data = {}
    })
end

Menus.Controls.Right = function()

    if not Menus.Current then
        return
    end

    if Menus.Get(Menus.Current):currentItem().type ~= "list" then
        return
    end

    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

    SendNUIMessage({
        action = "outro:menu:right",
        data = {}
    })
end

Menus.Controls.Select = function()

    if not Menus.Current then
        return
    end

    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

    SendNUIMessage({
        action = "outro:menu:select",
        data = {}
    })
end

Menus.Controls.Back = function()

    if not Menus.Current then
        return
    end

    PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)

    if Menus.Get(Menus.Current):parent() then
        Menus.Get(Menus.Current):parent(nil)
        Menus.Visible(Menus.Current, false)
    else
        Menus.Visible(Menus.Current, false)
    end
end

exports("Back", Menus.Controls.Back)
exports("Close", function()
    Menus.Controls.Close()
    Menus.Visible(Menus.Current, false)
end)
