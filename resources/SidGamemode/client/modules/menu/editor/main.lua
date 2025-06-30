MainMenu = MainMenu or {}
MainMenu.Editor = MainMenu.Editor or {}

MainMenu.Editor.Create = function()
    MainMenu.Editor.Main = Menus:CreateSub(MainMenu.Main, "Rockstar Editor", "default")

    local isRecording = IsRecording();

    Menus:CreateThread(MainMenu.Editor.Main, function()
        isRecording = IsRecording();
        Menus:IsVisible(MainMenu.Editor.Main, function()

            Menus:AddSeparator("Enregistrement")

            Menus:AddButton("Commencer à enregistrer", isRecording, "🎥", "", function()
                StartRecording(1)
            end)

            Menus:AddButton("Sauvegarder & arrêter", not isRecording, "💾", "", function()
                StartRecording(0)
                StopRecordingAndSaveClip()
            end)
            Menus:AddButton("~r~Arrêter sans sauvegarder~s~", not isRecording, "🗑️", "", function()
                StopRecordingAndDiscardClip()
            end)

        end)
    end)
end
