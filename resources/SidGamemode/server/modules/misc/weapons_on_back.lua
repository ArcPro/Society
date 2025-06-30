AddEventHandler('playerDropped', function(reason)
	local source = source

	for k, v in pairs(GetAllObjects()) do
		if Entity(v).state.owner == source then
			DeleteEntity(v)
		end
	end
end)
