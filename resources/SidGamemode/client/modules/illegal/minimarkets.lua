ClientModules = ClientModules or {}
ClientModules.Illegal = ClientModules.Illegal or {}
ClientModules.Illegal.Minimarkets = {}

ClientModules.Illegal.Minimarkets.currentShopKeeper = nil
ClientModules.Illegal.Minimarkets.nearestMinimarket = nil
ClientModules.Illegal.Minimarkets.nearestDistance = 99999
ClientModules.Illegal.Minimarkets.initalized = false
ClientModules.Illegal.Minimarkets.robberyStep = 0
ClientModules.Illegal.Minimarkets.isRobbed = nil
ClientModules.Illegal.Minimarkets.data = {}

function ClientModules.Illegal.Minimarkets:StartRobbery()
	if not self.currentShopKeeper or not self.nearestMinimarket then
		return
	end

	if self.isRobbed ~= nil then
		return
	end

	self.isRobbed = Callbacks.Trigger("minimarket:isRobbed", self.nearestMinimarket.id)

	if ClientModules.Illegal:CheckForPolice("minimarket_robbery") == false then return end

	if self.isRobbed == true then
		UI:AddNotification("basic", "~r~Cette supérette à déja été braquée récemment, repassez plus tard.~s~", "info", 5000)
		return
	end

	ClientModules.Illegal:AlertPolice("Braquage de supérette")

	Events.TriggerServer("minimarket:startRobbery", self.nearestMinimarket.id)

	Citizen.CreateThread(function()

		local shopKeeperCoords = GetEntityCoords(self.currentShopKeeper, false)
		local bagModel = GetHashKey('prop_poly_bag_01')
		local robberyStep = 0
		local bag = nil

		--[[ Shopkeeper put hands up ]]
		Utils.Streaming.RequestAnimDict('missheist_agency2ahands_up')
		Utils.Streaming.RequestModel(bagModel)
		TaskPlayAnim(self.currentShopKeeper, "missheist_agency2ahands_up", "handsup_anxious", 8.0, -8.0, -1, 2, 0.0, false, false, false)
		Citizen.Wait(5000)

		RemoveAnimDict('missheist_agency2ahands_up')
		Utils.Streaming.RequestAnimDict('mp_am_hold_up')

		while robberyStep ~= 5 do

			if Math.Distance(player:position(), shopKeeperCoords) > 30.0 then
				break
			end

			--[[ Then shopkeeper takes money ]]
			TaskPlayAnim(self.currentShopKeeper, "mp_am_hold_up", "holdup_victim_20s", 8.0, -8.0, -1, 2, 0.0, false, false, false)

			Utils.RealWait(4000)

			bag = CreateObject(bagModel, shopKeeperCoords.x, shopKeeperCoords.y, shopKeeperCoords.z, true, false, false)
			AttachEntityToEntity(
				bag, self.currentShopKeeper, GetPedBoneIndex(self.currentShopKeeper, 60309),
				0.1, -0.11, 0.08,
				0.0, -75.0, -75.0,
				true, true, false, false, 2, true
			)

			Utils.RealWait(17000)

			DetachEntity(bag, true, false)
			Citizen.Wait(75)
			ApplyForceToEntity(bag, 3, 0.0, 50.0, 0.0, 0.0, 0.0, 0.0, 0, true, true, false, false, true)

			SharedModules.Entities:SetStatebag(bag, "pickupItem", "money")
			SharedModules.Entities:SetStatebag(bag, "pickupQuantity", math.random(
				(SharedModules.Variables:Get("global", "min_minimarket_robbery") or 600) / 5,
				(SharedModules.Variables:Get("global", "max_minimarket_robbery") or 1500) / 5
			))

			if Math.Distance(player:position(), GetEntityCoords(self.currentShopKeeper, false)) > 30.0 then
				break
			end

			robberyStep += 1
		end

		ClearPedTasks(self.currentShopKeeper)
		self.isRobbed = nil
	end)
end

function ClientModules.Illegal.Minimarkets:Safecrack(id)
	if Callbacks.Trigger("minimarket:isRobbed", id) ~= true then
		return UI:AddNotification("basic", "~r~Cette supérette n'a pas été braquée récemment.~s~", "info", 5000)
	end

	if Callbacks.Trigger("minimarket:isSafeRobbed", id) == true then
		return UI:AddNotification("basic", "~r~Ce coffre-fort à déjà été ouvert.~s~", "info", 5000)
	end

	ClientModules.Illegal.QuicktimeEvents:Safecracking(3, function(success)
		if success then
			UI:AddNotification("basic", "~b~Vous avez ouvert le coffre !.~s~", "info", 5000)

			player:inventory():addItem(Item.Create("money", {}, math.random(
				(SharedModules.Variables:Get("global", "min_minimarket_robbery") or 600),
				(SharedModules.Variables:Get("global", "max_minimarket_robbery") or 1500)
			)))
		else
			UI:AddNotification("basic", "~r~Ce coffre vous a résisté...~s~", "info", 5000)
		end

		Events.TriggerServer("minimarket:setSafeRobbed", id)
	end)
end

---@private
function ClientModules.Illegal.Minimarkets:LoadAll()
	for _, v in pairs(Callbacks.Trigger("minimarket:all") or {}) do
		self.data[v.id] = {
			id = v.id,
			ped_id = SharedModules.Entities:CreatePed("mp_m_shopkeep_01", v.ped_coords, false),
			safe_coords = v.safe_coords,
			safe_marker = Marker:new({
				coords = vector3(v.safe_coords.x, v.safe_coords.y, v.safe_coords.z - 0.95),
				name = ("minimarket_%d"):format(v.id),
				action = "safecracking",
				editable = false,

				onInteract = function ()
					ClientModules.Illegal.Minimarkets:Safecrack(v.id)
				end,

				onLeave = function()end,
			})
		}

		SetEntityHeading(self.data[v.id].ped_id, v.ped_coords.w)
	end
end

---@private
function ClientModules.Illegal.Minimarkets:GetNearestThread()
	Citizen.CreateThread(function()
		local dist = nil
		while true do

			self.nearestMinimarket = nil
			self.nearestDistance = 99999

			for _, data in pairs(self.data) do

				dist = Math.Distance(player:position(), data.safe_coords);

				if dist < self.nearestDistance then
					self.nearestMinimarket = data
					self.nearestDistance = dist
				end

				if dist > 150 then
					goto continue
				end

				if data.ped_id ~= self.currentShopKeeper then
					self.isRobbed = nil
				end

				self.currentShopKeeper = data.ped_id

				if DoesEntityExist(self.currentShopKeeper) then
					SetEntityInvincible(self.currentShopKeeper, true)
					SetEntityAsMissionEntity(self.currentShopKeeper, false, false)
					SetBlockingOfNonTemporaryEvents(self.currentShopKeeper, true)
					SetPedFleeAttributes(self.currentShopKeeper, 0, false)
					SetPedCombatAttributes(self.currentShopKeeper, 46, true)
					SetPedFleeAttributes(self.currentShopKeeper, 0, false)
				end

				::continue::

			end

			Citizen.Wait(2000)
		end
	end)
end

---@private
function ClientModules.Illegal.Minimarkets:IsRobbingThread()
	Citizen.CreateThread(function()
		local playerPed = PlayerPedId()
		local timeout = 1000

		while true do

			playerPed = PlayerPedId()

			if not self.nearestMinimarket then
				timeout = 1000
			else
				self.currentShopKeeper = self.nearestMinimarket.ped_id
			end

			if not DoesEntityExist(self.currentShopKeeper) then
				timeout = 1000
			else
				timeout = 100
			end

			if (
				((IsPedArmed(playerPed, 1) and IsPedInMeleeCombat(playerPed)) or IsPlayerFreeAiming(PlayerId()))
				and (not IsPedDeadOrDying(self.currentShopKeeper, true)) and HasEntityClearLosToEntityInFront(playerPed, self.currentShopKeeper)
			) then
				self:StartRobbery()
			end

			Citizen.Wait(timeout)
		end
	end)
end

function ClientModules.Illegal.Minimarkets:RegisterEvents()
	Events.Register("minimarket:create", function(source, id, ped_coords, safe_coords)
		self.data[id] = {
			id = id,
			ped_id = SharedModules.Entities:CreatePed("mp_m_shopkeep_01", ped_coords, false),
			safe_coords = safe_coords,
			safe_marker = Marker:new({
				coords = vector3(safe_coords.x, safe_coords.y, safe_coords.z - 0.95),
				name = ("minimarket_%d"):format(id),
				action = "safecracking",
				editable = false,

				onInteract = function ()
					self:Safecrack(id)
				end,

				onLeave = function()end,
			})
		}
	end)

	Events.Register("minimarket:update", function(source, id, ped_coords, safe_coords)
		SetEntityCoords(self.data[id].ped_id, ped_coords.x, ped_coords.y, ped_coords.z, true, false, false, false)
		SetEntityHeading(self.data[id].ped_id, ped_coords.w)

		self.data[id].safe_coords = safe_coords
		self.data[id].safe_marker:coords(vector3(safe_coords.x, safe_coords.y, safe_coords.z - 0.95))
	end)

	Events.Register("minimarket:delete", function(source, id)
		DeleteEntity(minimarkets[id].ped_id)

		self.data[id].safe_marker:delete()
		self.data[id] = nil
	end)
end

function ClientModules.Illegal.Minimarkets:Initialize()
	if self.initalized == true then return end

	self:LoadAll()

	self:GetNearestThread()
	self:IsRobbingThread()
	self:RegisterEvents()

	self.initalized = true
end

Core.Player:OnLoad(function()
	ClientModules.Illegal.Minimarkets:Initialize()
end)
