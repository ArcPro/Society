DB = DB or {}
DB.Laboratory = {}

DB.Laboratory.Get = function(id)
    return MySQL.single.await("SELECT * FROM `laboratories` WHERE `id` = ?", { id })
end

DB.Laboratory.All = function()
    return MySQL.query.await("SELECT * FROM `laboratories`")
end

DB.Laboratory.AllInBucket = function(bucket)
    return MySQL.query.await("SELECT * FROM `laboratories` WHERE `bucket` = ?", { bucket })
end

DB.Laboratory.Create = function(bucket, raw_mat_1, raw_mat_2, unpooched_item, pooched_item, residue_item, reduce_pos, produce_pos, collect_pos, pooch_pos)
	if type(reduce_pos) ~= "string" then
		reduce_pos = json.encode(reduce_pos)
	end

	if type(produce_pos) ~= "string" then
		produce_pos = json.encode(produce_pos)
	end

	if type(collect_pos) ~= "string" then
		collect_pos = json.encode(collect_pos)
	end

	if type(pooch_pos) ~= "string" then
		pooch_pos = json.encode(pooch_pos)
	end

	return MySQL.insert.await("INSERT INTO `laboratories` (`bucket`, `raw_mat_1`, `raw_mat_2`, `unpooched_item`, `pooched_item`, `residue_item`, `reduce_pos`, `produce_pos`, `collect_pos`, `pooch_pos`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", {
        bucket,
        raw_mat_1,
        raw_mat_2,
		unpooched_item,
		pooched_item,
		residue_item,
		reduce_pos,
		produce_pos,
		collect_pos,
		pooch_pos,
    })
end

DB.Laboratory.Update = function(id, bucket, raw_mat_1, raw_mat_2, unpooched_item, pooched_item, residue_item, reduce_pos, produce_pos, collect_pos, pooch_pos)
	if type(reduce_pos) ~= "string" then
		reduce_pos = json.encode(reduce_pos)
	end

	if type(produce_pos) ~= "string" then
		produce_pos = json.encode(produce_pos)
	end

	if type(collect_pos) ~= "string" then
		collect_pos = json.encode(collect_pos)
	end

	if type(pooch_pos) ~= "string" then
		pooch_pos = json.encode(pooch_pos)
	end

    return MySQL.update.await("UPDATE `laboratories` SET `bucket` = ?, `raw_mat_1` = ?, `raw_mat_2` = ?, `unpooched_item` = ?, `pooched_item` = ?, `residue_item` = ?, `reduce_pos` = ?, `produce_pos` = ?, `collect_pos` = ?, `pooch_pos` = ? WHERE `id` = ?", {
        bucket,
        raw_mat_1,
        raw_mat_2,
		unpooched_item,
		pooched_item,
		residue_item,
		reduce_pos,
		produce_pos,
		collect_pos,
		pooch_pos,
        id
    })
end

DB.Laboratory.Delete = function(id)
    return MySQL.query.await("DELETE FROM `laboratories` WHERE `id` = ?", { id })
end
