---@class UI
---@field AddNotification fun(self: UI, type: string, message: string, icon: string, duration: number, name?: string, location?: string, emergencyCode?: string, id?: number)
---@field Popup fun(self: UI, title: string, text: string, accept: { text: string, cb: function }, cancel: { text: string, cb: function }, color_type: 0 | 1)
---@field Toggle fun(self: UI, component: string, visible: boolean, data: any, useMouse: boolean, keepInput: boolean, blur?: boolean)
---@field PopupMultiChoice fun(self: UI, title: string, text: string, choices: string[], onConfirm: fun(choice: string))
---@field RegisterCallback fun(self: UI, name: string, cb: fun(data: any, cb: fun(response: boolean)))
---@field SendMessage fun(self: UI, message: string, data: any)
---@field CopyToClipboard fun(self: UI, content: string)
---@field ToggleRadar fun(self: UI, toggle: boolean)
---@field PlaySound fun(self: UI, sound: string)
---@field Progress fun(self: UI, time: integer)
---@field UseTablet fun(self: UI, url: string)
---@field OpenURL fun(self: UI, url: string)
---@field TTS fun(self: UI, message: string)
---@field IsFocused fun(self: UI)
UI = exports["SidUI"]

---@class Menus
---@field Create fun(self: Menus, title: string, banner: string): number
---@field CreateSub fun(self: Menus, parent: number, title: string, banner: string): number
---@field Get fun(self: Menus, id: number): Menus
---@field Visible fun(self: Menus, id: number, visible?: boolean): boolean
---@field IsVisible fun(self: Menus, id: number, fn: function)
---@field CreateThread fun(self: Menus, id: number, fn: function)
---
---@field AddButton fun(self: Menus, text: string, disabled: boolean, rightLabel: string, icon: string, onClick: function, submenu?: number)
---@field AddCheckbox fun(self: Menus, text: string, disabled: boolean, checked: boolean, onClick: fun(checked: boolean))
---@field AddList fun(self: Menus, text: string, items: table, index: number, disabled: boolean, onClick: fun(isClicked: boolean, index: number))
---@field AddSeparator fun(self: Menus, text: string)
---
---@field Back fun(self: Menus)
---@field Close fun(self: Menus)
---
---@field OnIndexChange fun(self: Menus, menu: number, fn: fun(index: number))
---@field OnOpen fun(self: Menus, menu: number, fn: fun())
---@field OnClose fun(self: Menus, menu: number, fn: fun())
Menus = exports["SidMenus"]

---@class Context
---@field Register fun(self: Context, func: fun(screenPosition: { x: number, y: number }, hitSomething: boolean, worldPosition: vector3, hitEntity: integer, normalDirection)): integer
---
---@field AddSeparator fun(self: Context, menuId: integer): integer
---@field AddTextItem fun(self: Context, menuId: integer, title: string): integer
---@field AddItem fun(self: Context, menuId: integer, title: string, func?: fun(), closeOnActivate?: boolean): integer
---@field AddItems fun(self: Context, itemList: table): table<integer>
---@field AddSpriteItem fun(self: Context, menuId: integer, textureDict: string, textureName: string): integer
---@field AddCheckboxItem fun(self: Context, menuId: integer, title: string, checked: boolean): integer
---@field AddSubmenu fun(self: Context, parentMenuId: integer, title: string): integer, integer
---@field AddScrollSubmenu fun(self: Context, parentMenuId: integer, title: string, maxItems: integer): integer, integer
---@field AddPageSubmenu fun(self: Context, parentMenuId: integer, title: string, maxItems: integer): integer, integer
---
---@field OnActivate fun(self: Context, itemId: integer, func: fun())
---@field OnRelease fun(self: Context, itemId: integer, func: fun())
---@field OnValueChanged fun(self: Context, itemId: integer, func: fun())
---@field Enabled fun(self: Context, itemId: integer, enabled: boolean)
---@field CloseOnActivate fun(self: Context, itemId: integer, closeOnActivate: boolean)
---@field RightText fun(self: Context, itemId: integer, text: string): string | nil
Context = exports["ContextMenu"]

---@class PMMS
---@field enableEntity fun(self: PMMS, entity: integer)
---@field disableEntity fun(self: PMMS, entity: integer)
---@field createMediaPlayer fun(self: PMMS, options: any): integer
---@field IsMediaPlayableProp fun(self: PMMS, entity: integer)
---@field OpenUIForEntity fun(self: PMMS, entity: integer)
---@field deleteMediaPlayer fun(self: PMMS, entity: integer)
PMMS = exports["pmms"]
