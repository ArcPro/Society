Config = Config or {}
Config.VehicleFailure = {
    deformationMultiplier = -1,					-- How much should the vehicle visually deform from a collision. Range 0.0 to 10.0 Where 0.0 is no deformation and 10.0 is 10x deformation. -1 = Don't touch. Visual damage does not sync well to other players.
    deformationExponent = 0.4,					-- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
    collisionDamageExponent = 0.6,				-- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.

    damageFactorEngine = 2.0,					-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
    damageFactorBody = 3.0,						-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
    damageFactorPetrolTank = 48.0,				-- Sane values are 1 to 200. Higher values means more damage to vehicle. A good starting point is 64
    engineDamageExponent = 0.6,					-- How much should the handling file engine damage setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
    weaponsDamageMultiplier = 2.0,				-- How much damage should the vehicle get from weapons fire. Range 0.0 to 10.0, where 0.0 is no damage and 10.0 is 10x damage. -1 = don't touch
    degradingHealthSpeedFactor = 10,			-- Speed of slowly degrading health, but not failure. Value of 10 means that it will take about 0.25 second per health point, so degradation from 800 to 305 will take about 2 minutes of clean driving. Higher values means faster degradation
    cascadingFailureSpeedFactor = 8.0,			-- Sane values are 1 to 100. When vehicle health drops below a certain point, cascading failure sets in, and the health drops rapidly until the vehicle dies. Higher values means faster failure. A good starting point is 8

    degradingFailureThreshold = 800.0,			-- Below this value, slow health degradation will set in
    cascadingFailureThreshold = 360.0,			-- Below this value, health cascading failure will set in
    engineSafeGuard = 100.0,					-- Final failure value. Set it too high, and the vehicle won't smoke when disabled. Set too low, and the car will catch fire from a single bullet to the engine. At health 100 a typical car can take 3-4 bullets to the engine before catching fire.

    torqueMultiplierEnabled = true,				-- Decrease engine torque as engine gets more and more damaged

    disableAirControl = true,					-- If true, you can't turn over an upside down vehicle

    -- Class Damagefactor Multiplier
    -- The damageFactor for engine, body and Petroltank will be multiplied by this value, depending on vehicle class
    -- Use it to increase or decrease damage for each class
    classDamageMultiplier = {
        [0] = 	0.75,		--	0: Compacts
        0.75,		--	1: Sedans
        0.75,		--	2: SUVs
        0.75,		--	3: Coupes
        0.75,		--	4: Muscle
        0.75,		--	5: Sports Classics
        0.75,		--	6: Sports
        0.75,		--	7: Super
        0.25,		--	8: Motorcycles
        0.7,		--	9: Off-road
        0.25,		--	10: Industrial
        0.75,		--	11: Utility
        0.75,		--	12: Vans
        0.75,		--	13: Cycles
        0.5,		--	14: Boats
        0.75,		--	15: Helicopters
        0.75,		--	16: Planes
        0.75,		--	17: Service
        0.75,		--	18: Emergency
        0.75,		--	19: Military
        0.75,		--	20: Commercial
        0.75			--	21: Trains
    }
}
