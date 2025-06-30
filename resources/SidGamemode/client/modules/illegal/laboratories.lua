ClientModules = ClientModules or {}
ClientModules.Illegal = ClientModules.Illegal or {}
ClientModules.Illegal.Laboratories = {}

ClientModules.Illegal.Laboratories.initialized = false

---@type Laboratory[]
ClientModules.Illegal.Laboratories.loaded = {}

---@param laboratory Laboratory
function ClientModules.Illegal.Laboratories:Reduce(laboratory)
	local state = Callbacks.Trigger("laboratory:getState", laboratory.id)

	if state ~= nil then
		UI:AddNotification("basic", "~r~Une tournée est déjà en cours.~s~", "info", 5000)
		return
	end

	local item1 = player:inventory():findItem(function(item)
		return item.name == laboratory.raw_mat_1 and item.quantity >= 20
	end)

	local item2 = player:inventory():findItem(function(item)
		return item.name == laboratory.raw_mat_2 and item.quantity >= 20
	end)

	if item1 == nil then
		UI:AddNotification("basic", ("~r~Vous n'avez pas 20x %s.~s~"):format(Item.Get(laboratory.raw_mat_1).label), "info", 5000)
		return
	end

	if item2 == nil then
		UI:AddNotification("basic", ("~r~Vous n'avez pas 20x %s.~s~"):format(Item.Get(laboratory.raw_mat_2).label), "info", 5000)
		return
	end

	item1.quantity = 20
	item2.quantity = 20

	player:inventory():removeItem(item1)
	player:inventory():removeItem(item2)

	ClientModules.Misc.Animations:Play("mechanic")
	FreezeEntityPosition(PlayerPedId(), true)

	UI:Progress(5)
	UI:AddNotification("basic", "Vous lancez la réduction... (60 secondes)", "info", 5000)
	Utils.RealWait(5000)

	ClientModules.Misc.Animations:Stop()
	FreezeEntityPosition(PlayerPedId(), false)

	Events.TriggerServer("laboratory:setState", laboratory.id, 1)
end

---@param laboratory Laboratory
function ClientModules.Illegal.Laboratories:Produce(laboratory)
	local state = Callbacks.Trigger("laboratory:getState", laboratory.id)

	if state == nil then
		UI:AddNotification("basic", "~r~La réduction n'a pas encore été faite.~s~", "info", 5000)
		return
	end

	if state.state ~= 1 then
		UI:AddNotification("basic", "~r~Une tournée est déjà en cours.~s~", "info", 5000)
		return
	end

	local update = Callbacks.Trigger("laboratory:canUpdate", laboratory.id) or {}

	if update.can_update == false then
		UI:AddNotification("basic", ("~r~La réduction est encore en cours (%d secondes)~s~"):format(update.remaining_time), "info", 5000)
		return
	end

	ClientModules.Misc.Animations:Play("tablet")
	FreezeEntityPosition(PlayerPedId(), true)

	UI:Progress(5)
	UI:AddNotification("basic", "Vous lancez la production... (60 minutes)", "info", 5000)
	Utils.RealWait(5000)

	ClientModules.Misc.Animations:Stop()
	FreezeEntityPosition(PlayerPedId(), false)

	Events.TriggerServer("laboratory:setState", laboratory.id, 2)
end

---@param laboratory Laboratory
function ClientModules.Illegal.Laboratories:Collect(laboratory)
	local state = Callbacks.Trigger("laboratory:getState", laboratory.id)

	if state == nil then
		UI:AddNotification("basic", "~r~La réduction n'a pas encore été faite.~s~", "info", 5000)
		return
	end

	if state.state ~= 2 then
		UI:AddNotification("basic", "~r~La production n'a pas encore été lancée.~s~", "info", 5000)
		return
	end

	local update = Callbacks.Trigger("laboratory:canUpdate", laboratory.id) or {}

	if update.can_update == false then
		local minutes, seconds = math.floor(update.remaining_time / 60), update.remaining_time % 60

		UI:AddNotification("basic", ("~r~La production est encore en cours (%d minutes %d secondes)~s~"):format(minutes, seconds), "info", 5000)
		return
	end

	ClientModules.Misc.Animations:Play("mechanic")
	FreezeEntityPosition(PlayerPedId(), true)

	UI:Progress(5)
	UI:AddNotification("basic", "Vous collectez la production.", "info", 5000)
	Utils.RealWait(5000)

	ClientModules.Misc.Animations:Stop()
	FreezeEntityPosition(PlayerPedId(), false)

	local unpooched_item = Item.Create(laboratory.unpooched_item, {}, 20)
	local residue_item = nil
	local weight = 0

	if laboratory.residue_item then
		residue_item = Item.Create(laboratory.residue_item, {}, math.random(5, 15))

		if residue_item ~= nil then
			weight += residue_item.weight * residue_item.quantity
		end
	end

	if unpooched_item == nil then
		UI:AddNotification("basic", "~r~Item invalide.~s~", "info", 5000)
		return
	end

	weight += unpooched_item.weight * unpooched_item.quantity

	if player:inventory():free_weight() <  weight then
		UI:AddNotification("basic", "~r~Pas assez de place.~s~", "info", 5000)
		return
	end

	player:inventory():addItem(unpooched_item)

	if residue_item then
		player:inventory():addItem(residue_item)
	end

	Events.TriggerServer("laboratory:clearState", laboratory.id)
end

---@param laboratory Laboratory
function ClientModules.Illegal.Laboratories:Pooch(laboratory)
	local item = player:inventory():findItem(function (item)
		return item.name == laboratory.unpooched_item and item.quantity >= 1
	end)

	local pooch = player:inventory():findItem(function(i)
		return i.name == "pooch" and i.quantity >= 5
	end)

	local pooched_item = Item.Create(laboratory.pooched_item, {}, 5)

	if item == nil then
		return UI:AddNotification("basic", ("~r~Vous n'avez pas 1x %s.~s~"):format(Item.Get(laboratory.unpooched_item).label), "info", 5000)
	end

	if pooch == nil then
		return UI:AddNotification("basic", "~r~Vous n'avez pas 5 pochons.~s~", "info", 5000)
	end

	if pooched_item == nil then
		return UI:AddNotification("basic", "~r~Cet item ne semble pas exister.~s~", "info", 5000)
	end

	if player:inventory():free_weight() < pooched_item.weight * pooched_item.quantity then
		UI:AddNotification("basic", "~r~Pas assez de place.~s~", "info", 5000)
		return
	end

	item.quantity = 1
	player:inventory():removeItem(item)

	pooch.quantity = 5
	player:inventory():removeItem(pooch)

	ClientModules.Misc.Animations:Play("mechanic")
	FreezeEntityPosition(PlayerPedId(), true)

	UI:Progress(5)
	UI:AddNotification("basic", "Vous mettez la drogue en pochon.", "info", 5000)
	Utils.RealWait(5000)

	ClientModules.Misc.Animations:Stop()
	FreezeEntityPosition(PlayerPedId(), false)

	player:inventory():addItem(pooched_item)
end

---@private
---@param laboratory Laboratory
---@param step_name string
---@param action fun(self: self, data: Laboratory)
function ClientModules.Illegal.Laboratories:CreateMarker(laboratory, step_name, action)
	if type(laboratory[step_name]) == "string" then
		laboratory[step_name] = json.decode(laboratory[step_name])
	end

	Marker:new({
		coords = vector3(laboratory[step_name].x, laboratory[step_name].y, laboratory[step_name].z - 0.95),
		name = ("labo_%d_%s"):format(laboratory.id, step_name),
		bucket = laboratory.bucket,
		action = "laboratory",
		data = laboratory,
		editable = false,

        onInteract = function (data)
			action(self, data)
        end,

        onLeave = function()end,
	})
end

---@private
---@param bucket integer
---@return Laboratory[]
function ClientModules.Illegal.Laboratories:AllInBucket(bucket)
	return Callbacks.Trigger("laboratory:allInBucket", bucket) or {}
end

---@private
---@param id integer
---@return Laboratory
function ClientModules.Illegal.Laboratories:Get(id)
	return Callbacks.Trigger("laboratory:get", id) or {}
end

---@param laboratory Laboratory
function ClientModules.Illegal.Laboratories:Create(laboratory)
	if laboratory.bucket ~= player:metadata().instance then return end

	self:CreateMarker(laboratory, "reduce_pos", self.Reduce)
	self:CreateMarker(laboratory, "produce_pos", self.Produce)
	self:CreateMarker(laboratory, "collect_pos", self.Collect)
	self:CreateMarker(laboratory, "pooch_pos", self.Pooch)
end

---@param id integer
function ClientModules.Illegal.Laboratories:Delete(id)
	local markers = {
		Markers.Get(("labo_%d_reduce_pos"):format(id)),
		Markers.Get(("labo_%d_produce_pos"):format(id)),
		Markers.Get(("labo_%d_collect_pos"):format(id)),
		Markers.Get(("labo_%d_pooch_pos"):format(id)),
	}

	for _, marker in pairs(markers) do
		marker:delete()
	end
end

function ClientModules.Illegal.Laboratories:WatchForBucketChange()
	Events.Register("bucket:changed", function (_, bucket)
		for _, labo in pairs(self.loaded) do
			self:Delete(labo.id)
		end

		self.loaded = self:AllInBucket(bucket)

		for _, laboratory in pairs(self.loaded) do
			self:Create(laboratory)
		end
	end)
end

function ClientModules.Illegal.Laboratories:RegisterEvents()
	Events.Register("laboratory:reload", function(_, id)
		local laboratory = self:Get(id)

		if laboratory == nil then return end

		ClientModules.Illegal.Laboratories:Delete(id)
		Citizen.Wait(500)
		ClientModules.Illegal.Laboratories:Create(laboratory)
	end)

	Events.Register("laboratory:delete", function(source, id)
		ClientModules.Illegal.Laboratories:Delete(id)
	end)

	Events.Register("laboratory:create", function(source, laboratory)
		ClientModules.Illegal.Laboratories:Create(laboratory)
	end)
end

function ClientModules.Illegal.Laboratories:Initialize()
	if self.initialized == true then return end

	self.loaded = self:AllInBucket(1)

	self:WatchForBucketChange()
	self:RegisterEvents()

	for k, laboratory in pairs(self.loaded) do
		self:Create(laboratory)
	end

	self.initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Illegal.Laboratories:Initialize()
end)
