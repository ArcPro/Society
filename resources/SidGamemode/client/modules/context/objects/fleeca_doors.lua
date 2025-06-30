Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then
        return
    end

	local hasHackingPhone = player:inventory():findItem(function(item)
		return item.name == "hacking_phone"
	end) ~= nil

	local hasAccessCard = player:inventory():findItem(function(item)
		return item.name == "access_card"
	end) ~= nil

	if ClientModules.Illegal.FleecaHeist:IsValidGlassDoor(hitEntity) and hasHackingPhone then
		Context:AddItem(0, "Hacker la porte", function()
			if Math.Distance(player:position(), GetEntityCoords(hitEntity, false)) > 1.5 then
				UI:AddNotification("basic", "~r~Trop loin.~s~", "info", 5000)
				return
			end

			ClientModules.Illegal.FleecaHeist:HackGlassDoor(hitEntity)
		end, true)
	end

	if ClientModules.Illegal.FleecaHeist:IsValidSafeDoor(hitEntity) and hasAccessCard then
		Context:AddItem(0, "Hacker la porte", function()
			if Math.Distance(player:position(), GetEntityCoords(hitEntity, false)) > 1.5 then
				UI:AddNotification("basic", "~r~Trop loin.~s~", "info", 5000)
				return
			end

			ClientModules.Illegal.FleecaHeist:HackSafeDoor(hitEntity)
		end, true)
	end

end)
