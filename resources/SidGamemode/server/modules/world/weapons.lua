local sockets = {}

Events.Register("weapons:shot", function(source, weaponId, weaponHash, weaponName)
	local weaponAmmo = nil

	for k, supposedWeapon in pairs(Item._list) do
		if supposedWeapon.action.type == "weapon" and GetHashKey(supposedWeapon.action.model) == weaponHash then
			weaponAmmo = supposedWeapon.action.ammo
		end
	end

	table.insert(sockets, {
		type = weaponAmmo,
		coords = GetEntityCoords(GetPlayerPed(source), true),
		weaponId = weaponId
	})

	SharedModules.Log:Create(source, "weapons", "shoot", {
		["Arme"] = weaponName,
		["ID Arme"] = weaponId,
		["Position"] = GetEntityCoords(GetPlayerPed(source), true)
	})
end)

Callbacks.Register("weapons:getSocketInRange", function(source, coords)
	local socketInRange = nil;

	for k, socket in pairs(sockets) do
		if Math.Distance(coords, socket.coords) < 2.5 then
			socketInRange = socket
			table.remove(sockets, k)

			break
		end
	end

	return socketInRange
end)
