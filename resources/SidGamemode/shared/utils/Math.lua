Math = {}

Math.RotationToDirection = function(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)

    local absx = math.abs(math.cos(retx))

    return vector3(
        -math.sin(retz) * absx,
        math.cos(retz) * absx,
        math.sin(retx)
    )
end

Math.Clamp = function(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    end
    return value
end

Math.Distance = function(v1, v2)
    return #(
        vector3(v1.x, v1.y, v1.z)
        - vector3(v2.x, v2.y, v2.z)
    )
end
