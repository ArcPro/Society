ClientModules = ClientModules or {}
ClientModules.HUD = ClientModules.HUD or {}
ClientModules.HUD.InstructionalButtons = ClientModules.HUD.InstructionalButtons or {}

ClientModules.HUD.InstructionalButtons.initialized = false
ClientModules.HUD.InstructionalButtons.entries = {}
ClientModules.HUD.InstructionalButtons.form = nil

---@private
function ClientModules.HUD.InstructionalButtons:ButtonMessage(text)
	local textEntry = ("outro_%d_%d"):format(Date, math.random(0, 2147483647))
	AddTextEntry(textEntry, text)
    BeginTextCommandScaleformString(textEntry)
    EndTextCommandScaleformString()
end

---@private
function ClientModules.HUD.InstructionalButtons:Button(ControlButton)
    ScaleformMovieMethodAddParamPlayerNameString(ControlButton)
end

---@private
function ClientModules.HUD.InstructionalButtons:Scaleform(scaleform, data)
	self.form = RequestScaleformMovie(scaleform)

    while not HasScaleformMovieLoaded(self.form) do
        Citizen.Wait(0)
    end

    DrawScaleformMovieFullscreen(self.form, 255, 255, 255, 0, 0)

    BeginScaleformMovieMethod(self.form, "CLEAR_ALL")
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(self.form, "SET_CLEAR_SPACE")
    ScaleformMovieMethodAddParamInt(200)
    EndScaleformMovieMethod()

    for n, btn in next, data do
        BeginScaleformMovieMethod(self.form, "SET_DATA_SLOT")
        ScaleformMovieMethodAddParamInt(n-1)
        self:Button(GetControlInstructionalButton(0, btn.control, true))
        self:ButtonMessage(btn.name)
        EndScaleformMovieMethod()
    end

    BeginScaleformMovieMethod(self.form, "DRAW_INSTRUCTIONAL_BUTTONS")
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(self.form, "SET_BACKGROUND_COLOUR")
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(80)
    EndScaleformMovieMethod()
end

function ClientModules.HUD.InstructionalButtons:Add(name, control)
	local item = Table.find(self.entries, function(entry)
		return entry.control == control
	end)

	if item ~= nil then return end

    table.insert(self.entries, { name = name, control = control })
    self:Scaleform("instructional_buttons", self.entries)
end

function ClientModules.HUD.InstructionalButtons:Delete(control)
	for k, v in pairs(self.entries) do
		if v.control == control then
			table.remove(self.entries, k)
			break
		end
	end

	self:Scaleform("instructional_buttons", self.entries)
end

function ClientModules.HUD.InstructionalButtons:Inititalize()
	if self.initialized == true then return end

	Citizen.CreateThread(function()
		while true do
			if self.form then
				DrawScaleformMovieFullscreen(self.form, 255, 255, 255, 255, 0)
			end

			Citizen.Wait(0)
		end
	end)

	self.initialized = false
end

Core.Player:OnLoad(function()
	ClientModules.HUD.InstructionalButtons:Inititalize()
end)

exports("AddInstructional", function (name, control)
	ClientModules.HUD.InstructionalButtons:Add(name, control)
end)

exports("DeleteInstructional", function (control)
	ClientModules.HUD.InstructionalButtons:Delete(control)
end)
