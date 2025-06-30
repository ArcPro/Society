local whitelist_roles = {"1387407104301731966", -- Admin
"1387407104301731965", -- Dev
"1387407104205390021", -- Staff
"1282079409146171589", -- Support
"1387407104205390021" -- Whitelist role
}
local cards = {}

cards.checking = function(name)
    return DeferralCards.Card:Create({
        body = {DeferralCards.CardElement:TextBlock({
            text = ('Bienvenue sur San Andreas Stories, %s !'):format(name),
            size = 'Large',
            weight = 'Bolder'
        }), DeferralCards.CardElement:TextBlock({
            text = 'Veuillez patienter pendant que nous vérifions vos informations.',
            size = 'Medium',
            weight = 'Lighter'
        })}
    })
end

cards.not_whitelisted = function(name)
    return DeferralCards.Card:Create({
        body = {DeferralCards.CardElement:TextBlock({
            text = ('Nous rencontrons un problème, %s !'):format(name),
            size = 'Large',
            weight = 'Bolder'
        }), DeferralCards.CardElement:TextBlock({
            text = 'Vous n\'êtes pas whitelisté sur San Andreas Stories.',
            size = 'Medium',
            weight = 'Lighter'
        }), DeferralCards.CardElement:TextBlock({
            text = 'Pour  obtenir votre whitelist, rejoignez le serveur discord, tout y est expliqué.',
            size = 'Medium',
            weight = 'Lighter'
        }), DeferralCards.Container:ActionSet({
            actions = {DeferralCards.Action:OpenUrl({
                title = 'Rejoindre le discord',
                id = 'submit_discord',
                url = 'https://discord.gg/sastoriesrp'
            }), DeferralCards.Action:Submit({
                title = 'Annuler',
                id = 'submit_cancel'
            })}
        })}
    })
end

cards.banned = function(name, reason, expiration)
    return DeferralCards.Card:Create({
        body = {DeferralCards.CardElement:TextBlock({
            text = ('Nous rencontrons un problème, %s !'):format(name),
            size = 'Large',
            weight = 'Bolder'
        }), DeferralCards.CardElement:TextBlock({
            text = ('Nous rencontrons un problème, %s !'):format(name),
            size = 'Medium',
            weight = 'Lighter'
        }), DeferralCards.CardElement:TextBlock({
            text = ('Raison: %s.'):format(reason),
            size = 'Medium',
            weight = 'Lighter'
        }), DeferralCards.CardElement:TextBlock({
            text = ('Expiration: %s.'):format(Date.format("%d/%m/%Y", expiration / 1000)),
            size = 'Medium',
            weight = 'Lighter'
        }), DeferralCards.Container:ActionSet({
            actions = {DeferralCards.Action:Submit({
                title = 'Annuler',
                id = 'submit_cancel'
            })}
        })}
    })
end

cards.no_discord = function(name)
    return DeferralCards.Card:Create({
        body = {DeferralCards.CardElement:TextBlock({
            text = ('Nous rencontrons un problème, %s !'):format(name),
            size = 'Large',
            weight = 'Bolder'
        }), DeferralCards.CardElement:TextBlock({
            text = 'Vous devez avoir Discord lié à votre compte FiveM pour jouer sur ce serveur.',
            size = 'Medium',
            weight = 'Lighter'
        }), DeferralCards.Container:ActionSet({
            actions = {DeferralCards.Action:Submit({
                title = 'Annuler',
                id = 'submit_cancel'
            })}
        })}
    })
end

cards.not_on_discord = function(name)
    return DeferralCards.Card:Create({
        body = {DeferralCards.CardElement:TextBlock({
            text = ('Nous rencontrons un problème, %s !'):format(name),
            size = 'Large',
            weight = 'Bolder'
        }), DeferralCards.CardElement:TextBlock({
            text = 'Vous n\'êtes pas sur le serveur Discord de ce serveur.',
            size = 'Medium',
            weight = 'Lighter'
        }), DeferralCards.Container:ActionSet({
            actions = {DeferralCards.Action:OpenUrl({
                url = 'https://discord.gg/w7xFsvxs',
                title = 'Rejoindre le discord',
                id = 'submit_discord'
            }), DeferralCards.Action:Submit({
                title = 'Annuler',
                id = 'submit_cancel'
            })}
        })}
    })
end

cards.too_many_players = function(name)
    return DeferralCards.Card:Create({
        body = {DeferralCards.CardElement:TextBlock({
            text = ('Nous rencontrons un problème, %s !'):format(name),
            size = 'Large',
            weight = 'Bolder'
        }), DeferralCards.CardElement:TextBlock({
            text = 'Il y a trop de joueurs connectés actuellement, veuillez réessayer plus tard.',
            size = 'Medium',
            weight = 'Lighter'
        })}
    })
end

local CheckingCard = function(deferrals, name)
    deferrals.presentCard(cards.checking(name), function(data, raw)
    end)
end

local NoDiscordCard = function(deferrals, name)
    deferrals.presentCard(cards.no_discord(name), function(data, raw)
        if (data.submitId == "submit_cancel") then
            deferrals.done("Vous devez avoir Discord lié à votre compte FiveM pour jouer sur ce serveur.")
        end
    end)
end

local NotOnDiscordCard = function(deferrals, name)
    deferrals.presentCard(cards.not_on_discord(name), function(data, raw)
        if (data.submitId == "submit_cancel") then
            deferrals.done("Vous n'êtes pas sur le serveur Discord de ce serveur.")
        end
    end)
end

local NotWhitelistedCard = function(deferrals, name)
    deferrals.presentCard(cards.not_whitelisted(name), function(data, raw)
        if (data.submitId == "submit_cancel") then
            deferrals.done("Vous n'êtes pas whitelisté sur ce serveur.")
        end
    end)
end

local BanCard = function(deferrals, name, reason, expiration)
    deferrals.presentCard(cards.banned(name, reason, expiration), function(data, raw)
        if (data.submitId == "submit_cancel") then
            deferrals.done("Vous avez été banni de ce serveur.")
        end
    end)
end

local TooManyPlayersCard = function(deferrals, name)
    deferrals.presentCard(cards.too_many_players(name), function(data, raw)
    end)
end

AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    local src = source;

    deferrals.defer()

    Citizen.Wait(500)

    local identifiers = Identifiers.Parse(GetPlayerIdentifiers(src))

    CheckingCard(deferrals, name)

    Citizen.Wait(1000)

    if (identifiers.discord == nil) then
        NoDiscordCard(deferrals, name)
        return
    end

    local ban = DB.Ban.Get(identifiers.discord)

    if (ban ~= nil) then
        if (ban.expiration ~= nil and ban.expiration / 1000 > os.time()) then
            BanCard(deferrals, name, ban.reason, ban.expiration)
            return
        end
    end

    local member = GetGuildMember(identifiers.discord)

    if (member == nil) then
        NotOnDiscordCard(deferrals, name)
        return
    end

    if (#GetPlayers() >= Config.MaxSlots) then
        TooManyPlayersCard(deferrals, name)
        return
    end

    local function AllowConnection()
        if (DB.Player.Get(identifiers.discord) == nil) then
            DB.Player.Create(identifiers.discord)
        end

        deferrals.done()

        SharedModules.Log:Create(src, "player", "connect", {})
    end

    for k, v in pairs(member.roles) do
        for _, role in pairs(whitelist_roles) do
            if (v == role) then
                AllowConnection()
                return
            end
        end
    end

    NotWhitelistedCard(deferrals, name)
end)
