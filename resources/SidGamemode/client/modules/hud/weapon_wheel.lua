local disableHudComponents = {19, 20}
local disableControls = {37}
CreateThread(function()
    while true do

        for i = 1, #disableHudComponents do
            HideHudComponentThisFrame(disableHudComponents[i])
        end

        for i = 1, #disableControls do
            DisableControlAction(2, disableControls[i], true)
        end

        -- DisplayAmmoThisFrame(false)
        Wait(0)
    end
end)
