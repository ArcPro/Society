if Config.Env == "client" then

	local function compareOutfitPart(t1, t2, prop)
		if t1 == nil or t1[prop] == nil then
			return true
		end

		return t1[prop][1] ~= t2[1] or t1[prop][2] ~= t2[2]
	end

    function SetHeadBlendData(skin, id)

        if id == nil then
            id = PlayerPedId()
        end

        SetPedHeadBlendData(id, skin._mother, skin._father, 0, skin._mother, skin._father, 0, skin._similarity + .0, skin._skinSimilarity + .0, 0.0, false)
    end

    function SetFaceFeature(skin, ped)

        if ped == nil then
            ped = PlayerPedId()
        end

        SetPedFaceFeature(ped, 0, skin._nose.x + .0)
        SetPedFaceFeature(ped, 1, skin._nose.y + .0)
        SetPedFaceFeature(ped, 2, skin._noseProfile.x * -1 + .0)
        SetPedFaceFeature(ped, 3, skin._noseProfile.y + .0)
        SetPedFaceFeature(ped, 4, skin._noseTip.y + .0)
        SetPedFaceFeature(ped, 5, skin._noseTip.x + .0)
        SetPedFaceFeature(ped, 6, skin._brow.y + .0)
        SetPedFaceFeature(ped, 7, skin._brow.x + .0)
        SetPedFaceFeature(ped, 8, skin._cheekbones.y + .0)
        SetPedFaceFeature(ped, 9, skin._cheekbones.x + .0)
        SetPedFaceFeature(ped, 10, skin._cheeks.x * -1 + .0)
        SetPedFaceFeature(ped, 11, skin._eyes.x * -1 + .0)
        SetPedFaceFeature(ped, 12, skin._lips.x * -1 + .0)
        SetPedFaceFeature(ped, 13, skin._jaw.x + .0)
        SetPedFaceFeature(ped, 14, skin._jaw.y + .0)
        SetPedFaceFeature(ped, 15, skin._chinProfile.y + .0)
        SetPedFaceFeature(ped, 16, skin._chinProfile.x + .0)
        SetPedFaceFeature(ped, 17, skin._chinShape.x * -1 + .0)
        SetPedFaceFeature(ped, 18, skin._chinShape.y + .0)
    end

    function SetHeadOverlay(skin, ped)

        if ped == nil then
            ped = PlayerPedId()
        end

		if skin._hair.isTied == true then
			SetPedComponentVariation(ped, 2, skin._hair.tiedComponent, 0, 2)
		else
			SetPedComponentVariation(ped, 2, skin._hair.component, 0, 2)
		end

        SetPedHairColor(ped, skin._hair.color, skin._hair.highlightColor)

        SetPedHeadOverlay(ped, 0, skin._blemishes.component, skin._blemishes.opacity + .0)
        SetPedHeadOverlay(ped, 1, skin._beard.component, skin._beard.opacity + .0)
        SetPedHeadOverlayColor(ped, 1, 1, skin._beard.color, skin._beard.color)
        SetPedHeadOverlay(ped, 2, skin._eyebrows.component, skin._eyebrows.opacity + .0)
        SetPedHeadOverlayColor(ped, 2, 1, skin._eyebrows.color, skin._eyebrows.color)
        SetPedHeadOverlay(ped, 3, skin._aging.component, skin._aging.opacity + .0)
        SetPedHeadOverlay(ped, 4, skin._makeup.component, skin._makeup.opacity + .0)
        -- print(skin._makeup.color2)
        SetPedHeadOverlayColor(ped, 4, 1, skin._makeup.color, skin._makeup.color)
        -- SetPedHeadOverlayColor(ped, 4, 1, skin._makeup.color2, skin._makeup.color2)
        SetPedHeadOverlay(ped, 5, skin._blush.component, skin._blush.opacity + .0)
        SetPedHeadOverlayColor(ped, 5, 2, skin._blush.color, skin._blush.color)
        SetPedHeadOverlay(ped, 6, skin._complexion.component, skin._complexion.opacity + .0)
        SetPedHeadOverlay(ped, 7, skin._sunDamage.component, skin._sunDamage.opacity + .0)
        SetPedHeadOverlay(ped, 8, skin._lipstick.component, skin._lipstick.opacity + .0)
        SetPedHeadOverlayColor(ped, 8, 2, skin._lipstick.color, skin._lipstick.color)
        SetPedHeadOverlay(ped, 9, skin._moleFreckles.component, skin._moleFreckles.opacity + .0)
        SetPedHeadOverlay(ped, 10, skin._chestHair.component, skin._chestHair.opacity + .0)
        SetPedHeadOverlayColor(ped, 10, 1, skin._chestHair.color, skin._chestHair.color)
        SetPedHeadOverlay(ped, 11, skin._bodyBlemishes.component, skin._bodyBlemishes.opacity + .0)
    end

    function SetOutfit(oldOutfit, newOutfit, ped)

        if ped == nil then
            ped = PlayerPedId()
        end

        for k, v in pairs(newOutfit.props) do
            if v ~= nil and compareOutfitPart(oldOutfit.props, v, k) then
                if v[1] == -1 then
                    ClearPedProp(ped, tonumber(k))
                else
                    SetPedPropIndex(ped, tonumber(k), v[1], v[2], true)
                end
				Citizen.Wait(0)
            end
        end

        for k, v in pairs(newOutfit.components) do
            if v ~= nil and compareOutfitPart(oldOutfit.components, v, k) then
                SetPedComponentVariation(ped, tonumber(k), v[1], v[2], 0)
				Citizen.Wait(0)
            end
        end
    end
else
    function SetHeadBlendData(skin)end
    function SetFaceFeature(skin)end
    function SetHeadOverlay(skin)end
    function SetOutfit(outfit)end
end

---@class Skin
---@field _model string
---@field private _mother number
---@field private _father number
---@field private _similarity number
---@field private _skinSimilarity number
---@field private _brow { x: number, y: number }
---@field private _eyes { x: number }
---@field private _nose { x: number, y: number }
---@field private _noseProfile { x: number, y: number }
---@field private _noseTip { x: number, y: number }
---@field private _cheekbones { x: number, y: number }
---@field private _cheeks { x: number }
---@field private _lips { x: number }
---@field private _jaw { x: number, y: number }
---@field private _chinProfile { x: number, y: number }
---@field private _chinShape { x: number, y: number }
---@field private _aging { component: number, opacity: number }
---@field private _beard { component: number, opacity: number, color: number }
---@field private _blemishes { component: number, opacity: number }
---@field private _blush { component: number, opacity: number, color: number }
---@field private _bodyBlemishes { component: number, opacity: number }
---@field private _chestHair { component: number, opacity: number, color: number }
---@field private _complexion { component: number, opacity: number }
---@field private _eyebrows { component: number, opacity: number, color: number }
---@field private _eyeColor { color: number }
---@field private _hair { component: number, tiedComponent: number, opacity: number, color: number, highlightColor: number, isTied: boolean }
---@field private _lipstick { component: number, opacity: number, color: number }
---@field private _makeup { component: number, opacity: number, color: number }
---@field private _moleFreckles { component: number, opacity: number }
---@field private _sunDamage { component: number, opacity: number }
---@field private _scalp { component: number }
---@field private _outfit table
---@field _tattoos table
Skin = {
    -- Model
    _model = "mp_m_freemode_01",

    -- Heritage
    _mother = 0,
    _father = 0,
    _similarity = .5,
    _skinSimilarity = .5,

    -- Face
    _brow = { x = 0, y = 0 },
    _eyes = { x = 0 },
    _nose = { x = 0, y = 0 },
    _noseProfile = { x = 0, y = 0 },
    _noseTip = { x = 0, y = 0 },
    _cheekbones = { x = 0, y = 0 },
    _cheeks = { x = 0 },
    _lips = { x = 0 },
    _jaw = { x = 0, y = 0 },
    _chinProfile = { x = 0, y = 0 },
    _chinShape = { x = 0, y = 0  },

    -- Appearance
    _aging = {
        component = 0,
        opacity = 0.0,
    },
    _beard = {
        component = 0,
        opacity = 0.0,
        color = 0,
    },
    _blemishes = {
        component = 0,
        opacity = 0.0,
    },
    _blush = {
        component = 0,
        opacity = 0.0,
        color = 0,
    },
    _bodyBlemishes = {
        component = 0,
        opacity = 0.0,
    },
    _chestHair = {
        component = 0,
        opacity = 0.0,
        color = 0,
    },
    _complexion = {
        component = 0,
        opacity = 0.0,
    },
    _eyebrows = {
        component = 0,
        opacity = 0.0,
        color = 0,
    },
    _eyeColor = {
        color = 0,
    },
    _hair = {
        component = 0,
		tiedComponent = 0,
		isTied = false,
        opacity = 0.0,
        color = 0,
        highlightColor = 0,
    },
    _lipstick = {
        component = 0,
        opacity = 0.0,
        color = 0,
    },
    _makeup = {
        component = 0,
        opacity = 0.0,
        color = 0,
    },
    _moleFreckles = {
        component = 0,
        opacity = 0.0,
    },
    _sunDamage = {
        component = 0,
        opacity = 0.0,
    },
    _scalp = {
        component = 0,
    },
    _tattoos = {},
    _outfit = {
        props = {},
        components = {},
    },
}
Skin.__index = Skin

---@param data { model: string, mother: number, father: number, similarity: number, skinSimilarity: number, brow: { x: number, y: number }, eyes: { x: number }, nose: { x: number, y: number }, noseProfile: { x: number, y: number }, noseTip: { x: number, y: number }, cheekbones: { x: number, y: number }, cheeks: { x: number }, lips: { x: number }, jaw: { x: number, y: number }, chinProfile: { x: number, y: number }, chinShape: { x: number, y: number }, aging: { component: number, opacity: number }, beard: { component: number, opacity: number, color: number }, blemishes: { component: number, opacity: number }, blush: { component: number, opacity: number, color: number }, bodyBlemishes: { component: number, opacity: number }, chestHair: { component: number, opacity: number, color: number }, complexion: { component: number, opacity: number }, eyebrows: { component: number, opacity: number, color: number }, eyeColor: { color: number }, hair: { component: number, tiedComponent: number, isTied: boolean, opacity: number, color: number, highlightColor: number }, lipstick: { component: number, opacity: number, color: number }, makeup: { component: number, opacity: number, color: number }, moleFreckles: { component: number, opacity: number }, sunDamage: { component: number, opacity: number }, scalp: { component: number }, tattoos: table, outfit: table }
---@param assign? boolean
---@return Skin
function Skin:new(data, assign)

	if assign == nil then
		assign = true
	end

    if data == nil then
        data = {}
    end

    local self = setmetatable({}, Skin)
	if assign then
		self:model(data.model)
		self:mother(data.mother)
		self:father(data.father)
		self:similarity(data.similarity)
		self:skinSimilarity(data.skinSimilarity)
		self:brow(data.brow)
		self:eyes(data.eyes)
		self:nose(data.nose)
		self:noseProfile(data.noseProfile)
		self:noseTip(data.noseTip)
		self:cheekbones(data.cheekbones)
		self:cheeks(data.cheeks)
		self:lips(data.lips)
		self:jaw(data.jaw)
		self:chinProfile(data.chinProfile)
		self:chinShape(data.chinShape)
		self:aging(data.aging)
		self:beard(data.beard)
		self:blemishes(data.blemishes)
		self:blush(data.blush)
		self:bodyBlemishes(data.bodyBlemishes)
		self:chestHair(data.chestHair)
		self:complexion(data.complexion)
		self:eyebrows(data.eyebrows)
		self:eyeColor(data.eyeColor)
		self:hair(data.hair)
		self:lipstick(data.lipstick)
		self:makeup(data.makeup)
		self:moleFreckles(data.moleFreckles)
		self:sunDamage(data.sunDamage)
		self:scalp(data.scalp)
		self:tattoos(data.tattoos, data.model == "mp_m_freemode_01" and "male" or "female")
		self:outfit(data.outfit)
	else
		self._model = data.model
		self._mother = data.mother
		self._father = data.father
		self._similarity = data.similarity
		self._skinSimilarity = data.skinSimilarity
		self._brow = data.brow
		self._eyes = data.eyes
		self._nose = data.nose
		self._noseProfile = data.noseProfile
		self._noseTip = data.noseTip
		self._cheekbones = data.cheekbones
		self._cheeks = data.cheeks
		self._lips = data.lips
		self._jaw = data.jaw
		self._chinProfile = data.chinProfile
		self._chinShape = data.chinShape
		self._aging = data.aging
		self._beard = data.beard
		self._blemishes = data.blemishes
		self._blush = data.blush
		self._bodyBlemishes = data.bodyBlemishes
		self._chestHair = data.chestHair
		self._complexion = data.complexion
		self._eyebrows = data.eyebrows
		self._eyeColor = data.eyeColor
		self._hair = data.hair
		self._lipstick = data.lipstick
		self._makeup = data.makeup
		self._moleFreckles = data.moleFreckles
		self._sunDamage = data.sunDamage
		self._scalp = data.scalp
		self._tattoos = data.tattoos
		self._outfit = data.outfit
	end

    return self
end

---@param model string | nil
---@return string
function Skin:model(model)
    if model ~= nil then
        self._model = model

        local hash = GetHashKey(self._model)

        if Config.Env == "server" then
            return self._model
        end

		if Utils.Streaming.RequestModel(hash, 5000) == nil then
			UI:AddNotification("basic", "~r~Votre ped prend trop de temps à charger, changement sur mp_m_freemode_01~s~", "info", 5000);

			if IsModelValid(hash) == false then
				Events.TriggerServer("player:updateSkin", "model", "mp_m_freemode_01")
			end

			self._model = "mp_m_freemode_01"
			hash = GetHashKey(self._model)
		end

        SetPlayerModel(PlayerId(), hash)
        SetModelAsNoLongerNeeded(hash)
        SetPedDefaultComponentVariation(PlayerPedId())
    end

    return self._model
end

---@param mother number | nil
---@return number
function Skin:mother(mother)
    if mother ~= nil then
        self._mother = mother
        SetHeadBlendData(self)
    end
    return self._mother
end

---@param father number | nil
---@return number
function Skin:father(father)
    if father ~= nil then
        self._father = father
        SetHeadBlendData(self)
    end
    return self._father
end

---@param similarity number | nil
---@return number
function Skin:similarity(similarity)
    if similarity ~= nil then
        self._similarity = similarity
        SetHeadBlendData(self)
    end
    return self._similarity
end

---@param skinSimilarity number | nil
---@return number
function Skin:skinSimilarity(skinSimilarity)
    if skinSimilarity ~= nil then
        self._skinSimilarity = skinSimilarity
        SetHeadBlendData(self)
    end
    return self._skinSimilarity
end

---@param brow { x: number, y: number } | nil
---@return { x: number, y: number }
function Skin:brow(brow)
    if brow ~= nil then
        self._brow = brow
        SetFaceFeature(self)
    end
    return self._brow
end

---@param eyes { x: number } | nil
---@return { x: number }
function Skin:eyes(eyes)
    if eyes ~= nil then
        self._eyes = eyes
        SetFaceFeature(self)
    end
    return self._eyes
end

---@param nose { x: number, y: number } | nil
---@return { x: number, y: number }
function Skin:nose(nose)
    if nose ~= nil then
        self._nose = nose
        SetFaceFeature(self)
    end
    return self._nose
end

---@param noseProfile { x: number, y: number } | nil
---@return { x: number, y: number }
function Skin:noseProfile(noseProfile)
    if noseProfile ~= nil then
        self._noseProfile = noseProfile
        SetFaceFeature(self)
    end
    return self._noseProfile
end

---@param noseTip { x: number, y: number } | nil
---@return { x: number, y: number }
function Skin:noseTip(noseTip)
    if noseTip ~= nil then
        self._noseTip = noseTip
        SetFaceFeature(self)
    end
    return self._noseTip
end

---@param cheekbones { x: number, y: number } | nil
---@return { x: number, y: number }
function Skin:cheekbones(cheekbones)
    if cheekbones ~= nil then
        self._cheekbones = cheekbones
        SetFaceFeature(self)
    end
    return self._cheekbones
end

---@param cheeks { x: number } | nil
---@return { x: number }
function Skin:cheeks(cheeks)
    if cheeks ~= nil then
        self._cheeks = cheeks
        SetFaceFeature(self)
    end
    return self._cheeks
end

---@param lips { x: number } | nil
---@return { x: number }
function Skin:lips(lips)
    if lips ~= nil then
        self._lips = lips
        SetFaceFeature(self)
    end
    return self._lips
end

---@param jaw { x: number, y: number } | nil
---@return { x: number, y: number }
function Skin:jaw(jaw)
    if jaw ~= nil then
        self._jaw = jaw
        SetFaceFeature(self)
    end
    return self._jaw
end

---@param chinProfile { x: number, y: number } | nil
---@return { x: number, y: number }
function Skin:chinProfile(chinProfile)
    if chinProfile ~= nil then
        self._chinProfile = chinProfile
        SetFaceFeature(self)
    end
    return self._chinProfile
end

---@param chinShape { x: number, y: number } | nil
---@return { x: number, y: number }
function Skin:chinShape(chinShape)
    if chinShape ~= nil then
        self._chinShape = chinShape
        SetFaceFeature(self)
    end
    return self._chinShape
end

---@param aging { component: number, opacity: number } | nil
---@return { component: number, opacity: number }
function Skin:aging(aging)
    if aging ~= nil then
        self._aging = aging
        SetHeadOverlay(self)
    end
    return self._aging
end

---@param beard { component: number, opacity: number, color: number } | nil
---@return { component: number, opacity: number, color: number }
function Skin:beard(beard)
    if beard ~= nil then
        self._beard = beard
        SetHeadOverlay(self)
    end
    return self._beard
end

---@param blemishes { component: number, opacity: number } | nil
---@return { component: number, opacity: number }
function Skin:blemishes(blemishes)
    if blemishes ~= nil then
        self._blemishes = blemishes
        SetHeadOverlay(self)
    end
    return self._blemishes
end

---@param blush { component: number, opacity: number, color: number } | nil
---@return { component: number, opacity: number, color: number }
function Skin:blush(blush)
    if blush ~= nil then
        self._blush = blush
        SetHeadOverlay(self)
    end
    return self._blush
end

---@param bodyBlemishes { component: number, opacity: number } | nil
---@return { component: number, opacity: number }
function Skin:bodyBlemishes(bodyBlemishes)
    if bodyBlemishes ~= nil then
        self._bodyBlemishes = bodyBlemishes
        SetHeadOverlay(self)
    end
    return self._bodyBlemishes
end

---@param chestHair { component: number, opacity: number, color: number } | nil
---@return { component: number, opacity: number, color: number }
function Skin:chestHair(chestHair)
    if chestHair ~= nil then
        self._chestHair = chestHair
        SetHeadOverlay(self)
    end
    return self._chestHair
end

---@param complexion { component: number, opacity: number } | nil
---@return { component: number, opacity: number }
function Skin:complexion(complexion)
    if complexion ~= nil then
        self._complexion = complexion
        SetHeadOverlay(self)
    end
    return self._complexion
end

---@param eyebrows { component: number, opacity: number, color: number } | nil
---@return { component: number, opacity: number, color: number }
function Skin:eyebrows(eyebrows)
    if eyebrows ~= nil then
        self._eyebrows = eyebrows
        SetHeadOverlay(self)
    end
    return self._eyebrows
end

---@param eyeColor { color: number } | nil
---@return { color: number }
function Skin:eyeColor(eyeColor)
    if eyeColor ~= nil then
        self._eyeColor = eyeColor

        if Config.Env == "server" then
            return self._eyeColor
        end

        SetPedEyeColor(PlayerPedId(), self._eyeColor.color)
    end
    return self._eyeColor
end

---@param hair { component: number, tiedComponent: number, opacity: number, color: number, highlightColor: number, isTied: boolean } | nil
---@return { component: number, tiedComponent: number, opacity: number, color: number, highlightColor: number, isTied: boolean }
function Skin:hair(hair)
    if hair ~= nil then
        self._hair = hair
        SetHeadOverlay(self)
    end
    return self._hair
end

---@param lipstick { component: number, opacity: number, color: number } | nil
---@return { component: number, opacity: number, color: number }
function Skin:lipstick(lipstick)
    if lipstick ~= nil then
        self._lipstick = lipstick
        SetHeadOverlay(self)
    end
    return self._lipstick
end

---@param makeup { component: number, opacity: number, color: number } | nil
---@return { component: number, opacity: number, color: number }
function Skin:makeup(makeup)
    if makeup ~= nil then
        self._makeup = makeup
        SetHeadOverlay(self)
    end
    return self._makeup
end

---@param moleFreckles { component: number, opacity: number } | nil
---@return { component: number, opacity: number }
function Skin:moleFreckles(moleFreckles)
    if moleFreckles ~= nil then
        self._moleFreckles = moleFreckles
        SetHeadOverlay(self)
    end
    return self._moleFreckles
end

---@param sunDamage { component: number, opacity: number } | nil
---@return { component: number, opacity: number }
function Skin:sunDamage(sunDamage)
    if sunDamage ~= nil then
        self._sunDamage = sunDamage
        SetHeadOverlay(self)
    end
    return self._sunDamage
end

---@param scalp { component: number } | nil
---@return { component: number }
function Skin:scalp(scalp)
    if scalp ~= nil then
        self._scalp = scalp

        if Config.Env == "server" then
            return self._scalp
        end

        local ped = PlayerPedId()

        ClearPedDecorations(ped)
        if self._scalp.component ~= nil and self._scalp.component ~= 0 then
            AddPedDecorationFromHashes(ped, Lists.Scalps[self._scalp.component].collection, Lists.Scalps[self._scalp.component].name)
        end

        for _, v in pairs(self._tattoos) do
            if v ~= nil and v.collection ~= nil and v.collection ~= '' then
                AddPedDecorationFromHashes(ped, v.collection, v[player:sex() == "m" and "male" or "female"])
            end
        end
    end
    return self._scalp
end

---@param tattoos table | nil
---@param sex "male" | "female" | nil
---@param ped Entity | nil
---@return table
function Skin:tattoos(tattoos, sex, ped)
    if tattoos ~= nil then

        self._tattoos = tattoos

        if Config.Env == "server" then
            return self._tattoos
        end

        ped = ped or PlayerPedId()

        ClearPedDecorations(ped)
        if self._scalp.component ~= nil and self._scalp.component ~= 0 then
            AddPedDecorationFromHashes(ped, Lists.Scalps[self._scalp.component].collection, Lists.Scalps[self._scalp.component].name)
        end

        for k, v in pairs(self._tattoos) do
            if v ~= nil and v.collection ~= nil and v.collection ~= '' and v[sex] ~= nil and v[sex] ~= '' then
                AddPedDecorationFromHashes(ped, v.collection, v[sex])
            end
        end
    end
    return self._tattoos
end

---@param outfit table | nil
---@return table
function Skin:outfit(outfit)
    if outfit ~= nil then
		local purgedProps = {}
		for k, v in pairs(outfit.props) do
			purgedProps[tostring(k)] = v
		end

		outfit.props = purgedProps

        SetOutfit(self._outfit, outfit)
		self:eyeColor(self:eyeColor())
        self._outfit = outfit
    end

    return Functions.DeepCopy(self._outfit)
end

function Skin:tieHair()
	self._hair.isTied = not self._hair.isTied
	self:hair(self._hair)
end

---@param id number
---@return boolean
function Skin:applyTo(id)
    if Config.Env == "server" then
        return false
    end

    if not DoesEntityExist(id) or not IsEntityAPed(id) then
        return false
    end

    Citizen.Wait(50)

    SetPlayerModel(id, GetHashKey(self:model()))
    SetModelAsNoLongerNeeded(GetHashKey(self:model()))
    SetPedDefaultComponentVariation(id)

    SetHeadBlendData(self, id)
    SetFaceFeature(self, id)
    SetHeadOverlay(self, id)
    SetOutfit({}, self:outfit(), id)
	self:tattoos(self:tattoos(), player:sex() == "m" and "male" or "female", id)
	SetPedEyeColor(id, self:eyeColor().color)

    return true
end
