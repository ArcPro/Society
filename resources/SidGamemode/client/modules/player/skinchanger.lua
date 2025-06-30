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
        UI:SendMessage("skin_creator:updateList", GetVariationsList())
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

	UI:SendMessage("skin_creator:updateVariations", {
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

local function SkinChanger()
    local data = {
        identity = {
            sex = 0,
            firstName = '',
            lastName = '',
            height = 0,
            weight = 0,
            nationality = '',
            birthDate = '',
        },
        heritage = {
            mother = 21,
            father = 0,
            similarity = 0.5,
            skinSimilarity = 0.5,
        },
        face = {
            brow = { x = 0, y = 0 },
            eyes = { x = 0 },
            nose = { x = 0, y = 0 },
            noseProfile = { x = 0, y = 0 },
            noseTip = { x = 0, y = 0 },
            cheekbones = { x = 0, y = 0 },
            cheeks = { x = 0 },
            lips = { x = 0 },
            jaw = { x = 0, y = 0 },
            chinProfile = { x = 0, y = 0 },
            chinShape = { x = 0, y = 0 },
        },
        appearance = {
            scalps = FormatScalpList(Lists.Scalps),
            maxItems = {
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
            },
            aging = {
                component = 0,
                opacity = 0.0,
            },
            beard = {
                component = 0,
                color = 0,
                opacity = 0.0,
            },
            blush = {
                component = 0,
                color = 0,
                opacity = 0.0,
            },
            blemishes = {
                component = 0,
                opacity = 0.0,
            },
            bodyBlemishes = {
                component = 0,
                opacity = 0.0,
            },
            chestHair = {
                component = 0,
                color = 0,
                opacity = 0.0,
            },
            complexion = {
                component = 0,
                opacity = 0.0,
            },
            eyebrows = {
                component = 0,
                color = 0,
                opacity = 1.0,
            },
            eyeColor = {
                color = 0,
            },
            hair = {
                component = 0,
                color = 0,
                highlightColor = 0,
            },
            lipstick = {
                component = 0,
                color = 0,
                opacity = 0.0,
            },
            makeup = {
                component = 0,
                color = 0,
                opacity = 0.0,
            },
            moleFreckles = {
                component = 0,
                opacity = 0.0,
            },
            sunDamage = {
                component = 0,
                opacity = 0.0,
            },
            scalp = {
                component = 0,
                opacity = 0.0,
            },
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

    local spawns = {
        ["LSIA"] = vector4(-1068.27, -2807.74, 21.36, 331.20),
        ["M�tro"] = vector4(-274.77, -305.6913, 18.29, 295.736),
        ["Bolingbroke"] = vector4(1858.8, 2587.5, 45.7, 90.14),
        ["Grapeseed"] = vector4(1718.49, 4791.88, 41.98, 270.24),
        ["Paleto Bay"] = vector4(-1598.62, 5206.03, 4.31, 300.97),

    }
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

    UI:Toggle("skin_creator", true, data, true, false)

    Citizen.Wait(1000)

    if Math.Distance(player:position(), vector3(402.9032, -996.864, -100.0)) > 0.02 then
        player:position(vector4(402.9032, -996.864, -100.0, 174.2165), true)
    end

    Events.TriggerServer("bucket:change", GetPlayerServerId(PlayerId()) + 50)

    UI:RegisterCallback("skin_creator:updateSkin", function(_data)
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

    UI:RegisterCallback("skin_creator:rotateSkin", function(rotation)
        player:heading(player:heading() + rotation, true)
    end)

    UI:RegisterCallback("skin_creator:useCamera", function(cam)
        camera:position(cams[cam].position)
        camera:fov(cams[cam].fov)
    end)

    UI:RegisterCallback("skin_creator:validate", function(spawn)
        disableSecondaryTask = false
        player:position(spawns[spawn], false)

        local id = Callbacks.Trigger("player:create", player)

        if id == nil then
            return
        end

        player:id(id)
        UI:Toggle("skin_creator", false, {}, false, false)

        DoScreenFadeOut(1000)

        while not IsScreenFadedOut() do
            Citizen.Wait(50)
        end

        camera:destroy()
        SetPedCanPlayAmbientAnims(PlayerPedId(), true)
        ToggleRadar(true)
        Core.Player:Load()

        Citizen.Wait(1000)

        Events.TriggerServer("bucket:change", 1)
        player:position(spawns[spawn], true)

        player:health(100)
        player:hunger(100)
        player:thirst(100)
        player:armor(0)

        DoScreenFadeIn(1000)

		while not IsScreenFadedIn() do
			Citizen.Wait(100)
		end

        LocalPlayer.state:set("freecam", false, true)

        UI:AddNotification("basic", "Bienvenue sur San Andreas Stories !", "San Andreas Stories", 5000)

		player:inventory():addItem(Item.Create("money", {}, SharedModules.Variables:Get("global", "start_money") or 0))
        player:inventory():addItem(Item.Create("sandwich", {}, 10))
        player:inventory():addItem(Item.Create("water", {}, 10))
        player:inventory():addItem(Item.Create("phone", {}, 1))
        player:inventory():addItem(Item.Create("bmx", {}, 1))

		player:inventory():addItem(Item.Create('id_card', {
			birthdate = player:birthdate(),
			firstname = player:firstname(),
			lastname = player:lastname(),
			name = "Carte d'identité",
			height = player:height(),
			weight = player:weight(),
			photo = CharacterPhoto(),
			isDriverLicense = false,
			sex = player:sex(),
		}, 1))

    end)
end

Events.Register("skinchanger:new", SkinChanger)
