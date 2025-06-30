local function CreateFirework(type)
	Item.RegisterUsable(("firework_%d"):format(type), function(item, entity, coords)
		if coords == nil then
			coords = GetEntityCoords(PlayerPedId(), true) + GetEntityForwardVector(PlayerPedId()) * 0.25
		end

		if Math.Distance(player:position(), coords) > 2.0 then
			UI:AddNotification("basic", "~r~Trop loin.~s~", "info", 5000)
			return
		end

		ClientModules.World.Fireworks:Place("ind_prop_firework_04", coords, type)

		return true
	end, "ground")
end

for i=1, 6, 1 do
	CreateFirework(i)
end
