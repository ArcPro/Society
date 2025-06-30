Table = {}

function Table.compare(a, b)
    if Table.count(a) ~= Table.count(b) then
        return false
    end

    for k, v in pairs(a) do
        if b[k] == nil then
            return false
        end

        if type(v) == "table" then
            if not Table.compare(v, b[k]) then
                return false
            end
        else
            if v ~= b[k] then
                return false
            end
        end
    end

    return true
end

function Table.compareMetadatas(a, b)
	a = Functions.DeepCopy(a)
	b = Functions.DeepCopy(b)

	if a.metadata ~= nil then
		a.metadata.name = nil
		a.metadata.weight = nil

		b.metadata.name = nil
		b.metadata.weight = nil
	else
		a.name = nil
		a.weight = nil

		b.name = nil
		b.weight = nil
	end

    return Table.compare(a, b)
end

function Table.count(tbl)
    local count = 0

    for _ in pairs(tbl) do
        count += 1
    end

    return count
end

function Table.map(tbl, cb)
    local new = {}

    for k, v in pairs(tbl) do
        table.insert(new, cb(v, k))
    end

    return new
end

function Table.PairsByKeys(t, f)
    local a = {}

    for n in pairs(t) do
        table.insert(a, n)
    end

    table.sort(a, f)

    local i = 0

    return function()
        i += 1

        return a[i], t[a[i]]
    end
end

function Table.find(table, cb)
	for k, v in pairs(table) do
		if cb(v) == true then
			return v
		end
	end

	return nil
end

function Table.has(tbl, value, k)
    if not tbl or not value or type(tbl) ~= "table" then
        return
    end

    for _, v in pairs(tbl) do
        if k and v[k] == value or v == value then
            return true
        end
    end

	return false
end

function Table.index(tbl, value)
    if not tbl or not value or type(tbl) ~= "table" then
        return 0
    end

    for k, v in pairs(tbl) do
        if v == value then
            return k
        end
    end

	return 0
end

---Returns all keys of t2 that aren't the same as t1 ones
---@param t1 table
---@param t2 table
---@return table | nil
function Table.diff(t1, t2)
	local diff, found = {}, false

	for k, v in pairs(t2) do
		if t1[k] == nil then
			diff[k] = v
			found = true
		elseif type(t1[k]) == "table" and type(t2[k]) == "table" then
			diff[k] = Table.diff(t1[k], t2[k])

			if diff[k] ~= nil then
				found = true
			end
		elseif t1[k] ~= t2[k] then
			diff[k] = v
			found = true
		end
	end

	if found == false then
		return nil
	end

	return diff
end
