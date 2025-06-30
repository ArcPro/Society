Utils = Utils or {}
UI = UI or exports["SidUI"]

local KeyboardInputValue = nil

---@param value string
---@return boolean
local function CheckForBlacklistedDomains(value)
	for _, domain in pairs(Config.BlacklistedDomains) do
		if value:find(domain) ~= nil then
			return true
		end
	end

	return false
end

UI:RegisterCallback("keyboard_input:closed", function()
    KeyboardInputValue = ""
end)

UI:RegisterCallback("keyboardInput", function(value)
    if value == nil then
        KeyboardInputValue = ""
        return
    end

	if CheckForBlacklistedDomains(value) == true then
		UI:AddNotification("basic", "~r~Cette URL n'est pas autorisée.~s~", "info", 5000)
		value = nil
		return
	end

    KeyboardInputValue = value
end)

---@return string | nil
Utils.KeyboardInput = function(textEntry, maxLength, text)
    UI:Toggle("keyboard_input", true, {
        placeholder = textEntry,
        maxLength = maxLength,
        defaultValue = text
    }, true, false)

    while KeyboardInputValue == nil do
        Citizen.Wait(0)
    end

    local result = KeyboardInputValue
    KeyboardInputValue = nil
    UI:Toggle("keyboard_input", false, {}, false, false)

    if result == nil or result == "" then
        return nil
    end

    return result
end

Utils.KeyRegister = function(control, controlName, description, callback)
	local command = ("+%s"):format(controlName)
    RegisterCommand(command, callback, false)
    RegisterKeyMapping(command, description, "keyboard", control)
end
