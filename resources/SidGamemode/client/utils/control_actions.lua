Utils = Utils or {}

Utils.DisableControlsForUI = function(keepCamera)
	if keepCamera ~= true then
		DisableControlAction(0, 1, true)
		DisableControlAction(0, 2, true)
	end

    DisableControlAction(0, 6, true)
    DisableControlAction(0, 14, true)
    DisableControlAction(0, 15, true)
    DisableControlAction(0, 16, true)
    DisableControlAction(0, 17, true)
    DisableControlAction(0, 24, true)
    DisableControlAction(0, 25, true)
	DisableControlAction(0, 69, true)
    DisableControlAction(0, 106, true)
    DisableControlAction(0, 142, true)
    DisableControlAction(0, 257, true)
    DisableControlAction(0, 261, true)
    DisableControlAction(0, 262, true)

    DisableControlAction(2, 199, true)
    DisableControlAction(2, 200, true)
end

function Utils.GetControlHash(command)
	return GetHashKey(("+%s"):format(command)) | 0x80000000
end

exports("DisableControlsForUI", Utils.DisableControlsForUI)
