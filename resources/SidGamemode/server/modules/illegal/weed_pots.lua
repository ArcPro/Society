ServerModules = ServerModules or {}
ServerModules.Illegal = ServerModules.Illegal or {}
ServerModules.Illegal.WeedPots = {}
ServerModules.Illegal.WeedPots.GrowTime = 60 * 60 * 1000
ServerModules.Illegal.WeedPots.Models = {
	GetHashKey("bkr_prop_weed_plantpot_stack_01b"),	-- Empty
	GetHashKey("bkr_prop_weed_01_small_01b"),		-- Small plant
	GetHashKey("bkr_prop_weed_med_01b"),			-- Medium plant
	GetHashKey("bkr_prop_weed_lrg_01b"),			-- Final step
}

function ServerModules.Illegal.WeedPots:Create(coords)
	local entity = SharedModules.Entities:Create(self.Models[1], coords, 1)

	if not entity then
		return nil
	end

	SharedModules.Entities:SetStatebag(entity, "advancementState", 0)

	return entity
end

function ServerModules.Illegal.WeedPots:StartGrowing(netId)
	local coords = GetEntityCoords(NetworkGetEntityFromNetworkId(netId), false)

	SharedModules.Entities:Delete(netId)

	local newPot = SharedModules.Entities:Create(self.Models[2], coords, 1)

	if not newPot then return end

	SharedModules.Entities:SetStatebag(newPot, "advancementState", 2)
	SharedModules.Entities:SetStatebag(newPot, "growEndDate", math.floor(Date.timestamp() + self.GrowTime / 1000))

	SharedModules.Log:Create(source, "illegal", "weed", {
		["Coordonnées"] = coords,
		["Action"] = "Plante"
	})

	Citizen.SetTimeout(self.GrowTime / 2, function()
		SharedModules.Entities:Delete(newPot)

		newPot = SharedModules.Entities:Create(self.Models[3], coords, 1)

		if not newPot then return end

		SharedModules.Entities:SetStatebag(newPot, "advancementState", 3)
		SharedModules.Entities:SetStatebag(newPot, "growEndDate", math.floor(Date.timestamp() + self.GrowTime / 2 / 1000))
	end)

	Citizen.SetTimeout(self.GrowTime, function()
		SharedModules.Entities:Delete(newPot)

		newPot = SharedModules.Entities:Create(self.Models[4], coords, 1)

		if not newPot then return end

		SharedModules.Entities:SetStatebag(newPot, "advancementState", 4)
	end)
end

function ServerModules.Illegal.WeedPots:Harvest(source, netId)
	local entity = NetworkGetEntityFromNetworkId(netId)
	local player = Players.Get(source)
	local inventory = nil

	if player == nil then return end

	inventory = Inventories.Get(player:inventory_id())

	if inventory == nil then return end

	Citizen.Wait(math.random(0, 250))

	if DoesEntityExist(entity) == false then
		Events.TriggerClient("player:notify", source, "basic", "~r~Bien essayé mais non :).~s~", "info", 5000)
		return
	end

	SharedModules.Log:Create(source, "illegal", "weed", {
		["Coordonnées"] = GetEntityCoords(entity, false),
		["Action"] = "Récolte"
	})

	if math.random(1, 5) == 4 then
		inventory:addItem(Item.Create("weed_seeds", {}, 1))
	end

	if inventory:addItem(Item.Create("fresh_weed", {}, 30)) then
		local coords = GetEntityCoords(NetworkGetEntityFromNetworkId(netId), false)

		SharedModules.Entities:Delete(netId)

		local newPot = SharedModules.Entities:Create(self.Models[1], coords, 1)

		if not newPot then return end

		SharedModules.Entities:SetStatebag(newPot, "advancementState", 0)
	end
end

function ServerModules.Illegal.WeedPots:RegisterEvents()
	Callbacks.Register("weed:createEmptyPot", function(source, coords)
		return self:Create(coords)
	end)

	Events.Register("weed:startGrowing", function(source, netId)
		self:StartGrowing(netId)
	end)

	Events.Register("weed:harvest", function(source, netId)
		self:Harvest(source, netId)
	end)
end

function ServerModules.Illegal.WeedPots:Initialize()
	self:RegisterEvents()
end

ServerModules.Illegal.WeedPots:Initialize()
