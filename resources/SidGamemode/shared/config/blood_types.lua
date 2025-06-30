Config = Config or {}
Config.BloodTypes = {
	["A+"]	= 38,
	["O+"]	= 36,
	["B+"]	= 08,
	["A-"]	= 07,
	["O-"]	= 06,
	["AB+"]	= 03,
	["B-"]	= 01,
	["AB-"]	= 01
}

function Config.BloodTypes.GetRandomBloodType()
	local list = {}

	for blood_type, chance in pairs(Config.BloodTypes) do
		if type(chance) == "number" then
			for _=1, chance, 1 do
				table.insert(list, blood_type)
			end
		end
	end

	return list[math.random(1, #list)]
end
