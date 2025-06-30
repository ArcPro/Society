local loadedCiruits = {}

local function createCircuit(circuit)

    local id = ("farm_%d_%d"):format(circuit.id, circuit.society)
    loadedCiruits[circuit.id] = {}
		local harvest_pos = vector3(0, 0, 0)
		if circuit.harvest_pos.x ~= nil and circuit.harvest_pos.y ~= nil and circuit.harvest_pos.z ~= nil then
			harvest_pos = circuit.harvest_pos
		end
    loadedCiruits[circuit.id].harvest = Marker:new({
        name = ("%s:harvest"):format(id),
        action = "farm",
        editable = false,
        coords = vector3(harvest_pos.x, harvest_pos.y, (harvest_pos.z or 0) - 0.95),
		data = circuit,
        onInteract = function (data)

			if Item.Get(data.harvest_item) == nil then
				return UI:AddNotification(
					"basic",
					("~r~Item invalide (%s)~s~"):format(data.harvest_item),
					"info",
					5000
				)
			end

            ClientModules.Misc.Animations:Play(data.harvest_emote)

			UI:Progress(2)
            Utils.RealWait(2000)
            ClientModules.Misc.Animations:Stop()

            player:inventory():addItem(Item.Create(data.harvest_item, {}, 3))
            UI:AddNotification(
                "basic",
                ("Vous avez récolté 3 %s"):format(Item.Get(data.harvest_item).label),
                "info",
                2000
            )
        end,
        onLeave = function()end,
    })

	if circuit.treatment_pos.x ~= nil then
		loadedCiruits[circuit.id].treatment = Marker:new({
			name = ("%s:treatment"):format(id),
			action = "farm",
			editable = false,
			coords = vector3(circuit.treatment_pos.x, circuit.treatment_pos.y, circuit.treatment_pos.z - 0.95),
			data = circuit,
			onInteract = function (data)
				local item = player:inventory():findItem(function(item)
					return item.name == data.harvest_item and item.quantity >= 5
				end)

				if Item.Get(data.treatment_item) == nil then
					return UI:AddNotification(
						"basic",
						("~r~Item invalide (%s)~s~"):format(data.harvest_item),
						"info",
						5000
					)
				end

				if item == nil then
					UI:AddNotification(
						"basic",
						("~r~Vous n'avez pas les items nécéssaires (5x %s)"):format(Item.Get(data.harvest_item).label),
						"info",
						5000
					)
					return
				end

				ClientModules.Misc.Animations:Play(data.treatment_emote)
				UI:Progress(5)
				Utils.RealWait(5000)

				item.quantity = 5
				player:inventory():removeItem(item)
				player:inventory():addItem(Item.Create(data.treatment_item, {}, 1))
				UI:AddNotification(
					"basic",
					("Vous avez transformé 5 %s en 1 %s"):format(Item.Get(data.harvest_item).label, Item.Get(data.treatment_item).label),
					"info",
					5000
				)

				ClientModules.Misc.Animations:Stop()
			end,
			onLeave = function()end,
		})
	end

	if circuit.sell_pos.x ~= nil then
		loadedCiruits[circuit.id].sell = Marker:new({
			name = ("%s:sell"):format(id),
			action = "farm",
			editable = false,
			coords = vector3(circuit.sell_pos.x, circuit.sell_pos.y, circuit.sell_pos.z - 0.95),
			data = circuit,
			onInteract = function (data)
				local society = ClientModules.Societies:Get(player:job().id)
				local playerBankAccount = Bank.GetAccount(player:bank_account_id())
				local societyBankAccount = Bank.GetAccount(society:bank_account_id() or -1)
				local item = player:inventory():findItem(function(item)
					return item.name == data.treatment_item and item.quantity >= 1
				end)

				if item == nil then
					UI:AddNotification("basic", "~r~Vous n'avez pas les items nécéssaires", "info", 5000)
					return
				end

				if societyBankAccount == nil then
					UI:AddNotification("basic", "~r~L'entreprise n'a pas de compte en banque", "info", 5000)
					return
				end

				if playerBankAccount == nil then
					UI:AddNotification("basic", "~r~Vous n'avez pas de compte en banque", "info", 5000)
					return
				end

				ClientModules.Misc.Animations:Play("give")
				UI:Progress(2)
				Utils.RealWait(2000)

				local employeePart = math.floor(data.sell_price * 0.60)

				item.quantity = 1
				player:inventory():removeItem(item)

				societyBankAccount:deposit(data.sell_price, false)
				societyBankAccount:send(employeePart, playerBankAccount:id())

				ClientModules.Misc.Animations:Stop()
				UI:AddNotification(
					"basic",
					("Vous avez vendu 1 %s ~b~$%s~s~, votre entreprise a gagné ~b~$%s~s~"):format(
						Item.Get(data.treatment_item).label,
						employeePart,
						data.sell_price * 0.40
					),
					"info",
					5000
				)
			end,
			onLeave = function()end,
		})
	end
end

Events.Register("farm:load", function(source, toggle)

	if not toggle then
		for _, circuit in pairs(loadedCiruits) do
			if circuit.harvest then
				circuit.harvest:delete()
			end

			if circuit.treatment then
				circuit.treatment:delete()
			end

			if circuit.sell then
				circuit.sell:delete()
			end
		end

		return
	end

    local circuits = Callbacks.Trigger("farm:all")

    for _, circuit in pairs(circuits or {}) do
        if circuit.society == player:job().id then
            createCircuit(Callbacks.Trigger("farm:get", circuit.id))
        end
    end
end)

Events.Register("farm:update", function(source, id, key, value)

	if loadedCiruits[id] == nil then return end

	local data = Functions.DeepCopy(loadedCiruits[id].harvest:data())

	data[key] = value

	loadedCiruits[id].harvest:data(data)
	loadedCiruits[id].treatment:data(data)
	loadedCiruits[id].sell:data(data)
end)
