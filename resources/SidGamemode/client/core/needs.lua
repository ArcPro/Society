Core = Core or {}
Core.Needs = {}
Core.Needs.Initialized = false
Core.Needs.ThreadInterval = 2500
Core.Needs.CurrentStep = {
	Alcohol = -1,
	Drug = -1,
}

Core.Needs.DrunkInteractions = {
	{interaction = 27, time = 1500},
	{interaction = 6, time = 1000},
	{interaction = 7, time = 800}, --turn left and accel
	{interaction = 8, time = 800}, --turn right and accel
	{interaction = 10, time = 800}, --turn left and restore wheel pos
	{interaction = 11, time = 800}, --turn right and restore wheel pos
	{interaction = 23, time = 2000}, -- accel fast
	{interaction = 31, time = 2000} -- accel fast and then handbrake 
}

Core.Needs.WalkStyles = {
	[0] = "move_m@drunk@slightlydrunk",
	[1] = "move_m@drunk@moderatedrunk",
	[2] = "move_m@drunk@verydrunk"
}

function Core.Needs:GetStep(value)
    if value > 66 then
        return 2
    elseif value > 33 then
        return 1
    elseif value > 0 then
        return 0
    else
        return -1
    end
end

function Core.Needs:Alteration(timecycle, level, forceWalkStyle)
    ShakeGameplayCam("DRUNK_SHAKE", level / 100.0)
    SetPedMotionBlur(PlayerPedId(), level > 0)
	SetPedIsDrunk(PlayerPedId(), level > 0)

    if level > 0 then
        SetTimecycleModifier(timecycle)
        SetTimecycleModifierStrength(level / 100)
    else
        SetTimecycleModifierStrength(0.0)
        SetTransitionTimecycleModifier("default", 1.0)
    end

    if forceWalkStyle == true then
		if level > 0 then
			ClientModules.Misc.Animations:SetClipset(self:GetStep(level))
		else
			ClientModules.Misc.Animations:ResetClipset(false)
		end
	end

    Citizen.CreateThread(function()
        while self:GetStep(player:alcohol()) > 0 do
            if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId() then
                TaskVehicleTempAction(
					PlayerPedId(),
					GetVehiclePedIsIn(PlayerPedId(), false),
					self.DrunkInteractions[math.random(1, #self.DrunkInteractions)].interaction,
					self.DrunkInteractions[math.random(1, #self.DrunkInteractions)].time
				)
            end

            Citizen.Wait(5000)
        end
    end)
end

function Core.Needs:Decrease()
	player:hunger(player:hunger() - (SharedModules.Variables:Get("global", "hunger") or 0))
	player:thirst(player:thirst() - (SharedModules.Variables:Get("global", "thirst") or 0))

	player:alcohol(player:alcohol() - (SharedModules.Variables:Get("global", "alcohol") or 0))

	player:health(player:health())
	player:armor(player:armor())

	if ClientModules.Misc.Settings:Get("disable_drug_down") ~= true then
		player:drugs(player:drugs() - (SharedModules.Variables:Get("global", "drug") or 0))
	end

	if player:hunger() <= 0 then
		player:health(player:health() - 2.5)
	end

	if player:thirst() <= 0 then
		player:health(player:health() - 2.5)
	end

	if player:health() <= 0 then
		if not player:dead() then
			player:dead(true)
			Core.Death:SetPlayerDead()
		end
	end
end

function Core.Needs:Sync()
	LocalPlayer.state:set("alcohol", player:alcohol(), true)
	LocalPlayer.state:set("hunger", player:hunger(), true)
	LocalPlayer.state:set("health", player:health(), true)
	LocalPlayer.state:set("thirst", player:thirst(), true)
	LocalPlayer.state:set("drugs", player:drugs(), true)

	UI:SendMessage("hud:update", {
		alcohol = player:alcohol(),
		hunger = player:hunger(),
		health = player:health(),
		thirst = player:thirst(),
		armor = player:armor(),
		drugs = player:drugs(),
	})
end

function Core.Needs:UpdateAlteration()
	if self.CurrentStep.Alcohol ~= self:GetStep(player:alcohol()) then
		self.CurrentStep.Alcohol = self:GetStep(player:alcohol())
		self:Alteration("spectator5", player:alcohol(), true)
	end

	if self.CurrentStep.Drug ~= self:GetStep(player:drugs()) then
		self.CurrentStep.Drug = self:GetStep(player:drugs())
		self:Alteration("DaxTrip02", player:drugs(), false)
	end
end

function Core.Needs:NotifyIfHungryOrThirsty()
	if (
		player:hunger() <= 20 + (SharedModules.Variables:Get("global", "hunger") or 0) / 2
		and player:hunger() >= 20 - (SharedModules.Variables:Get("global", "hunger") or 0) / 2
	) then
		UI:AddNotification("basic", "Vous avez faim", "info", 5000)
	end

	if (
		player:thirst() <= 20 + (SharedModules.Variables:Get("global", "thirst") or 0) / 2
		and player:thirst() >= 20 - (SharedModules.Variables:Get("global", "thirst") or 0) / 2
	) then
		UI:AddNotification("basic", "Vous avez soif", "info", 5000)
	end
end

function Core.Needs:Initialize()
	if self.Initialized == true then return end

	Citizen.CreateThread(function()
        while true do
            Utils.RealWait(2500)

			self:Decrease()

			self:NotifyIfHungryOrThirsty()
			self:UpdateAlteration()
			self:Sync()
        end
    end)

	self.Initialized = true
end

Core.Player:OnLoad(function()
	Core.Needs:Initialize()
end)
