function RealIndex(index, items)
    local _index = index
    if _index < 1 then
        _index = #items
    elseif _index > #items then
        _index = 1
    end

    return _index
end

function CompareTables(a, b)
    if #a ~= #b then
        return false
    end

    for k, v in pairs(a) do
        if b[k] == nil then
            return false
        end

        if type(v) == "table" then
            if not CompareTables(v, b[k]) then
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
