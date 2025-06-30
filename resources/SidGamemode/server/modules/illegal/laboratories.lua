local runningLaboratories = {}
local laboratoryTimes = {
	[1] = 60,
	[2] = 60 * 60,
}

Callbacks.Register("laboratory:create", function(source, bucket, raw_mat_1, raw_mat_2, unpooched_item, pooched_item, residue_item, reduce_pos, produce_pos, collect_pos, pooch_pos)
	local sourcePlayer = Players.Get(source)

	if not sourcePlayer or sourcePlayer:permissions() < Config.Permissions.HM then return end

	local id = DB.Laboratory.Create(bucket, raw_mat_1, raw_mat_2, unpooched_item, pooched_item, residue_item, reduce_pos, produce_pos, collect_pos, pooch_pos)

	Events.TriggerClient("laboratory:create", -1, {
		id = id,
		bucket = bucket,
		raw_mat_1 = raw_mat_1,
		raw_mat_2 = raw_mat_2,
		unpooched_item = unpooched_item,
		pooched_item = pooched_item,
		residue_item =  residue_item,
		reduce_pos = reduce_pos,
		produce_pos = produce_pos,
		collect_pos = collect_pos,
		pooch_pos = pooch_pos,
	})

	return id
end)

Callbacks.Register("laboratory:all", function(source)
	local player = Players.Get(source)

	if not player or player:permissions() < Config.Permissions.HM then return end

	return DB.Laboratory.All()
end)

Callbacks.Register("laboratory:get", function(source, id)
	return DB.Laboratory.Get(id)
end)

Callbacks.Register("laboratory:allInBucket", function(source, id)
	return DB.Laboratory.AllInBucket(id)
end)

Events.Register("laboratory:update", function(source, id, key, value)
	local sourcePlayer = Players.Get(source)

	if not sourcePlayer or sourcePlayer:permissions() < Config.Permissions.HM then return end

	local laboratory = DB.Laboratory.Get(id)

	if laboratory == nil then return end

	laboratory[key] = value

	DB.Laboratory.Update(laboratory.id, laboratory.bucket,
		laboratory.raw_mat_1, laboratory.raw_mat_2,
		laboratory.unpooched_item, laboratory.pooched_item,  laboratory.residue_item,
		laboratory.reduce_pos, laboratory.produce_pos, laboratory.collect_pos, laboratory.pooch_pos
	)

	Events.TriggerClient("laboratory:reload", -1, laboratory.id)
end)

Events.Register("laboratory:delete", function(source, id)
	local sourcePlayer = Players.Get(source)

	if not sourcePlayer or sourcePlayer:permissions() < Config.Permissions.HM then return end

	local laboratory = DB.Laboratory.Get(id)

	if laboratory == nil then return end

	DB.Laboratory.Delete(id)

	for k, player in pairs(Players._list) do
        if player:metadata().instance == laboratory.bucket then
            Events.TriggerClient("laboratory:delete", player:source(), laboratory.id)
        end
    end
end)

Events.Register("laboratory:setState", function(source, id, state)
	runningLaboratories[id] = {
		date = Date.timestamp(),
		state = state,
	}

	SharedModules.Log:Create(source, "illegal", "laboratory", {
		["ID"] = id,
		["État"] = state
	})
end)

Events.Register("laboratory:clearState", function(source, id)
	runningLaboratories[id] = nil
end)

Callbacks.Register("laboratory:getState", function(source, id)
	return runningLaboratories[id]
end)

Callbacks.Register("laboratory:canUpdate", function(source, id)
	return {
		can_update = Date.timestamp() - runningLaboratories[id].date > laboratoryTimes[runningLaboratories[id].state],
		remaining_time = laboratoryTimes[runningLaboratories[id].state] - (Date.timestamp() - runningLaboratories[id].date)
	}
end)
