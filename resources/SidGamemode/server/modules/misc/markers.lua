Events.Register("marker:create", function(source, name, type, coords, data)
    if type == "" then
        type = nil
    end

	local bucket = GetPlayerRoutingBucket(source)

    DB.Marker.Create(name, type, coords, data, bucket)
    Events.TriggerClient("marker:create", -1, name, type, coords, data, bucket)
end)

Events.Register("marker:update", function(source, name, type, coords, data, bucket)
    DB.Marker.Update(name, type, coords, data, bucket)
    Events.TriggerClient("marker:update", -1, name, type, coords, data, bucket)
end)

Events.Register("marker:delete", function(source, name)
    DB.Marker.Delete(name)
    Events.TriggerClient("marker:delete", -1, name)
end)

local function chunkTable(tbl, chunkSize)
    local chunks = {}
    for i = 1, #tbl, chunkSize do
        local chunk = {}
        for j = i, math.min(i + chunkSize - 1, #tbl) do
            table.insert(chunk, tbl[j])
        end
        table.insert(chunks, chunk)
    end
    return chunks
end

Events.Register("marker:load", function(source)
    local markers = DB.Marker.All()
    local chunkSize = 3
    local chunks = chunkTable(markers, chunkSize)
    for _, dataToSend in ipairs(chunks) do
        Events.TriggerClient("marker:load", source, dataToSend)
    end
end)