ClientModules = ClientModules or {}
ClientModules.Societies = ClientModules.Societies or {}
ClientModules.Societies.Dispatch = {}
ClientModules.Societies.Dispatch.Initialized = false
ClientModules.Societies.Dispatch.Open = false
ClientModules.Societies.Dispatch.LastCallId = nil

---@type Blip[]
ClientModules.Societies.Dispatch.Blips = {}

function ClientModules.Societies.Dispatch:AddBlip(call)
	self.Blips[call.id] = Blip:new({
        title = ("Appel #%d"):format(call.id),
        coords = call.coords,
        id = 5000 + call.id,
        showOnList = false,
        shortRange = true,
        editable = false,
        sprite = 161,
        size = 0.75,
        color = 67,
    })

    self.Blips[call.id]:show()
    self.Blips[call.id]:showNumber(call.id)
end

function ClientModules.Societies.Dispatch:GetDispatchName()
	if player:job().name == "sams" then
		return "lsfd"
	end

	return player:job().name
end

local DispatchToggle = false

function ClientModules.Societies.Dispatch:Toggle()
    DispatchToggle = not DispatchToggle
    toggle = DispatchToggle
	UI:Toggle("dispatch", toggle, { calls = Callbacks.Trigger("dispatch:get") or {} }, toggle, toggle, false)
    self.Open = toggle

    if not toggle then return end

    Citizen.CreateThread(function()
        while self.Open do
            Utils.DisableControlsForUI()
            Citizen.Wait(0)
        end
    end)
end

function ClientModules.Societies.Dispatch:New(society, call)
	if society ~= self:GetDispatchName() or LocalPlayer.state.duty ~= true then
		return
	end

    self:AddBlip(call)

    if self.Open == true then
        UI:SendMessage("dispatch:add", call)
    else
        UI:AddNotification("emergency", call.text, "", 5000, "", call.location, call.code, call.id)
        self.LastCallId = call.id

        Citizen.CreateThread(function()
            local timer = GetGameTimer()
            local maxTime = timer + 5000

            while (not self.Open or timer < maxTime) and self.LastCallId == call.id do
                timer = GetGameTimer()

                if IsControlJustPressed(0, 246) then
                    self:Accept(call, self.LastCallId)
                    self.LastCallId = nil
                    break
                end

                Citizen.Wait(0)
            end
        end)
    end
end

function ClientModules.Societies.Dispatch:Delete(society, id)
	if society ~= self:GetDispatchName() or LocalPlayer.state.duty == false then
		return
	end

    if self.Blips[id] == nil then return end

    self.Blips[id]:delete()

    if self.Open then
        UI:SendMessage("dispatch:remove", id)
    end
end

function ClientModules.Societies.Dispatch:Accept(society, id)
	if society ~= self:GetDispatchName() or LocalPlayer.state.duty == false then
		return
	end

    if self.Open then
        UI:SendMessage("dispatch:accepted", id)
    end
end

function ClientModules.Societies.Dispatch:Load()
    for _, call in pairs(Callbacks.Trigger("dispatch:get") or {}) do
        self:AddBlip(call)
    end
end

function ClientModules.Societies.Dispatch:Take(data, cb)
    Events.TriggerServer("dispatch:accept", tonumber(data.id))

    for _, blip in pairs(self.Blips) do
        if blip:id() == tonumber(data.id) + 5000 then
            SetNewWaypoint(blip:coords().x, blip:coords().y)
            break
        end
    end

    UI:AddNotification("basic", ("~b~Vous avez accepté l'appel %s~s~"):format(data.id), "info", 5000)

    if cb ~= nil then cb(true) end
end

function ClientModules.Societies.Dispatch:Clear()
	for _, blip in pairs(self.Blips) do
        blip:delete()
    end

    self.Blips = {}
end

function ClientModules.Societies.Dispatch:RegisterEvents()
	Events.Register("dispatch:new", function(_, society, call)
		self:New(society, call)
	end)

	Events.Register("dispatch:deleted", function(_, society, id)
		self:Delete(society, id)
	end)

	Events.Register("dispatch:accepted", function(_, society, id)
		self:Accept(society, id)
	end)

	Events.Register("dispatch:load", function()
		self:Load()
	end)

	Events.Register("dispatch:clear", function()
		self:Clear()
	end)
end

function ClientModules.Societies.Dispatch:RegisterUICallbacks()
	UI:RegisterCallback("dispatch", function(data, cb)
		self:Toggle(true)
		cb(true)
	end)

	UI:RegisterCallback("dispatch:accept", function(data, cb)
		self:Take(data, cb)
	end)

	UI:RegisterCallback("dispatch:sendPosition", function(data, cb)
		Events.TriggerServer(
			"dispatch:add",
			player:job().name,
			GetStreetNameFromHashKey(GetStreetNameAtCoord(player:position().x, player:position().y, player:position().z)),
			player:lastname() .. " " .. player:firstname() .. " a besoin d'aide."
		)
	end)

	UI:RegisterCallback("dispatch:delete", function(data, cb)
		UI:AddNotification("basic", ("~r~Vous avez supprimé l'appel %s~s~"):format(data.id), "info", 5000)
		Events.TriggerServer("dispatch:delete", tonumber(data.id))
		cb(true)
	end)

	UI:RegisterCallback("dispatch:closed", function(data, cb)
		self.Open = false
        DispatchToggle = false
		cb(true)
	end)
end

function ClientModules.Societies.Dispatch:Initialize()
	if self.Initialized == true then return end

	self:RegisterUICallbacks()
	self:RegisterEvents()

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Societies.Dispatch:Initialize()
end)

RegisterKeyMapping('toggleDispatch', 'Toggle Dispatch list', 'keyboard', 'F6')

RegisterCommand('toggleDispatch', function()
    if player:job().name ~= "lspd" and player:job().name ~= "lssd" and player:job().name ~= "sahp" and player:job().name ~= "usss" then
        UI:AddNotification("basic", ("~b~Vous ne faites pas partie de ce service"), "error", 5000)
        return
    end
    if LocalPlayer.state.duty == nil or LocalPlayer.state.duty == false then
        UI:AddNotification("basic", ("~b~Vous n'êtes pas en service"), "error", 5000)
        return
    end
    ClientModules.Societies.Dispatch:Toggle()
end)
