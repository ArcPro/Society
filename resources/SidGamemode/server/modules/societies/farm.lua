Callbacks.Register("farm:get", function(source, id)
    local player = Players.Get(source)
    local circuit = DB.FarmCircuit.Get(id)

    if player == nil or (player:job().id ~= circuit.society and player:permissions() < Config.Permissions.MOD) then
        return nil
    end

    return circuit
end)

Callbacks.Register("farm:create", function(source, society, harvestPos, harvestEmote, harvestItem, treatmentPos, treatmentEmote, treatmentItem, sellPos, sellPrice)
        local player = Players.Get(source)

        if player == nil or player:permissions() < Config.Permissions.HM then
            return
        end
        return DB.FarmCircuit.Create(society, harvestPos, harvestEmote, harvestItem, treatmentPos, treatmentEmote, treatmentItem, sellPos, sellPrice)
    end)

Callbacks.Register("farm:all", function(source, id)
    return DB.FarmCircuit.All()
end)

Events.Register("farm:update", function(source, id, key, value)
    local player = Players.Get(source)

    if player == nil or player:permissions() < Config.Permissions.HM then
        return
    end

    local circuit = DB.FarmCircuit.Get(id)

    if circuit == nil then
        return
    end

    circuit[key] = value

    DB.FarmCircuit.Update(circuit.id, circuit.society, circuit.harvest_pos, circuit.harvest_emote, circuit.harvest_item,
        circuit.treatment_pos, circuit.treatment_emote, circuit.treatment_item, circuit.sell_pos, circuit.sell_price)

    Events.TriggerClient("farm:update", -1, id, key, value)
end)

Events.Register("farm:delete", function(source, id)
    local player = Players.Get(source)

    if player == nil or player:permissions() < Config.Permissions.HM then
        return
    end

    DB.FarmCircuit.Delete(id)
end)
