local lockdownMode = "inactive"

if Config.EntityLockdown then
	lockdownMode = "relaxed"
end

SetRoutingBucketEntityLockdownMode(1, lockdownMode)
SetRoutingBucketPopulationEnabled(1, true)

Events.Register("bucket:change", function(source, bucket, id)
    if bucket ~= 1 then
        SetRoutingBucketEntityLockdownMode(bucket, lockdownMode)
        SetRoutingBucketPopulationEnabled(bucket, false)
    end

    SetPlayerRoutingBucket(id or source, bucket)
    Events.TriggerClient("bucket:changed", id or source, bucket)
end)

Events.Register("bucket:change_entity", function(source, net_id, bucket)
    local id = NetworkGetEntityFromNetworkId(net_id)

	if id == nil or DoesEntityExist(id) == false then return end

	SetEntityRoutingBucket(id, bucket)
end)

Callbacks.Register("bucket:get", function(source, id)
    return GetPlayerRoutingBucket(id or source)
end)
