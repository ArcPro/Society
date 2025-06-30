Context:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
	if (not DoesEntityExist(hitEntity) or not IsEntityAnObject(hitEntity)) then
        return
    end

    local sittableProp = Config.SittableProps[GetEntityModel(hitEntity)]

    if not sittableProp then
        return
    end

    local x, y, z = table.unpack(GetEntityCoords(hitEntity))
    local offset, direction = sittableProp.offset, sittableProp.direction

    direction += GetEntityHeading(hitEntity)

    Context:AddItem(0, "S'asseoir", function()

        if Math.Distance(player:position(), GetEntityCoords(hitEntity, true)) > 1.5 then
            return UI:AddNotification("basic", "~r~Vous êtes trop loin~s~", "info", 3000)
        end

        ClientModules.Misc.Animations:PlayScenario(
            "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER",
            vector3(x + offset.x, y + offset.y, z - offset.z),
            direction
        )

        AttachEntityToEntity(PlayerPedId(), hitEntity, 0,
            offset.x, offset.y, offset.z,
            0.4, 0.0, direction,
            true, true, false, true, 1, true
        )
    end, true)
end)
