Identifiers = {}

Identifiers.Parse = function (ids)
    local identifiers = {}

    for _, identifier in ipairs(ids) do
        local parts = String.split(identifier, ":")
        identifiers[parts[1]] = parts[2]
    end

    return identifiers
end
