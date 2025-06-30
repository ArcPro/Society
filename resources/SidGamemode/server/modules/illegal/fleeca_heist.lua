ServerModules = ServerModules or {}
ServerModules.Illegal = ServerModules.Illegal or {}
ServerModules.Illegal.FleecaHeist = {}
ServerModules.Illegal.FleecaHeist.Robbed = {}
ServerModules.Illegal.FleecaHeist.SecurityTime = 20 * 60 * 1000
ServerModules.Illegal.FleecaHeist.RobDelay = 120 * 60 * 1000
ServerModules.Illegal.FleecaHeist.MastermindTries = 10
ServerModules.Illegal.FleecaHeist.MastermindMessages = {
	INVALID = "~g~Bien placés~s~ ~o~Mal placés~s~ ~r~Mauvais~s~\nTentative: %s",
	SECURITY = "~r~Ce coffre est en mode sécurité.~s~",
	VALID = "Code valide",
}

---Create a mastermind minigame
---@param id integer Fleeca id
---@param index integer Mastermind index
---@param coords vector3 Mastermind coords
function ServerModules.Illegal.FleecaHeist:CreateMastermind(id, index, coords)
	Events.TriggerClient("fleeca:add_mastermind", -1, id, index, coords)

	self.Robbed[id].masterminds[index] = {
		code = ("%d%d%d%d"):format(math.random(0, 9), math.random(0, 9), math.random(0, 9), math.random(0, 9)),
		id = ("fleeca_%d_mastermind_%d"):format(id, index),
		tries = 0,
	}
end

---Delete a mastermind minigame by index
---@param id integer Fleeca id
---@param index integer Mastermind index
function ServerModules.Illegal.FleecaHeist:DeleteMastermind(id, index)
	Events.TriggerClient("marker:delete", -1, ("fleeca_%d_mastermind_%d"):format(id, index))
	self.Robbed[id].masterminds[index] = nil
end

---@param code string Player try
---@param solution string Minigame solution
---@return boolean success
---@return string message
function ServerModules.Illegal.FleecaHeist:ParseMastermind(code, solution)
	local parsed_solution = { solution:sub(1, 1), solution:sub(2, 2), solution:sub(3, 3), solution:sub(4, 4) }
	local parsed_code = { code:sub(1, 1), code:sub(2, 2), code:sub(3, 3), code:sub(4, 4) }

	local final_string = ""
	local color = "r"
	local index = 0
	local good = 0

	for k, value in pairs(parsed_code) do
		index = Table.index(parsed_solution, value)
		color = "r"

		if parsed_solution[k] == value then
			index = k
		end

		if index == k then
			color = "g"
			good += 1
		elseif index ~= 0 then
			color = "o"
		end

		parsed_solution[index] = ""

		final_string = ("%s~%s~%s~s~"):format(final_string, color, value)
	end

	return good == 4, (self.MastermindMessages.INVALID):format(final_string)
end

---Try a code for mastermind minigame
---@param source integer Player server id
---@param id integer Fleeca id
---@param index integer Mastermind index
---@param try string Player try
---@return string message
function ServerModules.Illegal.FleecaHeist:TryMastermind(source, id, index, try)
	if self.Robbed[id].masterminds[index] == nil or self.Robbed[id].masterminds[index].tries > self.MastermindTries then
		return self.Messages.SECURITY
	end

	self.Robbed[id].masterminds[index].tries = self.Robbed[id].masterminds[index].tries + 1

	local res, message = self:ParseMastermind(try, self.Robbed[id].masterminds[index].code)

	if res == true then
		self:DeleteMastermind(id, index)
		self:Reward(source)
	end

	return message
end

---Check if a fleeca is robbed by id
---@param id integer Fleeca is
---@return boolean is_robbed
function ServerModules.Illegal.FleecaHeist:IsRobbed(id)
	return self.Robbed[id] ~= nil
end

---Give a player the fleeca reward
---@param source integer Player server id
function ServerModules.Illegal.FleecaHeist:Reward(source)
	local player = Players.Get(source)
	local inventory = nil

	if player == nil then return end

	inventory = Inventories.Get(player:inventory_id())

	if inventory == nil then return end

	Events.TriggerClient("animations:play", player:source(), "give2")

	inventory:addItem(Item.Create("money", {}, math.random(
		SharedModules.Variables:Get("global", "fleeca_min_reward") / 4,
		SharedModules.Variables:Get("global", "fleeca_max_reward") / 4
	)))
end

---Start a fleeca heist
---@param id integer Fleeca id
---@param door_id integer Fleeca glassdoor id
function ServerModules.Illegal.FleecaHeist:Start(id, door_id)
	Events.Trigger("doors:toggleLock", door_id, 0)

	self.Robbed[id] = {
		glass_door = door_id
	}

	SharedModules.Log:Create(source, "illegal", "fleeca", {
		["ID"] = id,
	})

	Citizen.SetTimeout(self.SecurityTime, function()
		self:TurnSecurity(id)
	end)

	Citizen.SetTimeout(self.RobDelay, function()
		self.Robbed[id] = nil
	end)
end

---Open a fleeca safe door
---@param id integer Fleeca id
---@param door_id integer Fleeca safe door id
---@param coords_list vector3[] Positions for mastermind minigames
function ServerModules.Illegal.FleecaHeist:OpenSafe(id, door_id, coords_list)
	Events.Trigger("doors:toggleLock", door_id, 0)

	self.Robbed[id].safe_door = door_id
	self.Robbed[id].masterminds = {}

	for index, coords in pairs(coords_list) do
		self:CreateMastermind(id, index, coords)
	end
end

function ServerModules.Illegal.FleecaHeist:TurnSecurity(id)
	Events.Trigger("doors:toggleLock", self.Robbed[id].glass_door, 1)
	Events.Trigger("doors:toggleLock", self.Robbed[id].safe_door, 1)

	for idx, _ in pairs(self.Robbed[id].masterminds) do
		self:DeleteMastermind(id, idx)
	end
end

---Register net events for fleeca_heist module
function ServerModules.Illegal.FleecaHeist:RegisterEvents()
	Callbacks.Register("fleeca:is_robbed", function(source, id)
		return self:IsRobbed(id)
	end)

	Callbacks.Register("fleeca:try_code", function(source, id, index, try)
		return self:TryMastermind(source, id, index, try)
	end)

	Events.Register("fleeca:started", function(source, id, door_id)
		self:Start(id, door_id)
	end)

	Events.Register("fleeca:safe_opened", function(source, id, door_id, coords_list)
		self:OpenSafe(id, door_id, coords_list)
	end)
end

ServerModules.Illegal.FleecaHeist:RegisterEvents()
