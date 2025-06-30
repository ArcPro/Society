---@class Items
---@field private _list table
---@field private _callbacks table
Items = {
    _list = {},
    _callbacks = {},
}
Items.__index = Items

function Items:new()
    local self = setmetatable({}, Items)
    return self
end

function Items:flush()
    self._list = {}
    self._callbacks = {}
end

---@param text string Button text
---@param disabled boolean Is button disabled
---@param rightLabel string Right label
---@param icon string Icon
---@param onClick fun() Callback (triggered on button click)
---@param submenu number
function Items:AddButton(text, disabled, rightLabel, icon, onClick, submenu)
    self._list[#self._list + 1] = {
        type = "button",
        props = {
            text = text,
            disabled = disabled,
            rightLabel = rightLabel,
            icon = icon,
        },
    }

    self._callbacks[#self._list] = function()
        onClick()

        if submenu then
            Menus.Visible(submenu, true)
        end
    end
end

---@param text string Checkbox text
---@param disabled boolean Is checkbox disabled
---@param checked boolean Is checkbox checked
---@param onClick fun(checked: boolean) Callback (triggered on checkbox click)
function Items:AddCheckbox(text, disabled, checked, onClick)
    self._list[#self._list + 1] = {
        type = "checkbox",
        props = {
            text = text,
            disabled = disabled,
            checked = checked,
        },
    }
    self._callbacks[#self._list] = onClick
end

---@param text string List text
---@param items table List items
---@param index number List index
---@param disabled boolean Is list disabled
---@param onClick fun(isClicked: boolean, index: number) Callback (triggered on list click)
function Items:AddList(text, items, index, disabled, onClick)
    self._list[#self._list + 1] = {
        type = "list",
        props = {
            text = text,
            index = (index - 1),
            items = items,
            disabled = disabled,
        },
    }
    self._callbacks[#self._list] = onClick
end

---@param text string Separator text
function Items:AddSeparator(text)
    self._list[#self._list + 1] = {
        type = "separator",
        props = {
            text = text,
        },
    }
end

function Items:callback(index, indexOrChecked, isClicked)

    if isClicked == nil then
        isClicked = true
    end

    if self._callbacks[index] then
        if self._list[index].type == "list" then
            self._callbacks[index](isClicked, indexOrChecked)
        else
            self._callbacks[index](indexOrChecked)
        end
    end
end

function Items:list()
    return self._list
end
