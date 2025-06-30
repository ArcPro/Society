ClientModules = ClientModules or {}
ClientModules.Misc = ClientModules.Misc or {}
ClientModules.Misc.Animations = ClientModules.Misc.Animations or {}

ClientModules.Misc.Animations.initialized = false
ClientModules.Misc.Animations.IsPlayingScenario = false
ClientModules.Misc.Animations.PlayerEmotingWith = nil
ClientModules.Misc.Animations.AttachedProps = {}
ClientModules.Misc.Animations.CurrentEmote = nil
ClientModules.Misc.Animations.CurrentEmoteForced = false
ClientModules.Misc.Animations.OnStop = function()end

local function errorNotify(message)
    UI:AddNotification("basic", ("~r~%s~s~"):format(message), "info", 5000)
end

function ClientModules.Misc.Animations:Find(name)
	for listName, list in pairs(Lists.Emotes) do
        if listName ~= "Walks" and listName ~= "Expressions" then
            for emoteName, emote in pairs(list) do
                if emoteName == name then
                    return emote
                end
            end
        end
    end

    return {}
end

function ClientModules.Misc.Animations:GetAnimInfo(name, field)
    -- Field must be a string where it would represent the fields of the Animations table
    -- If there is a . in the field, it will be used to get the subfield of the table
    -- Example: "AnimationOptions.PropPlacement" will return the PropPlacement field of the AnimationOptions table

    local fields = String.split(field, ".")
    local emote = self:Find(name)
    for _, f in ipairs(fields) do
        emote = emote[f]
    end

    return emote
end

function ClientModules.Misc.Animations:CreateProp(model)
    if not IsModelValid(model) or not Utils.Streaming.RequestModel(model) then
        return 0
    end

    local prop = SharedModules.Entities:Create(model, GetEntityCoords(PlayerPedId(), true))

    if not prop then return end

	SetEntityCollision(prop, false, false)

    table.insert(self.AttachedProps, prop)

    return prop
end

function ClientModules.Misc.Animations:AttachProp(model, bone, xOffset, yOffset, zOffset, xRotation, yRotation, zRotation)
    local prop = self:CreateProp(model)
    local ped = PlayerPedId()

    if prop == 0 or prop == nil then return false end

	SharedModules.Entities:Control(prop)

    AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, bone),
        xOffset, yOffset, zOffset,
        xRotation, yRotation, zRotation,
        true, true, false, true, 1, true
    )

    return true
end

function ClientModules.Misc.Animations:AttachSource(emote, target)
    local pedInFront = GetPlayerPed(GetPlayerFromServerId(target))
    local ply = PlayerPedId()

    local SyncOffsetFront = 1.0
    local SyncOffsetSide = 0.0
    local SyncOffsetHeight = 0.0
    local SyncOffsetHeading = 180.1

    local AnimationOptions = emote.AnimationOptions

    if AnimationOptions then
        if AnimationOptions.SyncOffsetFront then
            SyncOffsetFront = AnimationOptions.SyncOffsetFront + 0.0
        end

        if AnimationOptions.SyncOffsetSide then
            SyncOffsetSide = AnimationOptions.SyncOffsetSide + 0.0
        end

        if AnimationOptions.SyncOffsetHeight then
            SyncOffsetHeight = AnimationOptions.SyncOffsetHeight + 0.0
        end

        if AnimationOptions.SyncOffsetHeading then
            SyncOffsetHeading = AnimationOptions.SyncOffsetHeading + 0.0
        end

        if (AnimationOptions.Attachto) then
            AttachEntityToEntity(ply, pedInFront,
				GetPedBoneIndex(pedInFront, AnimationOptions.bone or -1),
				AnimationOptions.xPos or 0.0,
				AnimationOptions.yPos or 0.0,
				AnimationOptions.zPos or 0.0,
				AnimationOptions.xRot or 0.0,
				AnimationOptions.yRot or 0.0,
				AnimationOptions.zRot or 0.0,
				false, false, false, true, 1, true
			)
        end
    end

    local coords = GetOffsetFromEntityInWorldCoords(pedInFront, SyncOffsetSide, SyncOffsetFront, SyncOffsetHeight)
    SetEntityCoordsNoOffset(ply, coords.x, coords.y, coords.z, false, false, true)
	SetEntityHeading(ply, GetEntityHeading(pedInFront) - SyncOffsetHeading)
end

function ClientModules.Misc.Animations:AttachTarget(emote, target)
    local pedInFront = GetPlayerPed(GetPlayerFromServerId(target))
    local targetEmote = Lists.Emotes.Shared[emote[4]]

    if emote ~= nil and emote.AnimationOptions ~= nil and emote.AnimationOptions.Attachto == true then return end
    if targetEmote.AnimationOptions == nil or targetEmote.AnimationOptions.Attachto ~= true then return end

    AttachEntityToEntity(
		PlayerPedId(), pedInFront,
        GetPedBoneIndex(pedInFront, targetEmote.AnimationOptions.bone or -1),
        targetEmote.AnimationOptions.xPos or 0.0,
        targetEmote.AnimationOptions.yPos or 0.0,
        targetEmote.AnimationOptions.zPos or 0.0,
        targetEmote.AnimationOptions.xRot or 0.0,
        targetEmote.AnimationOptions.yRot or 0.0,
        targetEmote.AnimationOptions.zRot or 0.0,
        false, false, false, true, 1, true
    )
end

function ClientModules.Misc.Animations:DeleteAttachedProps()
    for _, entity in pairs(self.AttachedProps) do
		DeleteEntity(entity)
    end

    self.AttachedProps = {}
end

function ClientModules.Misc.Animations:SetClipset(walkStyle, save)
    if not Utils.Streaming.RequestAnimSet(walkStyle) then
        return errorNotify("Démarche invalide")
    end

    SetPedMovementClipset(PlayerPedId(), walkStyle, 0.2)
    RemoveAnimSet(walkStyle)

    if save == true then
		player:metadata().walk_style = walkStyle
		Events.TriggerServer("player:update", "metadata", player:metadata())
    end
end

function ClientModules.Misc.Animations:ResetClipset(clear)
    local walkStyle = player:metadata().walk_style

    if walkStyle and GetHashKey(walkStyle) ~= GetPedMovementClipset(PlayerPedId()) then
        self:SetClipset(walkStyle, true)
    else
		if clear then
			player:metadata().walk_style = nil
			Events.TriggerServer("player:update", "metadata", player:metadata())
		end

        ResetPedMovementClipset(PlayerPedId(), 0.0)
    end
end

function ClientModules.Misc.Animations:SetExpression(expression, save)
    SetFacialIdleAnimOverride(PlayerPedId(), expression, false)

    if save == true then
		player:metadata().expression = expression
		Events.TriggerServer("player:update", "metadata", player:metadata())
    end
end

function ClientModules.Misc.Animations:SetHolsterStyle(holster_style)
    player:metadata().holster_style = holster_style
	Events.TriggerServer("player:update", "metadata", player:metadata())
end

function ClientModules.Misc.Animations:ResetExpression()
    ClearFacialIdleAnimOverride(PlayerPedId())
    player:metadata().expression = nil
	Events.TriggerServer("player:update", "metadata", player:metadata())
end

---@param name string
---@param whitelist? boolean
---@param onStop? fun()
---@param force? boolean
function ClientModules.Misc.Animations:Play(name, whitelist, onStop, force)
    local emote = self:Find(name)
    local dict, emoteName = table.unpack(emote)
    local ped = PlayerPedId()
    local duration = -1
    local options = {}
    local flag = 0

    local isPlayerInVehicle = IsPedInAnyVehicle(ped, true)

    if #emote == 0 then
        return errorNotify("Emote invalide")
    end

	if self.CurrentEmoteForced == true then
		return errorNotify("Impossible pour le moment")
	end

    if self.CurrentEmote then
        self.CurrentEmote = nil
        Citizen.Wait(50)
    end

	self.CurrentEmoteForced = force == true and true or false

    self.OnStop = onStop or function()end

    options = emote.AnimationOptions or {}

    if isPlayerInVehicle then
        if options.NotInVehicle then
            return errorNotify("Impossible en véhicule")
        end
    elseif options.onlyInVehicle then
        return errorNotify("Impossible à pied")
    end

	if whitelist ~= true and options.Whitelist == true then
		return UI:AddNotification("basic", "~r~Vous ne pouvez pas utiliser cette emote via le menu, utilisez l'item lié.~s~", "info", 5000)
	end

    if options.Prop and #self.AttachedProps > 0 then
        self:DeleteAttachedProps()
    end

    if options.StartDelay then
        Citizen.Wait(options.StartDelay)
    end

    if options.EmoteDuration then
        duration = options.EmoteDuration or -1
    end

    if not Utils.Streaming.RequestAnimDict(dict) then
        errorNotify("Emote invalide")
    end

    if isPlayerInVehicle then
        flag = 51
	elseif options then
        if options.EmoteMoving then
            flag = 51
        elseif options.EmoteLoop then
            flag = 1
        elseif options.EmoteStuck then
            flag = 50
        end
    end

    if IsPedUsingAnyScenario(ped) or IsPedActiveInScenario(ped) then
        ClearPedTasksImmediately(ped)
    end

    TaskPlayAnim(ped, dict, emoteName, 5.0, 5.0, duration, flag, 0.0, false, false, false)
    RemoveAnimDict(dict)

    if options.Prop then
        local xOff, yOff, zOff, xRot, yRot, zRot = table.unpack(options.PropPlacement)
        if not self:AttachProp(options.Prop, options.PropBone, xOff, yOff, zOff, xRot, yRot, zRot) then
            errorNotify("Erreur lors de la création du prop 1 " .. options.Prop)
            return
        end
    end

    if options.SecondProp then
        local xOff, yOff, zOff, xRot, yRot, zRot = table.unpack(options.SecondPropPlacement)
        if not self:AttachProp(options.SecondProp, options.SecondPropBone, xOff, yOff, zOff, xRot, yRot, zRot) then
            errorNotify("Erreur lors de la création du prop 2 " .. options.SecondProp)
            self:DeleteAttachedProps()
            return
        end
    end

    LocalPlayer.state:set("emote", name, true)
    self.CurrentEmote = emote

	if duration ~= -1 and not options.EmoteLoop then
		Citizen.SetTimeout(duration, function()
			self:Stop(false)
		end)
	end
end

function ClientModules.Misc.Animations:Stop(detachProps, stopForced)
    local stopFn = self.OnStop

	if self.CurrentEmoteForced == true and stopForced ~= true then return end

	self.CurrentEmoteForced = false

    if self.CurrentEmote ~= nil then
        if self.CurrentEmote.AnimationOptions and self.CurrentEmote.AnimationOptions.ExitEmote then
            self:Play(self.CurrentEmote.AnimationOptions.ExitEmote)
        else
            ClearPedTasks(PlayerPedId())
        end
	else
		ClearPedTasks(PlayerPedId())
    end

    if self.IsPlayingScenario then
        ClearPedTasks(PlayerPedId())
    end

	if self.PlayerEmotingWith then
		Events.TriggerServer("animations:cancelShared", self.PlayerEmotingWith)
		DetachEntity(PlayerPedId(), true, true)
	end

	if detachProps ~= false then
		if #self.AttachedProps > 0 then
			self:DeleteAttachedProps()
		end
	end

	LocalPlayer.state:set("emote", nil, true)
	self.PlayerEmotingWith = nil
	self.CurrentEmote = nil

	stopFn()
end

function ClientModules.Misc.Animations:Preview(list, index)
    local i = 1

    for _, emote in Table.PairsByKeys(list) do
        if i == index then
            Utils.Streaming.RequestAnimDict(emote[1])
            TaskPlayAnim(Utils.Clone.ped, emote[1], emote[2], 5.0, 5.0, -1, 1, 0.0, false, false, false)
			RemoveAnimDict(emote[1])
            break
        end

        i += 1
    end
end

function ClientModules.Misc.Animations:PlayScenario(scenario, coords, direction)
    TaskStartScenarioAtPosition(PlayerPedId(), scenario, coords.x, coords.y, coords.z, direction, 0, true, true)
    self.IsPlayingScenario = true
end

function ClientModules.Misc.Animations:LoadMetadata()
	local expression = player:metadata().expression
	local walkStyle = player:metadata().walk_style

	if expression then
		self:SetExpression(expression, false)
	end

	if walkStyle then
		self:SetClipset(walkStyle, false)
	end
end

function ClientModules.Misc.Animations:RegisterEvents()
	Events.Register("animations:sharedRequest", function(source, target, emoteName)
		UI:Popup("Demande d'emote", ("La personne devant vous veut faire l'emote '%s' avec vous"):format(emoteName), {
			text = "Accepter",
			cb = function()
				Events.TriggerServer("animations:requestAccepted", target, emoteName)
			end
		}, {
			cb = function()end,
			text = "Refuser",
		}, 0)
	end)

	Events.Register("animations:playShared", function(source, target, emoteName, position)
		local emote = Lists.Emotes.Shared[emoteName]

		if emote == nil then
			return errorNotify("Emote invalide")
		end

		self:Stop()
		Citizen.Wait(300)

		self.PlayerEmotingWith = target

		if position == 1 then
			self:AttachSource(emote, target)
			self:Play(emoteName)
		else
			self:AttachTarget(emote, target)
			self:Play(emote[4])
		end
	end)

	Events.Register("animations:cancelShared", function(source)
		DetachEntity(PlayerPedId(), true, true)
		self.PlayerEmotingWith = nil
		self:Stop()
	end)

	Events.Register("animations:play", function(src, name)
		self:Play(name)
	end)
end

function ClientModules.Misc.Animations:RegisterCommandsAndBinds()
	RegisterCommand("e", function(source, args)
		self:Play(args[1])
	end, false)

	Utils.KeyRegister("X", "cancel_emote", "Arrêter l'animation", function()
		self:Stop()
	end)

	Events.TriggerExternal("chat:addSuggestion", "/e", "Fait une animation", {
		{ name = "emote", help = "Le nom de l'emote a jouer" },
	})
end

function ClientModules.Misc.Animations:Initialize()
	self:LoadMetadata()

	if self.initialized == true then return end

	self:RegisterCommandsAndBinds()
	self:RegisterEvents()

	self.initialized = true
end

Core.Player:OnLoad(function()
	ClientModules.Misc.Animations:Initialize()
end)

exports("PlayAnimation", function(name)
	ClientModules.Misc.Animations:Play(name)
end)

exports("StopAnimation", function()
	ClientModules.Misc.Animations:Stop()
end)
