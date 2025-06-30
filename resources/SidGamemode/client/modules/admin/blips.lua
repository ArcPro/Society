ClientModules = ClientModules or {}
ClientModules.Admin = ClientModules.Admin or {}
ClientModules.Admin.Blips = {}
ClientModules.Admin.Blips.Initialized = false

---@type Blip[]
ClientModules.Admin.Blips.List = {}

function ClientModules.Admin.Blips:Create(source, position, name)
	if self.List[source] ~= nil or source == player:source() then return end

	self.List[source] = Blip:new({
		coords = vector3(position.x, position.y, position.z),
		id = 50000 + source,
		shortRange = true,
		editable = false,
		category = 1,
		title = name,
		size = 1,
		sprite = 1,
		color = 0,
	})

	self.List[source]:show()

end

function ClientModules.Admin.Blips:Update(source, position)
	if self.List[source] == nil then return end

	self.List[source]:coords(vector3(position.x, position.y, position.z))
end

function ClientModules.Admin.Blips:Delete(source)
	if self.List[source] == nil then return end

	self.List[source]:delete()
	self.List[source] = nil
end

function ClientModules.Admin.Blips:Clear()
	for source, _ in pairs(self.List) do
		self:Delete(source)
	end
end

function ClientModules.Admin.Blips:RegisterEvents()
	Events.Register("admin:blips", function(_, list)
		for _, data in pairs(list) do
			if self.List[data.source] == nil then
				self:Create(data.source, data.position, data.name)
			else
				self:Update(data.source, data.position)
			end
		end
	end)
end

function ClientModules.Admin.Blips:Initialize()
	if self.Initialized == true then return end

	AddStateBagChangeHandler("blips", ("player:%d"):format(GetPlayerServerId(PlayerId())), function(bag, key, value, reserved, replicated)
		if value == false then
			self:Clear()
		end
	end)

	self:RegisterEvents()

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Admin.Blips:Initialize()
end)