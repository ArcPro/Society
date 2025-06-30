ClientModules = ClientModules or {}
ClientModules.Misc = ClientModules.Misc or {}
ClientModules.Misc.Animations = ClientModules.Misc.Animations or {}
ClientModules.Misc.Animations.Favorites = {}
ClientModules.Misc.Animations.Favorites.KVPKey = "favorite_emotes"

function ClientModules.Misc.Animations.Favorites:Get()
	local list = GetResourceKvpString(self.KVPKey)

	if list == nil then
		return {}
	end

	return json.decode(list)
end

function ClientModules.Misc.Animations.Favorites:Save(list)
	SetResourceKvp(self.KVPKey, json.encode(list))
end

function ClientModules.Misc.Animations.Favorites:Add(name)
	local list = self:Get()

	table.insert(list, name)
	self:Save(list)
end

function ClientModules.Misc.Animations.Favorites:Delete(name)
	local list = self:Get()
	local index = Table.index(list, name)

	if index == 0 then return end

	table.remove(list, index)
	self:Save(list)
end
