Utils = Utils or {}

Utils.Clone = {}
Utils.Clone.ped = nil
Utils.Clone.heading = 0.0
Utils.Clone.active = false

local function createClone()
    local clone = CreatePed(4, GetEntityModel(PlayerPedId()), 0.0, 0.0, 0.0, 0.0, false, true)

    SetEntityCoords(clone, 0.0, 0.0, 0.0, true, false, false, false)
    TaskSetBlockingOfNonTemporaryEvents(clone, true)
    SetEntityCollision(clone, false, false)
    FreezeEntityPosition(clone, true)
	SetEntityInvincible(clone, true)

    return clone
end

Utils.Clone.Create = function(forwardFactor, rightFactor, upFactor, animation_type)
    Utils.Clone.active = true
	Utils.Clone.heading = 0.0

    if GetEntityModel(Utils.Clone.ped) ~= GetEntityModel(PlayerPedId()) then
        Utils.Clone.ped = createClone()
    end

	Utils.Clone.UpdatePed(animation_type)

    Citizen.CreateThread(function()
        while Utils.Clone.active do
            if Utils.Clone.ped == nil then
                Utils.Clone.active = false
                break
            end

            local camRot = GetGameplayCamRot(2)

            local forward = Math.RotationToDirection(camRot)
            local _right = Math.RotationToDirection(vector3(0, 0, camRot.z + 10.0)) - Math.RotationToDirection(vector3(0, 0, camRot.z - 10.0))
            local _up = Math.RotationToDirection(vector3(camRot.x + 10.0, camRot.y, camRot.z)) - Math.RotationToDirection(vector3(camRot.x - 10.0, camRot.y, camRot.z))

            local radians = -(math.rad(camRot.y))

            local right = (_right * math.cos(radians)) - (_up * math.sin(radians))
            local up = (_right * math.sin(radians)) + (_up * math.cos(radians))

            local coords = GetGameplayCamCoord() + forward * forwardFactor + right * rightFactor + up * upFactor;

            SetEntityCoords(Utils.Clone.ped, coords.x, coords.y, coords.z - 1.0, true, false, false, false)
            SetEntityRotation(Utils.Clone.ped,
				-camRot.x,
				0.0,
				camRot.z + Utils.Clone.heading + 180.0,
				2, true
			)

            Citizen.Wait(0)
        end
    end)
end

Utils.Clone.Destroy = function()
    SetEntityCoords(Utils.Clone.ped, 0.0, 0.0, 0.0, true, false, false, false)
    Utils.Clone.active = false
end

Utils.Clone.UpdatePed = function(animation_type)
    ClearAllPedProps(Utils.Clone.ped)
    player:skin():applyTo(Utils.Clone.ped)

	local dict, anim = nil, nil

	if animation_type == 1 then
		dict = "anim@amb@nightclub@peds@"
		anim = "rcmme_amanda1_stand_loop_cop"
	elseif animation_type == 2 then
		dict = "mp_sleep"
		anim = "bind_pose_180"
	end

	if dict ~= nil then
		Utils.Streaming.RequestAnimDict(dict)
		TaskPlayAnim(Utils.Clone.ped, dict, anim, 8.0, 1.0, -1, 1, 1.0, false, false, false)
	end
end

Utils.Clone.ApplyOutfit = function(component, drawable, texture, isProp)
    if (isProp) then
        if drawable == -1 then
            ClearPedProp(Utils.Clone.ped, component)
        else
            SetPedPropIndex(Utils.Clone.ped, component, drawable, texture, true)
        end
    else
		if drawable == -1 then
			local naked = Lists.Variations.NakedOutfits[player:sex()].components[component]
			SetPedComponentVariation(Utils.Clone.ped, component, naked[1], naked[2], 0)
        else
			SetPedComponentVariation(Utils.Clone.ped, component, drawable, texture, 0)
        end
    end
end
