SharedModules = SharedModules or {}
SharedModules.Variables = {}

function SharedModules.Variables:Get(subregister, name)
    return tonumber(GlobalState[("variables.%s.%s"):format(subregister, name)]) or 100
end
