ClientModules = ClientModules or {}
ClientModules.Vehicles = ClientModules.Vehicles or {}
ClientModules.Vehicles.Properties = {}

function ClientModules.Vehicles.Properties:GetMods(entity)
	return {
		spoiler       	= GetVehicleMod(entity, 0),
		frontBumper   	= GetVehicleMod(entity, 1),
		rearBumper    	= GetVehicleMod(entity, 2),
		sideSkirt     	= GetVehicleMod(entity, 3),
		exhaust       	= GetVehicleMod(entity, 4),
		frame         	= GetVehicleMod(entity, 5),
		grille        	= GetVehicleMod(entity, 6),
		hood          	= GetVehicleMod(entity, 7),
		fender        	= GetVehicleMod(entity, 8),
		rightFender   	= GetVehicleMod(entity, 9),
		roof          	= GetVehicleMod(entity, 10),

		engine        	= GetVehicleMod(entity, 11),
		brakes        	= GetVehicleMod(entity, 12),
		transmission  	= GetVehicleMod(entity, 13),
		horns         	= GetVehicleMod(entity, 14),
		suspension    	= GetVehicleMod(entity, 15),
		armor         	= GetVehicleMod(entity, 16),

		turbo         	= IsToggleModOn(entity, 18),
		smokeEnabled  	= IsToggleModOn(entity, 20),
		xenon         	= IsToggleModOn(entity, 22),
        customTyres     = GetVehicleModVariation(entity, 23),

		frontWheels   	= GetVehicleMod(entity, 23),
		backWheels    	= GetVehicleMod(entity, 24),

		plateHolder   	= GetVehicleMod(entity, 25),
		vanityPlate   	= GetVehicleMod(entity, 26),
		trimA         	= GetVehicleMod(entity, 27),
		ornaments     	= GetVehicleMod(entity, 28),
		dashboard     	= GetVehicleMod(entity, 29),
		dial          	= GetVehicleMod(entity, 30),
		doorSpeaker   	= GetVehicleMod(entity, 31),
		seats         	= GetVehicleMod(entity, 32),
		steeringWheel 	= GetVehicleMod(entity, 33),
		shifterLeavers	= GetVehicleMod(entity, 34),
		aPlate        	= GetVehicleMod(entity, 35),
		speakers      	= GetVehicleMod(entity, 36),
		trunk         	= GetVehicleMod(entity, 37),
		hydrolic      	= GetVehicleMod(entity, 38),
		engineBlock   	= GetVehicleMod(entity, 39),
		airFilter     	= GetVehicleMod(entity, 40),
		struts        	= GetVehicleMod(entity, 41),
		archCover     	= GetVehicleMod(entity, 42),
		aerials       	= GetVehicleMod(entity, 43),
		trimB         	= GetVehicleMod(entity, 44),
		tank          	= GetVehicleMod(entity, 45),
		windows       	= GetVehicleMod(entity, 46),
		livery        	= GetVehicleMod(entity, 48),
		livery2			= GetVehicleLivery(entity),
	}
end

function ClientModules.Vehicles.Properties:Get(entity)
	local colorPrimary, colorSecondary	= GetVehicleColours(entity)
    local pearlescentColor, wheelColor	= GetVehicleExtraColours(entity)
    local interiorColor					= GetVehicleInteriorColor(entity)

	local tiresBurst = {}
	for i = 0, 5, 1 do
		if (IsVehicleTyreBurst(entity, i, true)) then
			table.insert(tiresBurst, { i, true })
		elseif (IsVehicleTyreBurst(entity, i, false)) then
			table.insert(tiresBurst, { i, false })
		end
	end

	local doorsMissing = {}
	for i = 0, 7, 1 do
		if (IsVehicleDoorDamaged(entity, i)) then
			table.insert(doorsMissing, i)
		end
	end

	local windowsBroken = {}
	for i = 0, 13, 1 do
		if (not IsVehicleWindowIntact(entity, i)) then
			table.insert(windowsBroken, i)
		end
	end

    local extras = {}

    for i = 0, 20, 1 do
        if (DoesExtraExist(entity, i)) then
            table.insert(extras, IsVehicleExtraTurnedOn(entity, i))
        end
    end

    return {
		fakePlate			= Entity(entity).state.real_plate ~= nil and GetVehicleNumberPlateText(entity) or nil,
		plate 				= SharedModules.Vehicles:GetRealPlate(entity),
        plateIndex        	= GetVehicleNumberPlateTextIndex(entity),
		model 				= GetEntityModel(entity),

        tankHealth        	= GetVehiclePetrolTankHealth(entity),
        engineHealth      	= GetVehicleEngineHealth(entity),
        bodyHealth        	= GetVehicleBodyHealth(entity),

        fuelLevel         	= ClientModules.Vehicles.Fuel:Get(entity),
        dirtLevel         	= GetVehicleDirtLevel(entity),
        color2           	= colorSecondary,
        color1            	= colorPrimary,

        pearlescentColor  	= pearlescentColor,
        interiorColor     	= interiorColor,
        wheelColor        	= wheelColor,

        rgbcolor2         	= {GetVehicleCustomSecondaryColour(entity)},
        rgbcolor1         	= {GetVehicleCustomPrimaryColour(entity)},
		colortype			= GetVehicleModColor_1(entity, 0),
        colortype2			= GetVehicleModColor_2(entity),

        xenonColor        	= GetVehicleXenonLightsColor(entity),
        windowTint        	= GetVehicleWindowTint(entity),
        wheels            	= GetVehicleWheelType(entity),

        neonEnabled       	= {
            IsVehicleNeonLightEnabled(entity, 0),
            IsVehicleNeonLightEnabled(entity, 1),
            IsVehicleNeonLightEnabled(entity, 2),
            IsVehicleNeonLightEnabled(entity, 3)
        },

        neonColor         	= table.pack(GetVehicleNeonLightsColour(entity)),
        extras            	= extras,

        tyreSmokeColor    	= table.pack(GetVehicleTyreSmokeColor(entity)),

        mods              	= self:GetMods(entity),

		bucket				= Entity(entity).state.bucket,
		windowsBroken		= windowsBroken,
		doorsMissing		= doorsMissing,
		tiresBurst			= tiresBurst,
    }
end

---@param entity number
---@param props VehicleProps
---@param save boolean
function ClientModules.Vehicles.Properties:Set(entity, props, save)
    if (not DoesEntityExist(entity) or not IsEntityAVehicle(entity)) then return end
	if SharedModules.Entities:Control(entity) == false then return end

    if save == nil then save = true end

    local pearlescentColor, wheelColor = GetVehicleExtraColours(entity)
    local colorPrimary, colorSecondary = GetVehicleColours(entity)
	local plate = props.plate

	if props.fakePlate then
		SharedModules.Entities:SetStatebag(entity, "real_plate", plate)
		plate = props.fakePlate
	end

    SetVehicleModKit(entity, 0)

	if props.plate then SetVehicleNumberPlateText(entity, props.plate) end
    if props.plateIndex then SetVehicleNumberPlateTextIndex(entity, props.plateIndex) end
    if props.bodyHealth then SetVehicleBodyHealth(entity, props.bodyHealth + 0.0) end
    if props.engineHealth then SetVehicleEngineHealth(entity, props.engineHealth + 0.0) end
    if props.tankHealth then SetVehiclePetrolTankHealth(entity, props.tankHealth + 0.0) end
    if props.fuelLevel then ClientModules.Vehicles.Fuel:Set(entity, props.fuelLevel + 0.0) end
    if props.dirtLevel then SetVehicleDirtLevel(entity, props.dirtLevel + 0.0) end
    if props.color1 then SetVehicleColours(entity, props.color1, colorSecondary) end
    if props.color2 then SetVehicleColours(entity, props.color1 or colorPrimary, props.color2) end
    if props.interiorColor then SetVehicleInteriorColor(entity, props.interiorColor) end
    if props.wheels then SetVehicleWheelType(entity, props.wheels) end
    if props.windowTint then SetVehicleWindowTint(entity, props.windowTint) end
	if props.colortype then SetVehicleModColor1(entity, props.colortype, 0, props.pearlescentColor) end
    if props.colortype2 then SetVehicleModColor2(entity, props.colortype2, 0) end
    if props.rgbcolor1 then SetVehicleCustomPrimaryColour(entity, props.rgbcolor1[1], props.rgbcolor1[2], props.rgbcolor1[3]) end
	if props.rgbcolor2 then SetVehicleCustomSecondaryColour(entity, props.rgbcolor2[1], props.rgbcolor2[2], props.rgbcolor2[3]) end
    if props.pearlescentColor then SetVehicleExtraColours(entity, props.pearlescentColor, wheelColor) end
    if props.wheelColor then SetVehicleExtraColours(entity, props.pearlescentColor or pearlescentColor, props.wheelColor) end

    if props.neonEnabled then
        SetVehicleNeonLightEnabled(entity, 0, props.neonEnabled[1])
        SetVehicleNeonLightEnabled(entity, 1, props.neonEnabled[2])
        SetVehicleNeonLightEnabled(entity, 2, props.neonEnabled[3])
        SetVehicleNeonLightEnabled(entity, 3, props.neonEnabled[4])
    end

    if props.extras then
        for id,enabled in pairs(props.extras) do
            if enabled then
                SetVehicleExtra(entity, tonumber(id), false)
            else
                SetVehicleExtra(entity, tonumber(id), true)
            end
        end
    end

    if props.neonColor then SetVehicleNeonLightsColour(entity, props.neonColor[1], props.neonColor[2], props.neonColor[3]) end
    if props.xenonColor then SetVehicleXenonLightsColor(entity, props.xenonColor) end
    if props.tyreSmokeColor then SetVehicleTyreSmokeColor(entity, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3]) end

    if props.mods.smokeEnabled ~= nil then ToggleVehicleMod(entity,  20, props.mods.smokeEnabled) end

    if props.mods.spoiler then SetVehicleMod(entity, 0, props.mods.spoiler, false) end
    if props.mods.frontBumper then SetVehicleMod(entity, 1, props.mods.frontBumper, false) end
    if props.mods.rearBumper then SetVehicleMod(entity, 2, props.mods.rearBumper, false) end
    if props.mods.sideSkirt then SetVehicleMod(entity, 3, props.mods.sideSkirt, false) end
    if props.mods.exhaust then SetVehicleMod(entity, 4, props.mods.exhaust, false) end
    if props.mods.frame then SetVehicleMod(entity, 5, props.mods.frame, false) end
    if props.mods.grille then SetVehicleMod(entity, 6, props.mods.grille, false) end
    if props.mods.hood then SetVehicleMod(entity, 7, props.mods.hood, false) end
    if props.mods.fender then SetVehicleMod(entity, 8, props.mods.fender, false) end
    if props.mods.rightFender then SetVehicleMod(entity, 9, props.mods.rightFender, false) end
    if props.mods.roof then SetVehicleMod(entity, 10, props.mods.roof, false) end
    if props.mods.engine then SetVehicleMod(entity, 11, props.mods.engine, false) end
    if props.mods.brakes then SetVehicleMod(entity, 12, props.mods.brakes, false) end
    if props.mods.transmission then SetVehicleMod(entity, 13, props.mods.transmission, false) end
    if props.mods.horns then SetVehicleMod(entity, 14, props.mods.horns, false) end
    if props.mods.suspension then SetVehicleMod(entity, 15, props.mods.suspension, false) end
    if props.mods.armor then SetVehicleMod(entity, 16, props.mods.armor, false) end
    if props.mods.turbo ~= nil then ToggleVehicleMod(entity,  18, props.mods.turbo) end
    if props.mods.xenon ~= nil then ToggleVehicleMod(entity,  22, props.mods.xenon) end
    if props.mods.frontWheels then SetVehicleMod(entity, 23, props.mods.frontWheels, props.mods.customTyres) end
    if props.mods.backWheels then SetVehicleMod(entity, 24, props.mods.backWheels, props.mods.customTyres) end
    if props.mods.plateHolder then SetVehicleMod(entity, 25, props.mods.plateHolder, false) end
    if props.mods.vanityPlate then SetVehicleMod(entity, 26, props.mods.vanityPlate, false) end
    if props.mods.trimA then SetVehicleMod(entity, 27, props.mods.trimA, false) end
    if props.mods.ornaments then SetVehicleMod(entity, 28, props.mods.ornaments, false) end
    if props.mods.dashboard then SetVehicleMod(entity, 29, props.mods.dashboard, false) end
    if props.mods.dial then SetVehicleMod(entity, 30, props.mods.dial, false) end
    if props.mods.doorSpeaker then SetVehicleMod(entity, 31, props.mods.doorSpeaker, false) end
    if props.mods.seats then SetVehicleMod(entity, 32, props.mods.seats, false) end
    if props.mods.steeringWheel then SetVehicleMod(entity, 33, props.mods.steeringWheel, false) end
    if props.mods.shifterLeavers then SetVehicleMod(entity, 34, props.mods.shifterLeavers, false) end
    if props.mods.aPlate then SetVehicleMod(entity, 35, props.mods.aPlate, false) end
    if props.mods.speakers then SetVehicleMod(entity, 36, props.mods.speakers, false) end
    if props.mods.trunk then SetVehicleMod(entity, 37, props.mods.trunk, false) end
    if props.mods.hydrolic then SetVehicleMod(entity, 38, props.mods.hydrolic, false) end
    if props.mods.engineBlock then SetVehicleMod(entity, 39, props.mods.engineBlock, false) end
    if props.mods.airFilter then SetVehicleMod(entity, 40, props.mods.airFilter, false) end
    if props.mods.struts then SetVehicleMod(entity, 41, props.mods.struts, false) end
    if props.mods.archCover then SetVehicleMod(entity, 42, props.mods.archCover, false) end
    if props.mods.aerials then SetVehicleMod(entity, 43, props.mods.aerials, false) end
    if props.mods.trimB then SetVehicleMod(entity, 44, props.mods.trimB, false) end
    if props.mods.tank then SetVehicleMod(entity, 45, props.mods.tank, false) end
    if props.mods.windows then SetVehicleMod(entity, 46, props.mods.windows, false) end

    if props.mods.livery then
        SetVehicleMod(entity, 48, props.mods.livery, false)
    end

	if props.mods.livery2 then
		SetVehicleLivery(entity, props.mods.livery2)
	end

	SetVehicleTyresCanBurst(entity, true)
	for i = 1, #props.tiresBurst, 1 do
		SetVehicleTyreBurst(entity, props.tiresBurst[i][1], props.tiresBurst[i][2], 1000.0)
	end

	for i = 1, #props.windowsBroken, 1 do
		SmashVehicleWindow(entity, props.windowsBroken[i])
	end

    for i = 1, #props.doorsMissing, 1 do
        SetVehicleDoorBroken(entity, props.doorsMissing[i], true)
    end

    if save then
		ClientModules.Vehicles:Synchronize(entity)
    end
end
