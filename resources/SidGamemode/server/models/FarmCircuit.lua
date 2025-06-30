DB = DB or {}
DB.FarmCircuit = {}

DB.FarmCircuit.Get = function(id)
    local circuit = MySQL.single.await("SELECT * FROM `farm_circuits` WHERE `id` = ?", { id })

    circuit.harvest_pos = json.decode(circuit.harvest_pos)
    circuit.treatment_pos = json.decode(circuit.treatment_pos)
    circuit.sell_pos = json.decode(circuit.sell_pos)

    return circuit
end

DB.FarmCircuit.All = function()
    return MySQL.query.await("SELECT id, society FROM `farm_circuits`")
end

DB.FarmCircuit.Create = function(society, harvestPos, harvestEmote, harvestItem, treatmentPos, treatmentEmote, treatmentItem, sellPos, sellPrice)
    return MySQL.insert.await("INSERT INTO `farm_circuits` (`society`, `harvest_emote`, `harvest_item`, `harvest_pos`, `treatment_emote`, `treatment_item`, `treatment_pos`, `sell_pos`, `sell_price`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", {
        society,
        harvestEmote,
        harvestItem,
        json.encode(harvestPos or {}),
        treatmentEmote,
        treatmentItem,
        json.encode(treatmentPos or {}),
        json.encode(sellPos or {}),
        sellPrice or 0
    })
end

DB.FarmCircuit.Update = function(id, society, harvestPos, harvestEmote, harvestItem, treatmentPos, treatmentEmote, treatmentItem, sellPos, sellPrice)
    return MySQL.update.await("UPDATE `farm_circuits` SET `society` = ?, `harvest_emote` = ?, `harvest_item` = ?, `harvest_pos` = ?, `treatment_emote` = ?, `treatment_item` = ?, `treatment_pos` = ?, `sell_pos` = ?, `sell_price` = ? WHERE `id` = ?", {
        society,
        harvestEmote,
        harvestItem,
        json.encode(harvestPos or {}),
        treatmentEmote,
        treatmentItem,
        json.encode(treatmentPos or {}),
        json.encode(sellPos or {}),
        sellPrice or 0,
        id
    })
end

DB.FarmCircuit.Delete = function(id)
    return MySQL.query.await("DELETE FROM `farm_circuits` WHERE `id` = ?", { id })
end
