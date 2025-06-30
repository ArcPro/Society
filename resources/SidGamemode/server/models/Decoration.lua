DB = DB or {}
DB.Decoration = {}

local function encodeMatrix(matrix)
	return json.encode({
		forward = { x = matrix.forward.x, y = matrix.forward.y, z = matrix.forward.z },
		right = { x = matrix.right.x, y = matrix.right.y, z = matrix.right.z },
		pos = { x = matrix.pos.x, y = matrix.pos.y, z = matrix.pos.z },
		up = { x = matrix.up.x, y = matrix.up.y, z = matrix.up.z }
	})
end

DB.Decoration.AllInBucket = function(bucket)
	return MySQL.query.await("SELECT * FROM `decoration` WHERE `bucket` = ?", { bucket })
end

DB.Decoration.CountOwned = function(bucket, owner)
	return MySQL.single.await("SELECT COUNT(*) AS total FROM `decoration` WHERE `bucket` = ? AND `owner` = ?", { bucket, owner }).total
end

DB.Decoration.Get = function(id)
	local data = MySQL.single.await("SELECT * FROM `decoration` WHERE `id` = ?", { id })

	if data ~= nil and data.matrix ~= nil and type(data.matrix) == "string" then
		data.matrix = json.decode(data.matrix)
	end

	return data
end

DB.Decoration.Create = function(bucket, model, collisions, matrix, owner)
    return MySQL.insert.await("INSERT INTO `decoration` (`bucket`, `model`, `collisions`, `matrix`, `owner`) VALUES (?, ?, ?, ?, ?)", {
		bucket,
		model,
		collisions,
		encodeMatrix(matrix),
		owner
	})
end

DB.Decoration.Update = function(id, bucket, model, collisions, matrix, owner)
    return MySQL.update.await("UPDATE `decoration` SET `bucket` = ?, `model` = ?, `collisions` = ?, `matrix` = ?, `owner` = ? WHERE `id` = ?", {
		bucket,
		model,
		collisions,
		encodeMatrix(matrix),
		owner,
		id
	})
end

DB.Decoration.Delete = function(id)
    return MySQL.query.await("DELETE FROM `decoration` WHERE `id` = ?", { id })
end
