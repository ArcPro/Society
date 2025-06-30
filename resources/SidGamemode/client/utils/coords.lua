Utils = Utils or {}
Utils.IsValidCoords = function(x, y, z)
	if x < -5300.51 or x > 5786.23 then
		return false
	end

	if y < -6209.25 or y > 8960.27 then
		return false
	end

	if z < -250 or z > 1500 then
		return false
	end

	return true
end
