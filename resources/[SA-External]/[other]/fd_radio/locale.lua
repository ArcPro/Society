Locale = {
    ui = {
        ["go_back"] = "Retour",
        ["call_sign"] = "Matricule",
        ["call_sign_placeholder"] = "ex: 01",
        ["name_input"] = "Nom",
        ["name_input_placeholder"] = "ex: John Doe",
        ["button_save"] = "Sauvegarder",
        ["lock_button"] = "Bloquer",
        ["unlock_button"] = "Débloquer",
        ["locked_status"] = "Bloqué",
        ["unlocked_status"] = "Débloqué",
        ["channel_is"] = "La fréquence est",
        ["invite_user"] = "Inviter (ID)",
        ["invite_button"] = "Inviter",
        ["channel"] = "Canal",
        ["show_list"] = "Voir la liste",
        ["change_signs"] = "Change Signs",
        ["lock_channel"] = "Bloquer la fréquence",
        ["settings"] = "Paramètres",
        ["change_button"] = "Changer",
        ["disconnect"] = "Se déconnecter",
        ["toggle_frame_movement"] = "Activer le mouvement de le radio",
        ["color"] = "Couleur",
        ["size"] = "Taille",
        ["volume"] = "Volume",
        ["press_enter_to_connect"] = "Appuyez sur entrée pour vous connecter",
        ["turn_on_off"] = "On/Off",
        ["volume_up"] = "Volume +",
        ["volume_down"] = "Volume -",
        ["unknown"] = "Anonyme",
        ["color_black"] = "Noir",
        ["color_white"] = "Blanc",
        ["color_blue"] = "Bleu",
        ["color_green"] = "Vert",
        ["color_red"] = "Rouge",
        ["color_yellow"] = "Jaune",
        ["radio_list"] = "List des gens connectés",
        ["enable_external_list"] = "Voir la liste externe",
        ["disable_external_list"] = "Cacher la liste externe"
    },
    to_close_to_other_jammer = "Vous êtes trop proche d'un autre brouilleur.",
    press_to_destroy = "Press [E] to destroy jammer",
    press_to_pickup = "Press [E] to pickup jammer",
    destroy_jammer = "Détruire le jammer",
    pick_up_jammer = "Pick up jammer",
    joined_to_radio = 'Vous êtes connecté sur: %sMhz.',
    invalid_radio = 'Cette fréquence n\'est pas disponible.',
    you_on_radio = 'Vous êtes déja connecté a cette fréquence.',
    restricted_channel_error = 'Vous ne pouvez pas vous connecter a cette fréquence',
    you_leave = 'Vous avez quitté la fréquence.',
    open_radio = 'Ouvrir la radio',
    open_radio_list = '',
    radio_cannot_be_unlocked = "La radio ne peut pas être débloquée.",
    radio_unlocked = "Radio débloquée",
    radio_cannot_be_locked = "La radio ne peut pas être bloquée.",
    radio_locked = "Radio bloquée.",
    radio_cannot_invite = "Impossible d'inviter dans cette fréquence.",
    radio_invited = "Invitation envoyée.",
    increase_radio_volume = 'Le volume est déja au minimum',
    volume_radio = 'Volume: %s.',
    decrease_radio_volume = 'Le volume est déja au maximum',
    size_updated = "Taille mise à jour",
    frame_updated = "Couleur mise à jour",
    position_updated = "Position mise à jour",
    signs_updated = "Informations mises à jour"
}

setmetatable(Locale, {
    __index = function(self, key)
        if rawget(self, key) == nil then
            return ('Unknown key: %s'):format(key)
        end

        return rawget(self, key)
    end
})
