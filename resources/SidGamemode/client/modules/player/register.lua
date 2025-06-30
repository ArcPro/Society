local lastLocation = nil

local maxItems = {
    aging = 16,
    beard = 30,
    blemishes = GetPedHeadOverlayNum(0),
    blush = GetPedHeadOverlayNum(5),
    bodyBlemishes = GetPedHeadOverlayNum(12),
    chestHair = GetPedHeadOverlayNum(10),
    complexion = 13,
    eyebrows = GetPedHeadOverlayNum(2),
    eyeColor = 8,
    hair = 345,
    lipstick = 11,
    makeup = 96,
    moleFreckles = 19,
    sunDamage = GetPedHeadOverlayNum(7),
    scalp = #Lists.Scalps,
}

local defaultEyeColor = {
    color = 0,
}

local function GetVariationsList()
	local ped = PlayerPedId()

	return {
        undershirt = GetNumberOfPedDrawableVariations(ped, Lists.Variations.Clothes.UNDERSHIRT),
        glasses = GetNumberOfPedPropDrawableVariations(ped, Lists.Variations.Props.GLASSES),
        pants = GetNumberOfPedDrawableVariations(ped, Lists.Variations.Clothes.PANTS),
        shoes = GetNumberOfPedDrawableVariations(ped, Lists.Variations.Clothes.SHOES),
        tshirt = GetNumberOfPedDrawableVariations(ped, Lists.Variations.Clothes.TSHIRT),
        torso = GetNumberOfPedDrawableVariations(ped, Lists.Variations.Clothes.TORSO),
    }
end

local function FormatScalpList(data)
    local formatted = {}
    for _, v in pairs(data) do
        table.insert(formatted, {
            collection = v.collection,
            zone = v.zoneName,
            male = (v.gender == 0 or v.gender == 2) and v.name or nil,
            female = (v.gender >= 1) and v.name or nil,
        })
    end
    return formatted
end

local function SetDefaultOutfit()
    if player:sex() == "m" then
        player:skin():outfit({
            props = {
                [Lists.Variations.Props.GLASSES]        = {0, 0},
            },
            components = {
                [Lists.Variations.Clothes.UNDERSHIRT]   = {15, 0},
                [Lists.Variations.Clothes.TSHIRT]		= {15, 0},
                [Lists.Variations.Clothes.DECALS]	    = {0, 0},
                [Lists.Variations.Clothes.TORSO]		= {15, 0},
                [Lists.Variations.Clothes.PANTS]		= {37, 0},
                [Lists.Variations.Clothes.SHOES]		= {47, 0},
                [Lists.Variations.Clothes.SCARF]		= {0, 0},
            },
        })
    else
        player:skin():outfit({
            props = {
                [Lists.Variations.Props.GLASSES]        = {15, 0}
            },
            components = {
                [Lists.Variations.Clothes.UNDERSHIRT]   = {15, 0},
                [Lists.Variations.Clothes.TSHIRT]	    = {15, 0},
                [Lists.Variations.Clothes.DECALS]	    = {0, 0},
                [Lists.Variations.Clothes.TORSO]		= {15, 0},
                [Lists.Variations.Clothes.PANTS]	    = {15, 0},
                [Lists.Variations.Clothes.SHOES]	    = {48, 0},
                [Lists.Variations.Clothes.SCARF]	    = {0, 0},
            },
        })
    end
end

local function UpdateIdentity(data)
    if (data.sex ~= nil) then
        player:sex(data.sex == 1 and "F" or "M")
        player:skin():model("mp_".. player:sex() .. "_freemode_01")
        SetDefaultOutfit()
        UI:SendMessage("register:updateList", GetVariationsList())
    elseif (data.firstName ~= nil) then
        player:firstname(data.firstName)
    elseif (data.lastName ~= nil) then
        player:lastname(data.lastName)
    elseif (data.height ~= nil) then
        player:height(data.height)
    elseif (data.weight ~= nil) then
        player:weight(data.weight)
    elseif (data.nationality ~= nil) then
        player:nationality(data.nationality)
    elseif (data.birthDate ~= nil) then
        print('aa')
        print(json.encode(data))
        print('aa')
        player:birthdate(data.birthDate)
    end
end

local function UpdateSkin(data)
    for key, value in pairs(data) do
		if player:skin()[key] then
			player:skin()[key](player:skin(), value)
		end
    end
end

local function UpdateTattoos(data)
    local tattoos = {}

    if (data.tattooed_eyes == true) then
        player:skin():eyeColor({
            color = 26
        })
    elseif (data.tattooed_eyes == false) then
        player:skin():eyeColor(defaultEyeColor)
    end

    if (data.selected == nil) then
        return
    end

    for _, v in pairs(data.selected) do
        for _,t in pairs(Lists.Tattoos) do
            if (t[player:sex() == "m" and "male" or "female"] == v) then
                table.insert(tattoos, t)
                break
            end
        end
    end

    player:skin():tattoos(tattoos, player:sex() == "m" and "male" or "female")
end

local function UpdateOutfit(data)
	local ped = PlayerPedId()

    player:skin():outfit({
        props = {
            [Lists.Variations.Props.GLASSES]        = {data.glasses.component, data.glasses.variation},
        },
        components = {
            [Lists.Variations.Clothes.UNDERSHIRT]   = {data.undershirt.component, data.undershirt.variation},
            [Lists.Variations.Clothes.TSHIRT]       = {data.tshirt.component, data.tshirt.variation},
            [Lists.Variations.Clothes.TORSO]		= {data.torso.component, data.torso.variation},
            [Lists.Variations.Clothes.PANTS]		= {data.pants.component, data.pants.variation},
            [Lists.Variations.Clothes.SHOES]		= {data.shoes.component, data.shoes.variation},
        }
    })

	UI:SendMessage("register:updateVariations", {
		variations = {
			undershirt = GetNumberOfPedTextureVariations(ped, Lists.Variations.Clothes.UNDERSHIRT, data.undershirt.component),
			glasses = GetNumberOfPedPropTextureVariations(ped, Lists.Variations.Props.GLASSES, data.glasses.component),
			torso = GetNumberOfPedTextureVariations(ped, Lists.Variations.Clothes.TORSO, data.torso.component),
			pants = GetNumberOfPedTextureVariations(ped, Lists.Variations.Clothes.PANTS, data.pants.component),
			shoes = GetNumberOfPedTextureVariations(ped, Lists.Variations.Clothes.SHOES, data.shoes.component),
			tshirt = GetNumberOfPedTextureVariations(ped, Lists.Variations.Clothes.TSHIRT, data.tshirt.component),
		}
	})
end

local function Register()
    local plyCoords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    lastLocation = vector4(plyCoords, heading)
    local currentSkin = player:skin()

    local data = {
        identity = {
            sex = player:sex(),
            firstName = player:firstname(),
            lastName = player:lastname(),
            height = player:height(),
            weight = player:weight(),
            nationality = player:nationality(),
            birthDate = player:birthdate(),
        },
        heritage = {
            mother = currentSkin:mother(),
            father = currentSkin:father(),
            similarity = currentSkin:similarity(),
            skinSimilarity = currentSkin:skinSimilarity(),
        },
        face = {
            brow = currentSkin:brow(),
            eyes = currentSkin:eyes(),
            nose = currentSkin:nose(),
            noseProfile = currentSkin:noseProfile(),
            noseTip = currentSkin:noseTip(),
            cheekbones = currentSkin:cheekbones(),
            cheeks = currentSkin:cheeks(),
            lips = currentSkin:lips(),
            jaw = currentSkin:jaw(),
            chinProfile = currentSkin:chinProfile(),
            chinShape = currentSkin:chinShape(),
        },
        appearance = {
            scalps = FormatScalpList(Lists.Scalps),
            maxItems = maxItems,
            aging = currentSkin:aging(),
            beard = currentSkin:beard(),
            blush = currentSkin:blush(),
            blemishes = currentSkin:blemishes(),
            bodyBlemishes = currentSkin:bodyBlemishes(),
            chestHair = currentSkin:chestHair(),
            complexion = currentSkin:complexion(),
            eyebrows = currentSkin:eyebrows(),
            eyeColor = currentSkin:eyeColor(),
            hair = currentSkin:hair(),
            lipstick = currentSkin:lipstick(),
            makeup = currentSkin:makeup(),
            moleFreckles = currentSkin:moleFreckles(),
            sunDamage = currentSkin:sunDamage(),
            scalp = currentSkin:scalp(),
        },
        tattoos = {
            list = Lists.Tattoos,
            selected = {},
            tattooed_eyes = false,
        },
        outfit = {
            list = GetVariationsList(),
            selected = {
                glasses = {
                    component = 0,
                    variation = 0,
                },
                tshirt = {
                    component = 0,
                    variation = 0,
                },
                undershirt = {
                    component = 0,
                    variation = 0,
                },
                torso = {
                    component = 0,
                    variation = 0,
                },
                pants = {
                    component = 0,
                    variation = 0,
                },
                shoes = {
                    component = 0,
                    variation = 0,
                },
            },
        },
    }

    local disableSecondaryTask = false

    local cams = {
        face = {
            position = vector3(402.92, -1000.72, -98.45),
            fov = 10.0,
        },
        torso = {
            position = vector3(402.92, -1000.72, -99.01),
            fov = 30.0,
        },
        legs = {
            position = vector3(402.92, -1000.72, -99.51),
            fov = 20.0,
        }
    }

    local camera = Camera:new({
        name = "skinchanger",
        position = cams.torso.position,
        fov = cams.torso.fov,
        rotation = vector3(0.0, 0.0, 0.0),
    })

    math.randomseed(GetGameTimer())

    LocalPlayer.state:set("freecam", true, true)

	player:skin():model("mp_m_freemode_01")

	UpdateIdentity(data.identity)
	UpdateSkin(data.appearance)
	UpdateSkin(data.heritage)
	UpdateSkin(data.face)
	UpdateTattoos(data.tattoos)
	UpdateOutfit(data.outfit.selected)

    player:position(vector4(402.9032, -996.864, -100.0, 174.2165), true)
    camera:render()
    SetDefaultOutfit()
    ClientModules.Misc.Animations:ResetClipset(true)
    SetPedCanPlayAmbientAnims(PlayerPedId(), false)
    ToggleRadar(false)

    disableSecondaryTask = true

    Citizen.CreateThread(function()
        local ped = PlayerPedId()
        while disableSecondaryTask do
            Citizen.Wait(500)
            ClearPedSecondaryTask(ped)
        end
    end)

    UI:Toggle("register", true, data, true, false)

    Citizen.Wait(1000)

    if Math.Distance(player:position(), vector3(402.9032, -996.864, -100.0)) > 0.02 then
        player:position(vector4(402.9032, -996.864, -100.0, 174.2165), true)
    end

    Events.TriggerServer("bucket:change", GetPlayerServerId(PlayerId()) + 50)

    UI:RegisterCallback("register:updateSkin", function(_data)
        if (_data.category == "identity") then
            UpdateIdentity(_data.props)
        elseif (_data.category == "heritage") then
            UpdateSkin(_data.props)
        elseif (_data.category == "face") then
            UpdateSkin(_data.props)
        elseif (_data.category == "appearance") then
            UpdateSkin(_data.props)
        elseif (_data.category == "tattoos") then
            UpdateTattoos(_data.props)
        elseif (_data.category == "outfit") then
            UpdateOutfit(_data.props.selected)
        end
    end)

    UI:RegisterCallback("register:rotateSkin", function(rotation)
        player:heading(player:heading() + rotation, true)
    end)

    UI:RegisterCallback("register:useCamera", function(cam)
        camera:position(cams[cam].position)
        camera:fov(cams[cam].fov)
    end)

    UI:RegisterCallback("register:validate", function()
        disableSecondaryTask = false
        player:position(lastLocation, false)

        UI:Toggle("register", false, {}, false, false)

        DoScreenFadeOut(1000)

        while not IsScreenFadedOut() do
            Citizen.Wait(50)
        end

        camera:destroy()
        SetPedCanPlayAmbientAnims(PlayerPedId(), true)
        ToggleRadar(true)

	    Events.TriggerServer("player:update", "metadata", player:metadata(), player:source())
        Events.TriggerServer("player:updateSkin", "outfit", player:skin():outfit(), player:source())
        Events.TriggerServer("player:updateSkin", "tattoos", player:skin():tattoos(), player:source())
        Events.TriggerServer('player:updateSkin', 'model', player:skin():model(), player:source())
        Events.TriggerServer("player:updateSkin", "eyebrows", player:skin():eyebrows(), player:source())
        Events.TriggerServer("player:updateSkin", "beard", player:skin():beard(), player:source())
        Events.TriggerServer("player:updateSkin", "scalp", player:skin():scalp(), player:source())
        Events.TriggerServer("player:updateSkin", "hair", player:skin():hair(), player:source())
        Events.TriggerServer("player:updateCharacter", player)
        Events.TriggerServer("player:update", "firstname", player:firstname(), player:source())
        Events.TriggerServer("player:update", "lastname", player:lastname(), player:source())
        Events.TriggerServer("player:update", "birthdate", player:birthdate(), player:source())
        Events.TriggerServer("player:update", "height", player:height(), player:source())
        Events.TriggerServer("player:update", "weight", player:weight(), player:source())
        Events.TriggerServer("player:update", "nationality", player:nationality(), player:source())
        Events.TriggerServer("player:update", "health", 100, player:source())
        Events.TriggerServer("player:update", "hunger", 100, player:source())
        Events.TriggerServer("player:update", "thirst", 100, player:source())
        Events.TriggerServer("player:update", "metadata", player:metadata(), player:source())
        Events.TriggerServer("player:update", "group", player:group(), player:source())

        Core.Player:Load()

        player:position(lastLocation, true)

        DoScreenFadeIn(1000)

		while not IsScreenFadedIn() do
			Citizen.Wait(100)
		end

        LocalPlayer.state:set("freecam", false, true)
    end)
end

Events.Register("register:toggle", Register)
