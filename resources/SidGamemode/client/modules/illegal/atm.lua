ClientModules = ClientModules or {}
ClientModules.Illegal = ClientModules.Illegal or {}
ClientModules.Illegal.ATMs = {}

function ClientModules.Illegal.ATMs:StartRobbing(entity)
	local id = ("%.3f_%.3f_%.3f"):format(table.unpack(GetEntityCoords(entity, false)))

	if player:metadata().instance ~= 1 then
		UI:AddNotification("basic", "~r~Vous ne pouvez pas braquer un ATM dans une instance.~s~", "info", 5000)
		return
	end

	if Callbacks.Trigger("atm:tryToRob", id) == false then
		UI:AddNotification("basic", "~r~Cet ATM semble hors service.~s~", "info", 5000)
		return
	end

	if ClientModules.Illegal:CheckForPolice("atm_cops") == false then return end

	ClientModules.Illegal:AlertPolice("Braquage d'ATM")
	ClientModules.Misc.Animations:Play("tablet2")

	ClientModules.Illegal.QuicktimeEvents:Datacrack(5, function(success)
		if success then
			ClientModules.Illegal.QuicktimeEvents:Datacrack(5, function(success)
				if success then
					UI:AddNotification("basic", "~b~Vous avez réussi !~s~", "info", 5000)
					player:inventory():addItem(Item.Create("money", {}, math.random(
						SharedModules.Variables:Get("global", "atm_min"),
						SharedModules.Variables:Get("global", "atm_max")
					)))
				else
					UI:AddNotification("basic", "~r~Vous avez échoué...~s~", "info", 5000)
				end

				ClientModules.Misc.Animations:Stop()
			end)
		else
			UI:AddNotification("basic", "~r~Vous avez échoué...~s~", "info", 5000)
		end
	end)
end
