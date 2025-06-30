Functions = {}

Functions.RemoveUnderscores = function(table)
    local new_table = {}
    for k, v in pairs(table) do
        local nk = k;

        if type(k) == "number" then
            nk = k
        else
            nk = k:gsub("^_", "")
        end

        if type(v) == "table" then
            new_table[nk] = Functions.RemoveUnderscores(v)
        else
            new_table[nk] = v
        end
    end
    return new_table
end

Functions.DeepCopy = function(table)
    local new_table = {}
    for k, v in pairs(table or {}) do
        if type(v) == "table" then
            new_table[k] = Functions.DeepCopy(v)
        else
            new_table[k] = v
        end
    end
    return new_table
end
