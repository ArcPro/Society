Menus = {}
Menus.Pool = {}
Menus.Threads = {}
Menus.Current = nil
Menus.Navigation = {}

---@param title string
---@param banner string
Menus.Create = function(title, banner)
    Menus.Pool[#Menus.Pool + 1] = Menu:new({
        title = title,
        banner = banner,
    })

    return #Menus.Pool
end

---@param parent number
---@param title string
---@param banner string
Menus.CreateSub = function(parent, title, banner)
    Menus.Pool[#Menus.Pool + 1] = Menu:new({
        title = title,
        banner = banner,
        parent = parent
    })

    return #Menus.Pool
end

---@return Menu
Menus.Get = function(id)
    return Menus.Pool[id]
end

---@param id number
---@param visible? boolean
Menus.Visible = function(id, visible)

    if visible == nil then
        return Menus.Get(id):visible()
    end

    if visible then
        if Menus.Navigation[#Menus.Navigation] ~= id then
            table.insert(Menus.Navigation, id)
        end
        Menus.Get(id):visible(true)
        Menus.Get(id):onOpen()()

        if Menus.Current then
            Menus.Get(Menus.Current):visible(false)
        end

        Menus.Current = id
    else
        if Menus.Current == id then
            Menus.Current = nil
            Menus.Get(id):visible(false)
            Menus.Get(id):onClose()()
            table.remove(Menus.Navigation, #Menus.Navigation)
            if (Menus.Navigation[#Menus.Navigation]) then
                Menus.Visible(Menus.Navigation[#Menus.Navigation], true)
            else
                Menus.Controls.Close()
            end
        end
    end
end

---@param id number
---@param fn fun()
Menus.IsVisible = function(id, fn)

    if Menus.Current ~= id then
        return
    end

    Menus.Get(Menus.Current):items():flush()
    fn()
end

Menus.CreateThread = function(id, fn)
    Menus.Threads[id] = fn
end

exports("Create", Menus.Create)
exports("CreateSub", Menus.CreateSub)
exports("IsVisible", Menus.IsVisible)
exports("Visible", Menus.Visible)
exports("CreateThread", Menus.CreateThread)

exports("AddButton", function(...)
    Menus.Get(Menus.Current):items():AddButton(...)
end)

exports("AddList", function(...)
    Menus.Get(Menus.Current):items():AddList(...)
end)

exports("AddCheckbox", function(...)
    Menus.Get(Menus.Current):items():AddCheckbox(...)
end)

exports("AddSeparator", function(...)
    Menus.Get(Menus.Current):items():AddSeparator(...)
end)

exports("OnIndexChange", function(menu, fn)
    Menus.Get(menu):onIndexChange(fn)
end)

exports("OnOpen", function(menu, fn)
    Menus.Get(menu):onOpen(fn)
end)

exports("OnClose", function(menu, fn)
    Menus.Get(menu):onClose(fn)
end)
