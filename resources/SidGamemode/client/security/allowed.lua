Security = Security or {}

local permissions = {}

permissions.noclip = function()
    return ClientModules.Admin.Noclip.enabled == true and player:permissions() >= Config.Permissions.MOD
end

permissions.godmode = function()
    if permissions.noclip() then
        return true
    end

	if player:ko() == true then
		return true
	end

	return LocalPlayer.state.godmode
end

permissions.invisible = function()
    if permissions.noclip() then
        return true
    end

	if permissions.spectate() then
		return true
	end

	return LocalPlayer.state.invisible
end

permissions.speed = function()
    if permissions.noclip() then
        return true
    end

	return LocalPlayer.state.speed
end

permissions.freecam = function()
    if permissions.noclip() then
        return true
    end

	if permissions.spectate() then
		return true
	end

    return LocalPlayer.state.freecam == true or ClientModules.Misc.Freecam.active == true
end

permissions.spectate = function()
    return LocalPlayer.state.spectate == true
end

Security.IsAllowed = function(action)
    if permissions[action] then return permissions[action]() end

    return false
end
