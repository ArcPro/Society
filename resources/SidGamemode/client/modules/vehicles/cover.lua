ClientModules = ClientModules or {}
ClientModules.Vehicles = ClientModules.Vehicles or {}
ClientModules.Vehicles.Cover = ClientModules.Vehicles.Cover or {}
ClientModules.Vehicles.Cover.Initialized = false
ClientModules.Vehicles.Cover.List = {}

function ClientModules.Vehicles.Cover:Create(plate, coords)
	if type(coords) == "string" then
		coords = json.decode(coords)
	end

	if (
		coords.x == nil or coords.x == 0.0
		or coords.y == nil or coords.y == 0.0
		or coords.z == nil or coords.z == 0.0
	) then
		return
	end

	coords = vector4(coords.x, coords.y, coords.z, coords.w or 0.0)

	self.List[plate] = CreateObject(GetHashKey("imp_prop_covered_vehicle_01a"), coords.x, coords.y, coords.z, false, false, false)

	SetEntityHeading(self.List[plate], coords.w)
	PlaceObjectOnGroundProperly(self.List[plate])
	SetEntityCollision(self.List[plate], false, false)
	SetEntityAlpha(self.List[plate], 125, false)
	SetEntityLodDist(self.List[plate], 20)
end

function ClientModules.Vehicles.Cover:LoadAll()
	for _, coveredVehicle in pairs(Callbacks.Trigger("vehicle:allCovered") or {}) do
		self:Create(coveredVehicle.plate, coveredVehicle.cover_coords)
	end
end

function ClientModules.Vehicles.Cover:GetVehicleUnderCover(cover)
	for plate, entity in pairs(self.List) do
		if entity == cover then
			return plate
		end
	end

	return nil
end

function ClientModules.Vehicles.Cover:FindNearest(coords)
	local nearest, nearestDistance = nil, 9999
	local dist = nil

	for plate, entity in pairs(self.List) do
		dist = Math.Distance(coords, GetEntityCoords(entity, false))
		if dist < nearestDistance then
			nearest, nearestDistance = plate, dist
		end
	end

	if nearestDistance > 3.0 then
		return nil
	end

	return nearest
end

function ClientModules.Vehicles.Cover:UncoverThread()
	local instructional = false

	Citizen.CreateThread(function()
		local timeout = 0
		local nearest = nil
		while true do

			if nearest == nil then
				if instructional ~= false then
					ClientModules.HUD.InstructionalButtons:Delete(38)
					instructional = false
				end

				timeout = 500
			else
				if instructional == false then
					ClientModules.HUD.InstructionalButtons:Add("Débâcher", 38)
					instructional = true
				end

				timeout = 0

				if IsControlJustPressed(0, 38) then
					self:Uncover(nearest)
				end
			end

			nearest = self:FindNearest(player:position())

			Citizen.Wait(timeout)
		end
	end)
end

function ClientModules.Vehicles.Cover:Cover(entity)
	local plate = SharedModules.Vehicles:GetRealPlate(entity)
	local coords = GetEntityCoords(entity, true)
	local heading = GetEntityHeading(entity)

	if Math.Distance(player:position(), coords) > 3.0 then
		return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
	end

	if Entity(entity).state.clamp then
		return UI:AddNotification("basic", "~r~Impossible de bâcher un véhicule avec un sabot.~s~", "info", 5000)
	end

	if ClientModules.Vehicles:HasKey(entity) == false then
		return UI:AddNotification("basic", "~r~Vous n'avez pas les clés de ce véhicule.~s~", "info", 5000)
	end

	Events.TriggerServer("vehicle:update", plate, "props", ClientModules.Vehicles.Properties:Get(entity))
	exports["AdvancedParking"]:DeleteVehicle(entity, false)
	Citizen.Wait(250)

	Events.TriggerServer("vehicle:cover", plate, vector4(coords.x, coords.y, coords.z, heading))
end

function ClientModules.Vehicles.Cover:Uncover(plate)
	if self.List[plate] == nil then
		return UI:AddNotification("basic", "~r~Aucun véhicule sous cette bache~s~", "info", 5000)
	end

	local coords, heading = GetEntityCoords(self.List[plate], true), GetEntityHeading(self.List[plate])

	if Math.Distance(player:position(), coords) > 5.0 then
		return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
	end

	local vehicle = Callbacks.Trigger("vehicle:get", plate)

	if vehicle == nil then
		return UI:AddNotification("basic", "~r~Erreur lors de la récupération du véhicule~s~", "info", 5000)
	end

	Events.TriggerServer("vehicle:uncover", plate)
	DeleteEntity(self.List[plate])
	self.List[plate] = nil
	Citizen.Wait(250)

	ClientModules.Vehicles:Create(vehicle._model, coords, heading, vehicle._props, vehicle._owner, vehicle._plate, false)
end

function ClientModules.Vehicles.Cover:RegisterEvents()
	Events.Register("vehicle:uncover", function(source, plate)
		DeleteEntity(self.List[plate])
		self.List[plate] = nil
	end)

	Events.Register("vehicle:cover", function(source, plate, coords)
		self:Create(plate, coords)
	end)
end

function ClientModules.Vehicles.Cover:Initialize()
	if self.Initialized == true then return end

	self:RegisterEvents()
	self:UncoverThread()
	self:LoadAll()

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Vehicles.Cover:Initialize()
end)
