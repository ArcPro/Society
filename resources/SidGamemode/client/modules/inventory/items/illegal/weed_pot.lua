Item.RegisterUsable("weed_pot", function(item, entity, coords)
	local potCoords = coords or GetEntityCoords(PlayerPedId(), true) + GetEntityForwardVector(PlayerPedId()) * 1.0

	if Math.Distance(player:position(), potCoords) > 2.0 then
		UI:AddNotification("basic", "~r~Trop loin.~s~", "basic", 5000)
		return false
	end

	if player:metadata().instance ~= 1 then
		UI:AddNotification("basic", "~r~Impossible dans une instance.~s~", "basic", 5000)
		return
	end

    local emptyPot = Callbacks.Trigger("weed:createEmptyPot", potCoords)

	if not emptyPot then return end

	local emptyPotLocalID = SharedModules.Entities:WaitForNetworkId(emptyPot)

	if not emptyPotLocalID then return end

	if not SharedModules.Entities:Control(emptyPotLocalID) then
		UI:AddNotification("basic", "~r~Échec lors de la création (NetworkRequestControlOfEntity)~s~", "basic", 5000)
		return false
	end

	PlaceObjectOnGroundProperly(emptyPotLocalID)

    return true
end, "ground")
