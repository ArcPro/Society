function InstructionalButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringKeyboardDisplay(text)
    EndTextCommandScaleformString()
end

function InstructionalButton(ControlButton)
    ScaleformMovieMethodAddParamPlayerNameString(ControlButton)
end

-- Citizen.CreateThread(function()
--     local instructScaleform = setupInstructionalScaleform("instructional_buttons")

--     while true do Wait(0)
--     DrawScaleformMovieFullscreen(instructScaleform, 255, 255, 255, 255, 0)
--     end
-- end)

function setupInstructionalScaleform(scaleform)
    scaleform = RequestScaleformMovie(scaleform)

    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

    BeginScaleformMovieMethod(scaleform, "CLEAR_ALL")
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "SET_CLEAR_SPACE")
    ScaleformMovieMethodAddParamInt(200)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(1)
    InstructionalButton(GetControlInstructionalButton(2, CONTROLS.MASH_A.CONTROL, true))
    InstructionalButton(GetControlInstructionalButton(2, CONTROLS.MASH_B.CONTROL, true))
    InstructionalButtonMessage(CONTROLS.MASH_A.TEXT)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(0)
    InstructionalButton(GetControlInstructionalButton(2, CONTROLS.QUIT.CONTROL, true))
    InstructionalButtonMessage(CONTROLS.QUIT.TEXT)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "SET_BACKGROUND_COLOUR")
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(80)
    EndScaleformMovieMethod()

    return scaleform
end
