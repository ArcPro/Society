ServerModules = ServerModules or {}
ServerModules.Misc = ServerModules.Misc or {}
ServerModules.Misc.Pickups = {}
ServerModules.Misc.Pickups.DeleteTime = 5 * 60 * 1000

function ServerModules.Misc.Pickups:Create(item, position, bucket, never_delete)
	local netObject = SharedModules.Entities:Create(Config.Pickups.Model, position, bucket)

	if netObject == nil then
		return
	end

    SharedModules.Entities:SetStatebag(netObject, "pickupItem", item.name)
    SharedModules.Entities:SetStatebag(netObject, "pickupQuantity", item.quantity)
    SharedModules.Entities:SetStatebag(netObject, "pickupMetadata", item.metadata)

	if never_delete == true then return end

	Citizen.SetTimeout(self.DeleteTime, function()
		SharedModules.Entities:Delete(netObject)
	end)
end

function ServerModules.Misc.Pickups:Take(source, netId)
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

	local max_quantity = math.floor(inventory:free_weight() / Item.Get(Entity(entity).state.pickupItem).weight)
	local quantity = (Entity(entity).state.pickupQuantity or 1)

	if max_quantity >= quantity then
		max_quantity = quantity
	end

	if inventory:addItem(Item.Create(Entity(entity).state.pickupItem, Entity(entity).state.pickupMetadata or {}, max_quantity)) then
		Events.TriggerClient("animations:play", source, "pickup")

		if max_quantity < quantity then
			Events.Trigger("onesync:updateEntity", netId, "pickupQuantity", quantity - max_quantity)
		else
			exports["AdvancedParking"]:DeleteVehicle(entity, false)
			SharedModules.Entities:Delete(netId)
		end
	else
		Events.TriggerClient("player:notify", source, "basic", "~r~Une erreur s'est produite.~s~", "info", 5000)
	end
end

function ServerModules.Misc.Pickups:RegisterEvents()
	Events.Register("pickup:create", function(source, item, position, never_delete)
		self:Create(item, position, GetPlayerRoutingBucket(source), never_delete)
	end)

	Events.Register("pickup:take", function(source, netId)
		self:Take(source, netId)
	end)
end

function ServerModules.Misc.Pickups:Initialize()
	self:RegisterEvents()
end

ServerModules.Misc.Pickups:Initialize()
