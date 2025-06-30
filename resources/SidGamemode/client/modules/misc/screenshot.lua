Screenshot = {}
Screenshot.isThreadRunning = false
Screenshot.ped = nil
Screenshot.imagePath = ""

function Screenshot.Variation(componentId, drawable, variation)
	SetPedComponentVariation(Screenshot.ped, componentId, drawable, variation, 0)
end

function Screenshot.InitPlayerAndCamera(fov, rotation, zOffset, sex, disableHead)
	player:skin():model(("mp_%s_freemode_01"):format(sex))

	Citizen.Wait(500)

	Screenshot.ped = PlayerPedId()

	if disableHead == true then
		Screenshot.Variation(0, -1)
	else
		player:skin():mother(0)
	end

	SetEntityCoords(Screenshot.ped, -563.891907, -936.667480, 23.869650, true, false, false, false)
	SetEntityHeading(Screenshot.ped, 57.703297)
	FreezeEntityPosition(Screenshot.ped, true)

	local coords = GetEntityCoords(Screenshot.ped, true)
	coords = vector3(coords.x, coords.y, coords.z + zOffset)

	local cam = Camera:new({
		position = coords + GetEntityForwardVector(Screenshot.ped) * 2.0,
		fov = fov,
	})

	SetEntityHeading(Screenshot.ped, 57.703297 + rotation)

	cam:focus(coords)
	cam:render()
end

Screenshot.invisibleDrawables = {
	["m"] = {
		mask = 0,
		hair = 0,
		torso = 3,
		pants = 11,
		backpack = 0,
		shoes = 13,
		scarf = 0,
		undershirt = 15,
		kevlar = 0,
		tshirt = 15,
		hat = -1,
		glasses = -1,
		ears = -1,
		watch = -1,
		bracelet = -1,
		decals = 0,
	},

	["f"] = {
		mask = 0,
		hair = 0,
		torso = 8,
		pants = 13,
		backpack = 0,
		shoes = 34,
		scarf = 0,
		undershirt = 2,
		kevlar = 0,
		tshirt = 82,
		hat = -1,
		glasses = -1,
		ears = -1,
		watch = -1,
		bracelet = -1,
		decals = 0,
	}
}

Screenshot.startIndexes = {
	["f"] = {
		backpack = 211,
		bracelet = 21,
		decals = 267,
		ears = 36,
		glasses = 99,
		hair = 297,
		hat = 293,
		kevlar = 177,
		mask = 293,
		pants = 399,
		scarf = 268,
		shoes = 235,
		torso = 278,
		tshirt = 800,
		undershirt = 415,
		watch = 38,
	},

	["m"] = {
		backpack = 217,
		bracelet = 13,
		decals = 240,
		ears = 72,
		glasses = 90,
		hair = 263,
		hat = 327,
		kevlar = 167,
		mask = 311,
		pants = 342,
		scarf = 303,
		shoes = 191,
		torso = 233,
		tshirt = 740,
		undershirt = 346,
		watch = 58,
	}
}


Screenshot.Cameras = {
	head = function(sex, disableHead, useHeading)
		Screenshot.InitPlayerAndCamera(15.0, useHeading == true and 30.0 or 0.0, 0.7, sex, disableHead)
		Screenshot.Variation(3, Screenshot.invisibleDrawables[sex].torso)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
		Screenshot.Variation(8, Screenshot.invisibleDrawables[sex].undershirt)
		Screenshot.Variation(11, Screenshot.invisibleDrawables[sex].tshirt)
	end,

	torso = function(sex)
		Screenshot.InitPlayerAndCamera(35.0, 0.0, 0.2, sex, true)
	end,

	legs = function(sex)
		Screenshot.InitPlayerAndCamera(35.0, 0.0, -0.5, sex, false)
		Screenshot.Variation(3, Screenshot.invisibleDrawables[sex].torso)
		Screenshot.Variation(8, Screenshot.invisibleDrawables[sex].undershirt)
		Screenshot.Variation(11, Screenshot.invisibleDrawables[sex].tshirt)
	end,

	feet = function(sex)
		Screenshot.InitPlayerAndCamera(15.0, 30.0, -0.9, sex, false)
	end,

	left_wrist = function(sex)
		Screenshot.InitPlayerAndCamera(15.0, -90.0, 0.0, sex, false)
	end,

	right_wrist = function(sex)
		Screenshot.InitPlayerAndCamera(15.0, 90.0, 0.0, sex, false)
	end
}

Screenshot.Presets = {
	mask = function(sex)
		Screenshot.Cameras.head(sex, true, true)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
	end,

	hair = function(sex)
		Screenshot.Cameras.head(sex, false, true)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
	end,

	torso = function(sex)
		Screenshot.Cameras.torso(sex)
		Screenshot.Variation(4, Screenshot.invisibleDrawables[sex].pants)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
		Screenshot.Variation(8, Screenshot.invisibleDrawables[sex].undershirt)
		Screenshot.Variation(11, Screenshot.invisibleDrawables[sex].tshirt)
	end,

	pants = function(sex)
		Screenshot.Cameras.legs(sex)
		Screenshot.Variation(3, Screenshot.invisibleDrawables[sex].torso)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
		Screenshot.Variation(8, Screenshot.invisibleDrawables[sex].undershirt)
		Screenshot.Variation(11, Screenshot.invisibleDrawables[sex].tshirt)
	end,

	backpack = function(sex)
		Screenshot.Cameras.torso(sex)
		Screenshot.Variation(3, Screenshot.invisibleDrawables[sex].torso)
		Screenshot.Variation(4, Screenshot.invisibleDrawables[sex].pants)
		Screenshot.Variation(8, Screenshot.invisibleDrawables[sex].undershirt)
		Screenshot.Variation(11, Screenshot.invisibleDrawables[sex].tshirt)
	end,

	shoes = function(sex)
		Screenshot.Cameras.feet(sex)
		Screenshot.Variation(4, Screenshot.invisibleDrawables[sex].pants)
	end,

	scarf = function(sex)
		Screenshot.Cameras.torso(sex)
		Screenshot.Variation(3, Screenshot.invisibleDrawables[sex].torso)
		Screenshot.Variation(4, Screenshot.invisibleDrawables[sex].pants)
		Screenshot.Variation(8, Screenshot.invisibleDrawables[sex].undershirt)
		Screenshot.Variation(11, Screenshot.invisibleDrawables[sex].tshirt)
	end,

	undershirt = function(sex)
		Screenshot.Cameras.torso(sex)
		Screenshot.Variation(3, Screenshot.invisibleDrawables[sex].torso)
		Screenshot.Variation(4, Screenshot.invisibleDrawables[sex].pants)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
		Screenshot.Variation(11, Screenshot.invisibleDrawables[sex].tshirt)
	end,

	kevlar = function(sex)
		Screenshot.Cameras.torso(sex)
		Screenshot.Variation(3, Screenshot.invisibleDrawables[sex].torso)
		Screenshot.Variation(4, Screenshot.invisibleDrawables[sex].pants)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
		Screenshot.Variation(8, Screenshot.invisibleDrawables[sex].undershirt)
		Screenshot.Variation(11, Screenshot.invisibleDrawables[sex].tshirt)
	end,

	tshirt = function(sex)
		Screenshot.Cameras.torso(sex)
		Screenshot.Variation(3, Screenshot.invisibleDrawables[sex].torso)
		Screenshot.Variation(4, Screenshot.invisibleDrawables[sex].pants)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
		Screenshot.Variation(8, Screenshot.invisibleDrawables[sex].undershirt)
	end,

	decals = function(sex)
		Screenshot.Cameras.torso(sex)
		Screenshot.Variation(3, Screenshot.invisibleDrawables[sex].torso)
		Screenshot.Variation(4, Screenshot.invisibleDrawables[sex].pants)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
		Screenshot.Variation(8, Screenshot.invisibleDrawables[sex].undershirt)
		Screenshot.Variation(11, Screenshot.invisibleDrawables[sex].tshirt)
		Screenshot.Variation(10, Screenshot.invisibleDrawables[sex].decals)
	end,

	hat = function(sex)
		Screenshot.Cameras.head(sex, true, true)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
	end,

	glasses = function(sex)
		Screenshot.Cameras.head(sex, true, true)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
	end,

	ears = function(sex)
		Screenshot.Cameras.head(sex, true, false)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
	end,

	watch = function(sex)
		Screenshot.Cameras.left_wrist(sex)
		Screenshot.Variation(3, Screenshot.invisibleDrawables[sex].torso)
		Screenshot.Variation(4, Screenshot.invisibleDrawables[sex].pants)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
		Screenshot.Variation(8, Screenshot.invisibleDrawables[sex].undershirt)
		Screenshot.Variation(11, Screenshot.invisibleDrawables[sex].tshirt)
	end,

	bracelet = function(sex)
		Screenshot.Cameras.right_wrist(sex)
		Screenshot.Variation(3, Screenshot.invisibleDrawables[sex].torso)
		Screenshot.Variation(4, Screenshot.invisibleDrawables[sex].pants)
		Screenshot.Variation(6, Screenshot.invisibleDrawables[sex].shoes)
		Screenshot.Variation(8, Screenshot.invisibleDrawables[sex].undershirt)
		Screenshot.Variation(11, Screenshot.invisibleDrawables[sex].tshirt)
	end,
}

function Screenshot.Take(sex, category, isProp, categoryName)
    local max = GetNumberOfPedDrawableVariations(Screenshot.ped, category)

	if isProp == true then
		max = GetNumberOfPedPropDrawableVariations(Screenshot.ped, category)
	end

    local i = Screenshot.startIndexes[sex][categoryName];
    while i <= max do

		local variations = GetNumberOfPedTextureVariations(Screenshot.ped, category, i)

		if isProp == true then
			variations = GetNumberOfPedPropTextureVariations(Screenshot.ped, category, i)
		end

		local j = 0;

		if categoryName == "hair" then
			variations = 1
		end

		while j <= variations - 1 do
			if isProp == false then
				Screenshot.Variation(category, Screenshot.invisibleDrawables[sex][categoryName], 0)
				Screenshot.Variation(category, i, j)
			else
				ClearAllPedProps(Screenshot.ped)
				SetPedPropIndex(Screenshot.ped, category, i, j, false)
			end

			Utils.RealWait(250)

			Callbacks.Trigger("screen", ("%s%d_%d"):format(Screenshot.imagePath, i, j))

			Utils.RealWait(250)

			j += 1
		end

		i += 1
    end
end

function Screenshot.UseCamera(key)
	Screenshot.Presets[key]()
end

function Screenshot.DisableUndesiredPedActions()

	if Screenshot.isThreadRunning == true then return end

	Citizen.CreateThread(function()
		Screenshot.isThreadRunning = true

		while Screenshot.isThreadRunning == true do
			ClearPedTasks(Screenshot.ped)
			Citizen.Wait(0)
		end

		Screenshot.isThreadRunning = false
	end)
end

function Screenshot.Start(category, isProp, sex)
	Screenshot.imagePath = ("screenshot/%s/%s/"):format(sex, category)
	Screenshot.Presets[category](sex)
	Screenshot.DisableUndesiredPedActions()
	Screenshot.Take(sex, isProp and Lists.Variations.Props[category:upper()] or Lists.Variations.Clothes[category:upper()], isProp, category)
end

function Screenshot.AutomaticMode()
	for preset, _ in pairs(Screenshot.Presets) do
		Screenshot.Start(preset, Screenshot.invisibleDrawables["m"][preset] == -1, "m")
		Screenshot.Start(preset, Screenshot.invisibleDrawables["f"][preset] == -1, "f")
	end

	player:skin():model("mp_m_freemode_01")
	ClientModules.Misc.Animations:Play("thumbsup")
	Screenshot.Cameras.torso("m")
end
