ClientModules = ClientModules or {}
ClientModules.Illegal = ClientModules.Illegal or {}

---@param variable_name string
---@return boolean
function ClientModules.Illegal:CheckForPolice(variable_name)
	local police = "lspd"

	if player:position().y > 1490 then
		police = "lssd"
	end

	local policeSociety = ClientModules.Societies:Find(police)

	if not policeSociety then
		return false
	end

	local requiredCops = SharedModules.Variables:Get("global", variable_name) or 5

	if requiredCops > #policeSociety:duties() then
		UI:AddNotification("basic", "~r~Pas assez de policiers en service.~s~", "info", 5000)
		return false
	end

	return true
end

---@param alert string
function ClientModules.Illegal:AlertPolice(alert)
	local police = "lspd"

	if player:position().y > 1490 then
		police = "lssd"
	end

	Events.TriggerServer(
		"dispatch:add",
		police,
		GetStreetNameFromHashKey(GetStreetNameAtCoord(player:position().x, player:position().y, player:position().z)),
		alert
	)
end
