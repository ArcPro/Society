Utils = Utils or {}
Utils.Sprites = {}

Utils.Sprites.Scale = function(ratio, dist, max)
    return ratio - dist / (max / (ratio / 1.5))
end

Utils.Sprites.Draw = function(textureDict, textureName, width, height, coords, maxDist)
    local get, x, y = GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z)
	local screenX, screenY = GetActiveScreenResolution()

    if not get or x < 0.0 or x > 1.0 or y < 0.0 or y > 1.0 then
        return
    end

    local dist = Math.Distance(GetEntityCoords(PlayerPedId(), true), coords)

    SetDrawOrigin(coords.x, coords.y, coords.z + 0.25, 0)
    DrawSprite(
        textureDict,
        textureName,
        0.0,
        0.0,
        Utils.Sprites.Scale(width / screenX, dist, maxDist),
        Utils.Sprites.Scale(height / screenY, dist, maxDist),
        0.0,
        255,
        255,
        255,
        255
    )
    ClearDrawOrigin()
end

Utils.Sprites.DrawNoScale = function(textureDict, textureName, width, height, coords, maxDist)
    local get, x, y = GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z)
	local screenX, screenY = GetActiveScreenResolution()

    if not get or x < 0.0 or x > 1.0 or y < 0.0 or y > 1.0 then
        return
    end

    SetDrawOrigin(coords.x, coords.y, coords.z + 0.25, 0)
    DrawSprite(
        textureDict,
        textureName,
        0.0,
        0.0,
        width / screenX,
        height / screenY,
        0.0,
        255,
        255,
        255,
        255
    )
    ClearDrawOrigin()
end

Utils.Sprites.DrawCrosshair = function()
	local screenX, screenY = GetActiveScreenResolution()

    Utils.Streaming.RequestStreamedTextureDict("outro")

    DrawSprite(
        "outro",
        "crosshair",
        0.5,
        0.5,
        7 / screenX,
        7 / screenY,
        0.0,
        255,
        255,
        255,
        255
    )
end
