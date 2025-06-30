ClientModules = ClientModules or {}
ClientModules.Vehicles = ClientModules.Vehicles or {}
ClientModules.Vehicles.Speedometer = {}
ClientModules.Vehicles.Speedometer.Initialized = false

ClientModules.Vehicles.Speedometer.InstructionalsDisplaying = false
ClientModules.Vehicles.Speedometer.ThreadsRunning = false
ClientModules.Vehicles.Speedometer.CurrentVehicle = nil
ClientModules.Vehicles.Speedometer.HasSeatBelt = false
ClientModules.Vehicles.Speedometer.Displaying = false
ClientModules.Vehicles.Speedometer.IsHotwired = false

ClientModules.Vehicles.Speedometer.IndicatorStatus = {
	[0] = "none",
	[1] = "left",
	[2] = "right",
	[3] = "hazard",
}

local function IsAnyDoorOpen(vehicle)
	for i = 1, GetNumberOfVehicleDoors(vehicle), 1 do
		if GetVehicleDoorAngleRatio(vehicle, i - 1) > 0.0 then
			return true
		end
	end
	return false
end

local function GetGear(vehicle)
	local gear = GetVehicleCurrentGear(vehicle)
	if gear == 0 and GetEntitySpeed(vehicle) ~= 0 then
		return "R"
	elseif gear == 0 and GetEntitySpeed(vehicle) == 0 then
		return "N"
	else
		return gear
	end
end

local function GetHeadLight(vehicle)
    local _, light, highbeams = GetVehicleLightsState(vehicle)
    local headlight = 0

    if light == true then
        headlight += 1;
    end

    if highbeams == true then
        headlight += 1;
    end

	return headlight
end

function ClientModules.Vehicles.Speedometer:SetSeatBelt(state)
    if DoesEntityExist(self.CurrentVehicle) == false or GetVehicleClass(self.CurrentVehicle) == 8 then return end

    if state == true then
        SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0)
    else
        SetFlyThroughWindscreenParams((60 / 3.6), (75 / 3.6), 17.0, 2000.0)
    end

    self.HasSeatBelt = state
end

function ClientModules.Vehicles.Speedometer:SwitchSeat(index)
    if DoesEntityExist(self.CurrentVehicle) == false then return end
	if GetVehicleClass(self.CurrentVehicle) == 18 and GetPedInVehicleSeat(self.CurrentVehicle, -1) == PlayerPedId() and IsVehicleSirenOn(self.CurrentVehicle) then return end
    if GetEntitySpeed(self.CurrentVehicle) > 0.5 and index ~= -1 then return end
    if self.HasSeatBelt == true then return end

    if GetPedInVehicleSeat(self.CurrentVehicle, index) == 0 then
        SetPedIntoVehicle(PlayerPedId(), self.CurrentVehicle, index)
    end
end

function ClientModules.Vehicles.Speedometer:GetData()
    if DoesEntityExist(self.CurrentVehicle) == false then return end

    return {
        blink = self.IndicatorStatus[GetVehicleIndicatorLights(self.CurrentVehicle)],
        fuel = ClientModules.Vehicles.Fuel:Get(self.CurrentVehicle) * 100 / 65,
        engine = GetVehicleEngineHealth(self.CurrentVehicle) < 400,
        speed = GetEntitySpeed(self.CurrentVehicle) * 3.6,
        rpm = GetVehicleCurrentRpm(self.CurrentVehicle),
        headlight = GetHeadLight(self.CurrentVehicle),
        door = IsAnyDoorOpen(self.CurrentVehicle),
        gear = GetGear(self.CurrentVehicle),
        seatbelt = not self.HasSeatBelt,
    }
end

function ClientModules.Vehicles.Speedometer:DecreaseGas()
	ClientModules.Vehicles.Fuel:Set(self.CurrentVehicle, ClientModules.Vehicles.Fuel:Get(self.CurrentVehicle) - GetVehicleCurrentRpm(self.CurrentVehicle) / 1500)
end

function ClientModules.Vehicles.Speedometer:UpdateDisplay()
	if (
		DoesEntityExist(self.CurrentVehicle) == true
		and GetIsVehicleEngineRunning(self.CurrentVehicle) == true
		and (
			GetPedInVehicleSeat(self.CurrentVehicle, -1) == PlayerPedId()
			or GetPedInVehicleSeat(self.CurrentVehicle, 0) == PlayerPedId()
		)
	) then
		if self.Displaying == false then
			UI:Toggle("speedometer", true, self:GetData(), false, true)
		else
			UI:SendMessage("speedometer:update", self:GetData())
		end

		self.Displaying = true
	else
		UI:Toggle("speedometer", false, {}, false, false)
		self.Displaying = false
	end
end

function ClientModules.Vehicles.Speedometer:DisplayInstructional()
	if (
		DoesEntityExist(self.CurrentVehicle) == true
		and GetPedInVehicleSeat(self.CurrentVehicle, -1) == PlayerPedId()
		and (GetIsVehicleEngineRunning(self.CurrentVehicle) == true or LocalPlayer.state.handcuffed == true) == false
		and ClientModules.Vehicles:HasKey(self.CurrentVehicle) == false
		and self.IsHotwired == false
	) then
		if self.InstructionalsDisplaying == false then
			ClientModules.HUD.InstructionalButtons:Add("Faire les fils", Utils.GetControlHash("wire_car"))
			self.InstructionalsDisplaying = true
		end
	else
		if self.InstructionalsDisplaying == true then
			ClientModules.HUD.InstructionalButtons:Delete(Utils.GetControlHash("wire_car"))
			self.InstructionalsDisplaying = false
		end
	end
end

function ClientModules.Vehicles.Speedometer:AllowGetOutOfVehicleWithoutClosingDoor(ped)
	if IsControlPressed(2, 75) and not IsEntityDead(ped) and GetIsVehicleEngineRunning(self.CurrentVehicle) then
		Citizen.Wait(150)

		if IsControlPressed(2, 75) and not IsEntityDead(ped) and GetIsVehicleEngineRunning(self.CurrentVehicle) then
			TaskLeaveVehicle(ped, self.CurrentVehicle, 256)

			Citizen.Wait(500)

			ClientModules.Vehicles.Actions:Call("toggle_engine", self.CurrentVehicle, { true })
		end
	end
end

function ClientModules.Vehicles.Speedometer:DisableNonDesiredNativeBehaviors(ped)
	SetVehicleMaxSpeed(currentVehicle, Entity(self.CurrentVehicle).state.limiter or 0)

	if GetIsTaskActive(ped, 165) then
		SetPedIntoVehicle(ped, self.CurrentVehicle, 0)
	end

	if self.HasSeatBelt then
		DisableControlAction(0, 75, true) -- Disable exit vehicle when stop
		DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
	end

	if Entity(self.CurrentVehicle).state.clamp then
		SetVehicleForwardSpeed(self.CurrentVehicle, 0.0)
		SetVehicleCurrentRpm(self.CurrentVehicle, 0.0)
	end
end

function ClientModules.Vehicles.Speedometer:DisableNonDesiredEngineStart()
	if (
		(ClientModules.Vehicles:HasKey(self.CurrentVehicle) == false and self.IsHotwired == false)
		or LocalPlayer.state.handcuffed == true
	) then
		SetVehicleEngineOn(self.CurrentVehicle, false, true, true)
	end
end

function ClientModules.Vehicles.Speedometer:SyncThread()
	if self.ThreadsRunning == true then return end

	Citizen.CreateThread(function()
		while DoesEntityExist(self.CurrentVehicle) do
			ClientModules.Vehicles:Synchronize(self.CurrentVehicle)
			Citizen.Wait(10000)
		end
	end)
end

function ClientModules.Vehicles.Speedometer:DisplayThread(ped)
	if self.ThreadsRunning == true then return end

	Citizen.CreateThread(function()
		while DoesEntityExist(self.CurrentVehicle) and IsPedInVehicle(ped, self.CurrentVehicle, false) do
			self:DisplayInstructional()
			self:UpdateDisplay()
			self:DecreaseGas()

			Citizen.Wait(100)
		end

		self:DisplayInstructional()
		self:UpdateDisplay()
	end)
end

function ClientModules.Vehicles.Speedometer:MainThread(ped)
	if self.ThreadsRunning == true then return end

	self.ThreadsRunning = true

	Citizen.CreateThread(function()
		while DoesEntityExist(self.CurrentVehicle) and IsPedInVehicle(ped, self.CurrentVehicle, false) do
			self:AllowGetOutOfVehicleWithoutClosingDoor(ped)
			self:DisableNonDesiredNativeBehaviors(ped)

			if GetIsVehicleEngineRunning(self.CurrentVehicle) == false then
				self:DisableNonDesiredEngineStart()
			end

			Citizen.Wait(0)
		end

		Events.TriggerServer("player:leftVehicle")
		self.ThreadsRunning = false
		self.CurrentVehicle = nil
		self.IsHotwired = false
	end)
end

function ClientModules.Vehicles.Speedometer:Initialize()
	if self.Initialized == true then return end

	DecorRegister("_FUEL_LEVEL", 1)

	GameEvents.OnEnteringVehicle(function(args)
		self.CurrentVehicle = args[2]
		local ped = PlayerPedId()

		SetPedConfigFlag(ped, 184, true)
		SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)

		if self.ThreadsRunning == false and GetVehicleClass(self.CurrentVehicle) ~= 13 and GetEntityModel(self.CurrentVehicle) ~= `iak_wheelchair` then
			ClientModules.Vehicles.Fuel:Initialize(self.CurrentVehicle)

			self:DisplayThread(ped)
			self:SyncThread()

			self:MainThread(ped)
		end
	end)

	self.Initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Vehicles.Speedometer:Initialize()
end)
