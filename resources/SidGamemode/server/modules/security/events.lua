function FlagReport(src, flag, value)

    local fields = {
        {
            name = "Flag",
            value = ("```%s```"):format(flag)
        },
        {
            name = "Nom du joueur",
            value = ("```%s```"):format(GetPlayerName(src))
        },
        {
            name = "Discord du joueur",
            value = ("<@%s>"):format(Identifiers.Parse(GetPlayerIdentifiers(src)).discord)
        },
        {
            name = "Valeur",
            value = ("```%s```"):format(value)
        }
    }

    PerformHttpRequest(
        Config.Webhooks.SECURITY.ANTICHEAT,
        function(err, text, header)end,
        'POST',
        json.encode({
            username = "RebornV Sécurité",
            embeds = {
                {
                    description = "Un joueur a été détecté comme un potentiel tricheur",
                    fields = fields,
                    author = {
                        name = "RebornV Anticheat"
                    },
					avatar_url = "https://cdnrv.sysscripts.com/other/logo.webp",
                    title = "Cheat détecté",
                    color = 16711680,
                    footer = {
                        text = "RebornV Anticheat"
                    },
                    timestamp = os.date('!%Y-%m-%dT%H:%M:%S.000Z')
                }
            }
        }),
        {['Content-Type'] = 'application/json'}
    )
    DropPlayer(src, "Vous avez été détecté comme un tricheur potentiel, merci d'ouvrir un ticket avant de vous reconnecter afin de clarifier la situation.")
end

Events.Register("security:flag", FlagReport)
