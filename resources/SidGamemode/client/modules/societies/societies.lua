ClientModules = ClientModules or {}
ClientModules.Societies = ClientModules.Societies or {}
ClientModules.Societies.Initialized = false

---@type Society[]
ClientModules.Societies.List = {}

function ClientModules.Societies:Get(id)
	return self.List[id]
end

function ClientModules.Societies:Find(name)
	for _, society in pairs(self.List) do
        if society:name() == name then
            return society
        end
    end

    return nil
end

function ClientModules.Societies:All()
	return self.List
end

function ClientModules.Societies:Create(data)
	return Society:new(data)
end

function ClientModules.Societies:Update(id, label, name, bank_account_id, phone_blip, phone_can_message, phone_can_call, phone_custom_icon)
	local society = self:Get(id)

	if society == nil then return end

	society:name(name)
	society:label(label)
	society:bank_account_id(bank_account_id)
	society:phone_blip(phone_blip)
	society:phone_can_message(phone_can_message)
	society:phone_can_call(phone_can_call)
	society:phone_custom_icon(phone_custom_icon)
end

function ClientModules.Societies:Delete(id)
	self.List[id] = nil
end

function ClientModules.Societies:RegisterEvents()
	Events.Register("society:create", function(source, id, label, name)
		self:Create({ id = id, label = label, name = name })
	end)

	Events.Register("society:update", function(source, id, label, name, bank_account_id, phone_blip, phone_can_message, phone_can_call, phone_custom_icon)
		self:Update(id, label, name, bank_account_id, phone_blip, phone_can_message, phone_can_call, phone_custom_icon)
	end)

	Events.Register("society:delete", function(source, id)
		self:Delete(id)
	end)

	Events.Register("society:duties:toggle", function(source, id, employee, duty)
		local society = self:Get(id)

		if society == nil then return end

		if duty then
			society:add_duty(employee)
		else
			society:delete_duty(employee)
		end
	end)
end

function ClientModules.Societies:Load()
	local raw_data = Callbacks.Trigger("society:all") or {}

	for _, data in pairs(raw_data) do
		Society:new(Functions.RemoveUnderscores(data))
	end
end

function ClientModules.Societies:SyncLBPhone()
    local locations = {}
    local services = {}

	for _, society in pairs(self.List) do
		table.insert(locations, {
			icon = ("https://cdnrv.sysscripts.com/societies/%s.webp"):format(society:name()),
			position = vector2(society:phone_blip().x or 0.0, society:phone_blip().y or 0.0),
			name = society:label(),
			description = "",
		})

		local boss_grades = {}

		for _, grade in pairs(society:grades() or {}) do
			if grade.can_manage then
				table.insert(boss_grades, grade.label)
			end
		end

		table.insert(services, {
			onCustomIconClick = (society:phone_custom_icon() or {}).onCustomIconClick or nil,
			icon = ("http://cdnrv.sysscripts.com/societies/%s.webp"):format(society:name()),
			customIcon = (society:phone_custom_icon() or {}).customIcon or nil,
			canMessage = society:phone_can_message(),
			canCall = society:phone_can_call(),
			open = #society:duties() > 0,
			bossRanks = boss_grades,
			name = society:label(),
			job = society:name(),
			location = {
				name = GetStreetNameFromHashKey(GetStreetNameAtCoord(society:phone_blip().x, society:phone_blip().y, 0.0)),
				coords = society:phone_blip(),
			},
		})
	end

	-- exports["lb-phone"]:RefreshData(locations, services)
end

function ClientModules.Societies:Initialize()
	if self.Initialized == true then return end

	self:RegisterEvents()
	self:Load()

	self:SyncLBPhone()

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Societies:Initialize()
end)

RegisterCommand("testsalaire", function()
    TriggerServerEvent("pay:salary")
end, false)

