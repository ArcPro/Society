function GetDutyCount(prefix)
	local total = 0

	for k, society in pairs(ClientModules.Societies:All()) do
		if society:name():find(prefix) ~= nil then
			total += #society:duties()
		end
	end

	return total
end
