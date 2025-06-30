ServerModules = ServerModules or {}
ServerModules.Societies = ServerModules.Societies or {}
---@type Society[]
ServerModules.Societies.List = {}

function ServerModules.Societies:Create(source, label, name)
	local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.HM then return end

	local id = DB.Society.Create(label, name, nil)

	self.List[id] = Society:new({
		label = label,
		name = name,
		id = id,
	})

    Events.TriggerClient("society:create", -1, id, label, name)
	Events.TriggerExternal("lb-phone:RefreshCompanies")

	SharedModules.Log:Create(source, "societies", "society_create", {
		["Label"] = label,
		["Nom"] = name,
		["ID"] = id
	})
end

function ServerModules.Societies:Update(source, id, name, label, phone_blip, bank_account_id, phone_can_message, phone_can_call, phone_custom_icon)
	local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.HM then return end

	local society = self.List[id]

	if society == nil then return end

	society:name(name)
	society:label(label)
	society:phone_blip(phone_blip)
	society:bank_account_id(bank_account_id)
	society:phone_can_message(phone_can_message)
	society:phone_can_call(phone_can_call)
	society:phone_custom_icon(phone_custom_icon)

    DB.Society.Update(id, label, name, bank_account_id, phone_blip, phone_can_message, phone_can_call, phone_custom_icon)
    Events.TriggerClient("society:update", -1, id, label, name, bank_account_id, phone_blip, phone_can_message, phone_can_call, phone_custom_icon)
	Events.TriggerExternal("lb-phone:RefreshCompanies")

	SharedModules.Log:Create(source, "societies", "society_update", {
		["ID"] = id,
		["Nom"] = name,
		["Label"] = label,
		["Compte en banque"] = bank_account_id,
		["Accepte les messages"] = phone_can_message,
		["Accepte les appels"] = phone_can_call,
		["Action custom"] = phone_custom_icon.onCustomIconClick,
	})
end

function ServerModules.Societies:Delete(source, id)
	local player = Players.Get(source)

	if player == nil or player:permissions() < Config.Permissions.HM then return end

	local society = self.List[id]

	if society == nil then return end

	self.List[id] = nil

    DB.Society.Delete(id)
    Events.TriggerClient("society:delete", -1, id)
	Events.TriggerExternal("lb-phone:RefreshCompanies")

	SharedModules.Log:Create(source, "societies", "society_delete", {
		["ID"] = society:id(),
		["Label"] = society:label()
	})
end

function ServerModules.Societies:Initialize()
	DB.Society.All()

	Callbacks.Register("society:all", function(source)
		return self.List
	end)

	Events.Register("society:create", function(source, label, name)
		self:Create(source, label, name)
	end)

	Events.Register("society:update", function(source, id, name, label, phone_blip, bank_account_id, phone_can_message, phone_can_call, phone_custom_icon)
		self:Update(source, id, name, label, phone_blip, bank_account_id, phone_can_message, phone_can_call, phone_custom_icon)
	end)

	Events.Register("society:delete", function(source, id)
		self:Delete(source, id)
	end)
end

ServerModules.Societies:Initialize()
