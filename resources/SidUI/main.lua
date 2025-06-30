local openedUIs = {}

local currentFocusKeepInput = nil
local isProgressActive = false
local pauseMenuOpen = false
local currentFocus = nil
local popup = nil

local function ToggleUI(component, visible, data, useMouse, keepInput, blur)

	if isProgressActive == true and component ~= "progress" then return end
	if pauseMenuOpen then return end

    SendNUIMessage({
        action = "toggleWebView",
        data = {
            component = component,
            visible = visible,
            data = data
        }
    })

    if blur == true then
        TriggerScreenblurFadeIn(250.0)
    else
        TriggerScreenblurFadeOut(250.0)
    end

	if visible == false and openedUIs[component] ~= true then
		return
	end

	openedUIs[component] = visible

    currentFocus = useMouse
    currentFocusKeepInput = keepInput

    SetNuiFocus(useMouse, useMouse)
    SetNuiFocusKeepInput(keepInput)
end

local function SendMessage(message, data)
    SendNUIMessage({
        action = message,
        data = data
    })
end

local function CopyToClipboard(content)
    SendNUIMessage({
        action = "copy_clipboard",
        data = {
		content = content
	}
    })
end


local function RegisterCallback(name, cb)
    RegisterNUICallback(name, cb)
end

local function OpenURL(url)
    SendNUIMessage({
        action = "external_url",
        data = {
            url = url
        }
    })
end

local function AddNotification(type, message, icon, duration, name, location, emergencyCode, id)
    SendNUIMessage({
        action = "notifications:add",
        data = {
            emergencyCode = emergencyCode,
            duration = duration,
            location = location,
            message = message,
            icon = icon,
            name = name,
            type = type,
            id = id,
        }
    })
end

local function ToggleRadar(toggle)
    DisplayRadar(toggle)
    SendNUIMessage({
        action = "toggleRadar",
        data = {
            toggle = toggle
        }
    })
end

local function PlaySound(sound)
    SendNUIMessage({
        action = "playSound",
        data = {
            sound = sound
        }
    })
end

local function TTS(text)
    SendNUIMessage({
        action = "tts",
        data = {
            text = text
        }
    })
end

local function CloseAll()
	SendNUIMessage({
        action = "closeAll",
    })

    SetNuiFocus(false, false)
end

local function Popup(title, text, confirm, cancel, color_type)
    ToggleUI('popup', true, {
        confirmText = confirm.text,
        cancelText = cancel.text,
		colorType = color_type,
        title = title,
        text = text,
    }, true, true)

    popup = {
        onConfirm = confirm.cb,
        onCancel = cancel.cb
    }

    Citizen.CreateThread(function()
        while popup ~= nil do
            Citizen.Wait(0)
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
        end

        ToggleUI('popup', false, {}, false, false)
    end)
end

local function PopupMultiChoice(title, text, choices, onConfirm)
    ToggleUI('popup2', true, {
        choices = choices,
        title = title,
        text = text,
    }, true, true)

    popup = {
        onCancel = function()end,
        onConfirm = onConfirm,
    }

    Citizen.CreateThread(function()
        while popup ~= nil do
            Citizen.Wait(0)
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
        end

        ToggleUI('popup2', false, {}, false, false)
    end)
end

local function UseTablet(url)
    ToggleUI('tablet', true, {
        url = url
    }, true, false, true)

	exports.SidGamemode:PlayAnimation("tablet2")

    Citizen.CreateThread(function()
        while IsNuiFocused() do
            Citizen.Wait(0)
        end

        ToggleUI('tablet', false, {}, false, false)
        exports.SidGamemode:StopAnimation()
    end)
end

local function Progress(time)
	ToggleUI("progress", true, { time = time }, false, false)
	isProgressActive = true

	Citizen.CreateThread(function()
		while isProgressActive == true do
			exports.SidGamemode:DisableControlsForUI(true)
			Citizen.Wait(0)
		end
	end)
end

local function IsFocused()
	return IsNuiFocused()
end

Citizen.CreateThread(function()
	local found = false
	while true do
		found = false

		for k, v in pairs(openedUIs) do
			if v == true then
				found = true
				break
			end
		end

		if found == false then
			if currentFocus == true then
				currentFocus, currentFocusKeepInput = false, false
				SetNuiFocus(currentFocus, currentFocus)
				SetNuiFocusKeepInput(currentFocusKeepInput)
			end
		end

		if IsPauseMenuActive() then
			if pauseMenuOpen == false then
				SendMessage("setVisibility", false)
			end

			pauseMenuOpen = true
		elseif pauseMenuOpen == true then
			SendMessage("setVisibility", true)
			pauseMenuOpen = false
		end

		Citizen.Wait(100)
	end
end)

Citizen.CreateThread(function()
	while true do
		if IsNuiFocused() then
			DisablePlayerFiring(PlayerPedId(), true)
		end

		Citizen.Wait(0)
	end
end)

RegisterNuiCallback('popup:closed', function()
    if popup then
		local fn = popup.onCancel
        popup = nil
		Citizen.Wait(50)
		fn()
    end
end)

RegisterNuiCallback('popup:accept', function()
    if popup then
        local fn = popup.onConfirm
        popup = nil
		Citizen.Wait(50)
		fn()
    end
end)

RegisterNuiCallback('popup:cancel', function()
    if popup then
        local fn = popup.onCancel
        popup = nil
		Citizen.Wait(50)
		fn()
    end
end)

RegisterNuiCallback('popup2:closed', function()
    popup = nil
end)

RegisterNuiCallback('popup2:choice', function(data, cb)
    if popup then
        local fn = popup.onConfirm
        popup = nil
		Citizen.Wait(50)
		fn(data.choice)
    end
end)

RegisterNuiCallback('requestFocus', function()
    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(false)
end)

RegisterNuiCallback('releaseFocus', function()
    SetNuiFocus(currentFocus, currentFocus)
    SetNuiFocusKeepInput(currentFocusKeepInput)
end)

RegisterNuiCallback('forceReleaseFocus', function()
    SetNuiFocus(false, false)
end)

RegisterNuiCallback('toggleKeepInput', function()
    SetNuiFocusKeepInput(not currentFocusKeepInput)
    currentFocusKeepInput = not currentFocusKeepInput
end)

RegisterNuiCallback('playSound', function(sound)
    PlaySoundFrontend(-1, sound, "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
end)

RegisterNuiCallback('progress:end', function(data, cb)
    ToggleUI("progress", false, {}, false, false)
	isProgressActive = false
    cb(true)
end)

RegisterNuiCallback('closed', function(data, cb)
    openedUIs[data.key] = false
    cb(true)
end)

exports("RegisterCallback", RegisterCallback)
exports('PopupMultiChoice', PopupMultiChoice)
exports('AddNotification', AddNotification)
exports('CopyToClipboard', CopyToClipboard)
exports('SendMessage', SendMessage)
exports('ToggleRadar', ToggleRadar)
exports('IsFocused', IsFocused)
exports('UseTablet', UseTablet)
exports("PlaySound", PlaySound)
exports("CloseAll", CloseAll)
exports('Progress', Progress)
exports("OpenURL", OpenURL)
exports("Toggle", ToggleUI)
exports('Popup', Popup)
exports("TTS", TTS)
