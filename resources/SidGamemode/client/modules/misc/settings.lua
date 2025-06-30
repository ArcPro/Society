ClientModules = ClientModules or {}
ClientModules.Misc = ClientModules.Misc or {}
ClientModules.Misc.Settings = {}

ClientModules.Misc.Settings.initialized = false

ClientModules.Misc.Settings.me_color = "green"
ClientModules.Misc.Settings.me_font = Utils.Fonts.archivo
ClientModules.Misc.Settings.compass = false
ClientModules.Misc.Settings.streetnames = false
ClientModules.Misc.Settings.radar = true
ClientModules.Misc.Settings.black_bands = false
ClientModules.Misc.Settings.disable_drug_down = false

function ClientModules.Misc.Settings:LoadValue(key)
	if self[key] == nil then return end

	local keyType = type(self[key])
	local value = nil

	if keyType == "number" then
		value = GetResourceKvpFloat(key)

		if value == 0.0 then
			value = nil
		end

	else
		value = GetResourceKvpString(key)

		if keyType == "boolean" and value ~= nil then
			value = value == "true"
		end
	end

	self[key] = value or self[key]
end

function ClientModules.Misc.Settings:Initialize()

	if self.initialized == true then return end

	self.me_font = Utils.Fonts.archivo

	for k, v in pairs(self) do
		if type(v) ~= "function" then
			self:LoadValue(k)
		end
	end

	UI:ToggleRadar(self.radar)

	self.initialized = true
end

function ClientModules.Misc.Settings:All()
	local data = {}

	for k, v in pairs(self) do
		if type(v) ~= "function" then
			data[k] = v
		end
	end

	return data
end

function ClientModules.Misc.Settings:Get(key)
	return self[key]
end

function ClientModules.Misc.Settings:Set(key, value)
	if self[key] == nil then return end

	if type(self[key]) ~= type(value) then return end

	self[key] = value

	if type(self[key]) == "number" then
		SetResourceKvpFloat(key, self[key])
	else
		SetResourceKvp(key, tostring(self[key]))
	end
end

Core.Player:OnLoad(function()

	ClientModules.Misc.Settings:Initialize()

end)
