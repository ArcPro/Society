Lists = Lists or {}

Lists.Emotes = {}

Lists.Emotes.Expressions = {
    ["Aiming"] = {"mood_aiming_1", "Concentré"},
    ["Angry"] = {"mood_angry_1", "En colère"},
    ["Burning"] = {"burning_1", "En feu"},
    ["Crying"] = {"console_wasnt_fun_end_loop_floyd_facial", "En pleurs"},
    ["Dead"] = {"dead_1", "Mort"},
    ["Drunk"] = {"mood_drunk_1", "Ivre"},
    ["Dumb"] = {"pose_injured_1", "Stupide"},
    ["Electrocuted"] = {"electrocuted_1", "Electrocuté"},
    ["Excited"] = {"mood_excited_1", "Excité"},
    ["Frustrated"] = {"mood_frustrated_1", "Frustré"},
    ["Grumpy"] = {"effort_1", "Grincheux 1"},
    ["Grumpy2"] = {"mood_drivefast_1", "Grincheux 2"},
    ["Grumpy3"] = {"pose_angry_1", "Grincheux 3"},
    ["Happy"] = {"mood_happy_1", "Heureux"},
    ["Injured"] = {"mood_injured_1", "Blessé"},
    ["Joyful"] = {"mood_dancing_low_1", "Joyeux"},
    ["Mouthbreather"] = {"smoking_hold_1", "Respiration de la bouche"},
    ["Neverblink"] = {"pose_normal_1", "Fixer"},
    ["Oneeye"] = {"pose_aiming_1", "Un oeil"},
    ["Shocked"] = {"shocked_1", "Sous le choc 1"},
    ["Shocked2"] = {"shocked_2", "Sous le choc 2"},
    ["Sleeping"] = {"mood_sleeping_1", "En train de dormir 1"},
    ["Sleeping2"] = {"dead_1", "En train de dormir 2"},
    ["Sleeping3"] = {"dead_2", "En train de dormir 3"},
    ["Smug"] = {"mood_smug_1", "Suffisant"},
    ["Speculative"] = {"mood_aiming_1", "Spéculatif"},
    ["Stressed"] = {"mood_stressed_1", "Stressé"},
    ["Sulking"] = {"mood_sulk_1", "Bouder"},
    ["Weird"] = {"effort_2", "Bizarre 1"},
    ["Weird2"] = {"effort_3", "Bizarre 2"}
}

Lists.Emotes.AimStyles = {
    ["Cow boy"] = "Hillbilly",
    ["Gangster"] = "Gang1H",
    ["Police"] = "Default"
}

Lists.Emotes.HolsterStyles = {
    ["Mêlée"] = {
        holster = {dict = "melee@holster", clip = "holster", duration = 200},
        unholster = {dict = "melee@holster", clip = "unholster", duration = 200}
    },
    ["Gangster"] = {
        holster = {
            dict = "reaction@intimidation@1h",
            clip = "outro",
            duration = 800
        },
        unholster = {
            dict = "reaction@intimidation@1h",
            clip = "intro",
            duration = 900
        }
    },
    ["Police"] = {
        holster = {
            dict = "reaction@intimidation@cop@unarmed",
            clip = "intro",
            duration = 400
        },
        unholster = {
            dict = "rcmjosh4",
            clip = "josh_leadout_cop2",
            duration = 300,
            cancel = true
        }
    }
}

Lists.Emotes.Walks = {
    ["Alien"] = {"move_m@alien"},
    ["Armored"] = {"anim_group_move_ballistic", "Blindé"},
    ["Arrogant"] = {"move_f@arrogant@a"},
    ["Butch"] = {"move_m@hurry_butch@a", "Pressé"},
    ["Butch2"] = {"move_m@hurry_butch@b", "Pressé 2"},
    ["Butch3"] = {"move_m@hurry_butch@c", "Pressé 3"},
    ["Buzzed"] = {"move_m@buzzed", "Clochard 2"},
    ["Brave"] = {"move_m@brave", "Brave 1"},
    ["Brave2"] = {"move_m@brave@a", "Brave 2"},
    ["Casey"] = {"move_casey"},
    ["Casual"] = {"move_m@casual@a", "Casual 1"},
    ["Casual2"] = {"move_m@casual@b", "Casual 2"},
    ["Casual3"] = {"move_m@casual@c", "Casual 3"},
    ["Casual4"] = {"move_m@casual@d", "Casual 4"},
    ["Casual5"] = {"move_m@casual@e", "Casual 5"},
    ["Casual6"] = {"move_m@casual@f", "Casual 6"},
    ["Chichi"] = {"move_f@chichi"},
    ["Confident"] = {"move_m@confident"},
    ["Cop"] = {"move_m@business@a", "Policier 1"},
    ["Cop2"] = {"move_m@business@b", "Policier 2"},
    ["Cop3"] = {"move_m@business@c", "Policier 3"},
    ["Coward"] = {"move_m@coward", "Lâche"},
    ["Chubbymale"] = {"move_chubby", "Homme enrobé"},
    ["Chubbyfemale"] = {"move_f@chubby@a", "Femme enrobé"},
    ["Dave"] = {"move_characters@dave_n"},
    ["Defaultfemale"] = {"move_f@multiplayer", "Basique (Femme)"},
    ["Defaultmale"] = {"move_m@multiplayer", "Basique (Homme)"},
    ["Depressed"] = {"move_m@depressed@a", "Déprimé 1"},
    ["Depressed2"] = {"move_m@depressed@b", "Déprimé 2"},
    ["Depressed3"] = {"move_f@depressed@a", "Déprimé 3"},
    ["Depressed4"] = {"move_f@depressed@c", "Déprimé 4"},
    ["Dreyfuss"] = {"move_dreyfuss"},
    ["Drunk"] = {"move_m@drunk@a", "Bourré 1"},
    ["Drunk2"] = {"move_m@buzzed", "Bourré 2"},
    ["Drunk3"] = {"move_m@drunk@moderatedrunk", "Bourré 3 - Modéré"},
    ["Drunk4"] = {"move_m@drunk@moderatedrunk_head_up", "Bourré 4 - Modéré 2"},
    ["Drunk5"] = {"move_m@drunk@slightlydrunk", "Bourré 5 - Léger"},
    ["Drunk6"] = {"move_m@drunk@verydrunk", "Bourré 6 - Epave"},
    ["Fat"] = {"move_m@fat@a", "Homme gros"},
    ["Fat2"] = {"move_f@fat@a", "Femme grosse"},
    ["Fat3"] = {"move_m@fat@bulky", "Gros & Volumineux"},
    ["Fat4"] = {"move_f@fat@a_no_add", "Femme grosse 2"},
    ["Femme"] = {"move_f@femme@"},
    ["Femme2"] = {"move_m@femme@", "Femme 2"},
    ["Franklin2"] = {"move_characters@franklin@fire", "Franklin 2"},
    ["Mickael2"] = {"move_characters@michael@fire", "Mickael 2"},
    ["Trevor2"] = {"move_m@fire", "Trevor"},
    ["Flee"] = {"move_f@flee@a", "Fuir 1 (femme)"},
    ["Flee2"] = {"move_f@flee@c", "Fuir 2 (femme)"},
    ["Flee3"] = {"move_m@flee@a", "Fuir 1 (homme)"},
    ["Flee4"] = {"move_m@flee@b", "Fuir 2 (homme)"},
    ["Flee5"] = {"move_m@flee@c", "Fuir 3 (homme)"},
    ["Floyd"] = {"move_characters@floyd"},
    ["Franklin"] = {"move_p_m_one"},
    ["Gangster"] = {"move_m@gangster@generic"},
    ["Gangsterb"] = {"move_gangster", "Gangster 2"},
    ["Gangsterc"] = {"move_m@gangster@ng", "Gangster 3"},
    ["Gangsterd"] = {"move_m@gangster@var_a", "Gangster 4"},
    ["Gangstere"] = {"move_m@gangster@var_b", "Gangster 5"},
    ["Gangsterf"] = {"move_m@gangster@var_c", "Gangster 6"},
    ["Gangsterg"] = {"move_m@gangster@var_d", "Gangster 7"},
    ["Gangsterh"] = {"move_m@gangster@var_e", "Gangster 8"},
    ["Gangsteri"] = {"move_m@gangster@var_f", "Gangster 9"},
    ["Gangsterj"] = {"move_m@gangster@var_g", "Gangster 10"},
    ["Gangsterk"] = {"move_m@gangster@var_h", "Gangster 11"},
    ["Gangsterl"] = {"move_m@gangster@var_i", "Gangster 12"},
    ["Gangsterm"] = {"move_m@gangster@var_j", "Gangster 13"},
    ["Gangstern"] = {"move_m@gangster@var_k", "Gangster 14"},
    ["Genenric"] = {"move_m@generic", "Generic (homme)"},
    ["Genenric2"] = {"move_f@generic", "Generic (femme)"},
    ["Grooving"] = {"anim@move_m@grooving@", "Grooving H1"},
    ["Grooving2"] = {"anim@move_f@grooving@", "Grooving F1"},
    ["Guard"] = {"move_m@prison_gaurd", "Garde de Prison"},
    ["Handcuffs"] = {"move_m@prisoner_cuffed", "Menotté"},
    ["Heels"] = {"move_f@heels@c", "Talons 1"},
    ["Heels2"] = {"move_f@heels@d", "Talons 2"},
    ["Hiking"] = {"move_m@hiking", "Randonné 1"},
    ["Hiking2"] = {"move_f@hiking", "Randonné 2"},
    ["Hipster"] = {"move_m@hipster@a"},
    ["Hobo"] = {"move_m@hobo@a", "Clochard 2"},
    ["Hobo2"] = {"move_m@hobo@b", "Clochard 3"},
    ["Hurry"] = {"move_m@hurry@a", "Pressé (homme)"},
    ["Hurry2"] = {"move_f@hurry@a", "Pressé F1"},
    ["Hurry3"] = {"move_f@hurry@b", "Pressé F2"},
    ["Injured2"] = {"move_f@injured", "Blessé 2 - Femme"},
    ["Intimidation"] = {"move_m@intimidation@1h", "Intimidé 1"},
    ["Intimidation2"] = {"move_m@intimidation@cop@unarmed", "Intimidé 2"},
    ["Intimidation3"] = {"move_m@intimidation@unarmed", "Intimidé 3"},
    ["Janitor"] = {"move_p_m_zero_janitor", "Concierge 1"},
    ["Janitor2"] = {"move_p_m_zero_slow", "Concierge 2"},
    ["Jimmy"] = {"move_characters@jimmy"},
    ["Jog"] = {"move_m@jog@"},
    ["Nervous"] = {"move_characters@jimmy@nervous@", "Nerveux"},
    ["Lamar"] = {"move_characters@lamar"},
    ["Lamar2"] = {"anim_group_move_lemar_alley", "Lamar 2"},
    ["Lester"] = {"move_heist_lester"},
    ["Lester2"] = {"move_lester_caneup", "Lester 2"},
    ["Maneater"] = {"move_f@maneater", "Mangeur d'hommes"},
    ["Michael"] = {"move_ped_bucket"},
    ["Money"] = {"move_m@money", "Riche"},
    ["Muscle"] = {"move_m@muscle@a"},
    ["Patricia"] = {"move_characters@patricia"},
    ["Paramedic"] = {"move_paramedic", "Medecin"},
    ["Posh"] = {"move_m@posh@", "Hautain 1"},
    ["Posh2"] = {"move_f@posh@", "Hautain 2"},
    ["Quick"] = {"move_m@quick", "Coincé"},
    ["Ron"] = {"move_characters@ron"},
    ["Runner"] = {"female_fast_runner"},
    ["Sad"] = {"move_m@sad@a", "Triste - Homme"},
    ["Sad2"] = {"move_m@sad@b", "Triste 2 - Homme"},
    ["Sad3"] = {"move_m@sad@c", "Triste 3 - Homme"},
    ["Sad4"] = {"move_f@sad@a", "Triste 1 - Femme"},
    ["Sad5"] = {"move_f@sad@b", "Triste 2 - Femme"},
    ["Sassy"] = {"move_m@sassy", "Efféminé - Homme"},
    ["Sassy2"] = {"move_f@sassy", "Efféminé - Femme"},
    ["Scared"] = {"move_f@scared", "Appeuré"},
    ["Sexy"] = {"move_f@sexy@a"},
    ["Shady"] = {"move_m@shadyped@a"},
    ["Slow"] = {"move_characters@jimmy@slow@", "Jimmy 2"},
    ["Stripper"] = {"move_f@stripper@a"},
    ["Swagger"] = {"move_m@swagger", "Swag 1"},
    ["Swagger2"] = {" move_m@swagger@b", "Swag 2"},
    ["Tough"] = {"move_m@tough_guy@", "Brute 1"},
    ["Tough2"] = {"move_f@tough_guy@", "Brute 2"},
    ["Toolbelt"] = {"move_m@tool_belt@a", "Ceinture Outil - Homme"},
    ["Toolbelt2"] = {"move_f@tool_belt@a", "Ceinture Outil - Femme"},
    ["Trash"] = {"clipset@move@trash_fast_turn"},
    ["Trash2"] = {"missfbi4prepp1_garbageman", "Trash 2"},
    ["Tracey"] = {"move_characters@tracey"},
    ["Trevor"] = {"move_p_m_two"},
    ["Veryslow"] = {"move_m@leaf_blower", "Very Slow"},
    ["Wide"] = {"move_m@bag"}
}

Lists.Emotes.Shared = {

    ["handshake"] = {
        "mp_ped_interaction",
        "handshake_guy_a",
        "Poignée de main",
        "handshake2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000,
            SyncOffsetFront = 0.9
        }
    },
    ["handshake2"] = {
        "mp_ped_interaction",
        "handshake_guy_b",
        "Poignée de main 2",
        "handshake",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 3000}
    },
    ["hug"] = {
        "mp_ped_interaction",
        "kisses_guy_a",
        "Câlin",
        "hug2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000,
            SyncOffsetFront = 1.05
        }
    },
    ["hug2"] = {
        "mp_ped_interaction",
        "kisses_guy_b",
        "Câlin 2",
        "hug",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000,
            SyncOffsetFront = 1.18
        }
    },
    ["hugr"] = {
        "misscarsteal2chad_goodbye",
        "chad_armsaround_chad",
        "Câlin Romantique 1",
        "hugr2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetSide = -0.05,
            SyncOffsetFront = 0.52
        }
    },
    ["hugr2"] = {
        "misscarsteal2chad_goodbye",
        "chad_armsaround_girl",
        "Câlin Romantique 2",
        "hugr",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetSide = -0.05,
            SyncOffsetFront = 0.52
        }
    },
    ["bro"] = {
        "mp_ped_interaction",
        "hugs_guy_a",
        "Bro",
        "bro2",
        AnimationOptions = {SyncOffsetFront = 1.14}
    },
    ["bro2"] = {
        "mp_ped_interaction",
        "hugs_guy_b",
        "Bro 2",
        "bro",
        AnimationOptions = {SyncOffsetFront = 1.14}
    },
    ["give"] = {
        "mp_common",
        "givetake1_a",
        "Donner 1",
        "give2",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 2000}
    },
    ["give2"] = {
        "mp_common",
        "givetake1_b",
        "Donner 2",
        "give",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 2000}
    },
    ["baseball"] = {
        "anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_a",
        "Baseball", "baseballthrow"
    },
    ["baseballthrow"] = {
        "anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_b",
        "Baseball - Lancer", "baseball"
    },
    ["stickup"] = {
        "random@countryside_gang_fight",
        "biker_02_stickup_loop",
        "Pointer avec son arme",
        "stickupscared",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["stickupscared"] = {
        "missminuteman_1ig_2",
        "handsup_base",
        "Se faire pointer avec une arme",
        "stickup",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["punch"] = {
        "melee@unarmed@streamed_variations", "plyr_takedown_rear_lefthook",
        "Frapper quelqu'un", "punched"
    },
    ["punched"] = {
        "melee@unarmed@streamed_variations", "victim_takedown_front_cross_r",
        "Se faire frapper", "punch"
    },
    ["headbutt"] = {
        "melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt",
        "Mettre un coup de boule", "headbutted"
    },
    ["headbutted"] = {
        "melee@unarmed@streamed_variations", "victim_takedown_front_headbutt",
        "Se prendre un coup de boule", "headbutt"
    },
    ["slap2"] = {
        "melee@unarmed@streamed_variations",
        "plyr_takedown_front_backslap",
        "Mettre une gifle 2",
        "slapped2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["slap"] = {
        "melee@unarmed@streamed_variations",
        "plyr_takedown_front_slap",
        "Mettre une gifle 1",
        "slapped",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["slapped"] = {
        "melee@unarmed@streamed_variations", "victim_takedown_front_slap",
        "Se prendre une gifle 1", "slap"
    },
    ["slapped2"] = {
        "melee@unarmed@streamed_variations", "victim_takedown_front_backslap",
        "Se prendre une gifle 2", "slap2"
    },
    ["receiveblowjob"] = {
        "misscarsteal2pimpsex",
        "pimpsex_punter",
        "Receive Blowjob",
        "giveblowjob",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 30000,
            SyncOffsetFront = 0.63
        },
        AdultAnimation = true
    },
    ["giveblowjob"] = {
        "misscarsteal2pimpsex",
        "pimpsex_hooker",
        "Give Blowjob",
        "receiveblowjob",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 30000,
            SyncOffsetFront = 0.63
        },
        AdultAnimation = true
    },
    ["streetsexmale"] = {
        "misscarsteal2pimpsex",
        "shagloop_pimp",
        "Street Sex Male",
        "streetsexfemale",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetFront = 0.50
        },
        AdultAnimation = true
    },
    ["streetsexfemale"] = {
        "misscarsteal2pimpsex",
        "shagloop_hooker",
        "Street Sex Female",
        "streetsexmale",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetFront = 0.50
        },
        AdultAnimation = true
    },
    ["carry"] = {
        "missfinale_c2mcs_1",
        "fin_c2_mcs_1_camman",
        "Porter 1",
        "carry2",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["carry2"] = {
        "nm",
        "firemans_carry",
        "Se faire porter 1",
        "carry",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 40269,
            xPos = -0.14,
            yPos = 0.15,
            zPos = 0.14,
            xRot = 0.0,
            yRot = -59.0,
            zRot = -4.5
        }
    },
    ["carry3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Porter 2",
        "carry4",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["carry4"] = {
        "amb@code_human_in_car_idles@generic@ps@base",
        "base",
        "Se faire porter 2",
        "carry3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 28252,
            xPos = 0.350,
            yPos = 0.15,
            zPos = -0.15,
            xRot = -42.50,
            yRot = -22.50,
            zRot = 22.50
        }
    },
    ["carrymecute"] = { -- Male Custom emote by Amnilka
        "amnilka@photopose@couple@couplefirst",
        "amnilka_couple_mal_002",
        "Porter - Cute 1",
        "carrymecute2",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["carrymecute2"] = { -- Female Custom emote by Amnilka
        "amnilka@photopose@couple@couplefirst",
        "amnilka_couple_fem_002",
        "Se faire porter - Cute 1",
        "carrymecute",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.0000,
            yPos = 0.0000,
            zPos = 0.0000,
            xRot = 0.0000,
            yRot = 0.0000,
            zRot = 0.0000
        }
    },
    ["carrycmg"] = { -- Male Custom emote by CMG Mods
        "couplepose1cmg@animation",
        "couplepose1cmg_clip",
        "Porter - Cute 2",
        "carrycmg2",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["carrycmg2"] = { -- Female Custom emote by CMG Mods
        "couplepose2cmg@animation",
        "couplepose2cmg_clip",
        "Se faire porter - Cute 2",
        "carrycmg",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.0100,
            yPos = 0.3440,
            zPos = -0.0100,
            xRot = 180.0000,
            yRot = 180.0000,
            zRot = -1.9999
        }
    },
    ["bestfriends"] = { -- Female Custom emote by MrWitt
        "mrwitt@casual_composure_female01",
        "mrwitt",
        "Best Friends 1",
        "bestfriends2",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["bestfriends2"] = { -- Female Custom emote by MrWitt
        "mrwitt@casual_composure_female02",
        "mrwitt",
        "Best Friends 2",
        "bestfriends",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = -0.2500,
            yPos = 0.1400,
            zPos = 0.0200,
            xRot = 0.0000,
            yRot = 0.0000,
            zRot = -0.0000
        }
    },
    ["bff"] = {
        "anim@male_couple_03_b",
        "m_couple_03_b_clip",
        "BFF - Homme",
        "bffb",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["bffb"] = {
        "anim@female_couple_03_b",
        "f_couple_03_b_clip",
        "BFF - Femme",
        "bff",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.0100,
            yPos = 0.1300,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 76.0000
        }
    },
    ["sitwithmepose"] = { -- Male Custom emote by Amnilka
        "amnilka@photopose@couple@couplefirst",
        "amnilka_couple_mal_003",
        "Assis toi avec moi - Homme",
        "sitwithmepose2",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["sitwithmepose2"] = { -- Female Custom emote by Amnilka
        "amnilka@photopose@couple@couplefirst",
        "amnilka_couple_fem_003",
        "Assis toi avec moi - Femme",
        "sitwithmepose",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.3540,
            yPos = 0.5110,
            zPos = 0.8310,
            xRot = 0.0000,
            yRot = 0.0000,
            zRot = -2.8000
        }
    },
    ["hugpose"] = { -- Male Custom emote by Amnilka
        "amnilka@photopose@couple@couplefirst",
        "amnilka_couple_mal_001",
        "Câlin 2 - Homme",
        "hugpose2",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["hugpose2"] = { -- Female Custom emote by Amnilka
        "amnilka@photopose@couple@couplefirst",
        "amnilka_couple_fem_001",
        "Câlin 2 - Femme",
        "hugpose",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.1400,
            yPos = 0.2500,
            zPos = 0.0000,
            xRot = 0.0000,
            yRot = 0.0000,
            zRot = 0.0000
        }
    },
    ["hugtip"] = { -- Male Custom emote by Little Spoon
        "littlespoon@friendship007",
        "friendship007",
        "Câlin 3 - Homme",
        "hugtip2",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["hugtip2"] = { -- Female Custom emote by Little Spoon
        "littlespoon@friendship008",
        "friendship008",
        "Câlin 3 - Femme",
        "hugtip",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.0100,
            yPos = 0.2700,
            zPos = 0.0,
            xRot = -180.0000,
            yRot = -180.0000,
            zRot = 10.0000
        }
    },
    ["cutepicpose"] = { -- Male Custom emote by Amnilka
        "amnilka@photopose@couple@couplefirst",
        "amnilka_couple_mal_004",
        "Pose Cute - Homme",
        "cutepicpose2",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["cutepicpose2"] = { -- Female Custom emote by Amnilka
        "amnilka@photopose@couple@couplefirst",
        "amnilka_couple_fem_004",
        "Pose Cute - Femme",
        "cutepicpose",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.2700,
            yPos = 0.1200,
            zPos = 0.0000,
            xRot = 0.0000,
            yRot = 0.0000,
            zRot = 0.0000
        }
    },
    ["couplehhands"] = { -- Male Custom emote by Amnilka
        "amnilka@photopose@couple@couplefirst",
        "amnilka_couple_mal_005",
        "Couple Coeur - Homme",
        "couplehhands2",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["couplehhands2"] = { -- Female Custom emote by Amnilka
        "amnilka@photopose@couple@couplefirst",
        "amnilka_couple_fem_005",
        "Couple Coeur - Femme",
        "couplehhands",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = -0.1230,
            yPos = 0.4740,
            zPos = 0.0000,
            xRot = 0.0000,
            yRot = 0.0000,
            zRot = 94.0000
        }
    },
    ["couplewed1a"] = { -- Male Custom emote by EnchantedBrownie
        "EnchantedBrwny@wedding1a",
        "wedding1a",
        "Couple Mariage Pose 1A",
        "couplewed1b",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["couplewed1b"] = { -- Female Custom emote by EnchantedBrownie
        "EnchantedBrwny@wedding1b",
        "wedding1b",
        "Couple Mariage Pose 1B",
        "couplewed1a",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.0300,
            yPos = 1.0000,
            zPos = 0.0200,
            xRot = 0.0000,
            yRot = 0.0000,
            zRot = 130.0000
        }
    },
    ["couplewed2a"] = { -- Male Custom emote by EnchantedBrownie
        "EnchantedBrwny@wedding2b",
        "wedding2b",
        "Couple Mariage Pose 2A",
        "couplewed2b",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["couplewed2b"] = { -- Female Custom emote by EnchantedBrownie
        "EnchantedBrwny@wedding2a",
        "wedding2a",
        "Couple Mariage Pose 2B",
        "couplewed2a",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.0100,
            yPos = 0.2500,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = -88.9000
        }
    },
    ["liftme"] = { -- Male Custom emote by -Moses-
        "couplepose1pack1anim2@animation",
        "couplepose1pack1anim2_clip",
        "Porte moi 1 - Homme",
        "liftme2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["liftme2"] = { -- Female Custom emote by -Moses-
        "couplepose1pack1anim1@animation",
        "couplepose1pack1anim1_clip",
        "Porte moi 1 - Femme",
        "liftme",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.0020,
            yPos = 0.2870,
            zPos = 0.2500,
            xRot = 0.0000,
            yRot = 0.0000,
            zRot = 180.0000
        }
    },
    ["liftme3"] = { -- Male Custom emote by -Moses-
        "couplepose2pack1anim2@animation",
        "couplepose2pack1anim2_clip",
        "Porte moi 2 - Homme",
        "liftme4",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["liftme4"] = { -- Female Custom emote by -Moses-
        "couplepose2pack1anim1@animation",
        "couplepose2pack1anim1_clip",
        "Porte moi 2 - Femme",
        "liftme3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.0100,
            yPos = 0.4800,
            zPos = 0.5300,
            xRot = 0.0000,
            yRot = 0.0000,
            zRot = 180.0000
        }
    },
    ["liftme5"] = { -- Male Custom emote by -Moses-
        "couplepose3pack1anim2@animation",
        "couplepose3pack1anim2_clip",
        "Porte moi 3 - Homme",
        "liftme6",
        AnimationOptions = {EmoteLoop = true}
    },
    ["liftme6"] = { -- Female Custom emote by -Moses-
        "couplepose3pack1anim1@animation",
        "couplepose3pack1anim1_clip",
        "Porte moi 3 - Femme",
        "liftme5",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = -0.2120,
            yPos = -0.5400,
            zPos = -0.1000,
            xRot = 0.0000,
            yRot = 0.0000,
            zRot = 0.0000
        }
    },
    ["csdog"] = {
        "anim@heists@box_carry@",
        "idle",
        "Porter Petit Chien 1",
        "csdog2",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true},
        AnimalEmote = true
    },
    ["csdog2"] = { -- Emote by MissSnowie
        "misssnowie@little_doggy_lying_down",
        "base",
        "Petit Chien Porté 1",
        "csdog",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = -0.040,
            yPos = 0.330,
            zPos = 0.280,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 80.0
        },
        AnimalEmote = true
    },
    ["csdog3"] = { -- Custom Emote by MissSnowie
        "hooman@hugging_little_doggy",
        "base",
        "Porter Petit Chien 2",
        "csdog4",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true},
        AnimalEmote = true
    },
    ["csdog4"] = { -- Custom Emote by MissSnowie
        "little_doggy@hugging_hooman",
        "base",
        "Petit Chien Porté 2",
        "csdog3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 24818,
            xPos = -0.95,
            yPos = 0.16,
            zPos = -0.15,
            xRot = 3.70,
            yRot = 75.00,
            zRot = -161.90
        },
        AnimalEmote = true
    },
    ["cbdog"] = {
        "anim@heists@box_carry@",
        "idle",
        "Porter Gros Chien 1",
        "cbdog2",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true},
        AnimalEmote = true
    },
    ["cbdog2"] = {
        "creatures@rottweiler@amb@sleep_in_kennel@",
        "sleep_in_kennel",
        "Gros Chien Porté 1",
        "cbdog",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = -0.100,
            yPos = 0.650,
            zPos = 0.430,
            xRot = 0.0,
            yRot = 0.0,
            zRot = -100.00
        },
        AnimalEmote = true
    },
    ["pback"] = { -- Custom Animation By SapphireMods
        "mx@piggypack_a",
        "mxclip_a",
        "Porter sur le dos",
        "pback2",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["pback2"] = { -- Custom Animation By SapphireMods
        "mx@piggypack_b",
        "mxanim_b",
        "Se faire porter (dos)",
        "pback",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.0200,
            yPos = -0.4399,
            zPos = 0.4200,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0
        }
    },
    ["cprs"] = {
        "mini@cpr@char_a@cpr_str",
        "cpr_pumpchest",
        "Pratiquer massage cardiaque 1",
        "cprs2",
        AnimationOptions = {EmoteLoop = true, StartDelay = 250}
    },
    ["cprs2"] = {
        "mini@cpr@char_b@cpr_str",
        "cpr_pumpchest",
        "Recevoir massage cardiaque 1",
        "cprs",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.35,
            yPos = 0.8,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 270.0
        }
    },
    ["cprs3"] = {
        "missheistfbi3b_ig8_2",
        "cpr_loop_paramedic",
        "Pratiquer massage cardiaque 2",
        "cprs4",
        AnimationOptions = {EmoteLoop = true, StartDelay = 250}
    },
    ["cprs4"] = {
        "missheistfbi3b_ig8_2",
        "cpr_loop_victim",
        "Recevoir massage cardiaque 2",
        "cprs3",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.35,
            yPos = 0.65,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 270.0
        }
    },
    ["hostage"] = {
        "anim@gangops@hostage@",
        "perp_idle",
        "Prendre en otage",
        "hostage2",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["hostage2"] = {
        "anim@gangops@hostage@",
        "victim_idle",
        "Etre un otage",
        "hostage",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            xPos = -0.3,
            yPos = 0.1,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0
        }
    },
    ["search"] = { -- Custom Emote By ultrahacx
        "custom@police",
        "police",
        "Fouiller",
        "search2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = false
            -- EmoteDuration = 9700
        }
    },
    ["search2"] = {
        "missfam5_yoga",
        "a2_pose",
        "Se faire fouiller",
        "search",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = false,
            -- EmoteDuration = 9700,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.5,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0
        }
    },
    ["followa"] = { -- Custom Ped In Front Emote By Dollie Mods
        "dollie_mods@follow_me_001",
        "follow_me_001",
        "Follow A (Front)",
        "followb",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
            -- We can set this to true for lols, however it messes up if you walk through doors. Either player can press X to cancel the shared emotes
        }
    },
    ["followb"] = { -- Custom Ped At Back Emote by Dollie Mods
        "dollie_mods@follow_me_002",
        "follow_me_002",
        "Follow B (Back)",
        "followa",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.078,
            yPos = 0.018,
            zPos = 0.00,
            xRot = 0.00,
            yRot = 0.00,
            zRot = 0.00
        }
    },
    ["kiss"] = {
        "hs3_ext-20",
        "cs_lestercrest_3_dual-20",
        "Embrasser 1 - Homme",
        "kiss2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 10000,
            SyncOffsetFront = 0.08
        }
    },
    ["kiss2"] = {
        "hs3_ext-20",
        "csb_georginacheng_dual-20",
        "Embrasser 1 - Femme",
        "kiss",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 10000,
            SyncOffsetFront = 0.08
        }
    },
    ["kiss3"] = {
        "hs3_ext-19",
        "cs_lestercrest_3_dual-19",
        "Embrasser 2 - Homme",
        "kiss4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 10000,
            SyncOffsetFront = 0.08
        }
    },
    ["kiss4"] = {
        "hs3_ext-19",
        "csb_georginacheng_dual-19",
        "Embrasser 2 - Femme",
        "kiss3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 10000,
            SyncOffsetFront = 0.08
        }
    },
    ["kisscuteneck"] = {
        "genesismods_kissme@kissmale8",
        "kissmale8",
        "Embrasser dans le cou - Homme",
        "kisscuteneck2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            -- SyncOffsetFront = 0.05,
            -- bone = 0,
            xPos = -0.56,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0

        }
    },
    ["kisscuteneck2"] = {
        "genesismods_kissme@kissfemale8",
        "kissfemale8",
        "Embrasser dans le cou - Femme",
        "kisscuteneck",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
            -- SyncOffsetFront = 0.05,

        }
    },
    ["kisscutecheek"] = {
        "genesismods_kissme@kissmale9",
        "kissmale9",
        "Embrasser sur la joue - Homme",
        "kisscutecheek2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            -- SyncOffsetFront = 0.05,
            -- bone = 0,
            xPos = 0.35,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0

        }
    },
    ["kisscutecheek2"] = {
        "genesismods_kissme@kissfemale9",
        "kissfemale9",
        "Embrasser sur la joue - Femme",
        "kisscutecheek",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
            -- SyncOffsetFront = 0.05,

        }
    },
    ["kisscutefh"] = {
        "genesismods_kissme@kissmale10",
        "kissmale10",
        "Embrasser front - Homme",
        "kisscutefh2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            -- SyncOffsetFront = 0.05,
            -- bone = 0,
            xPos = 0.38,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0

        }
    },
    ["kisslips"] = {
        "chocoholic@couple13",
        "couple13_clip",
        "Kiss Cute Lips (Female)",
        "kisslips2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.1600,
            yPos = 0.2700,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 130.0

        }
    },
    ["kisslips2"] = {
        "chocoholic@couple14",
        "couple14_clip",
        "Kiss Cute Lips (Male)",
        "kisslips",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["kisscutefh2"] = {
        "genesismods_kissme@kissfemale10",
        "kissfemale10",
        "Embrasser front - Femme",
        "kisscutefh",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
            -- SyncOffsetFront = 0.05,

        }
    },
    ["coupleanim"] = {
        "anim@scripted@robbery@tun_prep_uni_ig1_couple@",
        "action_var_01_bank_manager",
        "Couple Drinking (Wine Glasses)",
        "coupleanim2",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 60309,
            PropPlacement = {-0.0500, -0.0100, -0.1700, 0.0, 0.0, 0.0},
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["coupleanim2"] = {
        "anim@scripted@robbery@tun_prep_uni_ig1_couple@",
        "action_var_01_female",
        "Couple Drinking F (Wine Glasses)",
        "coupleanim",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            SyncOffsetSide = -0.04125,
            SyncOffsetFront = 0.11,
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["holdme"] = { -- Custom Animation By SapphireMods
        "mx_couple5_1_a",
        "mx_couple5_1_a_clip",
        "Tiens moi 1",
        "holdmeb",
        AnimationOptions = {EmoteLoop = true}
    },
    ["holdmeb"] = { -- Custom Animation By SapphireMods
        "mx_couple5_1_b",
        "mx_couple5_1_b_clip",
        "Se faire tenir 1",
        "holdme",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = -0.0200,
            yPos = 0.2400,
            zPos = -0.0100,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0
        }
    },
    ["holdmec"] = { -- Custom Animation By SapphireMods
        "mx_couple5_2_a",
        "mx_couple5_2_a_clip",
        "Tiens moi 2",
        "holdmed",
        AnimationOptions = {EmoteLoop = true}
    },
    ["holdmed"] = { -- Custom Animation By SapphireMods
        "mx_couple5_2_b",
        "mx_couple5_2_b_clip",
        "Se faire tenir 2",
        "holdmec",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = -0.1200,
            yPos = 0.3600,
            zPos = -0.0100,
            xRot = 0.0,
            yRot = 0.0,
            zRot = -180.0
        }
    },
    ["holdmee"] = { -- Custom Animation By SapphireMods
        "mx_couple5_3_a",
        "mx_couple5_3_a_clip",
        "Tiens moi 3",
        "holdmef",
        AnimationOptions = {EmoteLoop = true}
    },
    ["holdmef"] = { -- Custom Animation By SapphireMods
        "mx_couple5_3_b",
        "mx_couple5_3_b_clip",
        "Se faire tenir 3",
        "holdmee",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.0400,
            yPos = 0.2100,
            zPos = -0.0300,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0
        }
    },
	["kiss5"] = {
        "tigerle@custom@couple@kissing1a",
        "tigerle_couple_kissing1a",
        "Kiss 5",
        "kiss6",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["kiss6"] = {
        "tigerle@custom@couple@kissing1b",
        "tigerle_couple_kissing1b",
        "Kiss 6",
        "kiss5",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    }, 
    ["kiss7"] = {
        "tigerle@custom@couple@kissing2a",
        "tigerle_couple_kissing2a",
        "Kiss 7",
        "kiss8",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["kiss8"] = {
        "tigerle@custom@couple@kissing2b",
        "tigerle_couple_kissing2b",
        "Kiss 8",
        "kiss7",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["cuddleet"] = {
        "tigerle@custom@couple@cuddle1a",
        "tigerle_couple_cuddle1a",
        "Kiss 7",
        "cuddleet2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["cuddleet2"] = {
        "tigerle@custom@couple@cuddle1b",
        "tigerle_couple_cuddle1b",
        "Kiss 8",
        "cuddleet",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["cuddleet3"] = {
        "tigerle@custom@couple@cuddle@no2a",
        "tigerle_couple_cuddleno2a",
        "Kiss 7",
        "cuddleet4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["cuddleet4"] = {
        "tigerle@custom@couple@cuddle@no2b",
        "tigerle_couple_cuddleno2b",
        "Kiss 8",
        "cuddleet3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["layying"] = {
        "tigerle@custom@couple@laying1a",
        "tigerle_couple_laying1a",
        "Kiss 7",
        "layying2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["layying2"] = {
        "tigerle@custom@couple@laying1b",
        "tigerle_couple_laying1b",
        "Kiss 8",
        "layying",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["sitting"] = {
        "tigerle@custom@couple@sittingonbench@no1a",
        "tigerle_couple_sittingonbench_no1a",
        "Kiss 7",
        "sitting2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["sitting2"] = {
        "tigerle@custom@couple@sittingonbench@no1b",
        "tigerle_couple_sittingonbench_no1b",
        "Kiss 8",
        "sitting",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["cuddleet5"] = {
        "tigerle@custom@couple@standcuddle_a",
        "tigerle_couple_standcuddle_a",
        "Kiss 7",
        "cuddleet6",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["cuddleet6"] = {
        "tigerle@custom@couple@standcuddle_b",
        "tigerle_couple_standcuddle_b",
        "Kiss 8",
        "cuddleet5",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.35,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 180.0,
        }
    },
    ["standingg"] = {
        "tigerle@custom@couple@standing_a",
        "tigerle_couple_standing_a",
        "Kiss 7",
        "standingg2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["standingg2"] = {
        "tigerle@custom@couple@standing_b",
        "tigerle_couple_standing_b",
        "Kiss 8",
        "standingg",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.10,
            yPos = 0.30,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["titanic"] = {
        "tigerle@custom@pose@titanic1a",
        "tigerle_pose_titanic1a",
        "Kiss 7",
        "titanic2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["titanic2"] = {
        "tigerle@custom@pose@titanic1b",
        "tigerle_pose_titanic1b",
        "Kiss 8",
        "titanic",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.10,
            yPos = 0.30,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["bfff"] = {
        "tigerle@custom@pose@bff1a",
        "tigerle_pose_bff1a",
        "Kiss 7",
        "bfff2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["bfff2"] = {
        "tigerle@custom@pose@bff1b",
        "tigerle_pose_bff1b",
        "Kiss 8",
        "bfff",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.70,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["hug3"] = {
        "misscarsteal2chad_goodbye",
        "chad_armsaround_chad",
        "Hug Romantic 1",
        "hug4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetSide = -0.05,
            SyncOffsetFront = 0.52,
        }
    },
    ["hug4"] = {
        "misscarsteal2chad_goodbye",
        "chad_armsaround_girl",
        "Hug Romantic 2",
        "hug3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetSide = -0.05,
            SyncOffsetFront = 0.52,
        }
    },
}

Lists.Emotes.Dances = {
    ["dance"] = {
        "anim@amb@nightclub@dancers@podium_dancers@",
        "hi_dance_facedj_17_v2_male^5",
        "Dance",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dance2a"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",
        "high_center_down",
        "Dance 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dance3a"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@",
        "high_center",
        "Dance 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dance4a"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",
        "high_center_up",
        "Dance 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dance5a"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_a@",
        "med_center",
        "Dance 5",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dance6a"] = {
        "misschinese2_crystalmazemcs1_cs",
        "dance_loop_tao",
        "Dance 6",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dance7a"] = {
        "misschinese2_crystalmazemcs1_ig",
        "dance_loop_tao",
        "Dance 7",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dance8a"] = {
        "missfbi3_sniping",
        "dance_m_default",
        "Dance 8",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dance9a"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "med_center_up",
        "Dance 9",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancef"] = {
        "anim@amb@nightclub@dancers@solomun_entourage@",
        "mi_dance_facedj_17_v1_female^1",
        "Dance F",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancef2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center",
        "Dance F2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancef3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center_up",
        "Dance F3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancef4"] = {
        "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
        "hi_dance_facedj_09_v2_female^1",
        "Dance F4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancef5"] = {
        "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
        "hi_dance_facedj_09_v2_female^3",
        "Dance F5",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancef6"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center_up",
        "Dance F6",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclub"] = {
        "anim@amb@nightclub_island@dancers@beachdance@",
        "hi_idle_a_m03",
        "Dance Club",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubb"] = {
        "anim@amb@nightclub_island@dancers@beachdance@",
        "hi_idle_a_m05",
        "Dance Club 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubc"] = {
        "anim@amb@nightclub_island@dancers@beachdance@",
        "hi_idle_a_m02",
        "Dance Club 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubd"] = {
        "anim@amb@nightclub_island@dancers@beachdance@",
        "hi_idle_b_f01",
        "Dance Club 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclube"] = {
        "anim@amb@nightclub_island@dancers@club@",
        "hi_idle_a_f02",
        "Dance Club 5",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubf"] = {
        "anim@amb@nightclub_island@dancers@club@",
        "hi_idle_b_m03",
        "Dance Club 6",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubg"] = {
        "anim@amb@nightclub_island@dancers@club@",
        "hi_idle_d_f01",
        "Dance Club 7",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubh"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "mi_dance_facedj_17_v2_male^4",
        "Dance Club 8 ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubi"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "mi_dance_prop_13_v1_male^3",
        "Dance Club 9 ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubj"] = {
        "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@",
        "mi_dance_crowd_13_v2_male^1",
        "Dance Club 10 ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubk"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "mi_dance_facedj_15_v2_male^4",
        "Dance Club 11 ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubl"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center_up",
        "Dance Club 12",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubm"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "hi_dance_facedj_hu_15_v2_male^5",
        "Dance Club 13 ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubn"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "hi_dance_facedj_hu_17_male^5",
        "Dance Club 14 ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubo"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_center",
        "Dance Club 15 ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceclubp"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_left_down",
        "Dance Club 16 ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancedrink"] = {
        "anim@amb@nightclub_island@dancers@beachdanceprop@",
        "mi_idle_c_m01",
        "Dance Drink (Beer)",
        AnimationOptions = {
            Prop = 'prop_beer_amopen',
            PropBone = 28422,
            PropPlacement = {0.0, 0.00, 0.0, 0.0, 0.0, 20.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink2"] = {
        "anim@amb@nightclub_island@dancers@beachdanceprop@",
        "mi_loop_f1",
        "Dance Drink 2 (Wine)",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0900, 0.0, 0.0, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink3"] = {
        "anim@amb@nightclub_island@dancers@beachdanceprop@",
        "mi_loop_m04",
        "Dance Drink 3 (Whiskey)",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_opaque_s',
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.00, 0.0, 0.0, 0.0, 10.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink4"] = {
        "anim@amb@nightclub_island@dancers@beachdanceprops@male@",
        "mi_idle_b_m04",
        "Dance Drink 4 (Whiskey)",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_opaque_s',
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.00, 0.0, 0.0, 0.0, 10.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink5"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "hi_dance_prop_09_v1_female^3",
        "Dance Drink 5 (Wine)",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0900, 0.0, 0.0, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink6"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "hi_dance_prop_09_v1_male^3",
        "Dance Drink 6 (Beer)",
        AnimationOptions = {
            Prop = 'prop_beer_logopen',
            PropBone = 28422,
            PropPlacement = {0.0090, 0.0010, -0.0310, 180.0, 180.0, -69.99},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink7"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "hi_dance_prop_11_v1_female^3",
        "Dance Drink 7 (Wine)",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0900, 0.0, 0.0, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink8"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "hi_dance_prop_11_v1_female^1",
        "Dance Drink 8 (Wine)",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0900, 0.0, 0.0, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["danceslow2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "low_center",
        "Dance Slow 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceslow3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "low_center_down",
        "Dance Slow 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceslow4"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "low_center",
        "Dance Slow 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceupper"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "high_center",
        "Dance Upper",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["danceupper2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "high_center_up",
        "Dance Upper 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["danceshy"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@",
        "low_center",
        "Dance Shy",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceshy2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "low_center_down",
        "Dance Shy 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceslow"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",
        "low_center",
        "Dance Slow",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancesilly1"] = {
        "rcmnigel1bnmt_1b",
        "dance_loop_tyler",
        "Dance Silly 1",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancesilly"] = {
        "special_ped@mountain_dancer@monologue_3@monologue_3a",
        "mnt_dnc_buttwag",
        "Dance Silly",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancesilly2"] = {
        "move_clown@p_m_zero_idles@",
        "fidget_short_dance",
        "Dance Silly 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancesilly3"] = {
        "move_clown@p_m_two_idles@",
        "fidget_short_dance",
        "Dance Silly 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancesilly4"] = {
        "anim@amb@nightclub@lazlow@hi_podium@",
        "danceidle_hi_11_buttwiggle_b_laz",
        "Dance Silly 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancesilly5"] = {
        "timetable@tracy@ig_5@idle_a",
        "idle_a",
        "Dance Silly 5",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancesilly6"] = {
        "timetable@tracy@ig_8@idle_b",
        "idle_d",
        "Dance Silly 6",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancesilly7"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_b@",
        "med_center",
        "Dance Silly 7",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancesilly8"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_b@",
        "high_center",
        "Dance Silly 8",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancesilly9"] = {
        "anim@mp_player_intcelebrationfemale@the_woogie",
        "the_woogie",
        "Dance Silly 9",
        AnimationOptions = {EmoteLoop = true}
    },
    ["danceold"] = {
        "anim@mp_player_intupperuncle_disco",
        "idle_a",
        "Dance Old",
        AnimationOptions = {
            EmoteLoop = true
            --			EmoteMoving = true,-- Removing the comment will allow for you to mix and match dance emotes, ie /e danceold and /e dance to control the bottom half of the body.
        }
    },
    ["danceglowstick"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_13_mi_hi_sexualgriding_laz",
        "Dance Glowsticks",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["danceglowstick2"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_12_mi_hi_bootyshake_laz",
        "Dance Glowsticks 2",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true
        }
    },
    ["danceglowstick3"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Glowsticks 3",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true
        }
    },
    ["dancehorse"] = {
        "anim@amb@nightclub@lazlow@hi_dancefloor@",
        "dancecrowd_li_15_handup_laz",
        "Dance Horse",
        AnimationOptions = {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dancehorse2"] = {
        "anim@amb@nightclub@lazlow@hi_dancefloor@",
        "crowddance_hi_11_handup_laz",
        "Dance Horse 2",
        AnimationOptions = {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["dancehorse3"] = {
        "anim@amb@nightclub@lazlow@hi_dancefloor@",
        "dancecrowd_li_11_hu_shimmy_laz",
        "Dance Horse 3",
        AnimationOptions = {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["dancewave"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "wave_dance_1",
        "Wave Dance",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancewave02"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "wave_dance_2",
        "Wave Dance 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancewave03"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "wave_dance_3",
        "Wave Dance 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancewave04"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "wave_dance_4",
        "Wave Dance 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancewave05"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "tutankhamun_dance_1",
        "Wave Dance 5 - Tutankhamen",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancewave06"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "tutankhamun_dance_2",
        "Wave Dance 6 - Tutankhamen 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancewave07"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "snake_dance_1",
        "Wave Dance 7 - Snake Dance",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancewave08"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "slide_dance",
        "Wave Dance 8 - Slide Dance",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancewave09"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "slide_dance_2",
        "Wave Dance 9 - Slide Dance 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancewave10"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "robot_dance",
        "Wave Dance 10 - Robot Dance",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancewave11"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "locking_dance",
        "Wave Dance 11 - Locking Dance",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancewave12"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "headspin",
        "Wave Dance 12 - Headspin",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dancewave13"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "flaire_dance",
        "Wave Dance 13 - Flaire Dance",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dancewave14"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "crowd_girl_dance",
        "Wave Dance 14 - Female Crowd Dance",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dancewave15"] = { -- Custom Emote By BoringNeptune
        "dancing_wave_part_one@anim",
        "uprock_dance_1",
        "Wave Dance 15 - Uprock Dance",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancethriller"] = { -- Custom Emote By BoringNeptune
        "mj_thriller",
        "mj_thriller_dance",
        "Dance - MJ Thriller",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dj"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_dance_cntr_open_dix",
        "DJ",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["dj2"] = {
        "anim@amb@nightclub@djs@solomun@",
        "sol_idle_ctr_mid_a_sol",
        "DJ 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dj3"] = {
        "anim@amb@nightclub@djs@solomun@",
        "sol_dance_l_sol",
        "DJ 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dj4"] = {
        "anim@amb@nightclub@djs@black_madonna@",
        "dance_b_idle_a_blamadon",
        "DJ 4",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dj1"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_end_dix",
        "DJ 1",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dj5"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_idle_cntr_a_dix",
        "DJ 5",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dj6"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_idle_cntr_b_dix",
        "DJ 6",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dj7"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_idle_cntr_g_dix",
        "DJ 7",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dj8"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_idle_cntr_gb_dix",
        "DJ 8",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dj9"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_sync_cntr_j_dix",
        "DJ 9",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["twerk"] = {
        "switch@trevor@mocks_lapdance",
        "001443_01_trvs_28_idle_stripper",
        "Twerk",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lapdance"] = {"mp_safehouse", "lap_dance_girl", "Lapdance"},
    ["lapdance2"] = {
        "mini@strip_club@private_dance@idle",
        "priv_dance_idle",
        "Lapdance 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lapdance3"] = {
        "mini@strip_club@private_dance@part1",
        "priv_dance_p1",
        "Lapdance 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lapdance4"] = {
        "mini@strip_club@private_dance@part2",
        "priv_dance_p2",
        "Lapdance 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lapdance5"] = {
        "mini@strip_club@private_dance@part3",
        "priv_dance_p3",
        "Lapdance 5",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lapdance6"] = {
        "oddjobs@assassinate@multi@yachttarget@lapdance",
        "yacht_ld_f",
        "Lapdance 6",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lapdancewith"] = {
        "mini@strip_club@lap_dance_2g@ld_2g_p3",
        "ld_2g_p3_s2",
        "Lapdance With",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lapdancewith2"] = {
        "mini@strip_club@lap_dance_2g@ld_2g_p2",
        "ld_2g_p2_s2",
        "Lapdance With2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lapdancewith3"] = {
        "mini@strip_club@lap_dance_2g@ld_2g_p1",
        "ld_2g_p1_s2",
        "Lapdance With3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lapchair"] = {
        "mini@strip_club@lap_dance@ld_girl_a_song_a_p1",
        "ld_girl_a_song_a_p1_f",
        "Lap Chair",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lapchair2"] = {
        "mini@strip_club@lap_dance@ld_girl_a_song_a_p2",
        "ld_girl_a_song_a_p2_f",
        "Lap Chair2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lapchair3"] = {
        "mini@strip_club@lap_dance@ld_girl_a_song_a_p3",
        "ld_girl_a_song_a_p3_f",
        "Lap Chair3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["salsa1"] = {
        "anim@mp_player_intuppersalsa_roll",
        "idle_a",
        "Salso Roll",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancecrankdat"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_right_up",
        "Dance Crank Dat",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancecrankdat2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_right_down",
        "Dance Crank Dat 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancemonkey"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "high_center",
        "Monkey Dance  ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancemonkey2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "high_center_down",
        "Monkey Dance 2  ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancemonkey3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "med_center_down",
        "Monkey Dance 3  ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["boxdance"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@",
        "med_right_down",
        "Boxing Dance Solo  ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancehiphop"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_d@",
        "ped_a_dance_idle",
        "Hip Hop Dance ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancehiphop2"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_b@",
        "ped_a_dance_idle",
        "Hip Hop Dance 2 ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancehiphop3"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_a@",
        "ped_a_dance_idle",
        "Hip Hop Dance 3 ",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dancedrill"] = {
        "sdrill@animation",
        "sdrill_clip",
        "Drill Dance",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dancepride"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride A",
        AnimationOptions = {
            Prop = 'lilprideflag1', --- Rainbow
            PropBone = 18905,
            PropPlacement = {0.0900, 0.0000, 0.0300, -39.911, 93.9166, -5.8062},
            SecondProp = 'lilprideflag1',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900, -0.0200, -0.0300, -90.2454, 5.7068, -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["danceprideb"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride B - LGBTQIA",
        AnimationOptions = {
            Prop = 'lilprideflag2', -- LGBTQIA
            PropBone = 18905,
            PropPlacement = {0.0900, 0.0000, 0.0300, -39.911, 93.9166, -5.8062},
            SecondProp = 'lilprideflag2',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900, -0.0200, -0.0300, -90.2454, 5.7068, -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancepridea"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride A - Bisexual",
        AnimationOptions = {
            Prop = 'lilprideflag3', -- Bisexual
            PropBone = 18905,
            PropPlacement = {0.0900, 0.0000, 0.0300, -39.911, 93.9166, -5.8062},
            SecondProp = 'lilprideflag3',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900, -0.0200, -0.0300, -90.2454, 5.7068, -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancepridec"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride C - Lesbian",
        AnimationOptions = {
            Prop = 'lilprideflag4', -- Lesbian
            PropBone = 18905,
            PropPlacement = {0.0900, 0.0000, 0.0300, -39.911, 93.9166, -5.8062},
            SecondProp = 'lilprideflag4',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900, -0.0200, -0.0300, -90.2454, 5.7068, -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["danceprided"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride D - Pansexual",
        AnimationOptions = {
            Prop = 'lilprideflag5', -- Pansexual
            PropBone = 18905,
            PropPlacement = {0.0900, 0.0000, 0.0300, -39.911, 93.9166, -5.8062},
            SecondProp = 'lilprideflag5',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900, -0.0200, -0.0300, -90.2454, 5.7068, -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancepridee"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride E - Transgender ",
        AnimationOptions = {
            Prop = 'lilprideflag6', -- Transgender
            PropBone = 18905,
            PropPlacement = {0.0900, 0.0000, 0.0300, -39.911, 93.9166, -5.8062},
            SecondProp = 'lilprideflag6',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900, -0.0200, -0.0300, -90.2454, 5.7068, -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancepridef"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride F - Non Binary",
        AnimationOptions = {
            Prop = 'lilprideflag7', -- Lesbian
            PropBone = 18905,
            PropPlacement = {0.0900, 0.0000, 0.0300, -39.911, 93.9166, -5.8062},
            SecondProp = 'lilprideflag7',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900, -0.0200, -0.0300, -90.2454, 5.7068, -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["danceprideg"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride G - Asexual",
        AnimationOptions = {
            Prop = 'lilprideflag8', -- Asexual
            PropBone = 18905,
            PropPlacement = {0.0900, 0.0000, 0.0300, -39.911, 93.9166, -5.8062},
            SecondProp = 'lilprideflag8',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900, -0.0200, -0.0300, -90.2454, 5.7068, -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["danceprideh"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride H - Straight Ally",
        AnimationOptions = {
            Prop = 'lilprideflag9', -- Straight Ally
            PropBone = 18905,
            PropPlacement = {0.0900, 0.0000, 0.0300, -39.911, 93.9166, -5.8062},
            SecondProp = 'lilprideflag9',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900, -0.0200, -0.0300, -90.2454, 5.7068, -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["armswirl"] = {
        "custom@armswirl",
        "armswirl",
        "Tourbillon de bras",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["armwave"] = {
        "custom@armwave",
        "armwave",
        "Vague des bras",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["bellydance"] = {
        "custom@bellydance",
        "bellydance",
        "Danse du ventre",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["hiphopslide1"] = {
        "custom@hiphop_slide",
        "hiphop_slide",
        "Slide HipHop",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["hiphop1a"] = {
        "custom@hiphop1",
        "hiphop1",
        "HipHop 1",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["hiphop2a"] = {
        "custom@hiphop2",
        "hiphop2",
        "HipHop 2",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["hiphop3a"] = {
        "custom@hiphop3",
        "hiphop3",
        "HipHop 3",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = false}
    },
    ["hiphopold1"] = {
        "custom@hiphop90s",
        "hiphop90s",
        "HipHop Vieux",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["woowalk"] = {
        "div@woowalk@test",
        "woowalk",
        "Marche à pied Woo",
        AnimationOptions = {EmoteLoop = true}
    },
    ["drilldance"] = {
        "div@woowalk@test",
        "drilldance",
        "Dance Drill 1",
        AnimationOptions = {EmoteLoop = true}
    },
    ["cripwalk2a"] = {
        "div@woowalk@test",
        "cripwalk2",
        "Marche de Crip",
        AnimationOptions = {EmoteLoop = true}
    },
    ["sturdy2"] = {
        "div@woowalk@test",
        "sturdy2",
        "Devenez robuste",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bloodwalk2a"] = {
        "div@woowalk@test",
        "bloodwalk2",
        "Faire des claquettes",
        AnimationOptions = {EmoteLoop = true}
    },
    ["blixkytwirl2"] = {
        "div@woowalk@test",
        "blixkytwirl2",
        "Tourbillon Blixky",
        AnimationOptions = {EmoteLoop = true}
    },

    -- Custom Dances: Ultra
    ["breakdance1"] = {
        "export@breakdance",
        "breakdance",
        "Faire le robot",
        AnimationOptions = {EmoteLoop = true}
    },
    ["gangnamstyle1"] = {
        "custom@gangnamstyle",
        "gangnamstyle",
        "Gangnam Style",
        AnimationOptions = {EmoteLoop = true}
    },
    ["macarena1"] = {
        "custom@makarena",
        "makarena",
        "Macarena",
        AnimationOptions = {EmoteLoop = true}
    },
    ["maraschino1"] = {
        "custom@maraschino",
        "maraschino",
        "Maraschino",
        AnimationOptions = {EmoteLoop = true}
    },
    ["salsa1"] = {
        "custom@salsa",
        "salsa",
        "Salsa",
        AnimationOptions = {EmoteLoop = true}
    },

    -- Custom Dances: Divine
    ["ddance1a"] = {
        "divined@dances@new",
        "ddance1",
        "La danse divine D 1",
        AnimationOptions = {EmoteLoop = true}
    },
    ["ddance2a"] = {
        "divined@dances@new",
        "ddance2",
        "La danse divine D 6",
        AnimationOptions = {EmoteLoop = true}
    },
    ["ddance3a"] = {
        "divined@dances@new",
        "ddance3",
        "La danse divine D 7",
        AnimationOptions = {EmoteLoop = true}
    },
    ["ddance4a"] = {
        "divined@dances@new",
        "ddance4",
        "La danse divine D 8",
        AnimationOptions = {EmoteLoop = true}
    },
    ["ddance5a"] = {
        "divined@dances@new",
        "ddance5",
        "La danse divine D 9",
        AnimationOptions = {EmoteLoop = true}
    },
    ["ddance6a"] = {
        "divined@dances@new",
        "ddance6",
        "La danse divine D 10",
        AnimationOptions = {EmoteLoop = true}
    },
    ["ddance7a"] = {
        "divined@dances@new",
        "ddance7",
        "La danse divine D 11",
        AnimationOptions = {EmoteLoop = true}
    },
    ["ddance8a"] = {
        "divined@dances@new",
        "ddance8",
        "La danse divine D 12",
        AnimationOptions = {EmoteLoop = true}
    },
    ["ddance9a"] = {
        "divined@dances@new",
        "ddance9",
        "La danse divine D 13",
        AnimationOptions = {EmoteLoop = true}
    },
    ["ddance10a"] = {
        "divined@dances@new",
        "ddance10",
        "La danse divine D 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["ddance11a"] = {
        "divined@dances@new",
        "ddance11",
        "La danse divine D 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["ddance12a"] = {
        "divined@dances@new",
        "ddance12",
        "La danse divine D 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["ddance13a"] = {
        "divined@dances@new",
        "ddance13",
        "La danse divine D 5",
        AnimationOptions = {EmoteLoop = true}
    },

    -- Version Two
    ["divdance1a"] = {
        "divined@dancesv2@new",
        "divdance1",
        "Dance Custom 1",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance2a"] = {
        "divined@dancesv2@new",
        "divdance2",
        "Dance Custom 7",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance3a"] = {
        "divined@dancesv2@new",
        "divdance3",
        "Dance Custom 8",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance4a"] = {
        "divined@dancesv2@new",
        "divdance4",
        "Dance Custom 9",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance5a"] = {
        "divined@dancesv2@new",
        "divdance5",
        "Dance Custom 10",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance6a"] = {
        "divined@dancesv2@new",
        "divdance6",
        "Dance Custom 11",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance7a"] = {
        "divined@dancesv2@new",
        "divdance7",
        "Dance Custom 12",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance8a"] = {
        "divined@dancesv2@new",
        "divdance8",
        "Dance Custom 13",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance9a"] = {
        "divined@dancesv2@new",
        "divdance9",
        "Dance Custom 14",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance10a"] = {
        "divined@dancesv2@new",
        "divdance10",
        "Dance Custom 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance11a"] = {
        "divined@dancesv2@new",
        "divdance11",
        "Dance Custom 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance12a"] = {
        "divined@dancesv2@new",
        "divdance12",
        "Dance Custom 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance13a"] = {
        "divined@dancesv2@new",
        "divdance13",
        "Dance Custom 5",
        AnimationOptions = {EmoteLoop = true}
    },
    ["divdance14a"] = {
        "divined@dancesv2@new",
        "divdance14",
        "Dance Custom 6",
        AnimationOptions = {EmoteLoop = true}
    },
    -- Divine Breakdance
    ["divbdance1a"] = {
        "divined@breakdances@new",
        "divbdance1",
        "Break Dance divisée 1",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance2a"] = {
        "divined@breakdances@new",
        "divbdance2",
        "Break Dance divisée 8",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance3a"] = {
        "divined@breakdances@new",
        "divbdance3",
        "Break Dance divisée 9",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance4a"] = {
        "divined@breakdances@new",
        "divbdance4",
        "Break Dance divisée 10",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance5a"] = {
        "divined@breakdances@new",
        "divbdance5",
        "Break Dance divisée 11",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance6a"] = {
        "divined@breakdances@new",
        "divbdance6",
        "Break Dance divisée 12",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance7a"] = {
        "divined@breakdances@new",
        "divbdance7",
        "Break Dance divisée 13",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance8a"] = {
        "divined@breakdances@new",
        "divbdance8",
        "Break Dance divisée 14",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance9a"] = {
        "divined@breakdances@new",
        "divbdance9",
        "Break Dance divisée 15",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance10a"] = {
        "divined@breakdances@new",
        "divbdance10",
        "Break Dance divisée 2",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance11a"] = {
        "divined@breakdances@new",
        "divbdance11",
        "Break Dance divisée 3",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance12a"] = {
        "divined@breakdances@new",
        "divbdance12",
        "Break Dance divisée 4",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance13a"] = {
        "divined@breakdances@new",
        "divbdance13",
        "Break Dance divisée 5",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance14a"] = {
        "divined@breakdances@new",
        "divbdance14",
        "Break Dance divisée 6",
        AnimationOptions = {EmoteLoop = false}
    },
    ["divbdance15a"] = {
        "divined@breakdances@new",
        "divbdance14",
        "Break Dance divisée 7",
        AnimationOptions = {EmoteLoop = false}
    },
    ["sturdy"] = {
        "nito_sturdy18@animation",
        "nito_sturdy18_clip",
        "Danse vigoureuse",
        AnimationOptions = {EmoteLoop = true}
    },

    -- Divine Breakdance v3
    ["dbrdance1a"] = {
        "divined@brdancesv2@new",
        "dbrdance1",
        "La danse divine 1",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dbrdance2a"] = {
        "divined@brdancesv2@new",
        "dbrdance2",
        "La danse divine 5",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dbrdance3a"] = {
        "divined@brdancesv2@new",
        "dbrdance3",
        "La danse divine 6",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dbrdance4a"] = {
        "divined@brdancesv2@new",
        "dbrdance4",
        "La danse divine 7",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dbrdance5a"] = {
        "divined@brdancesv2@new",
        "dbrdance5",
        "La danse divine 8",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dbrdance6a"] = {
        "divined@brdancesv2@new",
        "dbrdance6",
        "La danse divine 9",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dbrdance7a"] = {
        "divined@brdancesv2@new",
        "dbrdance7",
        "La danse divine 10",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dbrdance8a"] = {
        "divined@brdancesv2@new",
        "dbrdance8",
        "La danse divine 11",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dbrdance9a"] = {
        "divined@brdancesv2@new",
        "dbrdance9",
        "La danse divine 12",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dbrdance10a"] = {
        "divined@brdancesv2@new",
        "dbrdance10",
        "La danse divine 2",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dbrdance11a"] = {
        "divined@brdancesv2@new",
        "dbrdance11",
        "La danse divine 3",
        AnimationOptions = {EmoteLoop = false}
    },
    ["dbrdance12a"] = {
        "divined@brdancesv2@new",
        "dbrdance12",
        "La danse divine 4",
        AnimationOptions = {EmoteLoop = false}
    },

    -- Divine: Trendy
    ["banddance"] = {
        "divined@tdances@new",
        "dtdance1",
        "Danse de groupe",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bopdance"] = {
        "divined@tdances@new",
        "dtdance2",
        "Bop",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bboydance"] = {
        "divined@tdances@new",
        "dtdance3",
        "Faire du breakdance",
        AnimationOptions = {EmoteLoop = true}
    },
    ["capoeiramove"] = {
        "divined@tdances@new",
        "dtdance4",
        "Mouvement de Capoeira",
        AnimationOptions = {EmoteLoop = true}
    },
    ["hiphopdance"] = {
        "divined@tdances@new",
        "dtdance5",
        "Danse hip-hop",
        AnimationOptions = {EmoteLoop = true}
    },
    ["hipsterdance"] = {
        "divined@tdances@new",
        "dtdance6",
        "Danse hipster",
        AnimationOptions = {EmoteLoop = true}
    },
    ["hippiedance"] = {
        "divined@tdances@new",
        "dtdance7",
        "Danse hippie",
        AnimationOptions = {EmoteLoop = true}
    },
    ["hiphoptaunt"] = {
        "divined@tdances@new",
        "dtdance8",
        "Taunt Hip Hop",
        AnimationOptions = {EmoteLoop = true}
    },
    ["hilowave"] = {
        "divined@tdances@new",
        "dtdance9",
        "Vague Hi Lo",
        AnimationOptions = {EmoteLoop = true}
    },
    ["squaredance"] = {
        "divined@tdances@new",
        "dtdance10",
        "Danse carrée",
        AnimationOptions = {EmoteLoop = true}
    },
    ["hotdance"] = {
        "divined@tdances@new",
        "dtdance11",
        "Danse chaude",
        AnimationOptions = {EmoteLoop = true}
    },
    ["hulahula"] = {
        "divined@tdances@new",
        "dtdance12",
        "Hula-Hula",
        AnimationOptions = {EmoteLoop = true}
    },
    ["dabloop"] = {
        "divined@tdances@new",
        "dtdance13",
        "Faire le dab infini",
        AnimationOptions = {EmoteLoop = true}
    },
    ["kingdance"] = {
        "divined@tdances@new",
        "dtdance14",
        "La danse du roi",
        AnimationOptions = {EmoteLoop = true}
    },
    ["linedance"] = {
        "divined@tdances@new",
        "dtdance15",
        "Ligne de danse",
        AnimationOptions = {EmoteLoop = true}
    },
    ["magicman"] = {
        "divined@tdances@new",
        "dtdance16",
        "L'homme magique",
        AnimationOptions = {EmoteLoop = true}
    },
    ["marat"] = {
        "divined@tdances@new",
        "dtdance17",
        "Marat",
        AnimationOptions = {EmoteLoop = true}
    },
    ["maskoff"] = {
        "divined@tdances@new",
        "dtdance18",
        "Mask Off",
        AnimationOptions = {EmoteLoop = true}
    },
    ["mellow"] = {
        "divined@tdances@new",
        "dtdance19",
        "Mellow",
        AnimationOptions = {EmoteLoop = true}
    },
    ["showroomdance"] = {
        "divined@tdances@new",
        "dtdance20",
        "Danse de salon",
        AnimationOptions = {EmoteLoop = true}
    },
    ["windmillfloss"] = {
        "divined@tdances@new",
        "dtdance21",
        "Fil à vent",
        AnimationOptions = {EmoteLoop = true}
    },
    ["woahdance"] = {
        "divined@tdances@new",
        "dtdance22",
        "Woah",
        AnimationOptions = {EmoteLoop = true}
    },
	["dance1"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"med_center_up",
		"Custom Dance  1",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance2"] = {
		"anim@amb@nightclub@djs@black_madonna@",
		"dance_b_idle_a_blamadon",
		"Custom Dance  2",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance3"] = {
		"anim@amb@nightclub@djs@black_madonna@",
		"dance_b_idle_d_blamadon",
		"Custom Dance  3",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance4"] = {
		"anim@amb@nightclub@dancers@black_madonna_entourage@",
		"li_dance_facedj_11_v1_male^1",
		"Custom Dance  4",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance5"] = {
		"anim@amb@nightclub@dancers@black_madonna_entourage@",
		"hi_dance_facedj_09_v2_male^5",
		"Custom Dance  5",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance6"] = {
		"anim@amb@nightclub@dancers@black_madonna_entourage@",
		"li_dance_facedj_15_v2_male^2",
		"Custom Dance  6",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance7"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"mi_dance_prop_15_v1_male^1",
		"Custom Dance  7",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance8"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"hi_dance_prop_09_v1_female^1",
		"Custom Dance  8",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance9"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"hi_dance_prop_09_v1_female^2",
		"Custom Dance  9",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance10"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"hi_dance_prop_09_v1_female^3",
		"Custom Dance  10",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance11"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"hi_dance_prop_09_v1_female^4",
		"Custom Dance  11",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance12"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"hi_dance_prop_09_v1_female^5",
		"Custom Dance  12",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance13"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"hi_dance_prop_09_v1_female^6",
		"Custom Dance  13",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance14"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"hi_dance_prop_09_v1_male^1",
		"Custom Dance  14",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance15"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"hi_dance_prop_09_v1_male^2",
		"Custom Dance  15",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance16"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"hi_dance_prop_09_v1_male^3",
		"Custom Dance  16",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance17"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"hi_dance_prop_09_v1_male^4",
		"Custom Dance  17",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance18"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"hi_dance_prop_09_v1_male^5",
		"Custom Dance  18",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance19"] = {
		"anim@amb@nightclub@djs@dixon@",
		"dixn_dance_a_dixon",
		"Custom Dance  19",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance20"] = {
		"anim@amb@nightclub@djs@solomun@",
		"sol_trans_out_to_rt_a_sol",
		"Custom Dance  20",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance21"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v1_female^1",
		"Custom Dance  21",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance22"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v1_female^2",
		"Custom Dance  22",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance23"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v1_female^3",
		"Custom Dance  23",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance24"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v1_female^4",
		"Custom Dance  24",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance25"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v1_female^5",
		"Custom Dance  25",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance26"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v1_female^6",
		"Custom Dance  26",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance27"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v1_male^1",
		"Custom Dance  27",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance28"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v1_male^2",
		"Custom Dance  28",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance29"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v1_male^3",
		"Custom Dance  29",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance30"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v1_male^4",
		"Custom Dance  30",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance31"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v1_male^5",
		"Custom Dance  31",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance32"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v1_male^6",
		"Custom Dance  32",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance33"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v2_female^2",
		"Custom Dance  33",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance34"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v2_female^3",
		"Custom Dance  34",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance35"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v2_female^4",
		"Custom Dance  35",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance36"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v2_female^5",
		"Custom Dance  36",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance37"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v2_female^6",
		"Custom Dance  37",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance38"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v2_male^1",
		"Custom Dance  38",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance39"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v2_male^2",
		"Custom Dance  39",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance40"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v2_male^3",
		"Custom Dance  40",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance41"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v2_male^4",
		"Custom Dance  41",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance42"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v2_male^5",
		"Custom Dance  42",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance43"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_09_v2_male^6",
		"Custom Dance  43",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance44"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v1_female^1",
		"Custom Dance  44",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance45"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v1_female^2",
		"Custom Dance  45",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance46"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v1_female^3",
		"Custom Dance  46",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance47"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v1_female^4",
		"Custom Dance  47",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance48"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v1_female^5",
		"Custom Dance  48",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance49"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v1_female^6",
		"Custom Dance  49",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance50"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v1_male^1",
		"Custom Dance  50",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance51"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v1_male^2",
		"Custom Dance  51",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance52"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v1_male^3",
		"Custom Dance  52",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance53"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v1_male^4",
		"Custom Dance  53",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance54"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v1_male^5",
		"Custom Dance  54",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance55"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v1_male^6",
		"Custom Dance  55",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance56"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v2_female^1",
		"Custom Dance  56",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance57"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v2_female^2",
		"Custom Dance  57",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance58"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v2_female^3",
		"Custom Dance  58",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance59"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v2_female^4",
		"Custom Dance  59",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance60"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v2_female^5",
		"Custom Dance  60",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance61"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v2_female^6",
		"Custom Dance  61",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance62"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v2_male^1",
		"Custom Dance  62",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance63"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v2_male^2",
		"Custom Dance  63",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance64"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v2_male^3",
		"Custom Dance  64",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance65"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v2_male^4",
		"Custom Dance  65",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance66"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v2_male^5",
		"Custom Dance  66",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance67"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"hi_dance_facedj_11_v2_male^6",
		"Custom Dance  67",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance68"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v1_female^1",
		"Custom Dance  68",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance69"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v1_female^2",
		"Custom Dance  69",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance70"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v1_female^3",
		"Custom Dance  70",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance71"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v1_female^4",
		"Custom Dance  71",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance72"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v1_female^5",
		"Custom Dance  72",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance73"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v1_female^6",
		"Custom Dance  73",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance74"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v1_male^1",
		"Custom Dance  74",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance75"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v1_male^2",
		"Custom Dance  75",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance76"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v1_male^3",
		"Custom Dance  76",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance77"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v1_male^4",
		"Custom Dance  77",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance78"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v1_male^5",
		"Custom Dance  78",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance79"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v1_male^6",
		"Custom Dance  79",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance80"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v2_female^1",
		"Custom Dance  80",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance81"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v2_female^2",
		"Custom Dance  81",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance82"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v2_female^3",
		"Custom Dance  82",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance83"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v2_female^4",
		"Custom Dance  83",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance84"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v2_female^5",
		"Custom Dance  84",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance85"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@",
		"mi_dance_facedj_09_v2_female^6",
		"Custom Dance  85",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance86"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
		"hi_dance_facedj_09_v1_female^1",
		"Custom Dance  86",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance87"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
		"hi_dance_facedj_09_v1_female^2",
		"Custom Dance  87",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance88"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
		"hi_dance_facedj_09_v1_female^3",
		"Custom Dance  88",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance89"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
		"hi_dance_facedj_09_v1_female^4",
		"Custom Dance  89",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance90"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
		"hi_dance_facedj_09_v1_female^5",
		"Custom Dance  90",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance91"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
		"hi_dance_facedj_09_v1_female^6",
		"Custom Dance  91",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance92"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity",
		"trans_dance_crowd_li_to_hi_09_v1_male^1",
		"Custom Dance  92",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance93"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity",
		"trans_dance_crowd_li_to_hi_09_v1_male^2",
		"Custom Dance  93",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance94"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity",
		"trans_dance_crowd_li_to_hi_09_v1_male^3",
		"Custom Dance  94",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance95"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity",
		"trans_dance_crowd_li_to_hi_09_v1_male^4",
		"Custom Dance  95",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance96"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity",
		"trans_dance_crowd_li_to_hi_09_v1_male^5",
		"Custom Dance  96",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance97"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity",
		"trans_dance_crowd_li_to_hi_09_v1_male^6",
		"Custom Dance  97",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance98"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity",
		"trans_dance_crowd_mi_to_hi_09_v1_male^1",
		"Custom Dance  98",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance99"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity",
		"trans_dance_crowd_mi_to_hi_09_v1_male^2",
		"Custom Dance  99",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance100"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity",
		"trans_dance_crowd_mi_to_hi_09_v1_male^3",
		"Custom Dance  100",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance101"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity",
		"trans_dance_crowd_mi_to_hi_09_v1_male^4",
		"Custom Dance  101",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance102"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity",
		"trans_dance_crowd_mi_to_hi_09_v1_male^5",
		"Custom Dance  102",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["dance103"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity",
		"trans_dance_crowd_mi_to_hi_09_v1_male^6",
		"Custom Dance  103",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},



	------- Custom emo ------

	["nekopiggy"] = {
		"fos_ep_1_p1-9",
		"csb_imran_dual-9",
		"Custom piggy",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},

	["neko"] = {
		"fos_ep_1_p0-0",
		"cs_lazlow_dual-0",
		"Custom ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},

	["fort1"] = {
		"custom@what_idk",
		"what_idk",
		"Custom Fort 1",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["fort2"] = {
		"custom@salsa",
		"salsa",
		"Custom Fort 2 Salsa",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["fort3"] = {
		"custom@pickfromground",
		"pickfromground",
		"Custom Fort 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["fort4"] = {
		"custom@maraschino",
		"maraschino",
		"Custom Fort 4 Maraschino",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["fort5"] = {
		"custom@makarena",
		"makarena",
		"Custom Fort 5 Makarena",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["fort6"] = {
		"custom@gangnamstyle",
		"gangnamstyle",
		"Custom Fort 6 Gangnam Style",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["fort7"] = {
		"custom@dig",
		"dig",
		"Custom Fort 7",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["fort8"] = {
		"custom@circle_crunch",
		"circle_crunch",
		"Custom Fort 8",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["fort9"] = {
		"custom@armwave",
		"armwave",
		"Custom Fort 9 Wave Arms",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},

	["fort11"] = {
		"custom@wanna_see_me",
		"wanna_see_me",
		"Custom Fort 11",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},

	["fort12"] = {
		"custom@rollie",
		"rollie",
		"Custom Fort 12",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},

	["fort13"] = {
		"custom@pullup",
		"pullup",
		"Custom Fort 13",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},

	["fort14"] = {
		"custom@downward_fortnite",
		"downward_fortnite",
		"Custom Fort 14",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},

	["fort15"] = {
		"custom@billybounce",
		"billybounce",
		"Custom Fort 15",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["renegade"] = {
		"custom@renegade",
		"renegade",
		"Renegade",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["savage"] = {
		"custom@savage",
		"savage",
		"Savage",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["sayso"] = {
		"custom@sayso",
		"sayso",
		"Say So",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["tslide"] = {
		"custom@toosie_slide",
		"toosie_slide",
		"Tootsie Slide",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},

	["defaultdance"] = {
		"custom@dancemoves",
		"dancemoves",
		"Default Dance",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},

	["discodance"] = {
		"custom@disco_dance",
		"disco_dance",
		"Disco Dance",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},

	["electroshuffle"] = {
		"custom@electroshuffle_original",
		"electroshuffle_original",
		"Electro Shuffle",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},

	["electroshuffle2"] = {
		"custom@electroshuffle",
		"electroshuffle",
		"Electro Shuffle 2",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},

	["hitit"] = {
		"custom@hitit",
		"hitit",
		"Hit It",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},

	["floss"] = {
		"custom@floss",
		"floss",
		"Floss",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},

	["orangejustice"] = {
		"custom@orangejustice",
		"orangejustice",
		"Orange Justice",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},

	["takel"] = {
		"custom@take_l",
		"take_l",
		"Take the L",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["jdrill"] = {
		"anim@amb@nightclub_island@dancers@crowddance_single_props@",
		"mi_dance_prop_13_v1_male^3",
		"Drill · Male",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdrill2"] = {
		"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@",
		"mi_dance_crowd_13_v2_male^1",
		"Drill · Male 2",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdrill3"] = {
		"anim@amb@nightclub_island@dancers@crowddance_facedj@",
		"mi_dance_facedj_17_v2_male^4",
		"Drill · Male 3",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdrill4"] = {
		"anim@amb@nightclub_island@dancers@crowddance_facedj@",
		"mi_dance_facedj_15_v2_male^4",
		"Drill · Male 4",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdrill5"] = {
		"anim@amb@nightclub_island@dancers@crowddance_facedj@",
		"hi_dance_facedj_hu_15_v2_male^5",
		"Drill · Male 5",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdrill6"] = {
		"anim@amb@nightclub_island@dancers@crowddance_facedj@",
		"hi_dance_facedj_hu_17_male^5",
		"Drill · Male 6",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdrill7"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
		"high_right_up",
		"Drill · Solo 1",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdrill8"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
		"med_center",
		"Drill · Solo 2",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdrill9"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
		"high_right_down",
		"Drill · Solo 3",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdrill10"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
		"high_center",
		"Drill · Solo 4",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdrill11"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
		"high_left_down",
		"Drill · Solo 5",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jmonkey1"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
		"high_center",
		"Monkey Dance",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jmonkeyd2"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
		"high_center_down",
		"Monkey Dance 2",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jmonkeyd3"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
		"med_center_down",
		"Monkey Dance 3",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jrightdown"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@",
		"med_right_down",
		"Boxing Dance Solo",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jlowdance"] = {
		"anim@amb@casino@mini@dance@dance_solo@female@var_a@",
		"low_center",
		"Low Dance · Female ",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jlowdance2"] = {
		"anim@amb@casino@mini@dance@dance_solo@female@var_a@",
		"high_center",
		"Low Dance · Female",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jhiphop"] = {
		"anim@amb@nightclub@mini@dance@dance_paired@dance_d@",
		"ped_a_dance_idle",
		"Hip Hop Dance",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jhiphop2"] = {
		"anim@amb@nightclub@mini@dance@dance_paired@dance_b@",
		"ped_a_dance_idle",
		"Hip Hop Dance 2",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jhiphop3"] = {
		"anim@amb@nightclub@mini@dance@dance_paired@dance_a@",
		"ped_a_dance_idle",
		"Hip Hop Dance 3",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jpbox"] = {
		"mp_am_hold_up",
		"purchase_beerbox_shopkeeper",
		"Purchase Box",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["zdance1"] = {
		"anim@amb@nightclub@dancers@club_ambientpeds@med-hi_intensity",
		"mi-hi_amb_club_10_v1_male^6",
		"Z Dance 1",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance2"] = {
		"amb@code_human_in_car_mp_actions@dance@bodhi@ds@base",
		"idle_a_fp",
		"Z Dance 2",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance3"] = {
		"amb@code_human_in_car_mp_actions@dance@bodhi@rds@base",
		"idle_b",
		"Z Dance 3",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance4"] = {
		"amb@code_human_in_car_mp_actions@dance@std@ds@base",
		"idle_a",
		"Z Dance 4",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance5"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
		"hi_dance_facedj_09_v2_male^6",
		"Z Dance 5",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance6"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity",
		"li_dance_facedj_09_v1_male^6",
		"Z Dance 6",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance7"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity",
		"trans_dance_facedj_hi_to_li_09_v1_male^6",
		"Z Dance 7",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance8"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity",
		"trans_dance_facedj_li_to_hi_07_v1_male^6",
		"Z Dance 8",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance9"] = {
		"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity",
		"hi_dance_crowd_13_v2_male^6",
		"Z Dance 9",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance10"] = {
		"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity",
		"trans_dance_crowd_hi_to_li__07_v1_male^6",
		"Z Dance 10",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance11"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity",
		"hi_dance_prop_13_v1_male^6",
		"Z Dance 11",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance12"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity",
		"trans_crowd_prop_mi_to_li_11_v1_male^6",
		"Z Dance 12",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance13"] = {
		"anim@amb@nightclub@dancers@crowddance_groups@low_intensity",
		"li_dance_crowd_17_v1_male^6",
		"Z Dance 13",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance14"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity",
		"trans_dance_facedj_mi_to_li_09_v1_male^6",
		"Z Dance 14",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance15"] = {
		"timetable@tracy@ig_5@idle_b",
		"idle_e",
		"Z Dance 15",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance16"] = {
		"special_ped@mountain_dancer@monologue_1@monologue_1a",
		"mtn_dnc_if_you_want_to_get_to_heaven",
		"Z Dance 16",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance17"] = {
		"special_ped@mountain_dancer@monologue_4@monologue_4a",
		"mnt_dnc_verse",
		"Z Dance 17",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance18"] = {
		"anim@amb@nightclub@dancers@crowddance_single_props@",
		"hi_dance_prop_09_v1_male^6",
		"Z Dance 18",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance19"] = {
		"anim@amb@nightclub@dancers@dixon_entourage@",
		"mi_dance_facedj_15_v1_male^4",
		"Z Dance 19",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance20"] = {
		"anim@amb@nightclub@dancers@tale_of_us_entourage@",
		"mi_dance_prop_13_v2_male^4",
		"Z Dance 20",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance21"] = {
		"anim@mp_player_intcelebrationfemale@uncle_disco",
		"uncle_disco",
		"Z Dance 21",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance22"] = {
		"anim@mp_player_intcelebrationfemale@raise_the_roof",
		"raise_the_roof",
		"Z Dance 22",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance23"] = {
		"anim@mp_player_intcelebrationmale@cats_cradle",
		"cats_cradle",
		"Z Dance 23",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance24"] = {
		"anim@mp_player_intupperbanging_tunes",
		"idle_a",
		"Z Dance 24",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance25"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj_transitions@",
		"trans_dance_facedj_hi_to_mi_11_v1_female^6",
		"Z Dance 25",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance26"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity",
		"trans_dance_facedj_hi_to_li_07_v1_female^6",
		"Z Dance 26",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance27"] = {
		"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity",
		"hi_dance_crowd_09_v1_female^6",
		"Z Dance 27",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance28"] = {
		"anim@amb@nightclub@lazlow@hi_podium@",
		"danceidle_hi_06_base_laz",
		"Z Dance 28",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance29"] = {
		"amb@code_human_in_car_mp_actions@dance@bodhi@ds@base",
		"idle_a_fp",
		"Z Dance 29",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance30"] = {
		"amb@code_human_in_car_mp_actions@dance@bodhi@rds@base",
		"idle_b",
		"Z Dance 30",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance31"] = {
		"anim@mp_player_intincardancebodhi@ds@",
		"idle_a_fp",
		"Z Dance 31",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance32"] = {
		"anim@mp_player_intincardancebodhi@rds@",
		"idle_a",
		"Z Dance 32",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance33"] = {
		"anim@mp_player_intincardancebodhi@rps@",
		"idle_c",
		"Z Dance 33",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance34"] = {
		"anim@mp_player_intincardancebodhi@ps@",
		"idle_a_fp",
		"Z Dance 34",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance35"] = {
		"special_ped@mountain_dancer@base",
		"base",
		"Z Dance 35",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance36"] = {
		"special_ped@mountain_dancer@monologue_1@monologue_1a",
		"mtn_dnc_if_you_want_to_get_to_heaven",
		"Z Dance 36",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance37"] = {
		"special_ped@mountain_dancer@monologue_2@monologue_2a",
		"mnt_dnc_angel",
		"Z Dance 37",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zdance38"] = {
		"special_ped@mountain_dancer@monologue_4@monologue_4a",
		"mnt_dnc_verse",
		"Z Dance 38",
		AnimationOption =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zztwerking3"] = {
		"divined@drillb2@new",
		"twerkmocap2",
		"Twerking #3",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zztwerking2"] = {
		"divined@drillb2@new",
		"splitstwerk2",
		"Twerking #2",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zztwerking"] = {
		"divined@drillb2@new",
		"twerking",
		"Twerking #1",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zdancesolo"] = {
		"anim@amb@nightclub@dancers@crowddance_facedj_transitions@",
		"trans_dance_facedj_hi_to_mi_09_v1_male^4",
		"Dance Solo  ",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["zdancesolo3"] = {
		"special_ped@mountain_dancer@base",
		"base",
		"Dance Solo 3  ",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["zdancesolo4"] = {
		"anim@mp_player_intcelebrationfemale@raise_the_roof",
		"raise_the_roof",
		"Dance Solo 4  ",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["zdancepartyf"] = {
		"anim@amb@nightclub@dancers@crowddance_groups@",
		"hi_dance_crowd_09_v1_female^1",
		"Dance Party Female  ",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["zdancepartyf2"] = {
		"anim@amb@nightclub@dancers@crowddance_groups@",
		"hi_dance_crowd_09_v1_female^6",
		"Dance Party Female 2  ",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["zdanceparty3"] = {
		"anim@mp_player_intcelebrationfemale@heart_pumping",
		"heart_pumping",
		"Dance Party 3  ",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["zdancedisco"] = {
		"anim@mp_player_intcelebrationfemale@uncle_disco",
		"uncle_disco",
		"Dance Disco  ",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscadd1"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"high_center",
		"Baile Custom D",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscadd2"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"high_center_down",
		"Baile Custom D1",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscadd3"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"high_center_up",
		"Baile Custom D2",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscadd4"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"high_left",
		"Baile Custom D3",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscadd5"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"high_right",
		"Baile Custom D4",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscadd6"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"high_left_up",
		"Baile Custom D5",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscadd7"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"high_right_up",
		"Baile Custom D6",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscadd8"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"low_center",
		"Baile Custom D7",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscadd9"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"low_left_up",
		"Baile Custom D8",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscadd99"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"low_right_up",
		"Baile Custom D9",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad11"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"low_left",
		"Baile Custom A",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad12"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"low_right",
		"Baile Custom A1",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad13"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"med_center",
		"Baile Custom A2",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad14"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"med_left_up",
		"Baile Custom A3",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad15"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"med_right_up",
		"Baile Custom A4",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad16"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"med_left",
		"Baile Custom A5",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad17"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
		"med_right",
		"Baile Custom A6",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad18"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@",
		"high_center_down",
		"Baile Custom A7",
		AnimationOptions =                                                                                                            ----------------
		{
			EmoteLoop = true,
		}
	},
	["buscad19"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"high_center_down",
		"Baile Custom A8",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad20"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"high_center_down",
		"Baile Custom A9",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad21"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"high_center_up",
		"Baile Custom B",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad22"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"high_left_down",
		"Baile Custom B1",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad23"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"high_right_down",
		"Baile Custom B2",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad24"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"high_left_up",
		"Baile Custom B3",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad25"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"high_right_up",
		"Baile Custom B4",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad26"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"low_center",
		"Baile Custom B5",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad27"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"low_center_down",
		"Baile Custom B6",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad28"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"low_left",
		"Baile Custom B7",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad29"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"low_right",
		"Baile Custom B8",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad30"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"med_center",
		"Baile Custom B9",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad31"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"med_center_down",
		"Baile Custom C",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad32"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"med_left_up",
		"Baile Custom C1",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad33"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"med_right_up",
		"Baile Custom C2",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad34"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"med_left_down",
		"Baile Custom C3",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["buscad35"] = {
		"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
		"med_right_down",
		"Baile Custom C4",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["breakdance"] = {
		"export@breakdance",
		"breakdance",
		"Break Dance",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["gangnamstyle"] = {
		"custom@gangnamstyle",
		"gangnamstyle",
		"Gangnam Style",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["macarena"] = {
		"custom@makarena",
		"makarena",
		"Macarena",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["maraschino"] = {
		"custom@maraschino",
		"maraschino",
		"Maraschino",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["salsa"] = {
		"custom@salsa",
		"salsa",
		"Salsa",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},

	-- Custom Dances: Divine
	["ddance1"] = {
		"divined@dances@new",
		"ddance1",
		"Divined Dance 1",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ddance2"] = {
		"divined@dances@new",
		"ddance2",
		"Divined Dance 2",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ddance3"] = {
		"divined@dances@new",
		"ddance3",
		"Divined Dance 3",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ddance4"] = {
		"divined@dances@new",
		"ddance4",
		"Divined Dance 4",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ddance5"] = {
		"divined@dances@new",
		"ddance5",
		"Divined Dance 5",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ddance6"] = {
		"divined@dances@new",
		"ddance6",
		"Divined Dance 6",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ddance7"] = {
		"divined@dances@new",
		"ddance7",
		"Divined Dance 7",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ddance8"] = {
		"divined@dances@new",
		"ddance8",
		"Divined Dance 8",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ddance9"] = {
		"divined@dances@new",
		"ddance9",
		"Divined Dance 9",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ddance10"] = {
		"divined@dances@new",
		"ddance10",
		"Divined Dance 10",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ddance11"] = {
		"divined@dances@new",
		"ddance11",
		"Divined Dance 11",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ddance12"] = {
		"divined@dances@new",
		"ddance12",
		"Divined Dance 12",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ddance13"] = {
		"divined@dances@new",
		"ddance13",
		"Divined Dance 13",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},

	-- Version Two
	["divdance1"] = {
		"divined@dancesv2@new",
		"divdance1",
		"Divined Dance 1",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance2"] = {
		"divined@dancesv2@new",
		"divdance2",
		"Divined Dance 2",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance3"] = {
		"divined@dancesv2@new",
		"divdance3",
		"Divined Dance 3",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance4"] = {
		"divined@dancesv2@new",
		"divdance4",
		"Divined Dance 4",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance5"] = {
		"divined@dancesv2@new",
		"divdance5",
		"Divined Dance 5",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance6"] = {
		"divined@dancesv2@new",
		"divdance6",
		"Divined Dance 6",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance7"] = {
		"divined@dancesv2@new",
		"divdance7",
		"Divined Dance 7",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance8"] = {
		"divined@dancesv2@new",
		"divdance8",
		"Divined Dance 8",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance9"] = {
		"divined@dancesv2@new",
		"divdance9",
		"Divined Dance 9",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance10"] = {
		"divined@dancesv2@new",
		"divdance10",
		"Divined Dance 10",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance11"] = {
		"divined@dancesv2@new",
		"divdance11",
		"Divined Dance 11",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance12"] = {
		"divined@dancesv2@new",
		"divdance12",
		"Divined Dance 12",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance13"] = {
		"divined@dancesv2@new",
		"divdance13",
		"Divined Dance 13",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divdance14"] = {
		"divined@dancesv2@new",
		"divdance14",
		"Divined Dance 14",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	-- Divine Breakdance
	["divbdance1"] = {
		"divined@breakdances@new",
		"divbdance1",
		"Divined Break Dance 1",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance2"] = {
		"divined@breakdances@new",
		"divbdance2",
		"Divined Break Dance 2",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance3"] = {
		"divined@breakdances@new",
		"divbdance3",
		"Divined Break Dance 3",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance4"] = {
		"divined@breakdances@new",
		"divbdance4",
		"Divined Break Dance 4",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance5"] = {
		"divined@breakdances@new",
		"divbdance5",
		"Divined Break Dance 5",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance6"] = {
		"divined@breakdances@new",
		"divbdance6",
		"Divined Break Dance 6",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance7"] = {
		"divined@breakdances@new",
		"divbdance7",
		"Divined Break Dance 7",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance8"] = {
		"divined@breakdances@new",
		"divbdance8",
		"Divined Break Dance 8",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance9"] = {
		"divined@breakdances@new",
		"divbdance9",
		"Divined Break Dance 9",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance10"] = {
		"divined@breakdances@new",
		"divbdance10",
		"Divined Break Dance 10",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance11"] = {
		"divined@breakdances@new",
		"divbdance11",
		"Divined Break Dance 11",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance12"] = {
		"divined@breakdances@new",
		"divbdance12",
		"Divined Break Dance 12",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance13"] = {
		"divined@breakdances@new",
		"divbdance13",
		"Divined Break Dance 13",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance14"] = {
		"divined@breakdances@new",
		"divbdance14",
		"Divined Break Dance 14",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["divbdance15"] = {
		"divined@breakdances@new",
		"divbdance14",
		"Divined Break Dance 15",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},

	-- Divine Breakdance v3
	["dbrdance1"] = {
		"divined@brdancesv2@new",
		"dbrdance1",
		"Divined Dance 1",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["dbrdance2"] = {
		"divined@brdancesv2@new",
		"dbrdance2",
		"Divined Dance 2",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["dbrdance3"] = {
		"divined@brdancesv2@new",
		"dbrdance3",
		"Divined Dance 3",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["dbrdance4"] = {
		"divined@brdancesv2@new",
		"dbrdance4",
		"Divined Dance 4",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["dbrdance5"] = {
		"divined@brdancesv2@new",
		"dbrdance5",
		"Divined Dance 5",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["dbrdance6"] = {
		"divined@brdancesv2@new",
		"dbrdance6",
		"Divined Dance 6",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["dbrdance7"] = {
		"divined@brdancesv2@new",
		"dbrdance7",
		"Divined Dance 7",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["dbrdance8"] = {
		"divined@brdancesv2@new",
		"dbrdance8",
		"Divined Dance 8",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["dbrdance9"] = {
		"divined@brdancesv2@new",
		"dbrdance9",
		"Divined Dance 9",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["dbrdance10"] = {
		"divined@brdancesv2@new",
		"dbrdance10",
		"Divined Dance 10",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["dbrdance11"] = {
		"divined@brdancesv2@new",
		"dbrdance11",
		"Divined Dance 11",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["dbrdance12"] = {
		"divined@brdancesv2@new",
		"dbrdance12",
		"Divined Dance 12",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["femaledance1"] = {
		"femaledancesbygoldiemods30@animation",
		"femaledancesbygoldiemods30_clip",
		"Female Dances ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["femaledance2"] = {
		"femaledancesbygoldiemods31@animation",
		"femaledancesbygoldiemods31_clip",
		"Female Dances 2 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["femaledance3"] = {
		"femaledancesbygoldiemods39@animation",
		"femaledancesbygoldiemods39_clip",
		"Female Dances 3 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["femaledance4"] = {
		"femaledancesbygoldiemods49@animation",
		"femaledancesbygoldiemods49_clip",
		"Female Dances 4 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["femaledance5"] = {
		"femaledancesbygoldiemods40@animation",
		"femaledancesbygoldiemods40_clip",
		"Female Dances 5 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["femaledance6"] = {
		"femaledancesbygoldiemods52@animation",
		"femaledancesbygoldiemods52_clip",
		"Female Dances 6 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["femaledance7"] = {
		"femaledancesbygoldiemods11@animation",
		"femaledancesbygoldiemods11_clip",
		"Female Dances 7 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["femaledance8"] = {
		"femaledancesbygoldiemods13@animation",
		"femaledancesbygoldiemods13_clip",
		"Female Dances 8 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["femaledance9"] = {
		"femaledancesbygoldiemods15@animation",
		"femaledancesbygoldiemods15_clip",
		"Female Dances 9 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["femaledance10"] = {
		"femaledancesbygoldiemods18@animation",
		"femaledancesbygoldiemods18_clip",
		"Female Dances 10 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["femaledance11"] = {
		"femaledancesbygoldiemods21@animation",
		"femaledancesbygoldiemods21_clip",
		"Female Dances 11 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["femaledance12"] = {
		"femaledancesbygoldiemods24@animation",
		"femaledancesbygoldiemods24_clip",
		"Female Dances 12 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["femaledance13"] = {
		"femaledancesbygoldiemods27@animation",
		"femaledancesbygoldiemods27_clip",
		"Female Dances 13 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["hiphopslide"] = {
		"custom@hiphop_slide",
		"hiphop_slide",
		"HipHop Slide",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["hiphop1"] = {
		"custom@hiphop1",
		"hiphop1",
		"HipHop 1",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["hiphop2"] = {
		"custom@hiphop2",
		"hiphop2",
		"HipHop 2",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["hiphop3"] = {
		"custom@hiphop3",
		"hiphop3",
		"HipHop 3",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = false,
		}
	},
	["hiphopold"] = {
		"custom@hiphop90s",
		"hiphop90s",
		"HipHop Old",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["zsturdy"] = {
		"div@woowalk@test",
		"sturdy2",
		"Get Sturdy 1",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zsturdy2"] = {
		"divined@drillb2@new",
		"sturdy",
		"Get Sturdy 2",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zwalknstep"] = {
		"divined@drillb2@new",
		"walknstep",
		"Walk N Step",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zsturdy3"] = {
		"divined@drillb2@new",
		"sturdyground",
		"Get Sturdy 3",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zsturdy4"] = {
		"nito_sturdy18@animation",
		"nito_sturdy18_clip",
		"Get Sturdy 4",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zsturdy5"] = {
		"div@woowalk@test",
		"woowalk",
		"Get Sturdy 5 Woo Walk",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zsturdy6"] = {
		"div@woowalk@test",
		"blixkytwirl2",
		"Get Sturdy 6 Blixky Twirl",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zsturdy7"] = {
		"divined@drpackv3@",
		"kaisturdy",
		"Get Sturdy 7",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy8"] = {
		"adxttisturdy@animation",
		"adxttisturdy_clip",
		"Get Sturdy 8  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy9"] = {
		"adxttisturdy2@animation",
		"adxttisturdy2_clip",
		"Get Sturdy 9  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy91"] = {
		"adxttisturdy3@animation",
		"adxttisturdy3_clip",
		"Get Sturdy 10  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy92"] = {
		"adxttisturdy4@animation",
		"adxttisturdy4_clip",
		"Get Sturdy 11  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy93"] = {
		"adxttisturdy5@animation",
		"adxttisturdy5_clip",
		"Get Sturdy 12  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy94"] = {
		"adxttisturdy6@animation",
		"adxttisturdy6_clip",
		"Get Sturdy 13  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy95"] = {
		"nito_sturdy_dance1@animation",
		"nito_sturdy_dance1_clip",
		"Get Sturdy 14  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy96"] = {
		"nito_sturdy20@animation",
		"nito_sturdy20_clip",
		"Get Sturdy 15  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy97"] = {
		"nito_sturdy5@animation",
		"nito_sturdy5_clip",
		"Get Sturdy 16  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy98"] = {
		"nito_sturdy2_freethehometeam@animation",
		"nito_sturdy2_freethehometeam_clip",
		"Get Sturdy 17  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy99"] = {
		"nito_sturdy7@animation",
		"nito_sturdy7_clip",
		"Get Sturdy 18  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy991"] = {
		"nito_sturdy8@animation",
		"nito_sturdy8_clip",
		"Get Sturdy 19  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy992"] = {
		"nito_sturdy11@animation",
		"nito_sturdy11_clip",
		"Get Sturdy 20  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy993"] = {
		"nito_sturdy3_freethehometeam@animation",
		"nito_sturdy3_freethehometeam_clip",
		"Get Sturdy 21  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy994"] = {
		"nito_sturdy_mightyz@animation",
		"nito_sturdy_mightyz_clip",
		"Get Sturdy 22  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy995"] = {
		"nito_sturdy1@animation",
		"nito_sturdy1_clip",
		"Get Sturdy 23  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zsturdy996"] = {
		"divined@drpack@new",
		"cripwalk3",
		"Get Sturdy 24 (Crip Walk)  ",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zsturdy997"] = {
		"divined@drpack@new",
		"bloodwalk",
		"Get Sturdy 25 (Blood Walk)  ",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zsturdy998"] = {
		"divined@drpack@new",
		"woowalkinx",
		"Get Sturdy 26 (Woo Walk)  ",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ztoomanyglockies"] = {
		"divined@drillb2@new",
		"toomanyglockies",
		"Too Many Glockies",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zhitemwithdat"] = {
		"divined@drillb2@new",
		"hitemwithdat",
		"Hit 'Em With Dat",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["zslutmeout"] = {
		"divined@drillb2@new",
		"slutmeout",
		"Slut Me Out",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["ztoosieslide"] = {
		"divined@drillb2@new",
		"toosieslide",
		"Toosie Slide",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["cripwalk2"] = {
		"div@woowalk@test",
		"cripwalk2",
		"Crip Walk",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["bloodwalk2"] = {
		"div@woowalk@test",
		"bloodwalk2",
		"Blood Walk",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
}

Lists.Emotes.Animal = {
    ["bdogbark"] = {
        "creatures@rottweiler@amb@world_dog_barking@idle_a",
        "idle_a",
        "Aboiement - Gros chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bdogindicateahead"] = {
        "creatures@rottweiler@indication@",
        "indicate_ahead",
        "Indiquer la direction à suivre - Gros chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bdogindicatehigh"] = {
        "creatures@rottweiler@indication@",
        "indicate_high",
        "Aboyez derrière un grillage 1 - Gros chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bdogindicatelow"] = {
        "creatures@rottweiler@indication@",
        "indicate_low",
        "Aboyez derrière un grillage 2 - Gros chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bdogbeg"] = {
        "creatures@rottweiler@tricks@",
        "beg_loop",
        "Réclamer - Gros chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bdogbeg2"] = {
        "creatures@rottweiler@tricks@",
        "paw_right_loop",
        "Réclamer 2 - Gros chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bdoglayright"] = {
        "creatures@rottweiler@move",
        "dead_right",
        "Faire le mort à droite - Gros chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bdoglayleft"] = {
        "creatures@rottweiler@move",
        "dead_left",
        "Faire le mort à gauche - Gros chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bdogsitcar"] = {
        "creatures@rottweiler@incar@",
        "sit",
        "S'asseoir en voiture - Gros Chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bdogshit"] = {
        "creatures@rottweiler@move",
        "dump_loop",
        "Faire caca - Gros Chien",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["bdogitch"] = {
        "creatures@rottweiler@amb@world_dog_sitting@idle_a",
        "idle_a",
        "Se gratter - Gros chien",
        AnimationOptions = {EmoteDuration = 2000}
    },
    ["bdogsleep"] = {
        "creatures@rottweiler@amb@sleep_in_kennel@",
        "sleep_in_kennel",
        "Dormir - Gros chien",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "bdogupk",
            ExitEmoteType = "Exits"
        }
    },
    ["bdogsit"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Assis - Gros chien",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "bdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["bdogpee"] = {
        "creatures@rottweiler@move",
        "pee_left_idle",
        "Faire pipi à gauche - Gros chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bdogpee2"] = {
        "creatures@rottweiler@move",
        "pee_right_idle",
        "Faire pipi à droite - Gros chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["bdogglowa"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "nill",
        "Baton lumineux - Gros chien",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 31086,
            PropPlacement = {0.2000, 0.000, -0.0600, 90.00, 0.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bdogglowb"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Baton lumineux assis - Gros chien",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 31086,
            PropPlacement = {0.2000, 0.000, -0.0600, 90.00, 0.00, 0.00},
            EmoteLoop = true,
            ExitEmote = "bdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["bdogpridea"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride A (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag1', -- Rainbow
            PropBone = 31086,
            PropPlacement = {0.1900, 0.0000, -0.0500, 100.0000, 90.0000, 0.0000},
            SecondProp = 'lilprideflag1',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940, 0.020, -0.0500, -90.0000, -90.0000, 0.0000
            },
            EmoteLoop = true,
            ExitEmote = "bdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["bdogprideb"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride B - LGBTQIA (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag2', -- LGBTQIA
            PropBone = 31086,
            PropPlacement = {0.1900, 0.0000, -0.0500, 100.0000, 90.0000, 0.0000},
            SecondProp = 'lilprideflag2',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940, 0.020, -0.0500, -90.0000, -90.0000, 0.0000
            },
            EmoteLoop = true,
            ExitEmote = "bdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["bdogpridec"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride C - Bisexual (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag3', -- Bisexual
            PropBone = 31086,
            PropPlacement = {0.1900, 0.0000, -0.0500, 100.0000, 90.0000, 0.0000},
            SecondProp = 'lilprideflag3',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940, 0.020, -0.0500, -90.0000, -90.0000, 0.0000
            },
            EmoteLoop = true,
            ExitEmote = "bdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["bdogprided"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride D - Lesbian (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag4', -- Lesbian
            PropBone = 31086,
            PropPlacement = {0.1900, 0.0000, -0.0500, 100.0000, 90.0000, 0.0000},
            SecondProp = 'lilprideflag4',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940, 0.020, -0.0500, -90.0000, -90.0000, 0.0000
            },
            EmoteLoop = true,
            ExitEmote = "bdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["bdogpridee"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride E - Pansexual (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag5', -- Pansexual
            PropBone = 31086,
            PropPlacement = {0.1900, 0.0000, -0.0500, 100.0000, 90.0000, 0.0000},
            SecondProp = 'lilprideflag5',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940, 0.020, -0.0500, -90.0000, -90.0000, 0.0000
            },
            EmoteLoop = true,
            ExitEmote = "bdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["bdogpridef"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride F - Transgender  (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag6', -- Transgender
            PropBone = 31086,
            PropPlacement = {0.1900, 0.0000, -0.0500, 100.0000, 90.0000, 0.0000},
            SecondProp = 'lilprideflag6',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940, 0.020, -0.0500, -90.0000, -90.0000, 0.0000
            },
            EmoteLoop = true,
            ExitEmote = "bdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["bdogprideg"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride G - Non Binary (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag7', -- Non Binary
            PropBone = 31086,
            PropPlacement = {0.1900, 0.0000, -0.0500, 100.0000, 90.0000, 0.0000},
            SecondProp = 'lilprideflag7',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940, 0.020, -0.0500, -90.0000, -90.0000, 0.0000
            },
            EmoteLoop = true,
            ExitEmote = "bdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["bdogprideh"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride H - Asexual (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag8', -- Asexual
            PropBone = 31086,
            PropPlacement = {0.1900, 0.0000, -0.0500, 100.0000, 90.0000, 0.0000},
            SecondProp = 'lilprideflag8',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940, 0.020, -0.0500, -90.0000, -90.0000, 0.0000
            },
            EmoteLoop = true,
            ExitEmote = "bdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["bdogpridei"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride I - Straight Ally (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag9', -- Straight Ally
            PropBone = 31086,
            PropPlacement = {0.1900, 0.0000, -0.0500, 100.0000, 90.0000, 0.0000},
            SecondProp = 'lilprideflag9',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940, 0.020, -0.0500, -90.0000, -90.0000, 0.0000
            },
            EmoteLoop = true,
            ExitEmote = "bdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["bdogfw"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Feu d'artifice - Gros Chien",
        AnimationOptions = {
            Prop = 'ind_prop_firework_01', --- blue, green, red, purple pink, cyan, yellow, white
            PropBone = 31086,
            PropPlacement = {
                0.1400, 0.3300, -0.0800, -85.6060, -176.7400, -9.8767
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bdogfris"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Frisbee (big dog)",
        AnimationOptions = {
            Prop = 'p_ld_frisbee_01',
            PropBone = 31086,
            PropPlacement = {
                0.2600, 0.0200, -0.0600, -173.7526, -169.4149, 21.4173
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },

    ---- ANIMAL EMOTES ----
    ----   SMALL DOG   ----

    ["sdogbark"] = {
        "creatures@pug@amb@world_dog_barking@idle_a",
        "idle_a",
        "Aboiement - Petit chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["sdogitch"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_a",
        "Se gratter - Petit chien",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogsit"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Assis - Petit chien",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogld"] = {
        "misssnowie@little_doggy_lying_down",
        "base",
        "Allongez - Petit chien",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogshake"] = {
        "creatures@pug@amb@world_dog_barking@idle_a",
        "idle_c",
        "Se secouer - Petit chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["sdogdance"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance 1 - Petit chien",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdance2"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance 2 - Petit chien",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0300, 0.0, 0.0, 0.0},
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdancepridea"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride A (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag1',
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdanceprideb"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride B - LGBTQIA (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag2', -- LGBTQIA
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdancepridec"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride C - Bisexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag3', -- Bisexual
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdanceprided"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride D - Lesbian (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag4', -- Lesbian
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdancepridee"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride E - Pansexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag5', -- Pansexual
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdancepridef"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride F - Transgender  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag6', -- Transgender
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdanceprideg"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride G - Non Binary (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag7', -- Non Binary
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdanceprideh"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride H - Asexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag8', -- Asexual
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdancepridei"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride I - Straight Ally (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag9', -- Straight Ally
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogbb"] = {
        "creatures@pug@move",
        "nill",
        "Tenir une balle - Petit chien",
        AnimationOptions = {
            Prop = 'w_am_baseball',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0500, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogburger"] = {
        "creatures@pug@move",
        "nill",
        "Tenir un burger - Petit chien",
        AnimationOptions = {
            Prop = 'prop_cs_burger_01',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0400, 0.0000, -90.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogcontroller"] = {
        "creatures@pug@move",
        "nill",
        "Tenir une manette - Petit chien",
        AnimationOptions = {
            Prop = 'prop_controller_01',
            PropBone = 31086,
            PropPlacement = {0.1800, -0.0300, 0.0000, -180.000, 90.0000, 0.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdolla"] = {
        "creatures@pug@move",
        "nill",
        "Tenir un billet - Petit chien",
        AnimationOptions = {
            Prop = 'p_banknote_onedollar_s',
            PropBone = 31086,
            PropPlacement = {0.1700, -0.0100, 0.0000, 90.0000, 0.0000, 0.000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdolla2"] = {
        "creatures@pug@move",
        "nill",
        "Tenir un billet froissé - Petit chien",
        AnimationOptions = {
            Prop = 'bkr_prop_scrunched_moneypage',
            PropBone = 31086,
            PropPlacement = {0.1700, 0.000, 0.0000, 90.0000, 00.0000, 00.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdolla3"] = {
        "creatures@pug@move",
        "nill",
        "Tenir une pile de billet - Petit chien",
        AnimationOptions = {
            Prop = 'bkr_prop_money_wrapped_01',
            PropBone = 31086,
            PropPlacement = {0.1700, -0.0100, 0.0000, 90.0000, 0.0000, 0.000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogdolla4"] = {
        "creatures@pug@move",
        "nill",
        "Tenir un sac - Petit chien",
        AnimationOptions = {
            Prop = 'ch_prop_ch_moneybag_01a',
            PropBone = 31086,
            PropPlacement = {
                0.1200, -0.2000, 0.0000, -79.9999997, 90.00, 0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogmic"] = {
        "creatures@pug@move",
        "nill",
        "Tenir un micro - Petit chien",
        AnimationOptions = {
            Prop = 'p_ing_microphonel_01',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0170, 0.0300, 0.000, 0.0000, 0.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogteddy"] = {
        "creatures@pug@move",
        "nill",
        "Tenir un nounours 1 - Petit chien",
        AnimationOptions = {
            Prop = 'v_ilev_mr_rasberryclean',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.1100, -0.23, 0.000, 0.0000, 0.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogteddy2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Tenir un nounours 2 - Petit chien",
        AnimationOptions = {
            Prop = 'v_ilev_mr_rasberryclean',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.1100, -0.23, 0.000, 0.0000, 0.0000},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogtennis"] = {
        "creatures@pug@move",
        "nill",
        "Tenir une balle de tennis - Petit chien",
        AnimationOptions = {
            Prop = 'prop_tennis_ball',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0600, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogtennisr"] = {
        "creatures@pug@move",
        "nill",
        "Tenir une raquette - Petit chien",
        AnimationOptions = {
            Prop = 'prop_tennis_rack_01',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0200, 0.00, 0.000, 0.0000, -28.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogrose"] = {
        "creatures@pug@move",
        "nill",
        "Tenir une rose - Petit chien",
        AnimationOptions = {
            Prop = 'prop_single_rose',
            PropBone = 12844,
            PropPlacement = {0.1090, -0.0140, 0.0500, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogrose2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Tenir une rose assis - Petit chien",
        AnimationOptions = {
            Prop = 'prop_single_rose',
            PropBone = 12844,
            PropPlacement = {0.1090, -0.0140, 0.0500, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogggun"] = {
        "creatures@pug@move",
        "nill",
        "Tenir un pistolet en or - Petit chien",
        AnimationOptions = {
            Prop = 'w_pi_pistol_luxe',
            PropBone = 12844,
            PropPlacement = {0.2010, -0.0080, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdoggun2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Tenir un pistolet assis - Petit chien",
        AnimationOptions = {
            Prop = 'w_pi_pistol_luxe',
            PropBone = 12844,
            PropPlacement = {0.2010, -0.0080, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogstun"] = {
        "creatures@pug@move",
        "nill",
        "Tenir un taser - Petit chien",
        AnimationOptions = {
            Prop = 'w_pi_stungun',
            PropBone = 12844,
            PropPlacement = {0.1400, -0.0100, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdoggl1"] = {
        "creatures@pug@move",
        "nill",
        "Porter des lunettes - Petit chien",
        AnimationOptions = {
            Prop = 'prop_aviators_01',
            PropBone = 31086,
            PropPlacement = {0.0500, 0.0400, 0.000, -90.00, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdoggl2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Porter des lunettes assis - Petit chien",
        AnimationOptions = {
            Prop = 'prop_aviators_01',
            PropBone = 31086,
            PropPlacement = {0.0500, 0.0400, 0.000, -90.00, 90.00, 0.00},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdoggl3"] = {
        "creatures@pug@move",
        "nill",
        "Porter des lunettes 2 - Petit chien",
        AnimationOptions = {
            Prop = 'prop_cs_sol_glasses',
            PropBone = 31086,
            PropPlacement = {0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdoggl4"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Porter des lunettes assis 2 - Petit chien",
        AnimationOptions = {
            Prop = 'prop_cs_sol_glasses',
            PropBone = 31086,
            PropPlacement = {0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdoghd1"] = {
        "creatures@pug@move",
        "nill",
        "Tenir un hotdog - Petit chien",
        AnimationOptions = {
            Prop = 'prop_cs_hotdog_01',
            PropBone = 31086,
            PropPlacement = {
                0.1300, -0.0250, 0.000, -88.272053, -9.8465858, -0.1488562
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdoghd2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Tenir un hotdog assis - Petit chien",
        AnimationOptions = {
            Prop = 'prop_cs_hotdog_01',
            PropBone = 31086,
            PropPlacement = {
                0.1300, -0.0250, 0.000, -88.272053, -9.8465858, -0.1488562
            },
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdoghlmt1"] = {
        "creatures@pug@move",
        "nill",
        "Porter un casque de moto - Petit chien",
        AnimationOptions = {
            Prop = 'ba_prop_battle_sports_helmet',
            PropBone = 31086,
            PropPlacement = {0.00, -0.0200, 0.000, -90.00, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdoghlmt2"] = {
        "creatures@pug@move",
        "nill",
        "Porter un casque de chantier - Petit chien",
        AnimationOptions = {
            Prop = 'prop_hard_hat_01',
            PropBone = 31086,
            PropPlacement = {0.00, 0.1300, 0.000, -90.00, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdoghat"] = {
        "creatures@pug@move",
        "nill",
        "Porter un chapeau - Petit chien",
        AnimationOptions = {
            Prop = 'prop_proxy_hat_01',
            PropBone = 31086,
            PropPlacement = {
                0.0, 0.1200, 0.000, -99.8510766, 80.1489234, 1.7279411
            },
            SecondProp = 'prop_aviators_01',
            SecondPropBone = 31086,
            SecondPropPlacement = {0.0500, 0.0400, 0.000, -90.00, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdoghat2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Porter un chapeau assis - Petit chien",
        AnimationOptions = {
            Prop = 'prop_proxy_hat_01',
            PropBone = 31086,
            PropPlacement = {
                0.0, 0.1200, 0.000, -99.8510766, 80.1489234, 1.7279411
            },
            SecondProp = 'prop_aviators_01',
            SecondPropBone = 31086,
            SecondPropPlacement = {0.0500, 0.0400, 0.000, -90.00, 90.00, 0.00},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogsteak"] = {
        "creatures@pug@move",
        "nill",
        "Tenir un steak - Petit chien",
        AnimationOptions = {
            Prop = 'prop_cs_steak',
            PropBone = 31086,
            PropPlacement = {0.1800, -0.0200, 0.000, 90.00, 0.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogsteak2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_c",
        "Tenir un steak assis - Petit chien",
        AnimationOptions = {
            Prop = 'prop_cs_steak',
            PropBone = 31086,
            PropPlacement = {0.1800, -0.0200, 0.000, 90.00, 0.00, 0.00},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogpridea"] = {
        "creatures@pug@move",
        "nill",
        "Pride A (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag1',
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogprideb"] = {
        "creatures@pug@move",
        "nill",
        "Pride B - LGBTQIA (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag2', -- LGBTQIA
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogpridec"] = {
        "creatures@pug@move",
        "nill",
        "Pride C - Bisexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag3', -- Bisexual
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogprided"] = {
        "creatures@pug@move",
        "nill",
        "Pride D - Lesbian (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag4', -- Lesbian
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogpridee"] = {
        "creatures@pug@move",
        "nill",
        "Pride E - Pansexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag5', -- Pansexual
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogpridef"] = {
        "creatures@pug@move",
        "nill",
        "Pride F - Transgender  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag6', -- Transgender
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogprideg"] = {
        "creatures@pug@move",
        "nill",
        "Pride G - Non Binary (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag6', -- Non Binary
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogprideh"] = {
        "creatures@pug@move",
        "nill",
        "Pride H - Non Binary (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag7', -- Non Binary
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogpridei"] = {
        "creatures@pug@move",
        "nill",
        "Pride I - Asexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag8', -- Asexual
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sdogpridesita"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride A Sit (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag1',
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogpridesitb"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride B Sit LGBTQIA  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag2', -- LGBTQIA
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogpridesitc"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride C Sit Bisexual  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag3', -- Bisexual
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogpridesitd"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride D Sit Lesbian (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag4', -- Lesbian
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogpridesite"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride E Sit Pansexual  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag5', -- Pansexual
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogpridesitf"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride F Sit Transgender   (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag6', -- Transgender
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogpridesitg"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride G Sit Non Binary (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag7', -- Non Binary
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogpridesith"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride H Sit Asexual  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag8',
            -- Asexual
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogpridesiti"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride I Sit Straight Ally  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag9', -- Straight Ally
            PropBone = 31086,
            PropPlacement = {0.1240, -0.0080, 0.000, 0.0, 0.0, -74.6999},
            EmoteLoop = true,
            ExitEmote = "sdogup",
            ExitEmoteType = "Exits"
        }
    },
    ["sdogpee"] = {
        "creatures@pug@move",
        "nill",
        "Faire pipi - Petit chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["sdogshit"] = {
        "creatures@pug@move",
        "nill",
        "Faire caca - Petit chien",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["sdogfw"] = {
        "creatures@pug@move",
        "base",
        "Feu d'artifice - Petit chien",
        AnimationOptions = {
            Prop = 'ind_prop_firework_01', --- blue, green, red, purple pink, cyan, yellow, white
            PropBone = 31086,
            PropPlacement = {0.1330, -0.0210, -0.2760, 0.0, -180.0, 44.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sdogfris"] = {
        "creatures@pug@move",
        "nill",
        "Frisbee (small dog)",
        AnimationOptions = {
            Prop = 'p_ld_frisbee_01',
            PropBone = 31086,
            PropPlacement = {0.1900, -0.0150, 0.0000, -90.0000, 120.0000, 0.000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["chatsursaute"] = {
        "creatures@cat@amb@world_cat_sleeping_ground@exit",
        "exit_panic",
        "Chat - Sursauter de peur",
        AnimationOptions = {EmoteLoop = false}
    },
    ["chatallonger"] = {
        "creatures@cat@amb@world_cat_sleeping_ground@base",
        "base",
        "Chat - Allonger",
        AnimationOptions = {EmoteLoop = true}
    },
    ["chatettirement"] = {
        "creatures@cat@amb@peyote@enter",
        "enter",
        "Chat - Etirement",
        AnimationOptions = {EmoteLoop = false}
    }
}

Lists.Emotes.Exits = {
    ["getup"] = {
        "get_up@sat_on_floor@to_stand",
        "getup_0",
        "Get Up",
        AnimationOptions = {EmoteDuration = 2000, StartDelay = 600}
    },
    ["meditateup"] = {
        "rcmcollect_paperleadinout@",
        "meditate_getup",
        "Meditate Get Up",
        AnimationOptions = {EmoteDuration = 2000}
    },
    ["surrender_exit"] = {
        "random@arrests",
        "kneeling_arrest_get_up",
        "Surrender Exit",
        AnimationOptions = {EmoteDuration = 2200}
    },
    ["offchair"] = {
        "switch@michael@sitting",
        "exit_forward",
        "Off Chair",
        AnimationOptions = {EmoteDuration = 1000}
    },
    ["offtable"] = {
        "anim@amb@board_room@diagram_blueprints@",
        "look_around_01_amy_skater_01",
        "Off Tabble",
        AnimationOptions = {EmoteDuration = 5700}
    },
    ["phoneaway"] = {
        "amb@world_human_stand_mobile@male@text@exit",
        "exit",
        "Phone Away",
        AnimationOptions = {
            EmoteDuration = 1780,
            StartDelay = 1150,
            EmoteMoving = true
        }
    },
    ["breakfreefont"] = {
        "mp_arresting",
        "a_uncuff",
        "Break Free Front",
        AnimationOptions = {
            EmoteDuration = 6099,
            StartDelay = 450,
            EmoteMoving = true
        }
    },
    ["breakfreeback"] = {
        "mp_arresting",
        "b_uncuff",
        "Break Free Back",
        AnimationOptions = {
            EmoteDuration = 6099,
            StartDelay = 450,
            EmoteMoving = true
        }
    },
    ["standup"] = {
        "get_up@directional@movement@from_knees@injured",
        "getup_l_0",
        "Stand Up",
        AnimationOptions = {EmoteDuration = 2000, StartDelay = 600}
    },
    ["sdogup"] = {
        "creatures@pug@amb@world_dog_sitting@exit",
        "exit",
        "Small Dog Get Up",
        AnimationOptions = {EmoteDuration = 1000}
    },
    ["bdogup"] = {
        "creatures@rottweiler@amb@world_dog_sitting@exit",
        "exit",
        "Big Dog Get Up",
        AnimationOptions = {EmoteDuration = 1000}
    },
    ["bdogupk"] = {
        "creatures@rottweiler@amb@sleep_in_kennel@",
        "exit_kennel",
        "Big Dog Get Up V2",
        AnimationOptions = {EmoteDuration = 5000}
    },
    ["shakeitoffhuman"] = {
        "move_m@_idles@shake_off",
        "shakeoff_1",
        "Shake Off The Rain",
        AnimationOptions = {
            EmoteDuration = 2899,
            StartDelay = 850,
            EmoteMoving = true
        }
    }
}

Lists.Emotes.Props = {
	["terminal"] = {
		"cellphone@",
		"cellphone_text_read_base",
		"Terminal",
		AnimationOptions = {
			Prop = 'bzzz_prop_payment_terminal',
			PropBone = 57005,
			PropPlacement = {0.18, 0.01, 0.0, -54.0, 220.0, 43.0}, 
			EmoteMoving = true,
			EmoteLoop = true
		}
	},
    ["umbrella"] = {
        "amb@world_human_drinking@coffee@male@base",
        "base",
        "Parapluie 1",
        AnimationOptions = {
            Prop = "p_amb_brolly_01",
            PropBone = 57005,
            PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['umbrella2'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Parapluie 2',
        AnimationOptions = {
            Prop = 'p_amb_brolly_01',
            PropBone = 28422,
            PropPlacement = {
                0.0700, 0.0100, 0.1100, 2.3402393, -150.9605721, 57.3374916
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['umbrella3'] = { --- Custom Emote Provided To RPEmotes By Mr Witt
        'mrwitt@rain_dreamy_pose',
        'mrwitt',
        'Umbrella 3 - Rain Check',
        AnimationOptions = {
            Prop = 'p_amb_brolly_01',
            PropBone = 58867,
            PropPlacement = {0.0150, 0.0340, -0.0340, 16.0040, -6.7284, -0.9319},
            EmoteLoop = true,
            EmoteMoving = true,
            ExitEmote = "shakeitoffhuman",
            ExitEmoteType = "Exits"
        }
    },
    ['umbrella4'] = { --- Custom Emote  By Mr ultrahacx
        'custom@hold_umbrella',
        'hold_left',
        'Umbrella 4 - Hold Left',
        AnimationOptions = {
            Prop = 'p_amb_brolly_01',
            PropBone = 60309,
            PropPlacement = {0.0600, -0.0100, 0.0200, -94.3996, -1.7343, 9.9656},
            EmoteLoop = true,
            EmoteMoving = true,
            ExitEmote = "shakeitoffhuman",
            ExitEmoteType = "Exits"
        }
    },
    ["k12saw"] = {
        "anim@heists@fleeca_bank@drilling",
        "drill_straight_end",
        "Firefighter K12 Saw",
        AnimationOptions = {
            Prop = "prop_tool_consaw",
            PropBone = 28422,
            PropPlacement = {
                0.0, 0.0900, 0.0500, -70.3009797, 71.0092017, 83.759421
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["carryextinguisher"] = {
        "amb@lo_res_idles@",
        "world_human_musician_bongos_lo_res_base",
        "Firefighter Extinguisher",
        AnimationOptions = {
            Prop = "prop_fire_exting_1a",
            PropBone = 28422,
            PropPlacement = {
                0.1500, 0.1400, -0.5200, 179.7874004, -178.5954846, 4.5961806
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["maskup"] = {
        "anim@mp_helmets@on_foot",
        "visor_up",
        "Firefighter Unmask",
        AnimationOptions = {
            EmoteDuration = 800, --- Even with EmoteLoop = false, this emote still loops, so we add a duration to force it to stop after a set amount of milliseconds.
            EmoteMoving = true
        }
    },
    ["maskdown"] = {
        "anim@mp_helmets@on_foot",
        "visor_down",
        "Firefighter Mask",
        AnimationOptions = {
            EmoteDuration = 800, --- Even with EmoteLoop = false, this emote still loops, so we add a duration to force it to stop after a set amount of milliseconds.
            EmoteMoving = true
        }
    },
    ["adjustbag"] = {
        "amb@world_human_hiker_standing@male@idle_a",
        "idle_b",
        "Firefighter Adjust Tank / Bag",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 9500}
    },
    ["adjustpanel"] = {
        "anim@scripted@heist@ig9_control_tower@male@",
        "loop",
        "Firefighter Pump PSI",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    -----------------------------------------------------------------------------------------------------
    ------ This is an example of an emote with 2 props, pretty simple! ----------------------------------
    -----------------------------------------------------------------------------------------------------
    ["notepad"] = {
        "missheistdockssetup1clipboard@base",
        "base",
        "Notepad",
        AnimationOptions = {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 58866,
            SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
            -- EmoteLoop is used for emotes that should loop, its as simple as that.
            -- Then EmoteMoving is used for emotes that should only play on the upperbody.
            -- The code then checks both values and sets the MovementType to the correct one
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["box"] = {
        "anim@heists@box_carry@",
        "idle",
        "Box",
        AnimationOptions = {
            Prop = "hei_prop_heist_box",
            PropBone = 60309,
            PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gift"] = { --- Custom Prop & Emote By BzZzi
        "bz@give_love@anim",
        "bz_give",
        "Cadeau",
        AnimationOptions = {
            Prop = 'bzzz_prop_gift_orange',
            PropBone = 57005,
            PropPlacement = {0.15, -0.03, -0.14, -77.0, -120.0, 40.0},
            EmoteMoving = true
        }
    },
    ["gift2"] = { --- Custom Prop & Emote By BzZzi
        "bz@give_love@anim",
        "bz_give",
        "Cadeau 2",
        AnimationOptions = {
            Prop = 'bzzz_prop_gift_purple',
            PropBone = 57005,
            PropPlacement = {0.15, -0.03, -0.14, -77.0, -120.0, 40.0},
            EmoteMoving = true
        }
    },
    ["cake"] = { --- Custom Prop & Emote By BzZzi
        "anim@heists@box_carry@",
        "idle",
        "Gâteau d'anniversaire 1",
        AnimationOptions = {
            Prop = 'bzzz_prop_cake_birthday_001',
            PropBone = 18905,
            PropPlacement = {0.33, 0.09, 0.2, -128.0, -245.0, 2.0},
            EmoteMoving = true
        }
    },
    ["cake2"] = { --- Custom Prop & Emote By BzZzi
        "anim@heists@box_carry@",
        "idle",
        "Gâteau - Bébé",
        AnimationOptions = {
            Prop = 'bzzz_prop_cake_baby_001',
            PropBone = 18905,
            PropPlacement = {0.33, 0.09, 0.2, -94.0, -162.0, -44.0},
            EmoteMoving = true
        }
    },
    ["cake3"] = { --- Custom Prop & Emote By BzZzi
        "anim@heists@box_carry@",
        "idle",
        "Gâteau - Casino",
        AnimationOptions = {
            Prop = 'bzzz_prop_cake_casino001',
            PropBone = 18905,
            PropPlacement = {0.33, 0.09, 0.2, -54.0, -72.0, -6.0},
            EmoteMoving = true
        }
    },
    ["cake4"] = { --- Custom Prop & Emote By BzZzi
        "anim@heists@box_carry@",
        "idle",
        "Gâteau - Amour",
        AnimationOptions = {
            Prop = 'bzzz_prop_cake_love_001',
            PropBone = 18905,
            PropPlacement = {0.28, 0.06, 0.2, -54.0, -72.0, -6.0},
            EmoteMoving = true
        }
    },
    ["cake5"] = {
        "anim@heists@box_carry@",
        "idle",
        "Gâteau - Licorne",
        AnimationOptions = { -- Custom Prop By PataMods
            Prop = 'pata_cake',
            PropBone = 28422,
            PropPlacement = {0.0, -0.0700, -0.0400, 10.0000, 0.0000, 0.0000},
            EmoteMoving = true
        }
    },
    ["cake6"] = {
        "anim@heists@box_carry@",
        "idle",
        "Gâteau - Fierté",
        AnimationOptions = { -- Custom Prop By PataMods
            Prop = 'pata_cake2',
            PropBone = 28422,
            PropPlacement = {0.0, -0.0700, -0.0400, 10.0000, 0.0000, 0.0000},
            EmoteMoving = true
        }
    },
    ["cake7"] = { -- Custom Prop By PataMods
        "anim@heists@box_carry@",
        "idle",
        "Gâteau - Coulant Choco",
        AnimationOptions = {
            Prop = 'pata_cake3',
            PropBone = 28422,
            PropPlacement = {-0.0100, -0.0390, -0.0800, 10.0000, 0.0000, 0.0000},
            EmoteMoving = true
        }
    },
    ["cakew"] = {
        "anim@move_f@waitress",
        "idle",
        "Gâteau Anniversaire 2",
        AnimationOptions = {
            Prop = "bzzz_prop_cake_birthday_001",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0100, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cakew2"] = { --- Custom Prop & Emote By BzZzi
        "anim@move_f@waitress",
        "idle",
        "Gâteau - Bébé 2",
        AnimationOptions = {
            Prop = "bzzz_prop_cake_baby_001",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0100, 0.0, 0.0, 80.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cakew3"] = { --- Custom Prop & Emote By BzZzi
        "anim@move_f@waitress",
        "idle",
        "Gâteau - Casino 2",
        AnimationOptions = {
            Prop = "bzzz_prop_cake_casino001",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0100, 0.0, 0.0, -160.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cakew4"] = { --- Custom Prop & Emote By BzZzi
        "anim@move_f@waitress",
        "idle",
        "Gâteau - Amour 2",
        AnimationOptions = {
            Prop = "bzzz_prop_cake_love_001",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0100, 0.0, 0.0, 180.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cakew5"] = {
        "anim@move_f@waitress",
        "idle",
        "Gâteau - Licorne 2",
        AnimationOptions = {
            Prop = "pata_cake",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.1100, 0.0, 0.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cakew6"] = {
        "anim@move_f@waitress",
        "idle",
        "Gâteau - Fierté 2",
        AnimationOptions = {
            Prop = "pata_cake2",
            PropBone = 28422,
            PropPlacement = {0.0000, 0.0000, 0.1100, 0.0, 0.0, 20.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cakew7"] = { --- Custom Prop & Emote By BzZzi
        "anim@move_f@waitress",
        "idle",
        "Gâteau - Coulant Choco 2",
        AnimationOptions = {
            Prop = "pata_cake3",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.1100, 0.0, 0.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["rose"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Rose",
        AnimationOptions = {
            Prop = "prop_single_rose",
            PropBone = 18905,
            PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["balloon"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Ballon",
        AnimationOptions = {
            Prop = "heart_balloon",
            PropBone = 60309,
            PropPlacement = {0.25, -0.84, 0.53, -157.2041, -101.1702, 28.0243},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["balloon2"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Balloon 2 - Pride",
        AnimationOptions = {
            Prop = "pride_heart_balloon",
            PropBone = 60309,
            PropPlacement = {1.0600, 0.4900, 0.0140, 73.5103, -30.9638, 19.3946},
            EmoteStuck = true,
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smoke2"] = {
        "amb@world_human_aa_smoke@male@idle_a",
        "idle_c",
        "Fumer une cigarette 2",
        AnimationOptions = {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smoke3"] = {
        "amb@world_human_aa_smoke@male@idle_a",
        "idle_b",
        "Fumer une cigarette 3",
        AnimationOptions = {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smoke4"] = {
        "amb@world_human_smoking@female@idle_a",
        "idle_b",
        "Fumer une cigarette 4 - Femme",
        AnimationOptions = {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smoke5"] = { --- Custom Emote Provided To RPEmotes By Mr Witt
        "mrwitt@composed_photo_moments",
        "mrwitt",
        "Smoke 5",
        AnimationOptions = {
            Prop = 'ng_proc_cigarette01a',
            PropBone = 64097,
            PropPlacement = {0.0020, 0.0010, -0.0090, 0.0, 0.0, 50.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["vape"] = {
        "amb@world_human_smoking@male@male_b@base",
        "base",
        "Vape",
        AnimationOptions = {
            Prop = 'ba_prop_battle_vape_01',
            PropBone = 28422,
            PropPlacement = {-0.0290, 0.0070, -0.0050, 91.0, 270.0, -360.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["vape2"] = {
        "amb@world_human_smoking@male@male_b@base",
        "base",
        "Vape 2",
        AnimationOptions = {
            Prop = 'xm3_prop_xm3_vape_01a',
            PropBone = 28422,
            PropPlacement = {-0.02, -0.02, 0.02, 58.0, 110.0, 10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["bong"] = {
        "anim@safehouse@bong",
        "bong_stage3",
        "Bong",
        AnimationOptions = {
            Prop = 'hei_heist_sh_bong_01',
            PropBone = 18905,
            PropPlacement = {0.10, -0.25, 0.0, 95.0, 190.0, 180.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bong2"] = {
        "anim@safehouse@bong",
        "bong_stage3",
        "Bong 2",
        AnimationOptions = {
            Prop = 'xm3_prop_xm3_bong_01a',
            PropBone = 18905,
            PropPlacement = {0.10, -0.25, 0.0, 95.0, 190.0, 180.0}
        },
        EmoteLoop = true,
        EmoteMoving = true
    },
    ["bong3"] = {
        "sit_bong@dark",
        "sit_bong_clip",
        "Bong 3 - Sit & Rip",
        AnimationOptions = {
            Prop = 'hei_heist_sh_bong_01',
            PropBone = 60309,
            PropPlacement = {
                0.0490, -0.2000, 0.0800, -85.0199, 102.3320, -15.0085
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["bong4"] = {
        "sit_bong@dark",
        "sit_bong_clip",
        "Bong 4 - Sit & Rip Purple",
        AnimationOptions = {
            Prop = 'xm3_prop_xm3_bong_01a',
            PropBone = 60309,
            PropPlacement = {
                0.0490, -0.2000, 0.0800, -85.0199, 102.3320, -15.0085
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["joint2"] = { --- Custom Emote Provided To RPEmotes By Sel of Darks Animations
        "smoke_m@sel",
        "smoke_m_clip",
        "Pass The Blunt",
        AnimationOptions = {
            Prop = 'p_cs_joint_01',
            PropBone = 26612,
            PropPlacement = {
                0.0540, -0.0120, 0.0480, 172.3040, -131.4506, 45.1778
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["fishing1"] = {
        "amb@world_human_stand_fishing@idle_a",
        "idle_a",
        "Pêcher 1",
        AnimationOptions = {
            Prop = 'prop_fishing_rod_01',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["fishing2"] = {
        "amb@world_human_stand_fishing@idle_a",
        "idle_b",
        "Pêcher 2",
        AnimationOptions = {
            Prop = 'prop_fishing_rod_01',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["fishing3"] = {
        "amb@world_human_stand_fishing@idle_a",
        "idle_c",
        "Pêcher 3",
        AnimationOptions = {
            Prop = 'prop_fishing_rod_01',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["suitcase"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Porter une valise 1",
        AnimationOptions = {
            Prop = "prop_ld_suitcase_01",
            PropBone = 57005,
            PropPlacement = {0.35, 0.0, 0.0, 0.0, 266.0, 90.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["suitcase2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Porter une valise 2",
        AnimationOptions = {
            Prop = "prop_security_case_01",
            PropBone = 57005,
            PropPlacement = {0.13, 0.0, -0.01, 0.0, 280.0, 90.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["boombox"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Boombox",
        AnimationOptions = {
            Prop = "prop_boombox_01",
            PropBone = 57005,
            PropPlacement = {0.27, 0.0, 0.0, 0.0, 263.0, 58.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["boombox2"] = {
        "molly@boombox1",
        "boombox1_clip",
        "Boombox 2",
        AnimationOptions = {
            Prop = "prop_cs_sol_glasses",
            PropBone = 31086,
            PropPlacement = {
                0.0440, 0.0740, 0.0000, -160.9843, -88.7288, -0.6197
            },
            SecondProp = 'prop_ghettoblast_02',
            SecondPropBone = 10706,
            SecondPropPlacement = {
                -0.2310, -0.0770, 0.2410, -179.7256, 176.7406, 23.0190
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["toolbox"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Boite a outils 1",
        AnimationOptions = {
            Prop = "prop_tool_box_04",
            PropBone = 28422,
            PropPlacement = {0.3960, 0.0410, -0.0030, -90.00, 0.0, 90.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["toolbox2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Boite a outils 2",
        AnimationOptions = {
            Prop = "imp_prop_tool_box_01a",
            PropBone = 28422,
            PropPlacement = {0.3700, 0.0200, 0.0, 90.00, 0.0, -90.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["toolbox3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Boite a outils 3",
        AnimationOptions = {
            Prop = "xm3_prop_xm3_tool_box_01a",
            PropBone = 28422,
            PropPlacement = {0.3700, 0.0200, 0.0, 90.00, 0.0, -90.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["toolbox4"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Boite a outils 4",
        AnimationOptions = {
            Prop = "xm3_prop_xm3_tool_box_02a",
            PropBone = 28422,
            PropPlacement = {0.3700, 0.0200, 0.0, 90.00, 0.0, -90.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cashbox"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Cash Box",
        AnimationOptions = {
            Prop = "m23_1_prop_m31_cashbox_01a",
            PropBone = 28422,
            PropPlacement = {0.0550, 0.0090, -0.0100, 90.00, 0.0, -81.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gbag"] = {
        "missfbi4prepp1",
        "_idle_garbage_man",
        "Sac poubelle",
        AnimationOptions = {
            Prop = "prop_cs_street_binbag_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0400, -0.0200, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beerbox"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Pack de bière 1",
        AnimationOptions = {
            Prop = "v_ret_ml_beerdus",
            PropBone = 57005,
            PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 48.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beerbox2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Pack de bière 2",
        AnimationOptions = {
            Prop = "v_ret_ml_beeram",
            PropBone = 57005,
            PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 48.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beerbox3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Pack de bière 3",
        AnimationOptions = {
            Prop = "v_ret_ml_beerpride",
            PropBone = 57005,
            PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 48.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beerbox4"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Pack de bière 4",
        AnimationOptions = {
            Prop = "v_ret_ml_beerbar",
            PropBone = 57005,
            PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 60.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mugshot"] = {
        "mp_character_creation@customise@male_a",
        "loop",
        "Mugshot",
        AnimationOptions = {
            Prop = 'prop_police_id_board',
            PropBone = 58868,
            PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["coffee"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Café",
        AnimationOptions = {
            Prop = 'p_amb_coffeecup_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["whiskey"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Whiskey",
        AnimationOptions = {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["whiskeyb"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_a",
        "Bouteille de Whiskey",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_bottle_2_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.05, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beer"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_c",
        "Bière 1",
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.06, 0.0, 15.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beer2"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_c",
        "Bière 2",
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.06, 0.0, 15.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beer3"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_a",
        "Bière 3",
        AnimationOptions = {
            Prop = 'p_cs_bottle_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beer4"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_b",
        "Bière 4",
        AnimationOptions = {
            Prop = 'p_cs_bottle_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["beer5"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_c",
        "Bière 5",
        AnimationOptions = {
            Prop = 'p_cs_bottle_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["whiskeyb2"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_a",
        "Bouteille de Whiskey 2",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_bottle_2_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.05, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["whiskeyb3"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_a",
        "Bouteille de Whiskey 3",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_bottle_2_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.05, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["beerf"] = {
        "amb@world_human_drinking@beer@female@idle_a",
        "idle_a",
        "Bière 1 - Femme",
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, -0.0, 0.05, 15.0, 15.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beercan"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Canette de Bière",
        AnimationOptions = {
            Prop = 'v_res_tt_can01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 80.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beercan2"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Canette de Bière 2",
        AnimationOptions = {
            Prop = 'v_res_tt_can02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, -150.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beercan3"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Canette de Bière 3",
        AnimationOptions = {
            Prop = 'h4_prop_h4_can_beer_01a',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0700, 0.0, 0.0, 90.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wine2"] = {
        "amb@world_human_drinking@beer@female@idle_a",
        "idle_e",
        "Bouteille de vin 2",
        AnimationOptions = {
            Prop = 'prop_wine_rose',
            PropBone = 28422,
            PropPlacement = {-0.0, 0.04, -0.19, 10.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
            ---       PropPlacement = {-0.0, 0.03, -0.20, 5.0, 0.0, 0.0},
            ---     F&B   L&R   U&D  R.F&B
        }
    },
    ["beerf3"] = {
        "amb@world_human_drinking@beer@female@idle_a",
        "idle_a",
        "Bière 3 - Femme",
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, -0.0, 0.05, 15.0, 15.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["wine3"] = {
        "amb@world_human_drinking@beer@female@idle_a",
        "idle_e",
        "Bouteille de vin 3",
        AnimationOptions = {
            Prop = 'prop_wine_rose',
            PropBone = 28422,
            PropPlacement = {-0.0, 0.04, -0.19, 10.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["cup"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Gobelet",
        AnimationOptions = {
            Prop = 'prop_plastic_cup_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["apple"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Pomme",
        AnimationOptions = {
            Prop = 'sf_prop_sf_apple_01b',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0150, -0.0200, -124.6964, -166.5760, 8.4572},
            EmoteMoving = true
        }
    },
    ["taco"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Taco",
        AnimationOptions = {
            Prop = 'prop_taco_01',
            PropBone = 60309,
            PropPlacement = {
                -0.0170, 0.0070, -0.0210, 107.9846, -105.0251, 55.7779
            },
            EmoteMoving = true
        }
    },
    ["hotdog"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Hotdog",
        AnimationOptions = {
            Prop = 'prop_cs_hotdog_02',
            PropBone = 60309,
            PropPlacement = {
                -0.0300, 0.0100, -0.0100, 95.1071, 94.7001, -66.9179
            },
            EmoteMoving = true
        }
    },
    ["bagel"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Bagel",
        AnimationOptions = {
            Prop = 'p_ing_bagel_01',
            PropBone = 18905,
            PropPlacement = {0.14, 0.05, 0.03, 145.3975, -53.8984, 4.8412},

            EmoteMoving = true
        }
    },
    ["donut"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Donut",
        AnimationOptions = {
            Prop = 'prop_amb_donut',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true
        }
    },
    ["donut2"] = { --- Custom Prop by Bzzzi
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Donut Chocolat",
        AnimationOptions = {
            Prop = 'bzzz_foodpack_donut002',
            PropBone = 60309,
            PropPlacement = {0.0000, -0.0300, -0.0100, 10.0000, 0.0000, -1.0000},
            EmoteMoving = true
        }
    },
    ["donut3"] = { --- Custom Prop by Bzzzi
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Donut Framboise",
        AnimationOptions = {
            Prop = 'bzzz_foodpack_donut001',
            PropBone = 60309,
            PropPlacement = {0.0000, -0.0300, -0.0100, 10.0000, 0.0000, -1.0000},
            EmoteMoving = true
        }
    },
    ["desert"] = { --- Custom Prop by Bzzzi
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger un dessert",
        AnimationOptions = {
            Prop = 'bzzz_food_dessert_a',
            PropBone = 18905,
            PropPlacement = {0.15, 0.03, 0.03, -42.0, -36.0, 0.0},
            EmoteMoving = true
        }
    },
    ["croissant"] = { --- Custom Prop by Bzzzi
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger un croissant",
        AnimationOptions = {
            Prop = 'bzzz_foodpack_croissant001',
            PropBone = 60309,
            PropPlacement = {0.0000, 0.0000, -0.0100, 0.0000, 0.0000, 90.0000},
            EmoteMoving = true
        }
    },
    ["gingerbread"] = { --- Custom Prop by Bzzzi
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger pain d'épice",
        AnimationOptions = {
            Prop = 'bzzz_food_xmas_gingerbread_a',
            PropBone = 18905,
            PropPlacement = {0.16, 0.04, 0.03, 18.0, 164.0, -5.0},
            EmoteMoving = true
        }
    },
    ["candycane"] = { --- Custom Prop by Bzzzi
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger sucre d'orge rouge",
        AnimationOptions = {
            Prop = 'bzzz_food_xmas_lollipop_a',
            PropBone = 18905,
            PropPlacement = {0.16, 0.02, 0.03, -73.0, 146.0, -5.0},
            EmoteMoving = true
        }
    },
    ["candycaneb"] = { --- Custom Prop by Bzzzi
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger sucre d'orge vert",
        AnimationOptions = {
            Prop = 'bzzz_food_xmas_lollipop_b',
            PropBone = 18905,
            PropPlacement = {0.16, 0.02, 0.03, -73.0, 146.0, -5.0},
            EmoteMoving = true
        }
    },
    ["candycanec"] = { --- Custom Prop by Bzzzi
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger sucre d'orge violet",
        AnimationOptions = {
            Prop = 'bzzz_food_xmas_lollipop_c',
            PropBone = 18905,
            PropPlacement = {0.16, 0.02, 0.03, -73.0, 146.0, -5.0},
            EmoteMoving = true
        }
    },
    ["candycaned"] = { --- Custom Prop by Bzzzi
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger sucre d'orge jaune",
        AnimationOptions = {
            Prop = 'bzzz_food_xmas_lollipop_d',
            PropBone = 18905,
            PropPlacement = {0.16, 0.02, 0.03, -73.0, 146.0, -5.0},
            EmoteMoving = true
        }
    },
    ["candycanee"] = { --- Custom Prop by Bzzzi
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger sucre d'orge bleu",
        AnimationOptions = {
            Prop = 'bzzz_food_xmas_lollipop_e',
            PropBone = 18905,
            PropPlacement = {0.16, 0.02, 0.03, -73.0, 146.0, -5.0},
            EmoteMoving = true
        }
    },
    ["meat"] = {
        "move_crouch_proto",
        "idle",
        "Meat On A Stick",
        AnimationOptions = {
            Prop = 'bzzz_camp_stick_kebab',
            PropBone = 64080,
            PropPlacement = {
                0.0600, 0.0500, -0.1600, 17.0651, -30.9089, 60.0374
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["meat2"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Meat On A Fork",
        AnimationOptions = {
            Prop = 'bzzz_camp_food_kebab',
            PropBone = 18905,
            PropPlacement = {0.14, 0.02, 0.01, -24.0, -80.0, 9.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mallow"] = {
        "move_crouch_proto",
        "idle",
        "Marshmallow Stick - White",
        AnimationOptions = {
            Prop = 'bzzz_camp_stick_marshmallow',
            PropBone = 64080,
            PropPlacement = {
                0.0600, 0.0500, -0.1600, 17.0651, -30.9089, 60.0374
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mallow2"] = {
        "move_crouch_proto",
        "idle",
        "Marshmallow Stick - Pink",
        AnimationOptions = {
            Prop = 'bzzz_camp_stick_mellopink',
            PropBone = 64080,
            PropPlacement = {
                0.0600, 0.0500, -0.1600, 17.0651, -30.9089, 60.0374
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mallow3"] = {
        "move_crouch_proto",
        "idle",
        "Marshmallow Stick - Burnt",
        AnimationOptions = {
            Prop = 'bzzz_camp_stick_melloburnt',
            PropBone = 64080,
            PropPlacement = {
                0.0600, 0.0500, -0.1600, 17.0651, -30.9089, 60.0374
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mallow4"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Marshmallow On A Fork - White",
        AnimationOptions = {
            Prop = 'bzzz_camp_food_marshmallow',
            PropBone = 18905,
            PropPlacement = {0.14, 0.02, 0.01, -24.0, -80.0, 9.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mallow5"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Marshmallow On A Fork - Pink",
        AnimationOptions = {
            Prop = 'bzzz_camp_food_mellopink',
            PropBone = 18905,
            PropPlacement = {0.14, 0.02, 0.01, -24.0, -80.0, 9.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mallow6"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Marshmallow On A Fork - Burnt",
        AnimationOptions = {
            Prop = 'bzzz_camp_food_melloburnt',
            PropBone = 18905,
            PropPlacement = {0.14, 0.02, 0.01, -24.0, -80.0, 9.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["macaroon"] = { --- Custom Prop by Bzzzi
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger un macaroon",
        AnimationOptions = {
            Prop = 'bzzz_food_xmas_macaroon_a',
            PropBone = 18905,
            PropPlacement = {0.15, 0.07, 0.00, 38.0, 7.0, 7.0},
            EmoteMoving = true
        }
    },
    ["xmasmug"] = { --- Custom Prop by Bzzzi
        "mp_player_intdrink",
        "loop_bottle",
        "Boire du thé - Mug",
        AnimationOptions = {
            Prop = 'bzzz_food_xmas_mug_a',
            PropBone = 18905,
            PropPlacement = {0.09, -0.01, 0.08, -44.0, 137.0, 9.0},
            EmoteMoving = true
        }
    },
    ["xmasmug2"] = { --- Custom Prop by Bzzzi
        "mp_player_intdrink",
        "loop_bottle",
        "Boire du Café - Mug",
        AnimationOptions = {
            Prop = 'bzzz_food_xmas_mug_b',
            PropBone = 18905,
            PropPlacement = {0.09, -0.01, 0.08, -44.0, 137.0, 9.0},
            EmoteMoving = true
        }
    },
    ["xmaswine"] = { --- Custom Prop by Bzzzi
        "mp_player_intdrink",
        "loop_bottle",
        "Boire du vin chaud",
        AnimationOptions = {
            Prop = 'bzzz_food_xmas_mulled_wine_a',
            PropBone = 18905,
            PropPlacement = {0.13, 0.03, 0.05, -110.0, -47.0, 7.0},
            EmoteMoving = true
        }
    },
    ["cocoa"] = {
        "amb@world_human_aa_coffee@base",
        "base",
        "Boire un chocolat chaud",
        AnimationOptions = {
            Prop = 'pata_christmasfood1',
            PropBone = 28422,
            PropPlacement = {0.0100, -0.1100, -0.1300, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["xmassf"] = { --- Custom Prop by PataMods
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger un cookie en flocon",
        AnimationOptions = {
            Prop = 'pata_christmasfood2',
            PropBone = 60309,
            PropPlacement = {0.0200, -0.0500, 0.0200, 0.0, 0.0, 0.0},
            EmoteMoving = true
        }
    },
    ["xmascc"] = { --- Custom Prop by PataMods
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger un cupcake",
        AnimationOptions = {
            Prop = 'pata_christmasfood6',
            PropBone = 60309,
            PropPlacement = {
                0.0100, 0.0200, -0.0100, -170.1788, 87.6716, 30.0540
            },
            EmoteMoving = true
        }
    },
    ["xmascc2"] = { --- Custom Prop by PataMods
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger un cupcake 2",
        AnimationOptions = {
            Prop = 'pata_christmasfood8',
            PropBone = 60309,
            PropPlacement = {0.0200, 0.0, -0.0100, 9.3608, -90.1809, 66.3689},
            EmoteMoving = true
        }
    },
    ["xmasic"] = {
        "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        "base_idle",
        "Manger une glace",
        AnimationOptions = {
            Prop = "pata_christmasfood7",
            PropBone = 60309,
            PropPlacement = {-0.0460, 0.0000, -0.0300, 0.0, 0.0, -50.0000},
            SecondProp = 'h4_prop_h4_coke_spoon_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 20.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pizzaslice"] = { --- Custom Prop by knjgh
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Part de Pizza - Jalapeño & Peperoni 1",
        AnimationOptions = {
            Prop = 'knjgh_pizzaslice1',
            PropBone = 60309,
            PropPlacement = {
                0.0500, -0.0200, -0.0200, 73.6928, -66.7427, 68.3677
            },
            EmoteMoving = true
        }
    },
    ["pizzas"] = { --- Custom Prop by knjgh
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Part de Pizza - Jalapeño & Peperoni",
        AnimationOptions = {
            Prop = 'knjgh_pizzaslice1',
            PropBone = 60309,
            PropPlacement = {
                0.0500, -0.0200, -0.0200, 73.6928, -66.7427, 68.3677
            },
            EmoteMoving = true
        }
    },
    ["pizzas2"] = { --- Custom Prop by knjgh
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Part de Pizza - Tomate & Pesto",
        AnimationOptions = {
            Prop = 'knjgh_pizzaslice2',
            PropBone = 60309,
            PropPlacement = {
                0.0500, -0.0200, -0.0200, 73.6928, -66.7427, 68.3677
            },
            EmoteMoving = true
        }
    },
    ["pizzas3"] = { --- Custom Prop by knjgh
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Part de Pizza - Champignon",
        AnimationOptions = {
            Prop = 'knjgh_pizzaslice3',
            PropBone = 60309,
            PropPlacement = {
                0.0500, -0.0200, -0.0200, 73.6928, -66.7427, 68.3677
            },
            EmoteMoving = true
        }
    },
    ["pizzas4"] = { --- Custom Prop by knjgh
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Part de Pizza - Margherita",
        AnimationOptions = {
            Prop = 'knjgh_pizzaslice4',
            PropBone = 60309,
            PropPlacement = {
                0.0500, -0.0200, -0.0200, 73.6928, -66.7427, 68.3677
            },
            EmoteMoving = true
        }
    },
    ["pizzas5"] = { --- Custom Prop by knjgh
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Part de Pizza - Double Peperoni",
        AnimationOptions = {
            Prop = 'knjgh_pizzaslice5',
            PropBone = 60309,
            PropPlacement = {
                0.0500, -0.0200, -0.0200, 73.6928, -66.7427, 68.3677
            },
            EmoteMoving = true
        }
    },
    ["eat"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Eat",
        AnimationOptions = {
            Prop = 'prop_cs_burger_01',
            PropBone = 60309,
            PropPlacement = {0.0000, 0.0000, -0.0200, 30.0000, 0.0000, 0.0000},

            EmoteMoving = true
        }
    },
    ["burger"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger un burger",
        AnimationOptions = {
            Prop = 'prop_cs_burger_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true
        }
    },
    ["burgerpose"] = { -- Custom Emote By Dark Animations exclusive to RPEmotes exclusive to RPEmotes
        "brugershot_dark_fixed@dark",
        "brugershot_dark_fixed_clip",
        "Burger - Pose",
        AnimationOptions = {
            Prop = 'prop_cs_burger_01',
            PropBone = 60309,
            PropPlacement = {0.0460, 0.0140, 0.0460, 3.4346, 20.1823, -10.000},
            SecondProp = 'ba_prop_battle_sports_helmet',
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.0400, -0.0100, -0.2000, 176.3835, -169.3724, 19.6834
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sandwich"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger un sandwich",
        AnimationOptions = {
            Prop = 'prop_sandwich_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true
        }
    },
    ["soda"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Boire un soda",
        AnimationOptions = {
            Prop = 'prop_ecola_can',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["soda2"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Boire un soda - Sprunk",
        AnimationOptions = {
            Prop = 'ng_proc_sodacan_01b',
            PropBone = 28422,
            PropPlacement = {0.0050, -0.0010, -0.0800, 0.0, 0.0, 160.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["soda3"] = {
        "amb@code_human_wander_drinking@male@base",
        "static",
        "Boire un soda - P's & Q's",
        AnimationOptions = {
            Prop = 'v_ret_fh_bscup',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0400, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["soda4"] = {
        "amb@code_human_wander_drinking@male@base",
        "static",
        "Boire un soda - Burger Shot",
        AnimationOptions = {
            Prop = 'prop_cs_bs_cup',
            PropBone = 28422,
            PropPlacement = {0.0060, 0.0010, 0.0, 0.0, 0.0, -150.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["soda5"] = {
        "amb@code_human_wander_drinking@male@base",
        "static",
        "Boire un soda - eCola 2",
        AnimationOptions = {
            Prop = 'prop_rpemotes_soda03',
            PropBone = 28422,
            PropPlacement = {0.0060, 0.0010, 0.0, 0.0, 0.0, 80.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["soda6"] = {
        "amb@code_human_wander_drinking@male@base",
        "static",
        "Boire un soda - eCola Light",
        AnimationOptions = {
            Prop = 'prop_rpemotes_soda04',
            PropBone = 28422,
            PropPlacement = {0.0060, 0.0010, 0.0, 0.0, 0.0, 80.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["soda7"] = {
        "amb@code_human_wander_drinking@male@base",
        "static",
        "Boire un soda - Sprunk 2",
        AnimationOptions = {
            Prop = 'prop_rpemotes_soda01',
            PropBone = 28422,
            PropPlacement = {0.0060, 0.0010, 0.0, 0.0, 0.0, 80.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["soda8"] = {
        "amb@code_human_wander_drinking@male@base",
        "static",
        "Boire un soda - Sprunk Light",
        AnimationOptions = {
            Prop = 'prop_rpemotes_soda02',
            PropBone = 28422,
            PropPlacement = {0.0060, 0.0010, 0.0, 0.0, 0.0, 80.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["soda9"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Boire un soda - Orange",
        AnimationOptions = {
            Prop = 'prop_orang_can_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipsoda"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Soda Cup - Sprunk",
        AnimationOptions = {
            Prop = 'prop_rpemotes_soda01',
            PropBone = 28422,
            PropPlacement = {
                0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipsodab"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Soda Cup - Sprunk Light",
        AnimationOptions = {
            Prop = 'prop_rpemotes_soda02',
            PropBone = 28422,
            PropPlacement = {
                0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipsodac"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Soda Cup - eCola",
        AnimationOptions = {
            Prop = 'prop_rpemotes_soda03',
            PropBone = 28422,
            PropPlacement = {
                0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipsodad"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Soda Cup - eCola Light",
        AnimationOptions = {
            Prop = 'prop_rpemotes_soda04',
            PropBone = 28422,
            PropPlacement = {
                0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dbsoda"] = {
        "amb@code_human_wander_drinking@male@base",
        "static",
        "Boire un soda - Dumb Bitch",
        AnimationOptions = {
            Prop = 'dumbbitchjuice',
            PropBone = 28422,
            PropPlacement = {
                0.0060, -0.0020, -0.0700, 180.0000, 180.0000, -10.0000
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["frappe"] = {
        "amb@code_human_wander_drinking@male@base",
        "static",
        "Frappe",
        AnimationOptions = {
            Prop = 'brum_heartfrappe',
            PropBone = 28422,
            PropPlacement = {0.0, -0.0150, -0.0100, 0.0, -3.9999, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["frappe2"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Frappe 2",
        AnimationOptions = {
            Prop = 'beanmachine_cup',
            PropBone = 28422,
            PropPlacement = {0.0110, 0.0, 0.0300, 0.0, 0.0, -140.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["frappe3"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Frappe 3",
        AnimationOptions = {
            Prop = 'beanmachine_cup2',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0600, 0.0, 0.0, -178.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["frappe4"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Frappe 4",
        AnimationOptions = {
            Prop = 'beanmachine_cup3',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0600, 0.0, 0.0, -178.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["edrink"] = {
        "mp_player_intdrink",
        "loop_bottle",
        "Energy Drink - Bouteille",
        AnimationOptions = {
            Prop = "prop_energy_drink",
            PropBone = 60309,
            PropPlacement = {0.0080, 0.0010, 0.0160, 3.5690, 4.6611, -49.9065},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["edrink2"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Energy Drink - Canette",
        AnimationOptions = {
            Prop = "sf_prop_sf_can_01a",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, -110.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["edrink3"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Energy Drink - Canette XXL",
        AnimationOptions = {
            Prop = "sf_p_sf_grass_gls_s_01a",
            PropBone = 28422,
            PropPlacement = {0.0000, 0.0000, -0.1400, 0.0000, 0.0000, 9.0000},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["mshake"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Milkshake - Bubblegum",
        AnimationOptions = {
            Prop = 'brum_cherryshake_bubblegum',
            PropBone = 28422,
            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mshakeb"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Milkshake - Cerise",
        AnimationOptions = {
            Prop = 'brum_cherryshake_cherry',
            PropBone = 28422,
            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mshakec"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Milkshake - Chocolat",
        AnimationOptions = {
            Prop = 'brum_cherryshake_chocolate',
            PropBone = 28422,
            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mshaked"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Milkshake - Café",
        AnimationOptions = {
            Prop = 'brum_cherryshake_coffee',
            PropBone = 28422,
            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mshakee"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Milkshake - Double Chocolat",
        AnimationOptions = {
            Prop = 'brum_cherryshake_doublechocolate',
            PropBone = 28422,
            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mshakef"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Milkshake - Frappe",
        AnimationOptions = {
            Prop = 'brum_cherryshake_frappe',
            PropBone = 28422,
            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mshakeg"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Milkshake - Citron",
        AnimationOptions = {
            Prop = 'brum_cherryshake_lemon',
            PropBone = 28422,
            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mshakeh"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Milkshake - Menthe",
        AnimationOptions = {
            Prop = 'brum_cherryshake_mint',
            PropBone = 28422,
            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mshakei"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Milkshake - Fraise",
        AnimationOptions = {
            Prop = 'brum_cherryshake_strawberry',
            PropBone = 28422,
            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mshakej"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Milkshake - Framboise",
        AnimationOptions = {
            Prop = 'brum_cherryshake_raspberry',
            PropBone = 28422,
            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mshakek"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Milkshake - Salé",
        AnimationOptions = {
            Prop = 'brum_cherryshake_salted',
            PropBone = 28422,
            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mshakel"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Milshake - Vanilla",
        AnimationOptions = {
            Prop = 'brum_cherryshake_vanilla',
            PropBone = 28422,
            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipshake"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Milkshake - Bubblegum",
        AnimationOptions = {
            Prop = 'brum_cherryshake_raspberry',
            PropBone = 28422,
            PropPlacement = {
                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipshakeb"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Milkshake - Cherry",
        AnimationOptions = {
            Prop = 'brum_cherryshake_cherry',
            PropBone = 28422,
            PropPlacement = {
                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipshakec"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Milkshake - Chocolate",
        AnimationOptions = {
            Prop = 'brum_cherryshake_chocolate',
            PropBone = 28422,
            PropPlacement = {
                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipshaked"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Milkshake - Coffee",
        AnimationOptions = {
            Prop = 'brum_cherryshake_coffee',
            PropBone = 28422,
            PropPlacement = {
                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipshakee"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Milkshake - Double Chocolate",
        AnimationOptions = {
            Prop = 'brum_cherryshake_doublechocolate',
            PropBone = 28422,
            PropPlacement = {
                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipshakef"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Milkshake - Frappe",
        AnimationOptions = {
            Prop = 'brum_cherryshake_frappe',
            PropBone = 28422,
            PropPlacement = {
                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipshakeg"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Milkshake - Lemon",
        AnimationOptions = {
            Prop = 'brum_cherryshake_lemon',
            PropBone = 28422,
            PropPlacement = {
                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipshakeh"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Milkshake - Mint",
        AnimationOptions = {
            Prop = 'brum_cherryshake_mint',
            PropBone = 28422,
            PropPlacement = {
                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipshakei"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Milkshake - Strawberry",
        AnimationOptions = {
            Prop = 'brum_cherryshake_strawberry',
            PropBone = 28422,
            PropPlacement = {
                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipshakej"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Milkshake - Raspberry",
        AnimationOptions = {
            Prop = 'brum_cherryshake_raspberry',
            PropBone = 28422,
            PropPlacement = {
                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipshakek"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Milkshake - Salted",
        AnimationOptions = {
            Prop = 'brum_cherryshake_salted',
            PropBone = 28422,
            PropPlacement = {
                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sipshakel"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sip Milkshake - Vanilla",
        AnimationOptions = {
            Prop = 'brum_cherryshake_vanilla',
            PropBone = 28422,
            PropPlacement = {
                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sodafu"] = {
        "anim@male_drinking_01",
        "m_drinking_01_clip",
        "Soda eCola - FU",
        AnimationOptions = {
            Prop = 'prop_ecola_can',
            PropBone = 26613,
            PropPlacement = {0.0400, -0.0500, 0.0390, 0.0000, 0.000, -69.9999},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sodafu2"] = {
        "anim@male_drinking_01",
        "m_drinking_01_clip",
        "Soda Sprunk - FU",
        AnimationOptions = {
            Prop = 'ng_proc_sodacan_01b',
            PropBone = 26613,
            PropPlacement = {0.0300, -0.0600, -0.0700, 0.0000, 0.000, 0.000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["water"] = {
        "mp_player_intdrink",
        "loop_bottle",
        "Bouteille d'eau",
        AnimationOptions = {
            Prop = "vw_prop_casino_water_bottle_01a",
            PropBone = 60309,
            PropPlacement = {0.0080, 0.0, -0.0500, 0.0, 0.0, -40.0000},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["egobar"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une barre en chocolat",
        AnimationOptions = {
            Prop = 'prop_choc_ego',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true
        }
    },
    ["candy"] = {
        "mp_player_inteat@pnq",
        "loop",
        "Manger des bonbons",
        AnimationOptions = {
            Prop = 'prop_candy_pqs',
            PropBone = 60309,
            PropPlacement = {-0.0300, 0.0180, 0.0, 180.0, 180.0, -88.099},
            EmoteMoving = true
        }
    },
    ["lollipop1"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une sucette 1",
        AnimationOptions = {
            Prop = 'natty_lollipop_spiral01',
            PropBone = 60309,
            PropPlacement = {
                -0.0100, 0.0200, -0.0100, -175.1935, 97.6975, 20.9598
            },
            EmoteMoving = true
        }
    },
    ["lollipop1b"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une sucette 2",
        AnimationOptions = {
            Prop = 'natty_lollipop_spiral02',
            PropBone = 60309,
            PropPlacement = {
                -0.0100, 0.0200, -0.0100, -175.1935, 97.6975, 20.9598
            },
            EmoteMoving = true
        }
    },
    ["lollipop1c"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une sucette 3",
        AnimationOptions = {
            Prop = 'natty_lollipop_spiral03',
            PropBone = 60309,
            PropPlacement = {
                -0.0100, 0.0200, -0.0100, -175.1935, 97.6975, 20.9598
            },
            EmoteMoving = true
        }
    },
    ["lollipop1d"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une sucette 4",
        AnimationOptions = {
            Prop = 'natty_lollipop_spiral04',
            PropBone = 60309,
            PropPlacement = {
                -0.0100, 0.0200, -0.0100, -175.1935, 97.6975, 20.9598
            },
            EmoteMoving = true
        }
    },
    ["lollipop1e"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une sucette 5",
        AnimationOptions = {
            Prop = 'natty_lollipop_spiral05',
            PropBone = 60309,
            PropPlacement = {
                -0.0100, 0.0200, -0.0100, -175.1935, 97.6975, 20.9598
            },
            EmoteMoving = true
        }
    },
    ["lollipop1f"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une sucette 6",
        AnimationOptions = {
            Prop = 'natty_lollipop_spiral06',
            PropBone = 60309,
            PropPlacement = {
                -0.0100, 0.0200, -0.0100, -175.1935, 97.6975, 20.9598
            },
            EmoteMoving = true
        }
    },
    ["lollipop2a"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Manger une sucette 7",
        AnimationOptions = {
            Prop = "natty_lollipop_spin01",
            PropBone = 60309,
            PropPlacement = {
                -0.0300, -0.0500, 0.0500, 112.4227, -128.8559, 15.6107
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lollipop2b"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Manger une sucette 8",
        AnimationOptions = {
            Prop = "natty_lollipop_spin02",
            PropBone = 60309,
            PropPlacement = {
                -0.0300, -0.0500, 0.0500, 112.4227, -128.8559, 15.6107
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lollipop2c"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Manger une sucette 9",
        AnimationOptions = {
            Prop = "natty_lollipop_spin03",
            PropBone = 60309,
            PropPlacement = {
                -0.0300, -0.0500, 0.0500, 112.4227, -128.8559, 15.6107
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lollipop2d"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Manger une sucette 10",
        AnimationOptions = {
            Prop = "natty_lollipop_spin04",
            PropBone = 60309,
            PropPlacement = {
                -0.0300, -0.0500, 0.0500, 112.4227, -128.8559, 15.6107
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lollipop2e"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Manger une sucette 11",
        AnimationOptions = {
            Prop = "natty_lollipop_spin05",
            PropBone = 60309,
            PropPlacement = {
                -0.0300, -0.0500, 0.0500, 112.4227, -128.8559, 15.6107
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lollipop3a"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Sucette en bouche",
        AnimationOptions = {
            Prop = 'natty_lollipop01',
            PropBone = 47419,
            PropPlacement = {
                0.0100, 0.0300, 0.0100, -90.0000, 10.0000, -10.0000
            },
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["icecreama"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une glace 2",
        AnimationOptions = {
            Prop = 'bzzz_icecream_cherry',
            PropBone = 18905,
            PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0},
            EmoteMoving = true
        }
    },
    ["icecreamb"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une glace 3",
        AnimationOptions = {
            Prop = 'bzzz_icecream_chocolate',
            PropBone = 18905,
            PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0},
            EmoteMoving = true
        }
    },
    ["icecreamc"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une glace 4",
        AnimationOptions = {
            Prop = 'bzzz_icecream_lemon',
            PropBone = 18905,
            PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0},
            EmoteMoving = true
        }
    },
    ["icecreamd"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une glace 5",
        AnimationOptions = {
            Prop = 'bzzz_icecream_pistachio',
            PropBone = 18905,
            PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0},
            EmoteMoving = true
        }
    },
    ["icecreame"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une glace 6",
        AnimationOptions = {
            Prop = 'bzzz_icecream_raspberry',
            PropBone = 18905,
            PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0},
            EmoteMoving = true
        }
    },
    ["icecreamf"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une glace 7",
        AnimationOptions = {
            Prop = 'bzzz_icecream_stracciatella',
            PropBone = 18905,
            PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0},
            EmoteMoving = true
        }
    },
    ["icecreamg"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une glace 8",
        AnimationOptions = {
            Prop = 'bzzz_icecream_strawberry',
            PropBone = 18905,
            PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0},
            EmoteMoving = true
        }
    },
    ["icecreamh"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Manger une glace 9",
        AnimationOptions = {
            Prop = 'bzzz_icecream_walnut',
            PropBone = 18905,
            PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0},
            EmoteMoving = true
        }
    },
    ["wine"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Boire du vin",
        AnimationOptions = {
            Prop = 'prop_drink_redwine',
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["flute"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Tenir une flute",
        AnimationOptions = {
            Prop = 'prop_champ_flute',
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["champagne"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Tenir une flute de Champagne",
        AnimationOptions = {
            Prop = 'prop_drink_champ',
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["cigar"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Cigare en bouche",
        AnimationOptions = {
            Prop = 'prop_cigar_02',
            PropBone = 47419,
            PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["cigar2"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Cigare en bouche 2",
        AnimationOptions = {
            Prop = 'prop_cigar_01',
            PropBone = 47419,
            PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["cigar3"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Cigare en bouche 3",
        AnimationOptions = {
            Prop = 'prop_cigar_03',
            PropBone = 47419,
            PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["smoking_pipe"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Fumer la pipe",
        AnimationOptions = {
            Prop = 'bzzz_prop_smoking_pipe_a',
            PropBone = 12844,
            PropPlacement = { -0.07, 0.13, 0.05, -20.0, 70.0, -36.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["guitar"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Jouer de la Guitare 1",
        AnimationOptions = {
            Prop = 'prop_acc_guitar_01',
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitar2"] = {
        "switch@trevor@guitar_beatdown",
        "001370_02_trvs_8_guitar_beatdown_idle_busker",
        "Jouer de la Guitare 2",
        AnimationOptions = {
            Prop = 'prop_acc_guitar_01',
            PropBone = 24818,
            PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitar3"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Guitar 3 - Pink",
        AnimationOptions = {
            Prop = 'prop_tay_guitar_001',
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitar4"] = {
        "switch@trevor@guitar_beatdown",
        "001370_02_trvs_8_guitar_beatdown_idle_busker",
        "Guitar 4 - Pink",
        AnimationOptions = {
            Prop = 'prop_tay_guitar_001',
            PropBone = 24818,
            PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitar5"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Guitar - Pride",
        AnimationOptions = {
            Prop = 'prop_tay_guitar_002',
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitar6"] = {
        "switch@trevor@guitar_beatdown",
        "001370_02_trvs_8_guitar_beatdown_idle_busker",
        "Guitar - Pride 2",
        AnimationOptions = {
            Prop = 'prop_tay_guitar_002',
            PropBone = 24818,
            PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarelectric"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Jouer de la Guitare Electrique 1",
        AnimationOptions = {
            Prop = 'prop_el_guitar_01',
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarelectric2"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Jouer de la Guitare Electrique 2",
        AnimationOptions = {
            Prop = 'prop_el_guitar_03',
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarcarry"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Porter un étui de guitare",
        AnimationOptions = {
            Prop = "sf_prop_sf_guitar_case_01a",
            PropBone = 28422,
            PropPlacement = {0.2800, -0.2000, -0.0600, 0.0, 0.0, 15.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Porter une guitare",
        AnimationOptions = {
            Prop = "prop_acc_guitar_01",
            PropBone = 28422,
            PropPlacement = {
                0.1500, -0.1400, -0.0200, -101.5083, 5.7251, 29.4987
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Porter une guitare electrique",
        AnimationOptions = {
            Prop = "prop_el_guitar_01",
            PropBone = 28422,
            PropPlacement = {0.1100, -0.1200, -0.0500, -80.0000, 0.0, 21.9999},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry4"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Porter une guitare electrique 2",
        AnimationOptions = {
            Prop = "prop_el_guitar_02",
            PropBone = 28422,
            PropPlacement = {0.1100, -0.1200, -0.0500, -80.0000, 0.0, 21.9999},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry5"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Porter une guitare electrique 3",
        AnimationOptions = {
            Prop = "prop_el_guitar_03",
            PropBone = 28422,
            PropPlacement = {0.1100, -0.1200, -0.0500, -80.0000, 0.0, 21.9999},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry6"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Porter une guitare electrique 4",
        AnimationOptions = {
            Prop = "vw_prop_casino_art_guitar_01a",
            PropBone = 28422,
            PropPlacement = {0.1100, -0.1200, -0.0500, -80.0000, 0.0, 21.9999},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry7"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Porter une guitare electrique 5",
        AnimationOptions = {
            Prop = "sf_prop_sf_el_guitar_02a",
            PropBone = 28422,
            PropPlacement = {0.1100, -0.1200, -0.0500, -80.0000, 0.0, 21.9999},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry8"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Electric 4",
        AnimationOptions = {
            Prop = "vw_prop_casino_art_guitar_01a",
            PropBone = 28422,
            PropPlacement = {0.1100, -0.1200, -0.0500, -80.0000, 0.0, 21.9999},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry9"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Electric 5",
        AnimationOptions = {
            Prop = "sf_prop_sf_el_guitar_02a",
            PropBone = 28422,
            PropPlacement = {0.1100, -0.1200, -0.0500, -80.0000, 0.0, 21.9999},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarsit"] = {
        "misssnowie@gatlax",
        "base",
        "Jouer de la guitare assis",
        AnimationOptions = {
            Prop = "prop_acc_guitar_01",
            PropBone = 24818,
            PropPlacement = {
                -0.0510, 0.2770, -0.0299, -140.3349, 166.3300, 29.7590
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["guitarsit2"] = {
        "misssnowie@gatlax",
        "base",
        "Guitar Sit And Play 2 - Pink",
        AnimationOptions = {
            Prop = "prop_tay_guitar_001",
            PropBone = 24818,
            PropPlacement = {
                -0.0510, 0.2770, -0.0299, -140.3349, 166.3300, 29.7590
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["guitarsit3"] = {
        "misssnowie@gatlax",
        "base",
        "Guitar Sit And Play 2 - Pride",
        AnimationOptions = {
            Prop = "prop_tay_guitar_002",
            PropBone = 24818,
            PropPlacement = {
                -0.0510, 0.2770, -0.0299, -140.3349, 166.3300, 29.7590
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["book"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "Lire un livre",
        AnimationOptions = {
            Prop = 'prop_novel_01',
            PropBone = 6286,
            PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0},
            -- This positioning isnt too great, was to much of a hassle
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["bookb"] = {
        "holding_book_1@dark",
        "holding_book_1_clip",
        "Book 2",
        AnimationOptions = {
            Prop = 'prop_cs_book_01',
            PropBone = 57005,
            PropPlacement = {
                0.0900, 0.0900, -0.0400, 80.1585, 158.5623, 24.7080
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bookc"] = {
        "holding_book_2@dark",
        "holding_book_2_clip",
        "Book 3",
        AnimationOptions = {
            Prop = "prop_michael_backpack",
            PropBone = 40269,
            PropPlacement = {
                0.0300, -0.1600, -0.0900, -170.7740, 112.8415, -20.0836
            },
            SecondProp = 'prop_cs_book_01',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.0400, 0.0400, 0.0300, -69.0815, 176.3905, 19.3724
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bookd"] = {
        "holding_book_3@dark",
        "holding_book_3_clip",
        "Book 4",
        AnimationOptions = {
            Prop = 'prop_cs_stock_book',
            PropBone = 18905,
            PropPlacement = {0.0700, 0.0400, 0.0700, 0.0000, 0.0000, -15.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["booke"] = {
        "holding_book_4@dark",
        "holding_book_4_clip",
        "Book 5",
        AnimationOptions = {
            Prop = 'prop_cs_stock_book',
            PropBone = 57005,
            PropPlacement = {0.0100, 0.0100, -0.0600, 15.1511, 3.1232, -21.2448},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bookf"] = {
        "holding_book_5@dark",
        "holding_book_5_clip",
        "Book 6",
        AnimationOptions = {
            Prop = 'v_ilev_mp_bedsidebook',
            PropBone = 18905,
            PropPlacement = {
                0.2100, 0.0600, 0.0400, 170.6161, -14.2960, 28.8727
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["bouquet"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Tenir un bouquet de fleur",
        AnimationOptions = {
            Prop = 'prop_snow_flower_02',
            PropBone = 24817,
            PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["bouquet2"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Tenir un bouquet de fleur 2",
        AnimationOptions = {
            Prop = 'pata_freevalentinesday3',
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.0300, -0.1700, -6.0697, 60.1852, 3.4934},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["teddy"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Tenir un Teddybear",
        AnimationOptions = {
            Prop = 'v_ilev_mr_rasberryclean',
            PropBone = 24817,
            PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["teddy2"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Tenir un Teddybear - Gremlin",
        AnimationOptions = {
            Prop = 'gremlin_plush',
            PropBone = 57005,
            PropPlacement = {
                0.2610, -0.1220, -0.0290, -96.2588, 62.8313, 9.2446
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["backpack"] = {
        "move_p_m_zero_rucksack",
        "nill",
        "Sac a dos",
        AnimationOptions = {
            Prop = 'p_michael_backpack_s',
            PropBone = 24818,
            PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["clipboard"] = {
        "missfam4",
        "base",
        "Clipboard",
        AnimationOptions = {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["map"] = {
        "amb@world_human_tourist_map@male@base",
        "base",
        "Tenir une carte",
        AnimationOptions = {
            Prop = 'prop_tourist_map_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["map2"] = {
        "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a",
        "idle_a",
        "Tenir une carte 2",
        AnimationOptions = {
            Prop = "prop_tourist_map_01",
            PropBone = 28422,
            PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beg"] = {
        "amb@world_human_bum_freeway@male@base",
        "base",
        "Faire la manche",
        AnimationOptions = {
            Prop = 'prop_beggers_sign_03',
            PropBone = 58868,
            PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beg2"] = {
        "amb@world_human_bum_freeway@male@base",
        "base",
        "Beg 2",
        AnimationOptions = {
            Prop = 'prop_beggers_sign_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beg3"] = {
        "amb@world_human_bum_freeway@male@base",
        "base",
        "Beg 3",
        AnimationOptions = {
            Prop = 'prop_beggers_sign_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0800, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["spaper"] = {
        "amb@world_human_clipboard@male@idle_a",
        "idle_a",
        "Lire le journal",
        AnimationOptions = {
            Prop = 'prop_cliff_paper',
            PropBone = 60309,
            PropPlacement = {
                0.0970, -0.0280, -0.0170, 107.4008, 3.2712, -10.5080
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["spaper2"] = {
        "amb@world_human_clipboard@male@idle_a",
        "idle_a",
        "Lire le journal 2",
        AnimationOptions = {
            Prop = 'ng_proc_paper_s_quik',
            PropBone = 60309,
            PropPlacement = {0.1590, 0.0290, -0.0100, 90.9998, 0.0087, 0.5000},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["spaper3"] = {
        "amb@world_human_clipboard@male@idle_a",
        "idle_a",
        "Lire le journal 3",
        AnimationOptions = {
            Prop = 'ng_proc_paper_s_rag',
            PropBone = 60309,
            PropPlacement = {0.1760, -0.00070, 0.0200, 99.8306, 3.2841, -4.7185},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },

    ["makeitrain"] = {
        "anim@mp_player_intupperraining_cash",
        "idle_a",
        "Pluie d'argent",
        AnimationOptions = {
            Prop = 'prop_anim_cash_pile_01',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["pornmag"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine",
        AnimationOptions = {
            Prop = 'prop_porn_mag_02',
            PropBone = 60309,
            PropPlacement = {
                0.1000, -0.0360, -0.0300, -86.9096, 179.2527, 13.8804
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag2"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 2",
        AnimationOptions = {
            Prop = 'prop_cs_magazine',
            PropBone = 60309,
            PropPlacement = {
                0.0800, -0.0490, -0.0500, 87.9369, -0.4292, -14.3925
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag3"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 3",
        AnimationOptions = {
            Prop = 'prop_porn_mag_03',
            PropBone = 60309,
            PropPlacement = {
                0.1000, -0.0700, -0.0200, -90.0000, -180.0000, 22.7007
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag4"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 4",
        AnimationOptions = {
            Prop = 'v_res_tt_pornmag01',
            PropBone = 60309,
            PropPlacement = {
                -0.0200, -0.0300, 0.0000, 88.9862, 0.2032, -20.0016
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag5"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 5",
        AnimationOptions = {
            Prop = 'v_res_tt_pornmag02',
            PropBone = 60309,
            PropPlacement = {
                -0.0200, -0.0300, 0.0000, 88.9862, 0.2032, -20.0016
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag6"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 6",
        AnimationOptions = {
            Prop = 'v_res_tt_pornmag03',
            PropBone = 60309,
            PropPlacement = {
                -0.0200, -0.0300, 0.0000, 88.9862, 0.2032, -20.0016
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag7"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 7",
        AnimationOptions = {
            Prop = 'v_res_tt_pornmag04',
            PropBone = 60309,
            PropPlacement = {
                -0.0200, -0.0300, 0.0000, 88.9862, 0.2032, -20.0016
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["camera"] = {
        "stand_camera_1@dad",
        "stand_camera_1_clip",
        "Camera",
        AnimationOptions = {
            Prop = 'prop_pap_camera_01',
            PropBone = 57005,
            PropPlacement = {0.1040, -0.0060, -0.0600, -2.7280, 33.0998, 4.1917},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["camera2"] = {
        "amb@world_human_paparazzi@male@base",
        "base",
        "Prendre des photos",
        AnimationOptions = {
            Prop = 'prop_pap_camera_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["camera3"] = {
        "cellphone@female",
        "cellphone_text_read_base_cover_low",
        "Prendre des photos 3",
        AnimationOptions = {
            Prop = "prop_ing_camera_01",
            PropBone = 28422,
            PropPlacement = {
                0.0100, -0.0300, 0.0520, -172.0487, -163.9389, -29.0221
            },
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["camera4"] = {
        "chocoholic@single110a",
        "single110a_clip",
        "Camera 4",
        AnimationOptions = {
            Prop = "prop_ing_camera_01",
            PropBone = 28422,
            PropPlacement = {0.0710, 0.0150, -0.0420, -68.3220, 99.6144, 2.9027},
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["camera5"] = {
        "chocoholic@single110b",
        "single110b_clip",
        "Camera 5",
        AnimationOptions = {
            Prop = "prop_ing_camera_01",
            PropBone = 60309,
            PropPlacement = {
                0.0980, 0.0560, 0.1330, -15.8221, 107.0825, -16.0159
            },
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["camera6"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Camera 6 - Carry s Camera",
        AnimationOptions = {
            Prop = "prop_v_cam_01",
            PropBone = 28422,
            PropPlacement = {
                0.2100, 0.0300, -0.0100, 90.0000, 176.0000, 79.9999
            },
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["champagnespray"] = {
        "anim@mp_player_intupperspray_champagne",
        "idle_a",
        "Secouer une bouteille de champagne",
        AnimationOptions = {
            Prop = 'ba_prop_battle_champ_open',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["joint"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Fumer un joint",
        AnimationOptions = {
            Prop = 'p_cs_joint_02',
            PropBone = 47419,
            PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["cig"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Fumer une cigarette",
        AnimationOptions = {
            Prop = 'prop_amb_ciggy_01',
            PropBone = 47419,
            PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["brief"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Briefcase",
        AnimationOptions = {
            Prop = "prop_ld_case_01",
            PropBone = 57005,
            PropPlacement = {0.12, 0.0, 0.0, 0.0, 255.0, 80.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["brief2"] = { -- Added for compatibility
        "missheistdocksprep1hold_cellphone",
        "static",
        "Briefcase 2",
        AnimationOptions = {
            Prop = "prop_ld_case_01",
            PropBone = 57005,
            PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guncase"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Porte-flingue",
        AnimationOptions = {
            Prop = "prop_gun_case_01",
            PropBone = 57005,
            PropPlacement = {0.10, 0.02, -0.02, 40.0, 145.0, 115.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tablet"] = {
        "amb@world_human_tourist_map@male@base",
        "base",
        "Tablette",
        AnimationOptions = {
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tablet2"] = {
        "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a",
        "idle_a",
        "Tablette 2",
        AnimationOptions = {
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["phonecall"] = {
        "cellphone@",
        "cellphone_call_listen_base",
        "Appel téléphonique",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["phonecall2"] = {
        "random@kidnap_girl",
        "ig_1_girl_on_phone_loop",
        "Appel téléphonique 2",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wt"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "Prendre son talkie-Walkie",
        AnimationOptions = {
            Prop = "prop_cs_hand_radio",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wt2"] = {
        "anim@radio_pose_3",
        "radio_holding_gun",
        "Prendre son talkie-Walkie 2",
        AnimationOptions = {
            Prop = "prop_cs_hand_radio",
            PropBone = 60309,
            PropPlacement = {0.0750, 0.0470, 0.0110, -97.9442, 3.7058, -23.2367},
            EmoteLoop = true

        }
    },
    ["wt3"] = {
        "anim@radio_left",
        "radio_left_clip",
        "Prendre son talkie-Walkie 3",
        AnimationOptions = {
            Prop = "prop_cs_hand_radio",
            PropBone = 60309,
            PropPlacement = {0.0750, 0.0470, 0.0110, -97.9442, 3.7058, -23.2367},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wt4"] = {
        "anim@male@holding_radio",
        "holding_radio_clip",
        "Prendre son talkie-Walkie 4",
        AnimationOptions = {
            Prop = "prop_cs_hand_radio",
            PropBone = 28422,
            PropPlacement = {0.0750, 0.0230, -0.0230, -90.0000, 0.0, -59.9999},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["clean"] = {
        "timetable@floyd@clean_kitchen@base",
        "base",
        "Nettoyer une table",
        AnimationOptions = {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["clean2"] = {
        "amb@world_human_maid_clean@",
        "base",
        "Nettoyer une vitre",
        AnimationOptions = {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["protest"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Protester",
        AnimationOptions = {
            Prop = "prop_cs_protest_sign_01",
            PropBone = 57005,
            PropPlacement = {
                0.1820, 0.2400, 0.0600, -69.3774235, 5.9142048, -13.9572354
            },
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["protest2"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Protester 2 - Fierté",
        AnimationOptions = {
            Prop = "pride_sign_01",
            PropBone = 57005,
            PropPlacement = {
                0.1820, 0.2400, 0.0600, -69.3774235, 5.9142048, -13.9572354
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    -- ["binoculars"] = {
    --     "amb@world_human_binoculars@male@idle_b",
    --     "idle_f",
    --     "Binoculars",
    --     AnimationOptions = {
    --         Prop = "prop_binoc_01",
    --         PropBone = 28422,
    --         PropPlacement = {
    --             0.0,
    --             0.0,
    --             0.0,
    --             0.0,
    --             0.0,
    --             0.0
    --         },
    --         EmoteLoop = true,
    --         EmoteMoving = true
    --     }
    -- },
    -- ["binoculars2"] = {
    --     "amb@world_human_binoculars@male@idle_a",
    --     "idle_c",
    --     "Binoculars 2",
    --     AnimationOptions = {
    --         Prop = "prop_binoc_01",
    --         PropBone = 28422,
    --         PropPlacement = {
    --             0.0,
    --             0.0,
    --             0.0,
    --             0.0,
    --             0.0,
    --             0.0
    --         },
    --         EmoteLoop = true,
    --         EmoteMoving = true
    --     }
    -- },
    ["tennisplay"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Jouer au tennis",
        AnimationOptions = {
            Prop = "prop_tennis_bag_01",
            PropBone = 57005,
            PropPlacement = {0.27, 0.0, 0.0, 91.0, 0.0, -82.9999951},
            SecondProp = 'prop_tennis_rack_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                0.0800, 0.0300, 0.0, -130.2907295, 3.8782324, 6.588224
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["weights"] = {
        "amb@world_human_muscle_free_weights@male@barbell@base",
        "base",
        "Soulever des haltères",
        AnimationOptions = {
            Prop = "prop_curl_bar_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["weights2"] = {
        "amb@world_human_muscle_free_weights@male@barbell@idle_a",
        "idle_d",
        "Soulever des haltères 2",
        AnimationOptions = {
            Prop = "prop_curl_bar_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["weights3"] = { -- Custom Emote By Amnilka
        "frabi@malepose@solo@firstsport",
        "pose_sport_004",
        "Soulever des haltères 3 - Pose",
        AnimationOptions = {
            Prop = 'prop_barbell_01',
            PropBone = 28422,
            PropPlacement = {
                0.0660, 0.0100, -0.0300, 90.0000, 90.0000, -79.9999
            },
            EmoteLoop = true
        }
    },
    ["weights4"] = { -- Custom Emote By Amnilka
        "frabi@malepose@solo@firstsport",
        "pose_sport_003",
        "Soulever des haltères 4 - Pose",
        AnimationOptions = {
            Prop = 'prop_barbell_01', -- Left Wrist
            PropBone = 60309,
            PropPlacement = {0.0520, -0.0010, 0.0131, 21.5428, 70.2098, 74.5019},
            SecondProp = 'prop_barbell_01', -- Right Wrist
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.0660, 0.0100, -0.0300, 90.0000, 90.0000, -79.9999
            },
            EmoteLoop = true
        }
    },
    ["weights5"] = { -- Custom Female Emote By Frabi
        "frabi@femalepose@solo@firstsport",
        "fem_pose_sport_001",
        "Soulever des haltères 5 - Pose Femme",
        AnimationOptions = {
            Prop = 'v_res_tre_weight',
            PropBone = 28422, -- Right Wrist
            PropPlacement = {
                0.0580, -0.0060, 0.0300, -11.8498, 170.2644, 7.8352
            },
            SecondProp = 'v_res_tre_weight',
            SecondPropBone = 60309, -- Left Wrist
            SecondPropPlacement = {
                0.0880, 0.0000, 0.0590, -29.1132, -128.5627, 13.7517
            },
            EmoteLoop = true
        }
    },
    ["weights6"] = { -- Custom Female Emote By Frabi
        "frabi@femalepose@solo@firstsport",
        "fem_pose_sport_002",
        "Soulever des haltères 6 - Pose Femme",
        AnimationOptions = {
            Prop = 'v_res_tre_weight',
            PropBone = 28422, -- Right Wrist
            PropPlacement = {0.0700, 0.0400, -0.0600, 24.5966, 6.4814, -13.9845},
            SecondProp = 'v_res_tre_weight',
            SecondPropBone = 60309, -- Left Wrist
            SecondPropPlacement = {
                0.0550, -0.0070, -0.0309, -20.5854, -15.0123, 0.5710
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["weights7"] = { -- Custom Female Emote By Frabi
        "frabi@femalepose@solo@firstsport",
        "fem_pose_sport_003",
        "Soulever des haltères 7 - Pose Femme",
        AnimationOptions = {
            Prop = 'prop_freeweight_01',
            PropBone = 28422, -- Right Wrist
            PropPlacement = {
                0.0500, 0.0100, -0.0200, 88.6283, -51.8805, 54.3903
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["fuel"] = {
        "weapons@misc@jerrycan@",
        "fire",
        "Fuel",
        AnimationOptions = {
            Prop = "w_am_jerrycan",
            PropBone = 57005,
            PropPlacement = {
                0.1800, 0.1300, -0.2400, -165.8693883, -11.2122753, -32.9453021
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["fuel2"] = {
        "weapons@misc@jerrycan@franklin",
        "idle",
        "Fuel 2 (Carry)",
        AnimationOptions = {
            Prop = "w_am_jerrycan",
            PropBone = 28422,
            PropPlacement = {0.26, 0.050, 0.0300, 80.00, 180.000, 79.99},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["hitchhike"] = {
        "random@hitch_lift",
        "idle_f",
        "Faire du stop",
        AnimationOptions = {
            Prop = "w_am_jerrycan",
            PropBone = 18905,
            PropPlacement = {0.32, -0.0100, 0.0, -162.423, 74.83, 58.79},
            SecondProp = 'prop_michael_backpack',
            SecondPropBone = 40269,
            SecondPropPlacement = {-0.07, -0.21, -0.11, -144.93, 117.358, -6.16},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Porter un panneau de stop",
        AnimationOptions = {
            Prop = "prop_sign_road_01a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign2"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Porter un panneau de signalisation",
        AnimationOptions = {
            Prop = "prop_sign_road_02a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign3"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Porter le panneau de l'hôpital",
        AnimationOptions = {
            Prop = "prop_sign_road_03d",
            PropBone = 60309,
            PropPlacement = {
                -0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign4"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Porter un panneau de stationnement 1",
        AnimationOptions = {
            Prop = "prop_sign_road_04a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign5"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Porter un panneau de stationnement 2",
        AnimationOptions = {
            Prop = "prop_sign_road_04w",
            PropBone = 60309,
            PropPlacement = {
                -0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign6"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Porter un panneau pour piétons",
        AnimationOptions = {
            Prop = "prop_sign_road_05a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign7"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Porter une plaque de rue",
        AnimationOptions = {
            Prop = "prop_sign_road_05t",
            PropBone = 60309,
            PropPlacement = {
                -0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign8"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Porter un panneau d'autoroute",
        AnimationOptions = {
            Prop = "prop_sign_freewayentrance",
            PropBone = 60309,
            PropPlacement = {
                -0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign9"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Porter le panneau d'arrêt enneigé",
        AnimationOptions = {
            Prop = "prop_snow_sign_road_01a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["conehead"] = {
        "move_m@drunk@verydrunk_idles@",
        "fidget_07",
        "Mettre un cone sur sa tête",
        AnimationOptions = {
            Prop = "prop_roadcone02b",
            PropBone = 31086,
            PropPlacement = {0.0500, 0.0200, -0.000, 30.0000004, 90.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtraya"] = {
        "anim@heists@box_carry@",
        "idle",
        "Plateau de nourriture 1",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_03",
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390, 20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayb"] = {
        "anim@heists@box_carry@",
        "idle",
        "Plateau de nourriture 2",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390, 20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayc"] = {
        "anim@heists@box_carry@",
        "idle",
        "Plateau de nourriture 3",
        AnimationOptions = {
            Prop = "prop_food_cb_tray_02",
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390, 20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayd"] = {
        "anim@heists@box_carry@",
        "idle",
        "Plateau de nourriture 4",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390, 20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtraye"] = {
        "anim@heists@box_carry@",
        "idle",
        "Plateau de nourriture 5",
        AnimationOptions = {
            Prop = "prop_food_tray_03",
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390, 20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayf"] = {
        "anim@heists@box_carry@",
        "idle",
        "Plateau de nourriture 6",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 57005,
            PropPlacement = {
                0.2500, 0.1000, 0.0700, -110.5483936, 73.3529273, -16.338362
            },
            SecondProp = 'prop_food_bs_tray_03',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayg"] = {
        "anim@heists@box_carry@",
        "idle",
        "Plateau de nourriture 7",
        AnimationOptions = {
            Prop = "prop_food_cb_tray_02",
            PropBone = 57005,
            PropPlacement = {
                0.2500, 0.1000, 0.0700, -110.5483936, 73.3529273, -16.338362
            },
            SecondProp = 'prop_food_cb_tray_02',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayh"] = {
        "anim@heists@box_carry@",
        "idle",
        "Plateau de nourriture 8",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 57005,
            PropPlacement = {
                0.2500, 0.1000, 0.0700, -110.5483936, 73.3529273, -16.338362
            },
            SecondProp = 'prop_food_tray_03',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayi"] = {
        "anim@heists@box_carry@",
        "idle",
        "Plateau de nourriture 9",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 57005,
            PropPlacement = {
                0.2500, 0.1000, 0.0700, -110.5483936, 73.3529273, -16.338362
            },
            SecondProp = 'prop_food_tray_02',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayj"] = {
        "anim@move_f@waitress",
        "idle",
        "Plateau de nourriture 10",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0200, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayk"] = {
        "anim@move_f@waitress",
        "idle",
        "Plateau de nourriture 11",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0200, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayl"] = {
        "anim@move_f@waitress",
        "idle",
        "Plateau de nourriture 12",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_03",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0200, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtraym"] = {
        "anim@move_f@waitress",
        "idle",
        "Plateau de nourriture 13",
        AnimationOptions = {
            Prop = "prop_food_cb_tray_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0200, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayn"] = {
        "anim@move_f@waitress",
        "idle",
        "Plateau de nourriture 14",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0200, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayo"] = {
        "anim@move_f@waitress",
        "idle",
        "Plateau de nourriture 15",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0200, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["carrypizza"] = {
        "anim@heists@box_carry@",
        "idle",
        "Boite a pizza",
        AnimationOptions = {
            Prop = "prop_pizza_box_02",
            PropBone = 28422,
            PropPlacement = {0.0100, -0.1000, -0.1590, 20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["carryfoodbag"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Sac de nourriture",
        AnimationOptions = {
            Prop = "prop_food_bs_bag_01",
            PropBone = 57005,
            PropPlacement = {
                0.3300, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["carryfoodbag2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Sac de nourriture 2",
        AnimationOptions = {
            Prop = "prop_food_cb_bag_01",
            PropBone = 57005,
            PropPlacement = {
                0.3800, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["carryfoodbag3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Sac de nourriture 3",
        AnimationOptions = {
            Prop = "prop_food_bag1",
            PropBone = 57005,
            PropPlacement = {
                0.3800, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tag"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@male@",
        "shake_can_male",
        "Secouer une bombe de peinture - Homme",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tag2"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@heeled@",
        "shake_can_female",
        "Secouer une bombe de peinture - Femme",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tag3"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@male@",
        "spray_can_var_01_male",
        "Taguer un mur 1 - Homme",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tag4"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@male@",
        "spray_can_var_02_male",
        "Taguer un mur 2 - Homme",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tag5"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@heeled@",
        "spray_can_var_01_female",
        "Taguer un mur 1 - Femme",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tag6"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@heeled@",
        "spray_can_var_02_female",
        "Taguer un mur 2 - Femme",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beans"] = {
        "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        "base_idle",
        "Manger des haricots",
        AnimationOptions = {
            Prop = "h4_prop_h4_caviar_tin_01a",
            PropBone = 60309,
            PropPlacement = {0.0, 0.0300, 0.0100, 0.0, 0.0, 0.0},
            SecondProp = 'h4_prop_h4_caviar_spoon_01a',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dinner"] = {
        "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        "base_idle",
        "Manger un diner",
        AnimationOptions = {
            Prop = "prop_cs_plate_01",
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0},
            SecondProp = 'h4_prop_h4_caviar_spoon_01a',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["scam"] = {
        "missfinale_c2mcs_1",
        "fin_c2_mcs_1_camman",
        "s Camera",
        AnimationOptions = {
            Prop = "prop_v_cam_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0300, 0.0100, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smic"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Tenir un micro",
        AnimationOptions = {
            Prop = "p_ing_microphonel_01",
            PropBone = 4154,
            PropPlacement = {-0.00, -0.0200, 0.1100, 0.00, 0.0, 60.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sbmic"] = {
        "missfra1",
        "mcs2_crew_idle_m_boom",
        "Tenir une perche micro",
        AnimationOptions = {
            Prop = "prop_v_bmike_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["microck"] = { --- Custom Emote Provided To RpEmotes By Prue颜
        "lunyx@mic@p1",
        "mic@p1",
        "Tenir un micro - Concert 1",
        AnimationOptions = {
            Prop = "sf_prop_sf_mic_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0300, 0.0200, -0.0300, 162.9608, -91.1712, -3.8249
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["microckb"] = { --- Custom Emote Provided To RpEmotes By Prue颜
        "lunyx@mic@p2",
        "mic@p2",
        "Tenir un micro - Concert 2",
        AnimationOptions = {
            Prop = "sf_prop_sf_mic_01a",
            PropBone = 60309, -- Left Wrist
            PropPlacement = {
                0.0350, 0.0180, 0.0290, -180.0000, -13.0000, 0.0000
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["microckc"] = { --- Custom Emote Provided To RpEmotes By Prue颜
        "lunyx@mic@p3",
        "mic@p3",
        "Tenir un micro - Concert 3",
        AnimationOptions = {
            Prop = "sf_prop_sf_mic_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0300, 0.0200, -0.0300, 162.9608, -91.1712, -3.8249
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["microckd"] = { --- Custom Emote Provided To RpEmotes By Prue颜
        "lunyx@mic@p4",
        "mic@p4",
        "Tenir un micro - Concert 4",
        AnimationOptions = {
            Prop = "sf_prop_sf_mic_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0300, 0.0200, -0.0300, 162.9608, -91.1712, -3.8249
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["microcke"] = { --- Custom Emote Provided To RpEmotes By Prue颜
        "lunyx@mic@p5",
        "mic@p5",
        "Tenir un micro - Concert 5",
        AnimationOptions = {
            Prop = "sf_prop_sf_mic_01a",
            PropBone = 60309,
            PropPlacement = {
                0.0370, 0.0130, 0.0150, -173.6259, -93.5253, 4.6450
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["microckf"] = { --- Custom Emote Provided To RpEmotes By Prue颜
        "lunyx@mic@p6",
        "mic@p6",
        "Tenir un micro - Concert 6",
        AnimationOptions = {
            Prop = "v_ilev_fos_mic",
            PropBone = 28422,
            PropPlacement = {
                -0.4410, -1.0600, -0.4800, -57.7266, 51.8164, 3.0976
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["microckg"] = { --- Custom Emote Provided To RpEmotes By Prue颜
        "lunyx@mic@p7",
        "mic@p7",
        "Tenir un micro - Concert 7",
        AnimationOptions = {
            Prop = "v_ilev_fos_mic",
            PropBone = 28422,
            PropPlacement = {
                -0.8210, -0.0900, -1.1900, -2.5478, 36.3684, -11.7503
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["microckh"] = { --- Custom Emote Provided To RpEmotes By Prue颜
        "lunyx@mic@p8",
        "mic@p8",
        "Tenir un micro - Concert 8",
        AnimationOptions = {
            Prop = "sf_prop_sf_mic_01a",
            PropBone = 60309,
            PropPlacement = {
                0.0370, 0.0130, 0.0150, -173.6259, -93.5253, 4.6450
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["microcki"] = { --- Custom Emote Provided To RpEmotes By Prue颜
        "lunyx@mic@p9",
        "mic@p9",
        "Tenir un micro - Concert 9",
        AnimationOptions = {
            Prop = "sf_prop_sf_mic_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0300, 0.0200, -0.0300, 162.9608, -91.1712, -3.8249
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["microckj"] = { --- Custom Emote Provided To RpEmotes By Prue颜
        "lunyx@mic@p10",
        "mic@p10",
        "Tenir un micro - Concert 10",
        AnimationOptions = {
            Prop = "sf_prop_sf_mic_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0300, 0.0200, -0.0300, 162.9608, -91.1712, -3.8249
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leafblower"] = {
        "amb@world_human_gardener_leaf_blower@base",
        "base",
        "Souffleur de feuilles",
        AnimationOptions = {
            Prop = "prop_leaf_blower_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bbqf"] = {
        "amb@prop_human_bbq@male@idle_a",
        "idle_b",
        "BBQ - Femme",
        AnimationOptions = {
            Prop = "prop_fish_slice_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pump"] = {
        "missfbi4prepp1",
        "idle",
        "Tenir une citrouille 1",
        AnimationOptions = {
            Prop = "prop_veg_crop_03_pump",
            PropBone = 28422,
            PropPlacement = {0.0200, 0.0600, -0.1200, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pump2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Tenir une citrouille 2",
        AnimationOptions = {
            Prop = "prop_veg_crop_03_pump",
            PropBone = 28422,
            PropPlacement = {0.0100, -0.16000, -0.2100, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pump3"] = {
        "missfbi4prepp1",
        "idle",
        "Tenir une citrouille 3",
        AnimationOptions = {
            Prop = "reh_prop_reh_lantern_pk_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0010, 0.0660, -0.0120, 171.9169, 179.8707, -39.9860
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pump4"] = {
        "missfbi4prepp1",
        "idle",
        "Tenir une citrouille 4",
        AnimationOptions = {
            Prop = "reh_prop_reh_lantern_pk_01b",
            PropBone = 28422,
            PropPlacement = {
                0.0010, 0.0660, -0.0120, 171.9169, 179.8707, -39.9860
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pump5"] = {
        "missfbi4prepp1",
        "idle",
        "Tenir une citrouille 5",
        AnimationOptions = {
            Prop = "reh_prop_reh_lantern_pk_01c",
            PropBone = 28422,
            PropPlacement = {
                0.0010, 0.0660, -0.0120, 171.9169, 179.8707, -39.9860
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mop"] = {
        "missfbi4prepp1",
        "idle",
        "Serpillère",
        AnimationOptions = {
            Prop = "prop_cs_mop_s",
            PropBone = 28422,
            PropPlacement = {
                -0.0200, -0.0600, -0.2000, -13.377, 10.3568, 17.9681
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mop2"] = {
        "move_mop",
        "idle_scrub_small_player",
        "Serpillère 2",
        AnimationOptions = {
            Prop = "prop_cs_mop_s",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.1200, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jerkf"] = {
        "switch@trevor@jerking_off",
        "trev_jerking_off_loop",
        "JerkOff! Female",
        AnimationOptions = {
            Prop = 'prop_cs_dildo_01',
            PropBone = 28422,
            PropPlacement = {0.09, 0.05, -0.03, 90.0, 80.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        },
        AdultAnimation = true
    },
    ["rake"] = {
        "anim@amb@drug_field_workers@rake@male_a@base",
        "base",
        "Passer le rateau 1",
        AnimationOptions = {
            Prop = "prop_tool_rake",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["rake2"] = {
        "anim@amb@drug_field_workers@rake@male_a@idles",
        "idle_b",
        "Passer le rateau 2",
        AnimationOptions = {
            Prop = "prop_tool_rake",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["rake3"] = {
        "anim@amb@drug_field_workers@rake@male_b@base",
        "base",
        "Passer le rateau 3",
        AnimationOptions = {
            Prop = "prop_tool_rake",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["rake4"] = {
        "anim@amb@drug_field_workers@rake@male_b@idles",
        "idle_d",
        "Passer le rateau 4",
        AnimationOptions = {
            Prop = "prop_tool_rake",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["broom"] = {
        "anim@amb@drug_field_workers@rake@male_a@base",
        "base",
        "Passer le balai 1",
        AnimationOptions = {
            Prop = "prop_tool_broom",
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["broom2"] = {
        "anim@amb@drug_field_workers@rake@male_a@idles",
        "idle_b",
        "Passer le balai 2",
        AnimationOptions = {
            Prop = "prop_tool_broom",
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["broom3"] = {
        "anim@amb@drug_field_workers@rake@male_b@base",
        "base",
        "Passer le balai 3",
        AnimationOptions = {
            Prop = "prop_tool_broom",
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["broom4"] = {
        "anim@amb@drug_field_workers@rake@male_b@idles",
        "idle_d",
        "Passer le balai 4",
        AnimationOptions = {
            Prop = "prop_tool_broom",
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["champw"] = {
        "anim@move_f@waitress",
        "idle",
        "Plateau de champagne",
        AnimationOptions = {
            Prop = "vw_prop_vw_tray_01a",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0100, 0.0, 0.0, 0.0},
            SecondProp = 'prop_champ_cool',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.010, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["shit"] = {
        "missfbi3ig_0",
        "shit_loop_trev",
        "Faire caca",
        AnimationOptions = {
            Prop = "prop_toilet_roll_01",
            PropBone = 28422,
            PropPlacement = {0.0700, -0.02000, -0.2100, 0, 0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["shit2"] = {
        "missfbi3ig_0",
        "nill",
        "Shit While Walking",
        AnimationOptions = {
            Prop = "prop_toilet_roll_01",
            PropBone = 28422,
            PropPlacement = {0.0700, -0.02000, -0.2100, 0, 0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["puke"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023
        "cross_arms@dark",
        "cross_arms_clip",
        "Puke",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["puke2"] = {
        "missheistpaletoscore1leadinout",
        "trv_puking_leadout",
        "Puke 2",
        AnimationOptions = {EmoteLoop = false, EmoteMoving = true}
    },
    ["puke3"] = {
        "anim@scripted@ulp_missions@injured_agent@",
        "idle",
        "Puke 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["puke4"] = {
        "anim@scripted@freemode@throw_up_toilet@male@",
        "vomit",
        "Puke 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["selfie"] = {
        "anim@mp_player_intuppertake_selfie",
        "idle_a",
        "Selfie",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfie2"] = {
        "cellphone@self@franklin@",
        "peace",
        "Selfie 2",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfie3"] = {
        "cellphone@self@franklin@",
        "west_coast",
        "Selfie 3 - West Side",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfie4"] = {
        "cellphone@self@trevor@",
        "aggressive_finger",
        "Selfie 4 - Doigt d'honneur 1",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfie5"] = {
        "cellphone@self@trevor@",
        "proud_finger",
        "Selfie 5 - Doigt d'honneur 2",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfie6"] = {
        "cellphone@self@trevor@",
        "throat_slit",
        "Selfie 6 - Trancher la gorge",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfie7"] = {
        "cellphone@self@franklin@",
        "chest_bump",
        "Selfie 7 - Poing sur la poitrine",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfiepeace"] = { -- MissSnowie Custom Emote
        "mirror_selfie@peace_sign",
        "base",
        "Selfie Peace",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 57005,
            PropPlacement = {
                0.1700, 0.0299, -0.0159, -126.2687, -139.9058, 35.6203
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfiecrouch"] = { -- MissSnowie Custom Emote
        "crouching@taking_selfie",
        "base",
        "Selfie accroupi",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 18905,
            PropPlacement = {
                0.1580, 0.0180, 0.0300, -150.4798, -67.8240, -46.0417
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiecrouch2"] = { -- Wolf's Square Custom Emote
        "eagle@girlphonepose13",
        "girl",
        "Selfie accroupi 2",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 60309,
            PropPlacement = {0.0670, 0.0300, 0.0300, -90.0000, 0.0000, -25.9000},
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["selfiecrouch3"] = { -- Custom Emote By Struggleville
        "anim@male_insta_selfie",
        "insta_selfie_clip",
        "Selfie accroupi 3",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 60309,
            PropPlacement = {0.0700, 0.0100, 0.0690, 0.0, 0.0, -150.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiecrouch4"] = { -- Custom emote by Struggleville
        "anim@female_selfie_risque",
        "selfie_risque_clip",
        "Selfie accroupi 4",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 18905,
            PropPlacement = {
                0.1580, 0.0180, 0.0300, -150.4798, -67.8240, -46.0417
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfieegirl"] = { -- Custom emote by Struggleville
        "anim@female_egirl_cute_selfie",
        "cute_selfie_clip",
        "Selfie E Girl",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 26613, -- Left Finger 30
            PropPlacement = {
                0.0760, -0.0220, 0.0350, -22.0968, 30.4351, -7.9339
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiesit"] = { -- Emote by WhiskerValeMod. Need to configure camera flash and texture variants
        "mouse@female_sitting_selfie",
        "female_sitting_selfie_clip",
        "Selfie assis",
        AnimationOptions = {
            Prop = 'prop_phone_taymckenzienz',
            PropBone = 57005,
            PropPlacement = {
                0.1380, 0.0300, -0.0430, -111.0946, -117.8069, 11.7386
            },
            SecondProp = 'apa_mp_h_stn_chairarm_23',
            SecondPropBone = 0,
            SecondPropPlacement = {
                -0.0100, -0.0800, -0.6800, -180.0000, -180.0000, 10.0000
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiesit2"] = { -- Emote by WolfSquareEmotes
        "eagle@boypose05",
        "boy",
        "Selfie assis 2",
        AnimationOptions = {
            Prop = 'prop_phone_taymckenzienz',
            PropBone = 4090, -- Left Finger 2
            PropPlacement = {
                0.0130, 0.0120, -0.0070, -103.6673, -11.0026, 18.2605
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiesit3"] = { -- Emote by Chocoholic Animations 
        "chocoholic@single77",
        "single77_clip",
        "Selfie assis 3",
        AnimationOptions = {
            Prop = 'prop_phone_taymckenzienz',
            PropBone = 4185,
            PropPlacement = {0.0130, -0.0190, 0.0320, 0.0, 0.0000, 0.0},
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["selfiesit4"] = { -- Emote by Chocoholic Animations
        "chocoholic@single89",
        "single89_clip",
        "Selfie assis 4",
        AnimationOptions = {
            Prop = 'prop_phone_taymckenzienz',
            PropBone = 4169, -- Left Finger 11
            PropPlacement = {0.0100, -0.0330, 0.000, -19.7197, 9.4080, -3.4048},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiefu"] = { -- Struggleville
        "anim@fuck_you_selfie",
        "fuck_you_selfie_clip",
        "Selfie - Doigt d'honneur",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {
                0.1200, 0.0220, -0.0210, 98.6822, -4.9809, 109.6216
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiethot"] = { -- Struggleville
        "anim@sitting_thot",
        "sitting_thot_clip",
        "Selfie accroupi",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {
                0.1030, 0.0440, -0.0270, -160.2802, -99.4080, -3.4048
            },
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["selfiefloor"] = { -- Custom Emote By Struggleville
        "anim@selfie_floor_cute",
        "floor_cute_clip",
        "Selfie Instagram",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 60309,
            PropPlacement = {
                0.0930, 0.0230, 0.0260, -158.8271, -82.9040, -18.7472
            },
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["selfiefloor2"] = { -- Custom Emote By Struggleville
        "anim@female_selfie_04",
        "f_selfie_04_clip",
        "Selfie Sol 2",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 4185,
            PropPlacement = {
                0.0170, -0.0100, 0.0200, -27.3580, 54.9374, -6.1611
            },
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["selfiefloor3"] = { -- Custom Emote By Chocoholic Animations
        "chocoholic@single90",
        "single90_clip",
        "Selfie & Vin",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {
                0.0800, 0.0170, 0.0810, -174.2748, -11.5083, 29.4987
            },
            SecondProp = 'prop_phone_taymckenzienz',
            SecondPropBone = 4186, -- Left Finger 22
            SecondPropPlacement = {
                -0.0100, 0.0000, 0.0200, -80.0000, 0.0000, -20.0000
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["selfiesexy"] = { -- Custom Emote By Little Spoon, designed for a custom iFruit phone model, however I am sticking with default game props for now
        "littlespoon@selfie001",
        "selfie001",
        "Selfie Sexy",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 58870, -- Right Finger 40 Bone
            PropPlacement = {0.0150, 0.0230, 0.0700, 0.0, 0.0, 170.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiesexy2"] = { -- Custom Emote By Little Spoon, designed for a custom iFruit phone model, however I am sticking with default game props for now
        "littlespoon@selfie002",
        "selfie002",
        "Selfie Sexy 2",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 64064, -- Right Finger 31 Bone
            PropPlacement = {
                0.0290, 0.0140, 0.0490, 174.9616, -149.6187, 8.6491
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiesexy3"] = { -- Custom Emote By Little Spoon, designed for a custom iFruit phone model, however I am sticking with default game props for now
        "littlespoon@selfie003",
        "selfie003",
        "Selfie Sexy 3",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 64064, -- Right Finger 31 Bone
            PropPlacement = {
                0.0290, 0.0140, 0.0490, 174.9616, -149.6187, 8.6491
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiesexy4"] = { -- Custom Emote By Little Spoon, designed for a custom iFruit phone model, however I am sticking with default game props for now
        "littlespoon@selfie004",
        "selfie004",
        "Selfie Sexy 4",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 64064, -- Right Finger 31 Bone
            PropPlacement = {
                0.0290, 0.0140, 0.0490, 174.9616, -149.6187, 8.6491
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiesexy5"] = { -- Custom Emote By Little Spoon, designed for a custom iFruit phone model, however I am sticking with default game props for now
        "littlespoon@selfie005",
        "selfie005",
        "Selfie Sexy 5",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 64064, -- Right Finger 31 Bone
            PropPlacement = {
                0.0290, 0.0140, 0.0490, 174.9616, -149.6187, 8.6491
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiecute"] = { -- Custom Emote By Puppy, designed for a custom iFruit phone model, however I am sticking with default game props for now
        "pupppy@freeselfie01",
        "freeselfie01",
        "Selfie Cute",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 26613, -- Left Finger 30 Bone
            PropPlacement = {0.0380, -0.0310, 0.0590, 0.0000, 0.0000, 10.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiecute2"] = { -- Custom Emote By Puppy, designed for a custom iFruit phone model, however I am sticking with default game props for now
        "pupppy@freeselfie02",
        "freeselfie02",
        "Selfie Cute 2",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 60309, -- Left Wrist, worked better.
            PropPlacement = {
                0.0960, 0.0160, 0.0420, -155.3515, -84.4828, 4.7551
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiecute3"] = { -- Custom Emote By Puppy, designed for a custom iFruit phone model, however I am sticking with default game props for now
        "pupppy@freeselfie03",
        "freeselfie03",
        "Selfie Cute 3",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 26614, -- Left Finger 40, worked better.
            PropPlacement = {0.0310, -0.0430, 0.0720, 0.0000, 3.9999, 0.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiecute4"] = { -- Custom Emote By Struggleville, designed for a custom iFruit phone model, however I am sticking with default game props for now
        "anim@egirl_1foot_selfie",
        "1foot_selfie_clip",
        "Selfie Cute 4",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 4185, -- Left Finger 21
            PropPlacement = {0.0290, -0.0230, 0.0190, -14.7860, 67.8030, 6.1827},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiecute5"] = { -- Custom Emote By Wolf's Square
        "eagle@girlphonepose21",
        "girl",
        "Selfie Cute 5",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 4185,
            PropPlacement = {
                0.0210, -0.0150, 0.0110, -45.8936, 41.8372, -26.6415
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiebbum"] = { -- Custom Emote By Struggleville, designed for a custom iFruit phone model, however I am sticking with default game props for now
        "anim@female_beach_booty_selfie",
        "booty_selfie_clip",
        "Selfie a la plage",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 26613, -- Left Finger 30
            PropPlacement = {
                0.0680, -0.0250, 0.0340, -13.4299, 47.2288, -14.9588
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['selfiehb'] = { -- Custom prop by crowded1337, unbranded by TayMcKenzieNZ
        'anim@female_selfie_cute',
        'selfie_cute_clip',
        'Selfie avec sac a main',
        AnimationOptions = {
            Prop = 'prop_amb_handbag_01',
            PropBone = 28422, -- Right Wrist
            PropPlacement = {
                0.1700, 0.0020, -0.1000, 105.4525, -178.3549, 69.1794
            },
            SecondProp = 'prop_phone_taymckenzienz', -- Cell Phone Left Finger 21
            SecondPropBone = 4185,
            SecondPropPlacement = {
                0.0200, -0.0250, 0.0000, -8.5947, 30.6141, -5.1311
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiehhands"] = { -- Custom Emote By QueenSistersAnimations, designed for a custom iFruit phone model, however I am sticking with default game props for now
        "heartselfiemirror@queensisters",
        "heartselfie_clip",
        "Selfie coeur avec les doigts",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 64096, -- Right Finger 11
            PropPlacement = {0.0390, 0.0200, 0.0330, 90.0000, 180.0000, 13.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiefu2"] = { -- Custom Emote By QueenSistersAnimations, designed for a custom iFruit phone model, however I am sticking with default game props for now
        "fuckyouselfie@queensisters",
        "mirrorselfie_clip",
        "Selfie doigt d'honneur 2",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 64097, -- Right Finger 12
            PropPlacement = {
                -0.0210, 0.0300, -0.0030, -180.0000, -180.0000, 0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiemale"] = { -- Custom Emote By Wolf's Square
        "eagle@boypose04",
        "boy",
        "Selfie Miroir - Homme",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 60309,
            PropPlacement = {
                0.0730, 0.0220, 0.0460, -142.1374, -92.4142, 33.1691
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfiemeh"] = { -- Custom Animation By Chocoholic Animations 
        "chocoholic@single81",
        "single81_clip",
        "Selfie Meh",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 58868,
            PropPlacement = {
                0.0450, 0.0310, 0.0280, 165.3005, -174.8342, -8.4770
            },
            EmoteLoop = true
        }
    },
    ["selfiewine"] = { -- Custom Emote By Wolf's Square
        "holding_wine@taking_selfie",
        "base",
        "Selfie avec du vin",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {
                0.0420, -0.0700, -0.0440, -82.6657, 1.2898, -19.9222
            },
            SecondProp = 'prop_phone_taymckenzienz',
            SecondPropBone = 4090,
            SecondPropPlacement = {
                0.0250, -0.0080, -0.0050, -140.5541, -24.7476, 13.7795
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["femalemirrorselfie"] = {
        "mirror_selfie_1@janina234",
        "mirror_selfie_1_clip",
        "Female Mirror Selfie",
        AnimationOptions = { -- Custom emote by Janina234
            Prop = "prop_phone_taymckenzienz",
            PropBone = 4089,
            PropPlacement = {
                0.0890, -0.0350, 0.0200, -161.7778308, -54.5014945, -12.0985177
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["femalemirrorselfie1"] = {
        "mirror_selfie_8@daj",
        "mirror_selfie_8_clip",
        "Female Mirror Selfie 1",
        AnimationOptions = { -- Custom emote by Dark
            Prop = "prop_phone_taymckenzienz",
            PropBone = 4153,
            PropPlacement = {
                0.0400, 0.00000, 0.0500, -37.4803963, 33.2648588, 18.6732448
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["cameraphotography"] = { -- Custom emote by MrWitt
        "mrwitt@photographic_journey_f",
        "mrwitt",
        "Camera Photography",
        AnimationOptions = {
            Prop = 'prop_pap_camera_01',
            PropBone = 26613,
            PropPlacement = {
                0.0280, -0.1350, 0.1120, -86.9428843, 157.9882355, 80.8053557
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["malemirrorselfie"] = { -- Custom emote by Struggleville
        "anim@male_model_08",
        "m_model_08_clip",
        "Male Mirror Selfie",
        AnimationOptions = {
            Prop = 'prop_phone_taymckenzienz',
            PropBone = 4169,
            PropPlacement = {
                0.0300, -0.0200, 0.0200, -64.2080926, 3.367247, 0.0711684
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["malemirrorselfie1"] = { -- Custom emote by Struggleville
        "anim@male_selfie_08",
        "m_selfie_08_clip",
        "Male Mirror Selfie 1",
        AnimationOptions = {
            Prop = 'prop_phone_taymckenzienz',
            PropBone = 4169,
            PropPlacement = {
                0.0100, -0.0400, 0.0000, -32.8072134, 11.7427793, 32.5772863
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["malemirrorselfie2"] = { -- Custom emote by Struggleville
        "anim@male_selfie_06",
        "m_selfie_06_clip",
        "Male Mirror Selfie 2",
        AnimationOptions = {
            Prop = 'prop_phone_taymckenzienz',
            PropBone = 4169,
            PropPlacement = {
                0.0200, -0.0200, 0.0100, -69.7707963, 3.10072, -8.4531301
            },
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["malemirrorselfie4"] = { -- Custom emote by Struggleville
        "anim@male_model_03",
        "m_model_03_clip",
        "Male Mirror Selfie 4",
        AnimationOptions = {
            Prop = 'prop_phone_taymckenzienz',
            PropBone = 4169,
            PropPlacement = {
                0.0100, -0.0600, -0.0100, -23.7215768, 66.9464998, -62.7303262
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["malemirrorselfie3"] = { -- Custom emote by Struggleville
        "anim@male_selfie_09",
        "m_selfie_09_clip",
        "Male Mirror Selfie 3",
        AnimationOptions = {
            Prop = 'prop_phone_taymckenzienz',
            PropBone = 4169,
            PropPlacement = {
                0.0400, -0.0300, 0.0000, -46.0563529, -0.6965831, -4.2803096
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sittv"] = {
        "anim@heists@heist_safehouse_intro@variations@male@tv",
        "tv_part_one_loop",
        "Regarder la TV",
        AnimationOptions = {
            Prop = "v_res_tre_remote",
            PropBone = 57005,
            PropPlacement = {0.0990, 0.0170, -0.0300, -64.760, -109.544, 18.717},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sitchairf"] = { -- Emote by WhiskerValeMods
        "mouse@femalearmchair",
        "female_armchair_clip_01",
        "Chaise assise - Fauteuil",
        AnimationOptions = {
            Prop = "p_armchair_01_s",
            PropBone = 11816,
            PropPlacement = {
                0.5320, -0.3310, 0.2000, -90.0000, -180.0000, -40.9999
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sitchairf2"] = { -- Custom Emote by WhiskerValeMods
        "mouse@female_sitting_folded",
        "female_sitting_folded_clip",
        "Chaise assis - Bras croisés",
        AnimationOptions = {
            Prop = "ba_prop_battle_club_chair_03",
            PropBone = 0,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, -170.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sitchairf3"] = { -- Custom Emote by WhiskerValeMods
        "mouse@female_sitting_forward",
        "female_sitting_forward_clip",
        "Chaise assise - penchée en avant",
        AnimationOptions = {
            Prop = "ba_prop_battle_club_chair_03",
            PropBone = 0,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, -170.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sitchairf4"] = { -- Custom Emote by WhiskerValeMods
        "mouse@female_smart_sitting",
        "female_smart_sitting_clip",
        "Chaise assise - Smart",
        AnimationOptions = {
            Prop = "ba_prop_battle_club_chair_03",
            PropBone = 0,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, -170.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sitchairf5"] = { -- Custom Emote By WhiskerValeMods
        "mouse@female_smart_sitting_crossed",
        "female_smart_sitting_crossed_clip",
        "Chaise assise - jambes croisées",
        AnimationOptions = {
            Prop = "ba_prop_battle_club_chair_03",
            PropBone = 0,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, -170.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sitchairf6"] = { -- Custom Emote By WhiskerValeMods
        "mouse@female_sitting_laptop",
        "female_sitting_laptop_clip",
        "Chaise assise - Avec un PC",
        AnimationOptions = {
            Prop = 'ba_prop_club_laptop_dj_02',
            PropBone = 57005,
            PropPlacement = {
                0.0860, -0.1370, -0.1750, -79.9999, -90.0000, 0.0000
            },
            SecondProp = 'ba_prop_battle_club_chair_02',
            SecondPropBone = 0,
            SecondPropPlacement = {
                -0.0400, -0.1900, 0.0000, -180.0000, -180.0000, 9.0999
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sitchairf7"] = { -- Custom Emote By Emote by WhiskerValeMods
        "mouse@female_sitting_tablet",
        "female_sitting_tablet_clip",
        "Chaise assise - Tablette",
        AnimationOptions = {
            Prop = 'hei_prop_dlc_tablet',
            PropBone = 28422,
            PropPlacement = {
                0.0870, 0.1030, -0.1240, 144.3540, 157.8527, -4.6318
            },
            SecondProp = 'ba_prop_battle_club_chair_02',
            SecondPropBone = 0,
            SecondPropPlacement = {
                0.0100, -0.0800, 0.0200, 150.0000, -180.0000, 10.0000
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["sitchairf8"] = { -- Custom Emote By Emote by WhiskerValeMods
        "mouse@female_sitting_tablet",
        "female_sitting_tablet_clip",
        "Chaise assise - Livre",
        AnimationOptions = {
            Prop = 'v_ilev_mp_bedsidebook',
            PropBone = 28422,
            PropPlacement = {
                0.1300, 0.1100, -0.1200, 120.3356, -15.9891, 26.1497
            },
            SecondProp = 'ba_prop_battle_club_chair_02',
            SecondPropBone = 0,
            SecondPropPlacement = {
                0.0100, -0.0800, 0.0200, 150.0000, -180.0000, 10.0000
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dig"] = {
        "random@burial",
        "a_burial",
        "Creuser avec une pelle",
        AnimationOptions = {
            Prop = "prop_tool_shovel",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.24, 0, 0, 0.0, 0.0},
            SecondProp = 'prop_ld_shovel_dirt',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.24, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['axe'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Axe',
        AnimationOptions = {
            Prop = 'prop_tool_fireaxe',
            PropBone = 18905,
            PropPlacement = {
                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["axe2"] = {
        "melee@large_wpn@streamed_core",
        "ground_attack_on_spot",
        "Axe - Ground Impact",
        AnimationOptions = {
            Prop = "prop_tool_fireaxe",
            PropBone = 57005,
            PropPlacement = {
                0.0160, -0.3140, -0.0860, -97.1455, 165.0749, 13.9114
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['axe3'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Axe - Pickaxe',
        AnimationOptions = {
            Prop = 'prop_tool_pickaxe',
            PropBone = 57005,
            PropPlacement = {
                0.0400, -0.2550, -0.1380, -109.0238, 163.6144, 20.6091
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["axe4"] = {
        "melee@large_wpn@streamed_core",
        "ground_attack_on_spot",
        "Axe - Pickaxe Ground Impact",
        AnimationOptions = {
            Prop = "prop_tool_pickaxe",
            PropBone = 57005,
            PropPlacement = {0.08, -0.4, -0.10, 80.0, -20.0, 175.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["bongos"] = {
        "amb@world_human_musician@bongos@male@base",
        "base",
        "Jouer du bongo",
        AnimationOptions = {
            Prop = "prop_bongos_01",
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["medbag"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Sac de soin médical",
        AnimationOptions = {
            Prop = "xm_prop_x17_bag_med_01a",
            PropBone = 57005,
            PropPlacement = {0.3900, -0.0600, -0.0600, -100.00, -180.00, -78.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dufbag"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Tenir un sac de sport",
        AnimationOptions = {
            Prop = "bkr_prop_duffel_bag_01a",
            PropBone = 28422,
            PropPlacement = {0.2600, 0.0400, 0.00, 90.00, 0.00, -78.99},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["shopbag"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Sac de shopping 1",
        AnimationOptions = {
            Prop = "vw_prop_casino_shopping_bag_01a",
            PropBone = 28422,
            PropPlacement = {0.24, 0.03, -0.04, 0.00, -90.00, 10.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["shopbag2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Sac de shopping 2",
        AnimationOptions = {
            Prop = "prop_shopping_bags02",
            PropBone = 28422,
            PropPlacement = {0.05, 0.02, 0.00, 178.80, 91.19, 9.97},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["shopbag3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Sac de shopping 3",
        AnimationOptions = {
            Prop = "prop_cs_shopping_bag",
            PropBone = 28422,
            PropPlacement = {0.24, 0.03, -0.04, 0.00, -90.00, 10.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['shopbag4'] = {
        'chocoholic@single54',
        'single54_clip',
        'Sac de shopping 4',
        AnimationOptions = {
            Prop = 'prop_carrier_bag_01',
            PropBone = 28422,
            PropPlacement = {
                0.2280, 0.0070, -0.1230, 1.2556, -53.8020, -34.4621
            },
            SecondProp = 'prop_phone_taymckenzienz',
            SecondPropBone = 60309, -- Left Wrist
            SecondPropPlacement = {
                0.0910, 0.0410, -0.0040, -129.2433, -18.1966, -41.2633
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guccibag"] = { -- Custom prop by crowded1337, unbranded by TayMcKenzieNZ
        "move_weapon@jerrycan@generic",
        "idle",
        "Sac Gucci",
        AnimationOptions = {
            Prop = 'prop_amb_handbag_01',
            PropBone = 28422, -- Right Wrist
            PropPlacement = {
                0.2000, 0.0300, -0.0200, 90.4294, -177.4267, 83.0011
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["idcard"] = {
       "paper_1_rcm_alt1-8",
       "player_one_dual-8",
       "ID Card 1",
       AnimationOptions = {
           Prop = "prop_franklin_dl",
           PropBone = 57005,
           PropPlacement = {0.1000, 0.0200, -0.0300, -90.000, 170.000, 78.999},
           EmoteStuck = true,
           EmoteLoop = false,
           EmoteMoving = true
       }
    },
    ["phone"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "Téléphone",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sms"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "SMS",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sms2"] = {
        "cellphone@female",
        "cellphone_text_read_base",
        "SMS 2",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {0.00, 0.00, 0.0301, 0.000, 00.00, 00.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sms3"] = {
        "cellphone@female",
        "cellphone_email_read_base",
        "SMS 3",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {-0.0190, -0.0240, 0.0300, 18.99, -72.07, 6.39},
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["sms4"] = {
        "cellphone@female",
        "cellphone_text_read_base_cover_low",
        "SMS 4",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {-0.0190, -0.0250, 0.0400, 19.17, -78.50, 14.97},
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["sms5"] = {
        "amb@code_human_wander_texting_fat@male@base",
        "static",
        "SMS 5",
        AnimationOptions = {
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {-0.0200, -0.0100, 0.00, 2.309, 88.845, 29.979},
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["tire"] = {
        "anim@heists@box_carry@",
        "idle",
        "Porter un pneu",
        AnimationOptions = {
            Prop = "prop_wheel_tyre",
            PropBone = 60309,
            PropPlacement = {-0.05, 0.16, 0.32, -130.0, -55.0, 150.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["golfswing"] = {
        "rcmnigel1d",
        "swing_a_mark",
        "Jouer au golf",
        AnimationOptions = {
            EmoteLoop = true,
            Prop = "prop_golf_wood_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
        }
    },
    ["register"] = {
        "anim@heists@box_carry@",
        "idle",
        "Porter une caisse enregistreuse",
        AnimationOptions = {
            Prop = "v_ret_gc_cashreg",
            PropBone = 60309,
            PropPlacement = {0.138, 0.2, 0.2, -50.0, 290.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["weedbrick"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Brique de weed (petit)",
        AnimationOptions = {
            Prop = "prop_weed_block_01",
            PropBone = 60309,
            PropPlacement = {0.1, 0.1, 0.05, 0.0, -90.0, 90.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["weedbrick2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Brique de weed (gros)",
        AnimationOptions = {
            Prop = "bkr_prop_weed_bigbag_01a",
            PropBone = 60309,
            PropPlacement = {0.158, -0.05, 0.23, -50.0, 290.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["potplant"] = {
        "anim@heists@box_carry@",
        "idle",
        "Plante en pot (petite)",
        AnimationOptions = {
            Prop = "bkr_prop_weed_01_small_01c",
            PropBone = 60309,
            PropPlacement = {0.138, -0.05, 0.23, -50.0, 290.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["potplant2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Plante en pot (moyenne)",
        AnimationOptions = {
            Prop = "bkr_prop_weed_01_small_01b",
            PropBone = 60309,
            PropPlacement = {0.138, -0.05, 0.23, -50.0, 290.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["potplant3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Plante en pot (grande)",
        AnimationOptions = {
            Prop = "bkr_prop_weed_lrg_01b",
            PropBone = 60309,
            PropPlacement = {0.138, -0.05, 0.23, -50.0, 290.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["weedbucket"] = {
        "anim@heists@box_carry@",
        "idle",
        "Sceau de Weed",
        AnimationOptions = {
            Prop = "bkr_prop_weed_bucket_open_01a",
            PropBone = 28422,
            PropPlacement = {0.0, -0.1000, -0.1800, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lawnchair"] = {
        "timetable@ron@ig_5_p3",
        "ig_5_p3_base",
        "Assis sur une chaise 1",
        AnimationOptions = {
            Prop = "prop_skid_chair_02",
            PropBone = 0,
            PropPlacement = {0.025, -0.2, -0.1, 45.0, -5.0, 180.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["lawnchair2"] = {
        "timetable@reunited@ig_10",
        "base_amanda",
        "Assis sur une chaise 2",
        AnimationOptions = {
            Prop = "prop_skid_chair_02",
            PropBone = 0,
            PropPlacement = {0.025, -0.15, -0.1, 45.0, 5.0, 180.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["lawnchair3"] = {
        "timetable@ron@ig_3_couch",
        "base",
        "Assis sur une chaise 3",
        AnimationOptions = {
            Prop = "prop_skid_chair_02",
            PropBone = 0,
            PropPlacement = {-0.05, 0.0, -0.2, 5.0, 0.0, 180.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["rose2"] = {
        "missheistdocksprep1hold_cellphone",
        "static",
        "Rose 2 (Homme)",
        AnimationOptions = {
            Prop = "prop_single_rose",
            PropBone = 31086,
            PropPlacement = {-0.0140, 0.1030, 0.0620, -2.932, 4.564, 39.910},
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["rose3"] = {
        "missheistdocksprep1hold_cellphone",
        "static",
        "Rose 3 (Femme)",
        AnimationOptions = {
            Prop = "prop_single_rose",
            PropBone = 31086,
            PropPlacement = {-0.0140, 0.1070, 0.0720, 0.00, 0.00, 2.99},
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["cbbox"] = {
        "anim@heists@box_carry@",
        "idle",
        "Porter un pack de biere 1",
        AnimationOptions = {
            Prop = "v_ret_ml_beerben1",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cbbox2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Porter un pack de biere 2",
        AnimationOptions = {
            Prop = "v_ret_ml_beerbla1",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cbbox3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Porter un pack de biere 3",
        AnimationOptions = {
            Prop = "v_ret_ml_beerjak1",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cbbox4"] = {
        "anim@heists@box_carry@",
        "idle",
        "Porter un pack de biere 4",
        AnimationOptions = {
            Prop = "v_ret_ml_beerlog1",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cbbox5"] = {
        "anim@heists@box_carry@",
        "idle",
        "Porter un pack de biere 5",
        AnimationOptions = {
            Prop = "v_ret_ml_beerpis1",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cbbox6"] = {
        "anim@heists@box_carry@",
        "idle",
        "Porter un pack de biere 6",
        AnimationOptions = {
            Prop = "prop_beer_box_01",
            PropBone = 28422,
            PropPlacement = {0.0200, -0.0600, -0.1200, -180.00, -180.00, 1.99},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gbin"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pousser une poubelle 1",
        AnimationOptions = {
            Prop = "prop_bin_08open",
            PropBone = 28422,
            PropPlacement = {0.00, -0.420, -1.290, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gbin2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pousser une poubelle 2",
        AnimationOptions = {
            Prop = "prop_cs_bin_01",
            PropBone = 28422,
            PropPlacement = {0.00, -0.420, -1.290, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gbin3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pousser une poubelle 3",
        AnimationOptions = {
            Prop = "prop_cs_bin_03",
            PropBone = 28422,
            PropPlacement = {0.00, -0.420, -1.290, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gbin4"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pousser une poubelle 4",
        AnimationOptions = {
            Prop = "prop_bin_08a",
            PropBone = 28422,
            PropPlacement = {0.00, -0.420, -1.290, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gbin5"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pousser une poubelle 5",
        AnimationOptions = {
            Prop = "prop_bin_07d",
            PropBone = 28422,
            PropPlacement = {-0.0100, -0.2200, -0.8600, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pflag'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau Mexique',
        AnimationOptions = {
            Prop = 'prideflag1',
            PropBone = 18905,
            PropPlacement = {
                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pflag2'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau USA',
        AnimationOptions = {
            Prop = 'prideflag2',
            PropBone = 18905,
            PropPlacement = {
                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pflag3'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau Cuba',
        AnimationOptions = {
            Prop = 'prideflag3',
            PropBone = 18905,
            PropPlacement = {
                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pflag4'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau Salvador',
        AnimationOptions = {
            Prop = 'prideflag4',
            PropBone = 18905,
            PropPlacement = {
                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pflag5'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau Jamaique',
        AnimationOptions = {
            Prop = 'prideflag5',
            PropBone = 18905,
            PropPlacement = {
                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pflag6'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau Canada',
        AnimationOptions = {
            Prop = 'prideflag6',
            PropBone = 18905,
            PropPlacement = {
                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pflag7'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau Costa Rica',
        AnimationOptions = {
            Prop = 'prideflag7',
            PropBone = 18905,
            PropPlacement = {
                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pflag8'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau Blanc',
        AnimationOptions = {
            Prop = 'prideflag8',
            PropBone = 18905,
            PropPlacement = {
                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pflag9'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau Noir',
        AnimationOptions = {
            Prop = 'prideflag9',
            PropBone = 18905,
            PropPlacement = {
                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['old'] = {
        'missbigscore2aleadinout@bs_2a_2b_int',
        'lester_base_idle',
        'Bâton de marche de vieux',
        AnimationOptions = {
            Prop = 'prop_cs_walking_stick',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            SecondProp = 'prop_phone_taymckenzienz',
            SecondPropBone = 60309, -- Left Wrist
            SecondPropPlacement = {
                0.0740, 0.0410, 0.0090, -127.9136, -10.6186, 4.7536
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['old2'] = { -- Custom Animation By Darks Animations, Added To And Requested By TayMcKenzieNZ Exclusively For RPEmotes and is not to be extracted or added to another scripts and / or menus
        'zimmerframe_walk@dark',
        'zimmerframe_walk_clip',
        'Old Man Zimmerframe',
        AnimationOptions = {
            Prop = 'v_res_d_zimmerframe',
            PropBone = 28252,
            PropPlacement = {
                0.9500, -0.6640, -0.5470, -122.4053, 85.0955, 23.1787
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['lighter'] = {
        'ebrwny_pack000',
        'ebrwny_spark',
        'Lighter - Cigar',
        AnimationOptions = {
            Prop = 'lux_prop_lighter_luxe',
            PropBone = 26612,
            PropPlacement = {
                0.0300, -0.0360, 0.0270, -168.0000, -180.0000, 8.0000
            },
            SecondProp = 'prop_cigar_01',
            SecondPropBone = 17188,
            SecondPropPlacement = {0.0450, 0.0130, 0.0170, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['lighter2'] = {
        'ebrwny_pack000',
        'ebrwny_spark',
        'Lighter - Cigar Sit',
        AnimationOptions = {
            Prop = 'lux_prop_lighter_luxe',
            PropBone = 26612,
            PropPlacement = {
                0.0300, -0.0360, 0.0270, -168.0000, -180.0000, 8.0000
            },
            SecondProp = 'prop_cigar_01',
            SecondPropBone = 17188,
            SecondPropPlacement = {0.0450, 0.0130, 0.0170, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ['digiscan'] = {
        'weapons@misc@digi_scanner',
        'aim_med_loop',
        'Utiliser un détecteur de métaux 1',
        AnimationOptions = {
            Prop = 'w_am_digiscanner',
            PropBone = 28422,
            PropPlacement = {0.0480, 0.0780, 0.0040, -81.6893, 2.5616, -15.7909},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['digiscan2'] = {
        'weapons@misc@digi_scanner',
        'aim_low_loop',
        'Utiliser un détecteur de métaux 2',
        AnimationOptions = {
            Prop = 'w_am_digiscanner',
            PropBone = 28422,
            PropPlacement = {0.0480, 0.0780, 0.0040, -81.6893, 2.5616, -15.7909},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['digiscan3'] = {
        'weapons@misc@digi_scanner',
        'aim_high_loop',
        'Utiliser un détecteur de métaux 3',
        AnimationOptions = {
            Prop = 'w_am_digiscanner',
            PropBone = 28422,
            PropPlacement = {0.0480, 0.0780, 0.0040, -81.6893, 2.5616, -15.7909},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cop4"] = {
        "amb@world_human_car_park_attendant@male@base",
        "base",
        "Faire la circulation 1",
        AnimationOptions = {
            Prop = "prop_parking_wand_01",
            PropBone = 57005,
            PropPlacement = {0.12, 0.05, 0.0, 80.0, -20.0, 180.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["copbeacon"] = { -- Added for compatibility
        "amb@world_human_car_park_attendant@male@base",
        "base",
        "Faire la circulation 2",
        AnimationOptions = {
            Prop = "prop_parking_wand_01",
            PropBone = 57005,
            PropPlacement = {0.12, 0.05, 0.0, 80.0, -20.0, 180.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanphone"] = {
        "amb@world_human_leaning@male@wall@back@mobile@base",
        "base",
        "S'appuyer avec le téléphone",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Prop = "prop_phone_taymckenzienz",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
        }
    },
    ["hump2"] = {
        "timetable@trevor@skull_loving_bear",
        "skull_loving_bear",
        "Hump (Bear)",
        AnimationOptions = {
            Prop = 'prop_mr_raspberry_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = false,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["drink"] = {
        "mp_player_intdrink",
        "loop_bottle",
        "Boire de l'eau",
        AnimationOptions = {
            Prop = "prop_ld_flow_bottle",
            PropBone = 18905,
            PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["surfboard"] = { -- Emote by Molly
        "beachanims@molly",
        "beachanim_surf_clip",
        "Porter une planche de surf",
        AnimationOptions = {
            Prop = "prop_surf_board_01",
            PropBone = 28252,
            PropPlacement = {
                0.1020, -0.1460, -0.1160, -85.5416, 176.1446, -2.1500
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["stealtv"] = { -- Emote by Molly
        "beachanims@molly",
        "beachanim_surf_clip",
        "Porter une TV",
        AnimationOptions = {
            Prop = "xs_prop_arena_screen_tv_01",
            PropBone = 28252,
            PropPlacement = {
                0.2600, 0.1100, -0.1400, 96.1620, 168.9069, 84.2402
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beachring"] = { -- Emote by Molly
        "beachanims@free",
        "beachanim_clip",
        "Porter une boué de piscine",
        AnimationOptions = {

            Prop = "prop_beach_ring_01",
            PropBone = 0,
            PropPlacement = {0.0, 0.0, 0.0100, -12.0, 0.0, -2.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cashcase"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Malette d'argent",
        AnimationOptions = {
            Prop = "bkr_prop_biker_case_shut",
            PropBone = 28422,
            PropPlacement = {0.1000, 0.0100, 0.0040, 0.0, 0.0, -90.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cashcase2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Malette d'argent 2",
        AnimationOptions = {
            Prop = "prop_cash_case_01",
            PropBone = 28422,
            PropPlacement = {-0.0050, -0.1870, -0.1400, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cashcase3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Malette d'argent 3",
        AnimationOptions = {
            Prop = "prop_cash_case_02",
            PropBone = 28422,
            PropPlacement = {0.0050, -0.1170, -0.1400, 14.000, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cashcase4"] = {
        "anim@heists@box_carry@",
        "idle",
        "Malette de diamant",
        AnimationOptions = {
            Prop = "ch_prop_ch_security_case_01a",
            PropBone = 28422,
            PropPlacement = {0.0, -0.0900, -0.1800, 14.4000, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["airportbag"] = {
        "anim@heists@narcotics@trash",
        "idle",
        "Prendre une valise",
        AnimationOptions = {
            Prop = "prop_suitcase_01c",
            PropBone = 28422,
            PropPlacement = {0.1100, -0.2100, -0.4300, -11.8999, 0.0, 30.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["airportbag2"] = { -- Custom Emote By Dark Animations exclusive to RPEmotes 
        "suitcase_phone@dark",
        "suitcase_phone_clip",
        "Airport Bag 2 - Phone",
        AnimationOptions = {
            Prop = 'prop_suitcase_03',
            PropBone = 60309,
            PropPlacement = {
                0.4700, -0.0400, -0.3500, -120.0000, -180.0000, -79.9999
            },
            SecondProp = 'prop_phone_taymckenzienz',
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.1040, 0.0320, -0.0200, -108.6997, -150.5805, 46.7080
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["airportbag3"] = { -- Custom Emote By Chocoholic Animations
        "chocoholic@single63",
        "single63_clip",
        "Prendre une valise 3",
        AnimationOptions = {
            Prop = "prop_suitcase_03",
            PropBone = 58869,
            PropPlacement = {
                0.2100, 0.4100, -0.3600, 56.9074, -6.1917, -24.3334
            },
            EmoteLoop = true
        }
    },
    ["megaphone"] = { -- Custom Emote By MollyEmotes
        "molly@megaphone",
        "megaphone_clip",
        "Megaphone",
        AnimationOptions = {
            Prop = "prop_megaphone_01",
            PropBone = 28422,
            PropPlacement = {
                0.0500, 0.0540, -0.0060, -71.8855, -13.0889, -16.0242
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["megaphone2"] = { -- Custom Emote By MollyEmotes
        "molly@megaphone2",
        "megaphone_clip",
        "Megaphone 2",
        AnimationOptions = {
            Prop = "prop_megaphone_01",
            PropBone = 28422,
            PropPlacement = {
                0.0500, 0.0540, -0.0060, -71.8855, -13.0889, -16.0242
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["megaphone3"] = {
        "anim@rifle_megaphone",
        "rifle_holding_megaphone",
        "Megaphone 3",
        AnimationOptions = {
            Prop = "prop_megaphone_01",
            PropBone = 60309,
            PropPlacement = {
                0.0480, 0.0190, 0.0160, -94.8944, -2.3093, -10.9030
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["easter"] = {
        "anim@heists@narcotics@trash",
        "idle",
        "Easter Basket",
        AnimationOptions = {
            Prop = "bzzz_event_easter_basket_b",
            PropBone = 28422,
            PropPlacement = {0.0040, 0.0400, -0.2420, 19.9999, 0.0, -10.0000},
            SecondProp = 'bzzz_event_easter_egg_d',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0790, 0.0090, 0.0190, -120.0000, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["easter2"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Easter Bunny",
        AnimationOptions = {
            Prop = "bzzz_event_easter_bunny_a",
            PropBone = 60309,
            PropPlacement = {-0.0270, -0.0200, 0.0100, 62.9161, 0.4622, 10.8906},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bball"] = { -- Custom Emote By Struggleville
        "anim@male_bskball_hold",
        "bskball_hold_clip",
        "Tenir un ballon de basket",
        AnimationOptions = {
            Prop = "prop_bskball_01",
            PropBone = 28422,
            PropPlacement = {0.0600, 0.0400, -0.1200, 0.0, 0.0, 40.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bball2"] = { -- Custom Emote By Struggleville
        "anim@male_bskball_photo_pose",
        "photo_pose_clip",
        "Prendre la pose avec le ballon de basket",
        AnimationOptions = {
            Prop = "prop_bskball_01",
            PropBone = 60309,
            PropPlacement = {-0.0100, 0.0200, 0.1300, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bball3"] = { -- Custom Emote By Struggleville
        "anim@male_basketball_03",
        "m_basketball_03_clip",
        "Prendre la pose avec le ballon de basket 2",
        AnimationOptions = {
            Prop = "prop_bskball_01",
            PropBone = 28422,
            PropPlacement = {
                0.0400, 0.0200, -0.1400, 90.0000, -99.9999, 79.9999
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bball4"] = { -- Custom Emote By SapphireMods
        "mx@pose2",
        "mx_clippose2",
        "Prendre la pose avec le ballon de basket 3",
        AnimationOptions = {
            Prop = "prop_bskball_01",
            PropBone = 28422,
            PropPlacement = {
                0.0400, 0.0200, -0.1400, 90.0000, -99.9999, 79.9999
            },
            EmoteLoop = true
        }
    },
    ["ftorch"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Torche de feu",
        AnimationOptions = {
            Prop = "bzzz_prop_torch_fire001", -- Custom Prop By Bzzzz Used With Permission
            PropBone = 18905,
            PropPlacement = {0.14, 0.21, -0.08, -110.0, -1.0, -10.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['ftorch2'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Torche de feu 2',
        AnimationOptions = {
            Prop = "bzzz_prop_torch_fire001", -- Custom Prop By Bzzzz Used With Permission
            PropBone = 28422,
            PropPlacement = {
                -0.0800, -0.0300, -0.1700, 11.4181, -159.1026, 15.0338
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['candle'] = {
        'special_ped@griff@base',
        'base',
        'Candle',
        AnimationOptions = {
            Prop = "prop_candle",
            PropBone = 28422,
            PropPlacement = {0.0200, 0.0100, 0.0100, 0.0000, 10.0000, 0.0000},
            EmoteLoop = true,
            EmoteMoving = true

        }
    },
    ["watchstripper2"] = {
        "amb@world_human_strip_watch_stand@male_c@base",
        "base",
        "Watch Stripper 2",
        AnimationOptions = {
            Prop = "prop_beer_am",
            PropBone = 60309,
            PropPlacement = {
                0.0880, -0.1360, 0.1450, -102.9624, 81.7098, -39.2734
            },
            EmoteLoop = true,
            EmoteMoving = true
        },
        AdultAnimation = true
    },
    ["candyapple"] = { -- Custom Prop by hollywoodiownu
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Pomme d'amour",
        AnimationOptions = {
            Prop = "apple_1",
            PropBone = 18905,
            PropPlacement = {0.12, 0.15, 0.0, -100.0, 0.0, -12.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gamer"] = { --- Custom Emote By MissSnowie
        "playing@with_controller",
        "base",
        "Gamer",
        AnimationOptions = {
            Prop = 'prop_controller_01',
            PropBone = 18905,
            PropPlacement = {
                0.1450, 0.0590, 0.0850, -164.4546, -62.9570, 17.5872
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["gamer2"] = { --- Custom Emote By Dark Animations exclusive to RPEmotes
        "lay_controller@dark",
        "lay_controller_clip",
        "Gamer Laying On Stomach",
        AnimationOptions = {
            Prop = 'prop_controller_01',
            PropBone = 18905,
            PropPlacement = {
                0.1350, 0.0360, 0.0950, -180.0000, -72.9699, 0.0000
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["study"] = { --- Custom Emote By Dark Animations exclusive to RPEmotes
        "study_pc_finally_fixed@dark",
        "study_pc_finally_fixed_clip",
        "Study",
        AnimationOptions = {
            Prop = 'xm_prop_x17_laptop_lester_01',
            PropBone = 28422,
            PropPlacement = {
                0.1650, 0.1010, -0.1470, -159.2533, -145.7418, -79.5760
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["crackhead"] = {
        "special_ped@zombie@base",
        "base",
        "Drogué",
        AnimationOptions = {
            Prop = 'prop_cs_bowie_knife', -- Knife
            PropBone = 28422, -- Right Wrist
            PropPlacement = {
                -0.1280, -0.0220, 0.0210, -150.0005, 179.9989, -30.0105
            },
            SecondProp = 'ng_proc_cigpak01a',
            SecondPropBone = 26614,
            SecondPropPlacement = {
                0.010, -0.0190, 0.0920, -82.4073, 178.6009, 29.9195
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["propose"] = { --- Custom Emote By ultrahacx
        "ultra@propose",
        "propose",
        "Demander en mariage",
        AnimationOptions = {
            Prop = 'ultra_ringcase', --- Custom prop by ultrahacx
            PropBone = 28422,
            PropPlacement = {
                0.0980, 0.0200, -0.0540, -138.6571, 4.4141, -79.3552
            },
            EmoteLoop = true
        }
    },
    ["propose2"] = { --- Custom Emote By ultrahacx
        "ultra@propose",
        "propose",
        "Demander en mariage - St Valentin",
        AnimationOptions = {
            Prop = 'pata_freevalentinesday', --- Custom prop by PataMods
            PropBone = 64064,
            PropPlacement = {0.0190, 0.0480, 0.0110, -9.0350, 88.4373, -9.8783},
            EmoteLoop = true
        }
    },
    ["propose3"] = { --- Custom Emote By ultrahacx
        "ultra@propose",
        "propose",
        "Demander en mariage 3",
        AnimationOptions = {
            Prop = 'pata_freevalentinesday2', --- Custom prop by PataMods
            PropBone = 64064,
            PropPlacement = {0.0190, 0.0480, 0.0110, -9.0350, 88.4373, -9.8783},
            EmoteLoop = true
        }
    },
    ["holdfw"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Tenir un feu d'artifice",
        AnimationOptions = {
            Prop = 'ind_prop_firework_01', --- blue, green, red, purple pink, cyan, yellow, white
            PropBone = 18905,
            PropPlacement = {
                0.1100, 0.3200, -0.2400, -130.0688, -2.5736, -3.0631
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["chillteq"] = { --- Custom Emote By Amnilka
        "amnilka@photopose@female@homepack001",
        "amnilka_femalehome_photopose_003",
        "Chill Tequila",
        AnimationOptions = {
            Prop = 'prop_tequila',
            PropBone = 60309,
            PropPlacement = {
                0.0810, -0.0460, 0.0430, -110.1784, 2.9283, -12.5092
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["patrolf1"] = {
        "amb@world_human_security_shine_torch@male@base",
        "base",
        "Patrouille - A Pied",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 80.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["patrolf2"] = {
        "amb@world_human_security_shine_torch@male@idle_b",
        "idle_e",
        "Patrouille - A Pied 2",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 80.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["patrolf3"] = {
        "amb@world_human_security_shine_torch@male@idle_a",
        "idle_a",
        "Patrouille - A Pied 3",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 80.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["patrolf4"] = { -- Huge thanks to MadsLeander on GitHub
        "amb@incar@male@patrol@torch@base",
        "base",
        "Patrouille - A Pied 4",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 28422, -- Right Wrist
            PropPlacement = {0.0, -0.00100, 0.0, 0.0, 0.0, 90.0},
            SecondProp = 'prop_cs_hand_radio',
            SecondPropBone = 60309, -- Left Wrist
            SecondPropPlacement = {
                0.0560, 0.0470, 0.0110, -43.82733, 164.6747, -7.5569
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["patrolcar"] = {
        "amb@incar@male@patrol@torch@base",
        "base",
        "Patrouille Voiture - Devant",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 28422,
            PropPlacement = {0.0, -0.0100, -0.0100, 0.0, 0.0, 100.0000},
            EmoteLoop = true
        }
    },
    ["pineapple"] = { -- Custom Prop by hollywoodiownu
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Ananas",
        AnimationOptions = {
            Prop = "xm3_prop_xm3_pineapple_01a",
            PropBone = 18905,
            PropPlacement = {0.1, -0.11, 0.05, -100.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["present"] = {
        "anim@heists@box_carry@",
        "idle",
        "Cadeau",
        AnimationOptions = {
            Prop = "xm3_prop_xm3_present_01a",
            PropBone = 28422,
            PropPlacement = {0.0, -0.18, -0.16, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["patrolcarl"] = {
        "amb@incar@male@patrol@torch@idle_b",
        "idle_d",
        "Patrouille Voiture - Gauche",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 28422,
            PropPlacement = {0.0, -0.0100, -0.0100, 0.0, 0.0, 100.0000},
            EmoteLoop = true
        }
    },
    ["patrolcarr"] = {
        "amb@incar@male@patrol@torch@idle_a",
        "idle_a",
        "Patrouille Voiture - Droite",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 28422,
            PropPlacement = {0.0, -0.0100, -0.0100, 0.0, 0.0, 100.0000},
            EmoteLoop = true
        }
    },
    ["papers"] = {
        "missheistdocksprep1hold_cellphone",
        "static",
        "Journaux",
        AnimationOptions = {
            Prop = "xm3_prop_xm3_papers_01a",
            PropBone = 18905,
            PropPlacement = {0.13, 0.0, 0.04, -110.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["vlog"] = {
        "amb@world_human_mobile_film_shocking@male@base",
        "base",
        "Vlog",
        AnimationOptions = {
            Prop = 'prop_ing_camera_01',
            PropBone = 28422,
            PropPlacement = {-0.07, -0.01, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["vlog2"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Vlog 2",
        AnimationOptions = {
            Prop = 'prop_ing_camera_01',
            PropBone = 18905,
            PropPlacement = {0.15, 0.03, 0.1, 280.0, 110.0, -11.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["skatesit"] = { -- Custom Emote By CMG Mods
        "skateboardposecmganimation",
        "skateboardposecmg_clip",
        "Skateboard - Assis",
        AnimationOptions = {
            Prop = 'taymckenzienz_skateboard01',
            PropBone = 0,
            PropPlacement = {0.0, 0.0400, -0.2300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["skatesit2"] = { -- Custom Emote By Chocoholic Animations
        "chocoholic@skate2",
        "skate2_clip",
        "Skateboard - Assis 2",
        AnimationOptions = {
            Prop = "taymckenzienz_skateboard02",
            PropBone = 0,
            PropPlacement = {0.0, -0.0200, -0.2900, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["skatehold"] = {
        "molly@boombox1",
        "boombox1_clip",
        "Skateboard - Pose Femme",
        AnimationOptions = {
            Prop = "prop_cs_sol_glasses",
            PropBone = 31086,
            PropPlacement = {
                0.0440, 0.0740, 0.0000, -160.9843, -88.7288, -0.6197
            },
            SecondProp = 'taymckenzienz_skateboard01',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                -0.0050, 0.0320, 0.1640, 44.6076, -112.2983, -86.1199
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["skatehold2"] = { -- Emote by Molly
        "beachanims@molly",
        "beachanim_surf_clip",
        "Skateboard - Pose Femme 2",
        AnimationOptions = {
            Prop = "taymckenzienz_skateboard01",
            PropBone = 28422,
            PropPlacement = {-0.1020, 0.2240, 0.0840, 5.6655, 175.3526, 49.7964},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["skatehold3"] = { -- Custom Emote By Chocoholic Animations
        "chocoholic@skate4",
        "skate4_clip",
        "Skateboard - Pose Femme 3",
        AnimationOptions = {
            Prop = "taymckenzienz_skateboard01",
            PropBone = 28422,
            PropPlacement = {0.2780, -0.0200, -0.0700, -180.0000, 28.0000, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["skatehold4"] = {
        "molly@boombox1",
        "boombox1_clip",
        "Skateboard - Pose Homme",
        AnimationOptions = {
            Prop = "prop_cs_sol_glasses",
            PropBone = 31086,
            PropPlacement = {
                0.0440, 0.0740, 0.0000, -160.9843, -88.7288, -0.6197
            },
            SecondProp = 'taymckenzienz_skateboard02',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                -0.0050, 0.0320, 0.1640, 44.6076, -112.2983, -86.1199
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["skatehold5"] = { -- Emote by Molly
        "beachanims@molly",
        "beachanim_surf_clip",
        "Skateboard - Pose Homme 2",
        AnimationOptions = {
            Prop = "taymckenzienz_skateboard02",
            PropBone = 28422,
            PropPlacement = {-0.1020, 0.2240, 0.0840, 5.6655, 175.3526, 49.7964},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["skatehold6"] = { -- Custom Emote By Chocoholic Animations
        "chocoholic@skate4",
        "skate4_clip",
        "Skateboard - Pose Homme 3",
        AnimationOptions = {
            Prop = "taymckenzienz_skateboard02",
            PropBone = 28422,
            PropPlacement = {0.2780, -0.0200, -0.0700, -180.0000, 28.0000, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["mafia"] = { -- Custom Emote By Chocoholic Animations
        "chocoholic@single12",
        "single12_clip",
        "Mafia Boss - Gun Point",
        AnimationOptions = {
            Prop = "w_pi_revolver_b",
            PropBone = 28422,
            PropPlacement = {
                0.1150, 0.0590, -0.0100, -69.7101, 1.4074, -13.7554
            },
            SecondProp = 'prop_cigar_01',
            SecondPropBone = 17188,
            SecondPropPlacement = {0.0450, 0.0130, 0.0170, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    -- ["shield"] = {
    --    "beachanims@molly",
    --    "beachanim_surf_clip",
    --    "Bouclier anti-émeute",
    --    AnimationOptions = {
    --        Prop = "prop_riot_shield",
    --        PropBone = 18905,
    --        PropPlacement = {-0.04, -0.06, 0.0, 4.04, 108.17, -17.48},
    --        EmoteLoop = true,
    --        EmoteMoving = true
    --    }
    -- },
    -- ["shield2"] = {
    --    "beachanims@molly",
    --    "beachanim_surf_clip",
    --    "Bouclier balistique",
    --    AnimationOptions = {
    --        Prop = "prop_ballistic_shield",
    --        PropBone = 18905,
    --        PropPlacement = {0.01, -0.1, -0.07, 1.83, 105.38, -10.14},
    --        EmoteLoop = true,
    --        EmoteMoving = true
    --    }
    -- },
    ["cofpose"] = {
        "chocoholic@single23",
        "single23_clip",
        "Café & Burger",
        AnimationOptions = {
            Prop = "prop_fib_coffee",
            PropBone = 28422,
            PropPlacement = {
                0.0720, 0.0390, -0.0230, -125.8797, -168.4347, 17.4518
            },
            SecondProp = 'prop_cs_burger_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                0.1240, 0.0230, 0.0520, 89.8585, -179.9282, -39.9999
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["holster6"] = {
        "anim@hlstr_7360_torch",
        "flsh_ps",
        "Holster 6 - Lampe torche",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 60309,
            PropPlacement = {0.0550, -0.0200, 0.0370, -29.6216, -8.6822, 4.9809},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["holster8"] = {
        "anim@holster_walk_torch",
        "flash_ps",
        "Holster 8 - Lampe torche 2",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 60309,
            PropPlacement = {0.0600, -0.0100, 0.0200, -20.0000, 0.0000, 3.9999},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["heartprop"] = {
        "anim@heists@box_carry@",
        "idle",
        "Gros coeur",
        AnimationOptions = {
            Prop = 'brum_heart',
            PropBone = 28422,
            PropPlacement = {
                -0.5600, 0.0240, -0.3690, -10.0000, 0.0000, -0.0000
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["popcorn"] = {
        "amb@code_human_wander_drinking@female@base",
        "static",
        "Popcorn",
        AnimationOptions = {
            Prop = 'prop_taymckenzienz_popcorn',
            PropBone = 28422,
            PropPlacement = {
                -0.0200, -0.0100, -0.0700, -179.3626, 176.9331, 11.9833
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["card"] = {
        "card@animation",
        "card_clip",
        "Montrer sa carte d'identité",
        AnimationOptions = {
            Prop = "p_ld_id_card_01",
            PropBone = 60309,
            PropPlacement = {0.129, 0.035, 0.068, -80.0, 140.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sax"] = {
        "play_saxophone@dark",
        "play_saxophone_clip",
        "Saxophone 1",
        AnimationOptions = {
            Prop = 'rpemotes_prop_saxophone01',
            PropBone = 57005,
            PropPlacement = {0.0700, 0.0400, 0.0300, -71.2242, 29.3364, 5.9514},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sax2"] = {
        "play_saxophone@dark",
        "play_saxophone_clip",
        "Saxophone 2",
        AnimationOptions = {
            Prop = 'rpemotes_prop_saxophone02',
            PropBone = 57005,
            PropPlacement = {0.0700, 0.0400, 0.0300, -71.2242, 29.3364, 5.9514},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["copradio"] = {
        "copradio@animation",
        "copradio_clip",
        "Radio de Police",
        AnimationOptions = {
            Prop = "prop_cs_walkie_talkie",
            PropBone = 28422,
            PropPlacement = {0.1, 0.07, 0.0, 40.0, 40.0, 170.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["radio1"] = {
        "anim@radio_left",
        "radio_left_clip",
        "Parler a sa radio 1",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["radio2"] = {
        "anim@male@holding_radio",
        "holding_radio_clip",
        "Parler a sa radio 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["pallet1"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_two",
        "Charriot 1",
        AnimationOptions = {
            Prop = "prop_pallettruck_01",
            PropBone = -1,
            PropPlacement = {0.0, 1.6, -1.15, 0.0, 0.0, 180.0},
            WeightCapacitor = 'pallet',
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pallet2"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_two",
        "Charriot 2",
        AnimationOptions = {
            Prop = "prop_pallettruck_02",
            PropBone = -1,
            PropPlacement = {0.0, 1.6, -1.15, 0.0, 0.0, 180.0},
            WeightCapacitor = 'pallet',
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pallet3"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_one",
        "Charriot 3",
        AnimationOptions = {
            Prop = "prop_sacktruck_02b",
            PropBone = -1,
            PropPlacement = {0.0, 1.45, -0.8, -30.0, 0.0, 180.0},
            WeightCapacitor = 'pallet',
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pallet4"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_two",
        "Charriot 4",
        AnimationOptions = {
            Prop = "prop_flattruck_01c",
            PropBone = -1,
            PropPlacement = {0.0, 1.3, -0.97, 0.0, 0.0, 180.0},
            WeightCapacitor = 'pallet',
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pallet5"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_two",
        "Charriot 5",
        AnimationOptions = {
            Prop = "prop_flattruck_01d",
            PropBone = -1,
            PropPlacement = {0.0, 1.3, -0.97, 0.0, 0.0, 180.0},
            WeightCapacitor = 'pallet',
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pallet6"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_two",
        "Charriot 6",
        AnimationOptions = {
            Prop = "prop_flattruck_01a",
            PropBone = -1,
            PropPlacement = {0.0, 1.3, -0.97, 0.0, 0.0, 180.0},
            WeightCapacitor = 'pallet',
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pallet7"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_two",
        "Charriot 7",
        AnimationOptions = {
            Prop = "prop_rub_trolley01a",
            PropBone = -1,
            PropPlacement = {0.0, 1.1, -0.4, 0.0, 0.0, 180.0},
            WeightCapacitor = 'pallet',
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["palletc2"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_two",
        "Charriot avec poids 1",
        AnimationOptions = {
            Prop = "prop_pallettruck_01",
            PropBone = -1,
            PropPlacement = {0.0, 1.6, -1.15, 0.0, 0.0, 180.0},
            WeightCapacitor = 'pallet',
            --
            SecondProp = 'ex_prop_crate_jewels_racks_sc',
            SecondPropBone = -1,
            SecondPropPlacement = {0.0, 2.0, -1.0, 0.0, 0.0, 180.0},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["palletc3"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_two",
        "Charriot avec poids 2",
        AnimationOptions = {
            Prop = "prop_pallettruck_01",
            PropBone = -1,
            PropPlacement = {0.0, 1.6, -1.15, 0.0, 0.0, 180.0},
            WeightCapacitor = 'pallet',
            --
            SecondProp = 'ex_prop_crate_money_sc',
            SecondPropBone = -1,
            SecondPropPlacement = {0.0, 2.0, -1.0, 0.0, 0.0, 180.0},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smokengun"] = {
        "smokingweapon@animation",
        "smokingweapon_clip",
        "Sitting Smoke & Gun",
        AnimationOptions = {
            Prop = "ng_proc_cigarette01a",
            PropBone = 4185,
            PropPlacement = {0.0300, 0.0000, 0.0200, 1.7096, -43.1362, -27.9428},
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ['smokendrink'] = { --- Custom Emote By Darks Animations
        "drx@male_smoke",
        "male_smoke",
        "Smoke And Whiskey",
        AnimationOptions = {
            Prop = 'prop_drink_whisky',
            PropBone = 26612,
            PropPlacement = {0.0500, -0.0700, -0.0500, 0.0, 0.0, 0.0},
            SecondProp = 'ng_proc_cigarette01a',
            SecondPropBone = 64113,
            SecondPropPlacement = {
                0.0270, 0.0080, 0.0050, -11.6920, -78.3079, 7.9470
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["poolcue"] = {
        "pool_pack_1@dark",
        "pool_pack_1_clip",
        "Play Pool",
        AnimationOptions = {
            Prop = 'prop_pool_cue',
            PropBone = 57005,
            PropPlacement = {0.0900, 0.2000, 0.0800, -61.4338, -7.2194, 3.1642},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["poolcue2"] = {
        "pool_pack_2@dark",
        "pool_pack_2_clip",
        "Play Pool 2 (Pose)",
        AnimationOptions = {
            Prop = 'prop_pool_cue',
            PropBone = 57005,
            PropPlacement = {
                0.1200, -0.5200, -0.1200, -78.0400, -1.4526, 1.8479
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["poolcue3"] = {
        "pool_pack_3@dark",
        "pool_pack_3_clip",
        "Play Pool 3 (Pose)",
        AnimationOptions = {
            Prop = 'prop_pool_cue',
            PropBone = 57005,
            PropPlacement = {0.1200, -0.3500, -0.0200, -90.0000, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["poolcue4"] = {
        "pool_pack_4@dark",
        "pool_pack_4_clip",
        "Play Pool 4 (Pose)",
        AnimationOptions = {
            Prop = 'prop_pool_cue',
            PropBone = 61163,
            PropPlacement = {
                0.2600, -0.1600, -0.3100, -31.8144, 14.4214, -13.2854
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["poolcue5"] = {
        "pool_pack_5@dark",
        "pool_pack_5_clip",
        "Play Pool 5",
        AnimationOptions = {
            Prop = 'prop_pool_cue',
            PropBone = 57005,
            PropPlacement = {0.0700, 0.5500, 0.1000, -76.6157, -9.5838, 2.9748},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["basket"] = {
        "missfbi4prepp1",
        "idle",
        "Basket",
        AnimationOptions = {
            Prop = 'bzzz_prop_shop_basket_a',
            PropBone = 57005,
            PropPlacement = {0.34, -0.25, -0.24, -146.0, 115.0, 19.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["basket2"] = {
        "missfbi4prepp1",
        "idle",
        "Basket 2",
        AnimationOptions = {
            Prop = 'bzzz_prop_shop_basket_b',
            PropBone = 57005,
            PropPlacement = {0.34, -0.25, -0.24, -146.0, 115.0, 19.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["power"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Power House",
        AnimationOptions = {
            Prop = 'prop_bzzz_elektro_powerhouse001',
            PropBone = 57005,
            PropPlacement = {0.11, 0.06, 0.0, 98.0, 12.0, -99.0},
            EmoteLoop = true,
            EmoteMoving = true

        }
    },
    ["wlight"] = {
        "missfbi4prepp1",
        "idle",
        "Weed Light",
        AnimationOptions = {
            Prop = 'prop_bzzz_drugs_light001',
            PropBone = 57005,
            PropPlacement = {0.08, 0.18, -0.02, -130.0, 0.0, -90.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["businessbag"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt
        "mrwitt@dark_appearance_with_bag_male",
        "mrwitt",
        "Business Bag",
        AnimationOptions = {
            Prop = 'prop_med_bag_01b',
            PropBone = 60309,
            PropPlacement = {
                0.3050, 0.0200, 0.0790, 43.8282, -54.1834, -88.4424
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["businessbag2"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt
        "mrwitt@dark_appearance_with_bag_male",
        "mrwitt",
        "Business Bag - Pose",
        AnimationOptions = {
            Prop = 'prop_med_bag_01b',
            PropBone = 60309,
            PropPlacement = {
                0.3050, 0.0200, 0.0790, 43.8282, -54.1834, -88.4424
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["squatcash"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt
        "mrwitt@checked_shirt_squat_male",
        "mrwitt",
        "Squat Cash - Pose",
        AnimationOptions = {
            Prop = 'prop_cash_pile_02',
            PropBone = 28422,
            PropPlacement = {
                0.0880, 0.0440, 0.0030, 149.6422, -164.7312, 25.2203
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["squatmask"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt
        "mrwitt@selfie02_male",
        "mrwitt",
        "Squat Mask Red - Pose",
        AnimationOptions = {
            Prop = 'scarymask1',
            PropBone = 64065,
            PropPlacement = {0.0200, 0.1700, -0.0210, 0.0000, 0.0000, 0.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["squatmask1"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt
        "mrwitt@selfie02_male",
        "mrwitt",
        "Squat Mask White - Pose",
        AnimationOptions = {
            Prop = 'scarymask2',
            PropBone = 64065,
            PropPlacement = {0.0200, 0.1700, -0.0210, 0.0000, 0.0000, 0.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["squatmask2"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt
        "mrwitt@selfie02_male",
        "mrwitt",
        "Squat Mask Black - Pose",
        AnimationOptions = {
            Prop = 'scarymask3',
            PropBone = 64065,
            PropPlacement = {0.0200, 0.1700, -0.0210, 0.0000, 0.0000, 0.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["selfiesquat"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt
        "mrwitt@selfie02_male",
        "mrwitt",
        "Selfie Squat Male",
        AnimationOptions = {
            Prop = 'prop_cash_pile_02',
            PropBone = 26614,
            PropPlacement = {
                0.0300, -0.0300, 0.0700, -90.0000, -180.0000, 6.9999
            },
            SecondProp = 'prop_phone_taymckenzienz',
            SecondPropBone = 64112,
            SecondPropPlacement = {
                0.0180, 0.0380, 0.0260, 179.6474, -177.9691, 9.9938
            },
            EmoteLoop = true
        }
    },
    ["femscaremask"] = { -- Animation by MrWitt
        "mrwitt@helloween4_f",
        "mrwitt",
        "Female Scary Mask Red - Pose",
        AnimationOptions = {
            Prop = 'scarymask1', -- Prop by Vedere
            PropBone = 64064,
            PropPlacement = {
                -0.0460, 0.1170, 0.0850, 21.9542799, -81.9467213, 9.0687101
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["femscaremask2"] = { -- Animation by MrWitt
        "mrwitt@helloween4_f",
        "mrwitt",
        "Female Scary Mask Black - Pose",
        AnimationOptions = {
            Prop = 'scarymask2', -- Prop by Vedere
            PropBone = 64064,
            PropPlacement = {
                -0.0460, 0.1170, 0.0850, 21.9542799, -81.9467213, 9.0687101
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["femscaremask3"] = { -- Animation by MrWitt
        "mrwitt@helloween4_f",
        "mrwitt",
        "Female Scary Mask White - Pose",
        AnimationOptions = {
            Prop = 'scarymask3', -- Prop by Vedere
            PropBone = 64064,
            PropPlacement = {
                -0.0460, 0.1170, 0.0850, 21.9542799, -81.9467213, 9.0687101
            },
            EmoteLoop = true,
            EmoteMoving = true

        }
    },
    ["raiseglass"] = { -- Custom Animation by Chocoholic Animations 
        "chocoholic@duo32",
        "duo32_clip",
        "Raise Your Glass",
        AnimationOptions = {
            Prop = 'p_champ_flute_s',
            PropBone = 64065,
            PropPlacement = {0.0140, 0.0310, -0.0990, 0.0000, 0.0000, 0.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["raiseglass2"] = { -- Custom Animation by Chocoholic Animations 
        "chocoholic@duo34",
        "duo34_clip",
        "Raise Your Glass 2",
        AnimationOptions = {
            Prop = 'p_champ_flute_s',
            PropBone = 64065,
            PropPlacement = {0.0260, 0.0190, -0.1280, -14.9999, 0.0000, -2.9999},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["squatgunpose2"] = { --- Custom Emote By Darks Animations
        "ganggirls_pose2@darks37",
        "ganggirls_pose2_clip",
        "Squat Gun Pose 2 - Right",
        AnimationOptions = {
            Prop = 'w_pi_pistolsmg_m31',
            PropBone = 26614,
            PropPlacement = {0.0260, -0.0280, 0.0980, -4.8222, -6.9836, 23.6186},
            EmoteLoop = true
        }
    },
    ["rap2"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations
        "mic_pose_1@darksj",
        "mic_pose_1_clip",
        "Rap / Sing 2 - Microhpone",
        AnimationOptions = {
            Prop = 'sf_prop_sf_mic_01a',
            PropBone = 28422,
            PropPlacement = {0.0680, 0.0190, -0.0220, 0.0000, 0.0000, 170.0000},
            EmoteLoop = true,
            EmoteMoving = true

        }
    },
    ["rap3"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations
        "mic_pose_2@darksj",
        "mic_pose_2_clip",
        "Rap / Sing 3 - Microhpone Rock Hand Sign",
        AnimationOptions = {
            Prop = 'sf_prop_sf_mic_01a',
            PropBone = 28422,
            PropPlacement = {0.0680, 0.0190, -0.0220, 0.0000, 0.0000, 170.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["rap4"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations
        "mic_pose_3@darksj",
        "mic_pose_3_clip",
        "Rap / Sing 4 - Microhpone Bend Back",
        AnimationOptions = {
            Prop = 'sf_prop_sf_mic_01a',
            PropBone = 28422,
            PropPlacement = {0.0680, 0.0190, -0.0220, 0.0000, 0.0000, 170.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["rap5"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations
        "mic_pose_4@darksj",
        "mic_pose_4_clip",
        "Rap / Sing 5 - Microhpone Kneel",
        AnimationOptions = {
            Prop = 'sf_prop_sf_mic_01a',
            PropBone = 28422,
            PropPlacement = {0.0680, 0.0190, -0.0220, 0.0000, 0.0000, 170.0000},
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["rap6"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations
        "mic_pose_5_a@darksj",
        "mic_pose_5_a_clip",
        "Rap / Sing 6 - Microhpone",
        AnimationOptions = {
            Prop = 'sf_prop_sf_mic_01a',
            PropBone = 28422,
            PropPlacement = {0.0680, 0.0190, -0.0220, 0.0000, 0.0000, 170.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bbat"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations
        "bat@sel",
        "bat_clip",
        "Baseball Bat Pose",
        AnimationOptions = {
            Prop = 'p_cs_bbbat_01',
            PropBone = 28422,
            PropPlacement = {0.0600, 0.0700, 0.0100, -73.8317, 0.8479, -12.8826},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["stopsign"] = { --- Custom Prop By PNWParksFan
        "amb@world_human_janitor@male@base",
        "base",
        "Stop Sign",
        AnimationOptions = {
            Prop = 'prop_flagger_sign_01',
            PropBone = 28422,
            PropPlacement = {0.0000, 0.0000, -0.6800, 0.0000, 0.0000, -50.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["stopsign2"] = { --- Custom Prop By PNWParksFan
        "amb@world_human_janitor@male@base",
        "base",
        "Stop Sign 2 - Slow Down",
        AnimationOptions = {
            Prop = 'prop_flagger_sign_01',
            PropBone = 28422,
            PropPlacement = {0.0000, 0.0000, -0.6800, 0.0000, 0.0000, 120.0000},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["stopsign3"] = { --- Custom Prop By PNWParksFan
        "special_ped@griff@base",
        "base",
        "Stop Sign 3 - Stop",
        AnimationOptions = {
            Prop = 'prop_flagger_sign_02',
            PropBone = 28422,
            PropPlacement = {
                0.0200, 0.0200, -0.2600, 169.9999, -180.0000, 59.9999
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["stopsign4"] = { --- Custom Prop By PNWParksFan
        "special_ped@griff@base",
        "base",
        "Stop Sign 4 - Slow Down",
        AnimationOptions = {
            Prop = 'prop_flagger_sign_02',
            PropBone = 28422,
            PropPlacement = {0.0200, 0.0200, -0.2600, 10.0000, 0.0000, -59.9999},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["binoculars"] = {
        "amb@world_human_binoculars@male@idle_b",
        "idle_f",
        "Binoculars",
        AnimationOptions = {
            Prop = "prop_binoc_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["binoculars2"] = {
        "amb@world_human_binoculars@male@idle_a",
        "idle_c",
        "Binoculars 2",
        AnimationOptions = {
            Prop = "prop_binoc_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["idcardb"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 2 - FIB",
        AnimationOptions = {
            Prop = "prop_fib_badge",
            PropBone = 28422,
            PropPlacement = {
                0.0600,
                0.0210,
                -0.0400,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcardc"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 3",
        AnimationOptions = {
            Prop = "prop_michael_sec_id",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcardd"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 4",
        AnimationOptions = {
            Prop = "prop_trev_sec_id",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcarde"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 5",
        AnimationOptions = {
            Prop = "p_ld_id_card_002",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcardf"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 6",
        AnimationOptions = {
            Prop = "prop_cs_r_business_card",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcardg"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 7",
        AnimationOptions = {
            Prop = "prop_michael_sec_id",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcardh"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 8",
        AnimationOptions = {
            Prop = "prop_cop_badge",
            PropBone = 28422,
            PropPlacement = {
                0.0800,
                -0.0120,
                -0.0600,
                -90.00,
                180.00,
                69.99
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["babe1"] = {
        "anim@heists@box_carry@",
        "idle",
        "Baby Seat 1",
        AnimationOptions = {
            Prop = "prop_busbebek_dark_01",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                -0.420,
                -1.290,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["babe2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Baby Seat 2",
        AnimationOptions = {
            Prop = "prop_busbebek_light_01",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                -0.420,
                -1.290,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
	["cane"] = {
		"missheistdocksprep1hold_cellphone",
		"static",
		"Cane",
		AnimationOptions =
		{
			Prop = "prop_cs_walking_stick",
			PropBone = 57005,
			PropPlacement = { 0.15, 0.05, -0.03, 0.0, 266.0, 180.0 },
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
}

Lists.Emotes.Gestures = {
    ["checkwatch"] = { -- Custom Emote By MissSnowie
        "watch@looking_at",
        "base",
        "Regarder sa montre",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["cleanhands"] = {
        "missheist_agency3aig_23",
        "urinal_sink_loop",
        "Se nettoyer les mains",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["cleanface"] = {
        "switch@michael@wash_face",
        "loop_michael",
        "Se nettoyer le visage",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["block"] = {
        "missheist_agency3ashield_face",
        "idle",
        "Proteger son visage",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["snot"] = {
        "move_p_m_two_idles@generic",
        "fidget_blow_snot",
        "S'essuyer les yeux",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 4500}
    },
    ["scratch"] = {
        "move_p_m_two_idles@generic",
        "fidget_scratch_balls",
        "Scratch Balls",
        AnimationOptions = {EmoteMoving = false, EmoteDuration = 4000},
        AdultAnimation = true
    },
    ["cartaunt"] = {
        "missarmenian1driving_taunts@lamar_1",
        "cmonfrank",
        "Car Taunt",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 2000
        }
    },
    ["cartauntb"] = {
        "missarmenian1driving_taunts@lamar_1",
        "cmonmynigga",
        "Car Taunt 2",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 2000
        }
    },
    ["cartauntc"] = {
        "missarmenian1driving_taunts@lamar_1",
        "hahahakeepup",
        "Car Taunt 3",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 2000
        }
    },
    ["cartauntd"] = {
        "missarmenian1driving_taunts@lamar_1",
        "manthisismeanttobe",
        "Car Taunt 4",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 2000
        }
    },
    ["cartaunte"] = {
        "missarmenian1driving_taunts@lamar_1",
        "rememberthis",
        "Car Taunt 5",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 3000
        }
    },
    ["cartauntf"] = {
        "missarmenian1driving_taunts@lamar_1",
        "skoolinyoass",
        "Car Taunt 6",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 3000
        }
    },
    ["cartauntg"] = {
        "missarmenian1driving_taunts@lamar_1",
        "youaintfuckin",
        "Car Taunt 7",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 2000
        }
    },
    ["cartaunth"] = {
        "missarmenian1driving_taunts@franklin",
        "heyidontneedanybody",
        "Car Taunt 8",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 2000
        }
    },
    ["cartaunti"] = {
        "missarmenian1driving_taunts@franklin",
        "heymotherfuckayoudriveslowasfuck",
        "Car Taunt 9",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 3000
        }
    },
    ["cartauntj"] = {
        "missarmenian1driving_taunts@franklin",
        "kids_on_bicycles",
        "Car Taunt 10",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 2000
        }
    },
    ["cartauntk"] = {
        "missarmenian1driving_taunts@franklin",
        "learnhowtouseastick",
        "Car Taunt 11",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 2000
        }
    },
    ["cartauntl"] = {
        "missarmenian1driving_taunts@franklin",
        "slowassshit",
        "Car Taunt 12",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 2000
        }
    },
    ["cartauntm"] = {
        "mp_intro_seq@mcs_7_race_taunt",
        "mcs_7_taunt_female",
        "Car Taunt 13",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["cartauntn"] = {
        "mp_intro_seq@mcs_7_race_taunt",
        "mcs_7_taunt_male",
        "Car Taunt 14",
        AnimationOptions = {
            onlyInVehicle = true,
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["respect"] = {
        "anim@mp_player_intcelebrationmale@respect",
        "respect",
        "Respect - Homme",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = false}
    },
    ["respectf"] = {
        "anim@mp_player_intcelebrationfemale@respect",
        "respect",
        "Respect - Femme",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = false}
    },
    ["bang"] = {
        "anim@mp_player_intcelebrationfemale@bang_bang",
        "bang_bang",
        "Bang Bang ",
        AnimationOptions = {EmoteMoving = false, EmoteDuration = 2500}
    },
    ["picklock"] = {
        "missheistfbisetup1",
        "hassle_intro_loop_f",
        "Crocheter",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["adjusttie"] = {
        "clothingtie",
        "try_tie_positive_a",
        "Se ré-habiller correctement",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 5000}
    },
    ["adjust"] = {
        "missmic4",
        "michael_tux_fidget",
        "Ajuster sa chemise",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 4000}
    },
    ["adjusthat"] = {
        "missheistdockssetup1hardhat@",
        "put_on_hat",
        "Mettre son chapeau",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1000}
    },
    ["adjusthelmet"] = {
        "veh@common@fp_helmet@",
        "put_on_helmet",
        "Mettre son casque",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1800}
    },
    ["takeoffhelmet"] = {
        "veh@common@fp_helmet@",
        "take_off_helmet_stand",
        "Enlever son casque",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1000}
    },
    ["adjustglasses"] = {
        "clothingspecs",
        "take_off",
        "Enlever des lunettes",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1000}
    },
    ["adjustshoes"] = {
        "clothingshoes",
        "try_shoes_positive_a",
        "Mettre ses chaussures", 
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 4000}
    },
    ["adjustmask"] = {
        "mp_masks@on_foot",
        "put_on_mask",
        "Mettre un masque",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 500}
    },
    ["airforce01"] = { -- MissSnowie
        "airforce@at_ease",
        "base",
        "Airforce - Au repos", -- MissSnowie
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["airforce02"] = { -- MissSnowie
        "airforce@attention",
        "base",
        "Airforce - Attention",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["airforce03"] = { -- MissSnowie
        "airforce@parade_rest",
        "base",
        "Airforce - Au repos (parade)",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["airforce04"] = {
        "airforce@salute",
        "base",
        "Airforce - Saluer",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["argue"] = {
        "misscarsteal4@actor",
        "actor_berating_loop",
        "Disputer",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["argue2"] = {
        "oddjobs@assassinate@vice@hooker",
        "argue_a",
        "Toi là ! Je vais t'éclater !",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["argue3"] = {
        "missheistdockssetup1leadinoutig_1",
        "lsdh_ig_1_argue_wade",
        "Disputer 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["argue4"] = {
        "car_2_mcs_1-6",
        "cs_devin_dual-6",
        "Disputer 4",
        AnimationOptions = {EmoteDuration = 6000, EmoteMoving = true}
    },
    ["argue5"] = {
        "anim@amb@casino@brawl@fights@argue@",
        "arguement_loop_mp_m_brawler_01",
        "Disputer 5",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["argue6"] = {
        "anim@amb@casino@brawl@fights@argue@",
        "arguement_loop_mp_m_brawler_02",
        "Disputer 6",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["bartender"] = {
        "anim@amb@clubhouse@bar@drink@idle_a",
        "idle_a_bartender",
        "Mains sur le comptoir",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["blowkiss"] = {
        "anim@mp_player_intcelebrationfemale@blow_kiss", "blow_kiss",
        "Plein de bisous"
    },
    ["blowkiss2"] = {
        "anim@mp_player_intselfieblow_kiss",
        "exit",
        "Plein de bisous 2",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 2000}
    },
    ["boi"] = {
        "special_ped@jane@monologue_5@monologue_5c",
        "brotheradrianhasshown_2",
        "BOI",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 3000}
    },
    ["comeatmebro"] = {
        "mini@triathlon",
        "want_some_of_this",
        "C'est mon frère sa !",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 2000}
    },
    ["countdown"] = {
        "random@street_race",
        "grid_girl_race_start",
        "Applaudissement",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["cough"] = {
        "timetable@gardener@smoking_joint",
        "idle_cough",
        "Tousser",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["cutthroat"] = {
        "anim@mp_player_intcelebrationmale@cut_throat", "cut_throat",
        "Toi là ! Je vais te crever !"
    },
    ["cutthroat2"] = {
        "anim@mp_player_intcelebrationfemale@cut_throat", "cut_throat",
        "Je vais te trancher la gorge"
    },
    ["damn"] = {
        "gestures@m@standing@casual",
        "gesture_damn",
        "Ah merde !",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1000}
    },
    ["damn2"] = {
        "anim@am_hold_up@male",
        "shoplift_mid",
        "Put*** !",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1000}
    },
    ["dock"] = {
        "anim@mp_player_intincardockstd@rds@",
        "idle_a",
        "Dock",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["facepalm2"] = {
        "anim@mp_player_intcelebrationfemale@face_palm",
        "face_palm",
        "Hein ? Pas possible..",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 8000}
    },
    ["facepalm"] = {
        "random@car_thief@agitated@idle_a",
        "agitated_idle_a",
        "Oh lala..",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 8000}
    },
    ["facepalm3"] = {
        "missminuteman_1ig_2",
        "tasered_2",
        "Quel malheur..",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 8000}
    },
    ["facepalm4"] = {
        "anim@mp_player_intupperface_palm",
        "idle_a",
        "Quel malheur..",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["finger"] = {
        "anim@mp_player_intselfiethe_bird",
        "idle_a",
        "Faire un fuck",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["finger2"] = {
        "anim@mp_player_intupperfinger",
        "idle_a_fp",
        "Faire un fuck 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["handshake"] = {
        "mp_ped_interaction",
        "handshake_guy_a",
        "Poignée de main",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 3000}
    },
    ["handshake2"] = {
        "mp_ped_interaction",
        "handshake_guy_b",
        "Poignée de main 2",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 3000}
    },
    ["handsup"] = {
        "missminuteman_1ig_2",
        "handsup_base",
        "Lever les mains en l'air",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["handsup2"] = {
        "anim@mp_player_intuppersurrender",
        "idle_a_fp",
        "Lever les mains en l'air 2",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ['handsup3'] = {
        'anim@mp_rollarcoaster',
        'hands_up_idle_a_player_one',
        "Lever les mains en l'air 3",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["hugme"] = {"mp_ped_interaction", "kisses_guy_a", "Câlin"},
    ["hugme2"] = {"mp_ped_interaction", "kisses_guy_b", "Câlin 2"},
    ["jazzhands"] = {
        "anim@mp_player_intcelebrationfemale@jazz_hands",
        "jazz_hands",
        "Clown",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 6000}
    },
    ["kick"] = {
        "missheistdockssetup1ig_13@kick_idle",
        "guard_beatup_kickidle_guard1",
        "Tabasser au sol",
        AnimationOptions = {EmoteLoop = true}
    },
    ["kick2"] = {
        "missheistdockssetup1ig_13@kick_idle",
        "guard_beatup_kickidle_guard2",
        "Tabasser au sol 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["kick3"] = {
        "melee@unarmed@streamed_core",
        "kick_close_a",
        "Tabasser au sol 3",
        AnimationOptions = {EmoteDuration = 1750}
    },
    ["knock"] = {
        "timetable@jimmy@doorknock@",
        "knockdoor_idle",
        "Toquer à une porte",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["knock2"] = {
        "missheistfbi3b_ig7",
        "lift_fibagent_loop",
        "Toquer à une porte 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["knucklecrunch"] = {
        "anim@mp_player_intcelebrationfemale@knuckle_crunch",
        "knuckle_crunch",
        "Se craquer les doigts",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["lift"] = {
        "random@hitch_lift",
        "idle_f",
        "Faire du stop",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["me"] = {
        "gestures@f@standing@casual",
        "gesture_me_hard",
        "Moi ?",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1000}
    },
    ["mindblown"] = {
        "anim@mp_player_intcelebrationmale@mind_blown",
        "mind_blown",
        "Ravi de te voir !",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 4000}
    },
    ["mindblown2"] = {
        "anim@mp_player_intcelebrationfemale@mind_blown",
        "mind_blown",
        "Damn",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 4000}
    },
    ["metal"] = {
        "anim@mp_player_intincarrockstd@ps@",
        "idle_a",
        "Signe métal",
        AnimationOptions = {
            -- CHANGE ME
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["no"] = {
        "anim@heists@ornate_bank@chat_manager",
        "fail",
        "Non pas du tout !",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["no2"] = {
        "mp_player_int_upper_nod",
        "mp_player_int_nod_no",
        "Non de la tête",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["nosepick"] = {
        "anim@mp_player_intcelebrationfemale@nose_pick",
        "nose_pick",
        "Se décrotter le nez",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["noway"] = {
        "gestures@m@standing@casual",
        "gesture_no_way",
        "Absolument pas",
        AnimationOptions = {EmoteDuration = 1500, EmoteMoving = true}
    },
    ["ok"] = {
        "anim@mp_player_intselfiedock",
        "idle_a",
        "OK",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["pointdown"] = {
        "gestures@f@standing@casual",
        "gesture_hand_down",
        "Tu restes ici",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1000}
    },
    ["point"] = {
        "gestures@f@standing@casual",
        "gesture_point",
        "Hé toi là !",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["pointright"] = {
        "mp_gun_shop_tut",
        "indicate_right",
        "Pointe vers la droite",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["pullover"] = {
        "misscarsteal3pullover",
        "pull_over_right",
        "Hé toi !",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1300}
    },
    ["headbutt"] = {
        "melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt",
        "Mettre un coup de boule 1"
    },
    ["peace"] = {
        "mp_player_int_upperpeace_sign",
        "mp_player_int_peace_sign",
        "Peace",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["peace2"] = {
        "anim@mp_player_intupperpeace",
        "idle_a",
        "Peace 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["peace3"] = {
        "anim@mp_player_intupperpeace",
        "idle_a_fp",
        "Peace 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["peace4"] = {
        "anim@mp_player_intincarpeacestd@ds@",
        "idle_a",
        "Peace 4",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["peace5"] = {
        "anim@mp_player_intincarpeacestd@ds@",
        "idle_a_fp",
        "Peace 5",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["peace6"] = {
        "anim@mp_player_intincarpeacebodhi@ds@",
        "idle_a",
        "Peace 6",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["peace7"] = {
        "anim@mp_player_intincarpeacebodhi@ds@",
        "idle_a_fp",
        "Peace 7",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["peacef"] = {
        "anim@mp_player_intcelebrationfemale@peace",
        "peace",
        "Peace - Femme",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["clapangry"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "angry_clap_a_player_a",
        "Applaudir comme un débile",
        AnimationOptions = {EmoteLoop = true}
    },
    ["slowclap3"] = {
        "anim@mp_player_intupperslow_clap",
        "idle_a",
        "Applaudir au ralenti",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["clap"] = {
        "amb@world_human_cheering@male_a",
        "base",
        "Applaudir joyeusement",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["slowclap"] = {
        "anim@mp_player_intcelebrationfemale@slow_clap",
        "slow_clap",
        "Applaudir doucement",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["slowclap2"] = {
        "anim@mp_player_intcelebrationmale@slow_clap",
        "slow_clap",
        "Applaudir doucement 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["smell"] = {
        "move_p_m_two_idles@generic",
        "fidget_sniff_fingers",
        "Se sentir la main",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["stickup"] = {
        "random@countryside_gang_fight",
        "biker_02_stickup_loop",
        "Pointer avec son arme",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["think4"] = {
        "anim@amb@casino@hangout@ped_male@stand@02b@idles",
        "idle_a",
        "Croiser les bras en ce tenant le menton",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["salute"] = {
        "anim@mp_player_intincarsalutestd@ds@",
        "idle_a",
        "Salut de l'armée",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["salute2"] = {
        "anim@mp_player_intincarsalutestd@ps@",
        "idle_a",
        "Salut de l'armée 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["salute3"] = {
        "anim@mp_player_intuppersalute",
        "idle_a",
        "Salut de l'armée 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["scared"] = {
        "random@domestic",
        "f_distressed_loop",
        "Avoir peur",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["scared2"] = {
        "random@homelandsecurity",
        "knees_loop_girl",
        "Avoir peur 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["screwyou"] = {
        "misscommon@response",
        "screw_you",
        "Bras d'honneur",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["shakeoff"] = {
        "move_m@_idles@shake_off",
        "shakeoff_1",
        "Enlever la poussière au sol",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 3500}
    },
    ["shaka"] = {
        "sign@hang_loose",
        "base",
        "Shaka 'Hang Loose'",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["shaka2"] = {
        "sign@hang_loose_casual",
        "base",
        "Shaka 'Hang Loose Casual'",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["shrug"] = {
        "gestures@f@standing@casual",
        "gesture_shrug_hard",
        "Hein ?",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1000}
    },
    ["shrug2"] = {
        "gestures@m@standing@casual",
        "gesture_shrug_hard",
        "Quoi ?",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1000}
    },
    ["stink"] = {
        "anim@mp_player_intcelebrationfemale@stinker",
        "stinker",
        "Sa pue",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["uwu"] = {
        "uwu@egirl",
        "base",
        "UwU",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["pickup"] = {"random@domestic", "pickup_low", "Ramasser"},
    ["thumbsup3"] = {
        "anim@mp_player_intincarthumbs_uplow@ds@",
        "enter",
        "Pouce en l'air",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 3000}
    },
    ["thumbsup2"] = {
        "anim@mp_player_intselfiethumbs_up",
        "idle_a",
        "Pouce en l'air en souriant",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["thumbsup"] = {
        "anim@mp_player_intupperthumbs_up",
        "idle_a",
        "Double pouce en l'air",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["warmth"] = {
        "amb@world_human_stand_fire@male@idle_a",
        "idle_a",
        "Se chauffer les mains autour du feu",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wave4"] = {
        "random@mugging5",
        "001445_01_gangintimidation_1_female_idle_b",
        "Salut avec les bras en l'air",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 3000}
    },
    ["wave2"] = {
        "anim@mp_player_intcelebrationfemale@wave",
        "wave",
        "Salut de reine",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wave3"] = {
        "friends@fra@ig_1",
        "over_here_idle_a",
        "Lever un bras comme une star",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wave"] = {
        "friends@frj@ig_1",
        "wave_a",
        "Coucou !",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wave5"] = {
        "friends@frj@ig_1",
        "wave_b",
        "Hé c'est moi !",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wave6"] = {
        "friends@frj@ig_1",
        "wave_c",
        "Je suis là",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wave7"] = {
        "friends@frj@ig_1",
        "wave_d",
        "Hé oh",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wave8"] = {
        "friends@frj@ig_1",
        "wave_e",
        "Salut !",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wave9"] = {
        "gestures@m@standing@casual",
        "gesture_hello",
        "Hey !",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["whistle"] = {
        "taxi_hail",
        "hail_taxi",
        "Sifflé",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1300}
    },
    ["whistle2"] = {
        "rcmnigel1c",
        "hailing_whistle_waive_a",
        "Sifflé 2",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 2000}
    },
    ["yeah"] = {
        "anim@mp_player_intupperair_shagging",
        "idle_a",
        "Yeah",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["flipoff"] = {
        "anim@arena@celeb@podium@no_prop@",
        "flip_off_a_1st",
        "Faire un fuck à l'horizon",
        AnimationOptions = {EmoteMoving = true}
    },
    ["flipoff2"] = {
        "anim@arena@celeb@podium@no_prop@",
        "flip_off_c_1st",
        "Faire un double fuck à l'horizon",
        AnimationOptions = {EmoteMoving = true}
    },
    ["keyfob"] = {
        "anim@mp_player_intmenu@key_fob@",
        "fob_click",
        "Utiliser une clée",
        AnimationOptions = {
            EmoteLoop = false,
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["holster"] = {
        "move_m@intimidation@cop@unarmed",
        "idle",
        "Holster",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["holster2"] = { --- Custom Emote Provided To RpEmotes By Mads
        "mads@police_reaching_holster",
        "idle",
        "Holster 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["holster3"] = {
        "anim@hlstr_7360_walk",
        "holster_walk",
        "Holster 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["holster4"] = {
        "anim@hlstr_7360_hold",
        "holster_stop",
        "Holster 4 - Stop",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["holster5"] = {
        "anim@holster_hold_there",
        "holster_hold",
        "Holster 5 - Stop 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["slap"] = {
        "melee@unarmed@streamed_variations",
        "plyr_takedown_front_slap",
        "Gifler",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["calldog"] = {
        "switch@franklin@plays_w_dog",
        "001916_01_fras_v2_9_plays_w_dog_idle",
        "Appeler son chien",
        AnimationOptions = {EmoteLoop = true}
    },
    ["calldogr"] = {
        "missfra0_chop_find",
        "call_chop_r",
        "Appeler son chien - Droite",
        AnimationOptions = {EmoteLoop = false}
    },
    ["calldogl"] = {
        "missfra0_chop_find",
        "call_chop_l",
        "Appeler son chien - Gauche",
        AnimationOptions = {EmoteLoop = false}
    },
    ["crosshands"] = {
        "anim@amb@carmeet@checkout_car@",
        "male_e_base",
        "Mains croisées",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["aslyes"] = {
        "ebrwny_sign",
        "ebrwny_yes",
        "ASL Yes 🇺🇸",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1030}
    },
    ["aslno"] = {
        "ebrwny_sign",
        "ebrwny_no",
        "ASL No 🇺🇸",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 2080}
    },
    ["aslimgood"] = {
        "ebrwny_sign",
        "ebrwny_imgood",
        "ASL I Am Good 🇺🇸",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 3940}
    },
    ["aslcya"] = {
        "ebrwny_sign",
        "ebrwny_seeya",
        "ASL See Ya 🇺🇸",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1200}
    },
    ["aslwhat"] = {
        "ebrwny_sign",
        "ebrwny_what",
        "ASL What 🇺🇸",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 1480}
    },
    ["hidegun"] = { -- CREDIT TO DARKS ANIMATIONS FOR THIS EXCLUSIVE RPEMOTES ANIMATION 
        "pistol_b_b@dark", -- CREDIT TO DARKS ANIMATIONS FOR THIS EXCLUSIVE RPEMOTES ANIMATION 
        "pistol_b_b_clip", -- CREDIT TO DARKS ANIMATIONS FOR THIS EXCLUSIVE RPEMOTES ANIMATION 
        "Hide a gun",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["dab"] = {
        "stand_dab@dark",
        "stand_dab_clip",
        "Dab",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["secretservice"] = {
        "anim@secret_service",
        "open_door",
        "Ouvrir la porte (USSS)",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["suit"] = {
        "anim@suit",
        "holding_suit",
        "Tenir son costume",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["secretservice2"] = {
        "wristmic@animation",
        "wristmic4_clip",
        "Parler a sa radio (USSS)",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
	["2head"] = {
		"2man2head@animation",
		"2man2head_clip",
		"2 Man 2 Head",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["2fucku"] = {
		"2manfcku@animation",
		"2manfcku_clip",
		"2 Man Fuck u",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["pluck"] = {
		"custom@pluck_fruits",
		"pluck_fruits",
		"Pluck Fruits",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["pickfromground"] = {
		"custom@pickfromground",
		"pickfromground",
		"Pick From Ground",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
}

Lists.Emotes.Positions = {
    ["bumsleep"] = {
        "amb@world_human_bum_slumped@male@laying_on_left_side@idle_a",
        "idle_b",
        "Grosse Sieste",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["chill"] = {
        "switch@trevor@scares_tramp",
        "trev_scares_tramp_idle_tramp",
        "Allongé relax",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 200,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["cloudgaze"] = {
        "switch@trevor@annoys_sunbathers",
        "trev_annoys_sunbathers_loop_girl",
        "Allongé dos au sol",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["checkcar"] = {
        "anim@amb@carmeet@checkout_car@male_a@idles",
        "idle_b",
        "Regarder la voiture - Femme",
        AnimationOptions = {EmoteLoop = true}
    },
    ["checkcar2"] = {
        "anim@amb@carmeet@checkout_car@male_c@idles",
        "idle_a",
        "Regarder la voiture - Homme",
        AnimationOptions = {EmoteLoop = true}
    },
    ["cryinbed"] = {
        "timetable@floyd@cryingonbed@base",
        "base",
        "Crying on bed",
        AnimationOptions = {EmoteLoop = true}
    },
    ["showboobs"] = {
        "mini@strip_club@backroom@",
        "stripper_b_backroom_idle_b",
        "Show Boobs ",
        AnimationOptions = {EmoteMoving = false, EmoteDuration = 6000}
    },
    ["showboobs2"] = {
        "mini@strip_club@idles@stripper",
        "stripper_idle_05",
        "Show Boobs 2",
        AnimationOptions = {EmoteMoving = false, EmoteDuration = 6000}
    },
    ["watchstripper"] = {
        "amb@world_human_strip_watch_stand@male_c@idle_a",
        "idle_b",
        "Watch Stripper ",
        AnimationOptions = {EmoteMoving = false, EmoteDuration = 6000}
    },
    ["hhands"] = {
        "misssnowie@hearthands",
        "base",
        "Faire un coeur avec ses mains",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["pockets"] = { -- Custom Emote By Dark Animations
        "hoodie_hands@dad",
        "hoodie_hands_clip",
        "Hands in pockets (Hoodie)",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["femaleposea"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@femalepose_10",
        "mrwitt",
        "Female Pose A",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleadorable1"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@adorable_style",
        "mrwitt",
        "Female Adorable 1",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleadorable2"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@adorable",
        "mrwitt",
        "Female Adorable 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposeb"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@characterful_poses",
        "mrwitt",
        "Female Pose B",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposec"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@elegant_floor_hock",
        "mrwitt",
        "Female Pose C",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposed"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@femalepose_03",
        "mrwitt",
        "Female Pose D",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposee"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@femalepose_04",
        "mrwitt",
        "Female Pose E",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposef"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@femalepose_05",
        "mrwitt",
        "Female Pose F",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposeg"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@femalepose_06",
        "mrwitt",
        "Female Pose G",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposeh"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@femalepose_07",
        "mrwitt",
        "Female Pose H",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposei"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@femalepose_09",
        "mrwitt",
        "Female Pose I",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposej"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@femalepose_10",
        "mrwitt",
        "Female Pose J",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposek"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@femalepose_11",
        "mrwitt",
        "Female Pose K",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposel"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@finger_gun_pose",
        "mrwitt",
        "Female Pose L",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposem"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@models_in_action",
        "mrwitt",
        "Female Pose M",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposen"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@photo_session_posing",
        "mrwitt",
        "Female Pose N",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposeo"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@school_uniform_expression",
        "mrwitt",
        "Female Pose O",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposep"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@urban_posing",
        "mrwitt",
        "Female Pose P",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposer"] = { --- Custom Emote By DRX Animations
        "drx@femalestand14",
        "xrd",
        "Female Pose R",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposes"] = { --- Custom Emote By DRX Animations
        "drx@femalestand15",
        "xrd",
        "Female Pose S",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposet"] = { --- Custom Emote By DRX Animations
        "drx@femalestand16",
        "xrd",
        "Female Pose T",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposeu"] = { --- Custom Emote By DRX Animations
        "drx@f_sitcool",
        "drx",
        "Female Pose U",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["femaleposev"] = { --- Custom Emote By DRX Animations
        "drx@f_standcasual1",
        "drx",
        "Female Pose V",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposew"] = { --- Custom Emote By DRX Animations
        "drx@f_standcasual2",
        "drx",
        "Female Pose W",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposex"] = { --- Custom Emote By DRX Animations
        "drx@femalestand7",
        "xrd",
        "Female Pose X",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposey"] = { --- Custom Emote By DRX Animations
        "drx@femalestand8",
        "xrd",
        "Female Pose Y",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femaleposez"] = { --- Custom Emote By DRX Animations
        "drx@femalestand9",
        "xrd",
        "Female Pose Z",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["posecutef"] = { -- Custom Emote By Pupppy
        "pupppy@freepose01",
        "freepose01",
        "Cute Pose Femme",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["posecutef2"] = { -- Custom Emote By Pupppy
        "pupppy@freepose03",
        "freepose03",
        "Cute Pose Femme 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["posecutef3"] = { -- Custom Emote By Pupppy
        "pupppy@freepose04",
        "freepose04",
        "Cute Pose Femme 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["posecutef4"] = { -- Custom Emote By QueenSistersAnimations
        "handkylie@queensisters",
        "kylie_clip",
        "Cute Pose Femme 4",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["posecutem"] = { -- Custom Emote By Pupppy
        "pupppy@freepose02",
        "freepose02",
        "Cute Pose Homme",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleposea"] = { --- Custom Emote By DRX Animations
        "drx@singlemale1",
        "drx",
        "Male Pose A",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleposeb"] = { --- Custom Emote By DRX Animations
        "drx@singlemale2",
        "drx",
        "Male Pose B",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleposec"] = { --- Custom Emote By DRX Animations
        "drx@singlemalestand1",
        "drx",
        "Male Pose C",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleposed"] = { --- Custom Emote By DRX Animations
        "drx@singlemalestand2",
        "drx",
        "Male Pose D",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleposee"] = { --- Custom Emote By DRX Animations
        "drx@m_doublehands",
        "drx",
        "Male Pose E",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleposef"] = { --- Custom Emote By DRX Animations
        "drx@m_standhide",
        "drx",
        "Male Pose F",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleposee1"] = { --- Custom Emote By DRX Animations
        "drx@malestand2",
        "xrd",
        "Male Pose E1",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleposef1"] = { --- Custom Emote By DRX Animations
        "drx@malestand3c",
        "xrd",
        "Male Pose F1",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleposeg"] = { --- Custom Emote By DRX Animations
        "drx@pose_male",
        "pose_male",
        "Male Pose G",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleposeh"] = { --- Custom Emote By MrWitt
        "mrwitt@gentleman_style_male",
        "mrwitt",
        "Male Pose H",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleposei"] = { --- Custom Emote By MrWitt
        "mrwitt@thoughtful_man_m",
        "mrwitt",
        "Male Pose I",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleposetie"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023
        "mrwitt@tie_perfection_in_suit_male",
        "mrwitt",
        "Male Pose Tie",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["malecrossarms"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023
        "cross_arms@dark",
        "cross_arms_clip",
        "Male Cross Arms",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}

    },
    ["malemiddlefinger"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023
        "stand_middlefinger@dark",
        "stand_middlefinger_clip",
        "Male Middle Finger",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["malefistface"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023
        "fist_face@darksj",
        "fist_face_clip",
        "Male Fist Face",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["malepose4"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023
        "fuckm@nxsty",
        "fuckm_clip",
        "Male Pose 4",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["malegunpose1"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023
        "gun_ink@darksj",
        "gun_ink_clip",
        "Male Gun Pose 1",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["malepose5"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023
        "koko_male@darksj",
        "koko_male_clip",
        "Male Pose 5",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["malepose3"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023
        "male_solo_1@darksj",
        "male_solo_1_clip",
        "Male Pose 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["malepose2"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023
        "male_solo_3@darksj",
        "male_solo_3_clip",
        "Male Pose 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["malepose1"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023
        "male_solo_4@darksj",
        "male_solo_4_clip",
        "Male Pose 1",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["maleshoecheck"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023
        "side_shoe_check@darksj",
        "side_shoe_check_clip",
        "Male Shoe Check Pose",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["malegangpose"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023
        "westside_cap@darksj",
        "westside_cap_clip",
        "Male Gang Pose",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["illuminati"] = { -- Custom Emote By EnchantedBrwny
        "ebrwny_illum",
        "ebrwny_illum003",
        "Illuminati Hand Sign",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["illuminati2"] = { -- Custom Emote By EnchantedBrwny
        "ebrwny_illum",
        "ebrwny_illum001",
        "Illuminati Hand Sign 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["illuminati3"] = { -- Custom Emote By EnchantedBrwny
        "ebrwny_illum",
        "ebrwny_illum002",
        "Illuminati Hand Sign 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["gunpoint"] = { --- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations
        "male_gun@vanessssi",
        "male_gun_clip",
        "Gun Point - Robbery",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["search3"] = {
        "anim@gangops@facility@servers@bodysearch@",
        "player_search",
        "Search",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["takegun"] = {
        "reaction@intimidation@1h",
        "intro",
        "Take Out Gun",
        AnimationOptions = {
            EmoteLoop = false,
            EmoteMoving = true,
            EmoteDuration = 2500
        }
    },
    ["fuelcar"] = {
        "timetable@gardener@filling_can",
        "gar_ig_5_filling_can",
        "Fuel Car",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["cloudgaze2"] = {
        "switch@trevor@annoys_sunbathers",
        "trev_annoys_sunbathers_loop_guy",
        "Allongé dos au sol détendu",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["cop2"] = {
        "anim@amb@nightclub@peds@",
        "rcmme_amanda1_stand_loop_cop",
        "Flic bras croisé",
        AnimationOptions = {EmoteLoop = true}
    },
    ["cop3"] = {
        "amb@code_human_police_investigate@idle_a",
        "idle_b",
        "Flic appel radio",
        AnimationOptions = {EmoteLoop = true}
    },
    ["crossarms"] = {
        "amb@world_human_hang_out_street@female_arms_crossed@idle_a",
        "idle_a",
        "Croiser les bras",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["crossarms2"] = {
        "amb@world_human_hang_out_street@male_c@idle_a",
        "idle_b",
        "Croiser les bras 2",
        AnimationOptions = {EmoteMoving = true}
    },
    ["crossarms3"] = {
        "anim@heists@heist_corona@single_team",
        "single_team_loop_boss",
        "Croiser les bras 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["crossarms4"] = {
        "random@street_race",
        "_car_b_lookout",
        "Croiser les bras 4",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["crossarms5"] = {
        "anim@amb@nightclub@peds@",
        "rcmme_amanda1_stand_loop_cop",
        "Croiser les bras 5",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["crossarms6"] = {
        "random@shop_gunstore",
        "_idle",
        "Croiser les bras 6",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["elbow"] = {
        "anim@veh@lowrider@std@ds@arm@base",
        "sit_low_lowdoor",
        "Bras a la fenetre",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["elbow2"] = { -- Custom Emote By Chocoholic Animations 
        "chocoholic@single47",
        "single47_clip",
        "Bras a la fenetre 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["fallasleep"] = {
        "mp_sleep",
        "sleep_loop",
        "Dormir debout",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["foldarms2"] = {
        "anim@amb@nightclub@peds@",
        "rcmme_amanda1_stand_loop_cop",
        "Bras croisé 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["foldarms"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "stand_phone_phoneputdown_idle_nowork",
        "Bras croisé",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["crossarmsside"] = {
        "rcmnigel1a_band_groupies",
        "base_m2",
        "Croiser les bras avec la tête sur le côté",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["idle"] = {
        "anim@heists@heist_corona@team_idles@male_a",
        "idle",
        "Patienter",
        AnimationOptions = {EmoteLoop = true}
    },
    ["idle8"] = {
        "amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Patienter 8"
    },
    ["idle9"] = {
        "friends@fra@ig_1",
        "base_idle",
        "Patienter 9",
        AnimationOptions = {EmoteLoop = true}
    },
    ["idle10"] = {
        "mp_move@prostitute@m@french",
        "idle",
        "Patienter 10",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["idle11"] = {
        "random@countrysiderobbery",
        "idle_a",
        "Patienter 11",
        AnimationOptions = {EmoteLoop = true}
    },
    ["idle2"] = {
        "anim@heists@heist_corona@team_idles@female_a",
        "idle",
        "Patienter 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["idle3"] = {
        "anim@heists@humane_labs@finale@strip_club",
        "ped_b_celebrate_loop",
        "Patienter 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["idle4"] = {
        "anim@mp_celebration@idles@female",
        "celebration_idle_f_a",
        "Patienter 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["idle5"] = {
        "anim@mp_corona_idles@female_b@idle_a",
        "idle_a",
        "Patienter 5",
        AnimationOptions = {EmoteLoop = true}
    },
    ["idle6"] = {
        "anim@mp_corona_idles@male_c@idle_a",
        "idle_a",
        "Patienter 6",
        AnimationOptions = {EmoteLoop = true}
    },
    ["idle7"] = {
        "anim@mp_corona_idles@male_d@idle_a",
        "idle_a",
        "Patienter 7",
        AnimationOptions = {EmoteLoop = true}
    },
    ["idledrunk"] = {
        "random@drunk_driver_1",
        "drunk_driver_stand_loop_dd1",
        "Bourré sur place",
        AnimationOptions = {EmoteLoop = true}
    },
    ["idledrunk2"] = {
        "random@drunk_driver_1",
        "drunk_driver_stand_loop_dd2",
        "Bourré sur place 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["idledrunk3"] = {
        "missarmenian2",
        "standing_idle_loop_drunk",
        "Bourré sur place 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["kneel2"] = {
        "rcmextreme3",
        "idle",
        "S'agenouiller 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["kneel3"] = {
        "amb@world_human_bum_wash@male@low@idle_a",
        "idle_a",
        "S'agenouiller 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["kneelthot"] = {
        "anim@model_kylie_insta",
        "kylie_insta_clip",
        "S'agenouiller 4 - Insta",
        AnimationOptions = {EmoteLoop = true}
    },
    ["kneelbored"] = { --- Custom Emote By Chocoholic Animations 
        "chocoholic@duo17",
        "duo17_clip",
        "Kneel Bored Pose",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 200,
            ExitEmote = "standup",
            ExitEmoteType = "Exits"
        }
    },
    ["kneelpeace"] = { --- Custom Emote By Chocoholic Animations 
        "chocoholic@duo18",
        "duo18_clip",
        "Kneel Peace Sign Pose",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 200,
            ExitEmote = "standup",
            ExitEmoteType = "Exits"
        }
    },
    ["shoepose"] = { --- Custom Emote By Darks Animations
        "male_duo_a@darksj",
        "male_duo_a_clip",
        "Shoe Kick Pose",
        AnimationOptions = {EmoteLoop = true, StartDelay = 240}
    },
    ["rap"] = { --- Custom Emote By Darks Animations
        "couple_singing_m@darks37",
        "couple_singing_m_clip",
        "Rap / Sing",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["squatgunpose"] = { --- Custom Emote By Darks Animations
        "ganggirls_pose1@darks37",
        "ganggirls_pose1_clip",
        "Squat Gun Pose - Left",
        AnimationOptions = {EmoteLoop = true}
    },
    ["squatgunpose3"] = { --- Custom Emote By Darks Animations
        "gun_prime_2@darksj",
        "gun_prime_2_clip",
        "Squat Gun Pose 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lean2"] = {
        "amb@world_human_leaning@female@wall@back@hand_up@idle_a",
        "idle_a",
        "Poser sur le mur",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lean3"] = {
        "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a",
        "idle_a",
        "Poser sur le mur détendu",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lean4"] = {
        "amb@world_human_leaning@male@wall@back@foot_up@idle_a",
        "idle_a",
        "Poser sur le mur mains croisés",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lean5"] = {
        "amb@world_human_leaning@male@wall@back@hands_together@idle_b",
        "idle_b",
        "S'appuyer 5",
        AnimationOptions = {EmoteLoop = true}
    },
    ["leanflirt"] = {
        "random@street_race",
        "_car_a_flirt_girl",
        "Tenir ses genoux",
        AnimationOptions = {EmoteLoop = true}
    },
    ["leanbar2"] = {
        "amb@prop_human_bum_shopping_cart@male@idle_a",
        "idle_c",
        "S'appuyer sur un bar 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["leanbar3"] = {
        "anim@amb@nightclub@lazlow@ig1_vip@",
        "clubvip_base_laz",
        "S'appuyer sur un bar 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["leanbar4"] = {
        "anim@heists@prison_heist",
        "ped_b_loop_a",
        "S'appuyer sur un bar 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["leanhigh"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_one",
        "Pousser un caddie",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["leanhigh2"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_two",
        "Pousser un caddie 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["leanside"] = {
        "timetable@mime@01_gc",
        "idle_a",
        "S'accrocher sur le côté",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["leanside2"] = {
        "misscarstealfinale",
        "packer_idle_1_trevor",
        "S'accrocher sur le côté 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["leanside3"] = {
        "misscarstealfinalecar_5_ig_1",
        "waitloop_lamar",
        "S'accrocher sur le côté 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["leanside4"] = {
        "misscarstealfinalecar_5_ig_1",
        "waitloop_lamar",
        "S'accrocher sur le côté 4",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["leanside5"] = {
        "rcmjosh2",
        "josh_2_intp1_base",
        "S'accrocher sur le côté 5",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["leanplan"] = {
        "anim@amb@board_room@diagram_blueprints@",
        "idle_01_amy_skater_01",
        "Lean On Table",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 200,
            ExitEmote = "offtable",
            ExitEmoteType = "Exits"
        }
    },
    ["prone"] = {
        "missfbi3_sniping",
        "prone_dave",
        "S'allonger à plat ventre",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["relax"] = {
        "lying@on_grass",
        "base",
        "Allonger de manière relax - 1",
        AnimationOptions = {
            EmoteLoop = true,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["relax2"] = {
        "lying@on_couch_legs_crossed",
        "base",
        "Allonger de manière relax - 2",
        AnimationOptions = {
            EmoteLoop = true,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sunbathe"] = {
        "amb@world_human_sunbathe@male@back@base",
        "base",
        "Bronzer sur le dos",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sunbathe2"] = {
        "amb@world_human_sunbathe@female@back@base",
        "base",
        "Bronzer sur le dos 2",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sexypose"] = { -- Custom Emote By Little Spoon
        "littlespoon@sexy003",
        "sexy003",
        "Sexy Pose",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["sexypose2"] = { -- Custom Emote By Little Spoon
        "littlespoon@sexy004",
        "sexy004",
        "Sexy Pose 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["sexypose3"] = { -- Custom Emote By Little Spoon
        "littlespoon@sexy005",
        "sexy005",
        "Sexy Pose 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["sexypose4"] = { -- Custom Emote By Little Spoon
        "littlespoon@sexy006",
        "sexy006",
        "Sexy Pose 4",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["sexypose5"] = { -- Custom Emote By Little Spoon
        "littlespoon@sexy009",
        "sexy009",
        "Sexy Pose 5",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["sexypose6"] = { -- Custom Emote By Little Spoon
        "littlespoon@sexy012",
        "sexy012",
        "Sexy Pose 5",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["surrender"] = {
        "random@arrests@busted",
        "idle_a",
        "Se rendre",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "surrender_exit",
            ExitEmoteType = "Exits"
        }
    },
    ["surrender2"] = {
        "mp_bank_heist_1",
        "f_cower_02",
        "Se rendre 2",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["surrender3"] = {
        "mp_bank_heist_1",
        "m_cower_01",
        "Se rendre 3",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["surrender4"] = {
        "mp_bank_heist_1",
        "m_cower_02",
        "Se rendre 4",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["surrender5"] = {
        "random@arrests",
        "kneeling_arrest_idle",
        "Se rendre 5",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "surrender_exit",
            ExitEmoteType = "Exits"
        }
    },
    ["surrender6"] = {
        "rcmbarry",
        "m_cower_01",
        "Se rendre 6",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sleep"] = {
        "timetable@tracy@sleep@",
        "idle_c",
        "Dormir",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "sit_phone_phoneputdown_idle_nowork",
        "S'asseoir",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit2"] = {
        "rcm_barry3",
        "barry_3_sit_loop",
        "S'asseoir 2",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit3"] = {
        "amb@world_human_picnic@male@idle_a",
        "idle_a",
        "S'asseoir 3",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit4"] = {
        "amb@world_human_picnic@female@idle_a",
        "idle_a",
        "S'asseoir 4",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit5"] = {
        "anim@heists@fleeca_bank@ig_7_jetski_owner",
        "owner_idle",
        "S'asseoir 5",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit6"] = {
        "timetable@jimmy@mics3_ig_15@",
        "idle_a_jimmy",
        "S'asseoir 6",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit7"] = {
        "anim@amb@nightclub@lazlow@lo_alone@",
        "lowalone_base_laz",
        "S'asseoir 7",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 900,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit8"] = {
        "timetable@jimmy@mics3_ig_15@",
        "mics3_15_base_jimmy",
        "S'asseoir 8",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit9"] = {
        "amb@world_human_stupor@male@idle_a",
        "idle_a",
        "S'asseoir 9",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitfu"] = {
        "chocoholic@single80",
        "single80_clip",
        "Sit Middle Finger",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"

        }
    },
    ["sitlean"] = {
        "timetable@tracy@ig_14@",
        "ig_14_base_tracy",
        "S'asseoir Timidement",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitsad"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "sit_phone_phoneputdown_sleeping-noworkfemale",
        "S'asseoir Tristement",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitsad2"] = {
        "anim@female_sit_01",
        "f_sit_01_clip",
        "Sit Sad 2",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitscared"] = {
        "anim@heists@ornate_bank@hostages@hit",
        "hit_loop_ped_b",
        "S'asseoir effrayé",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitscared2"] = {
        "anim@heists@ornate_bank@hostages@ped_c@",
        "flinch_loop",
        "S'asseoir effrayé 2",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitscared3"] = {
        "anim@heists@ornate_bank@hostages@ped_e@",
        "flinch_loop",
        "S'asseoir effrayé 3",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitdrunk"] = {
        "timetable@amanda@drunk@base",
        "base",
        "S'asseoir bourré",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchair"] = {
        "timetable@ron@ig_3_couch",
        "base",
        "Sit Chair",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchair2"] = {
        "timetable@ron@ig_5_p3",
        "ig_5_p3_base",
        "S'asseoir sur une chaise 2",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchair3"] = {
        "timetable@reunited@ig_10",
        "base_amanda",
        "S'asseoir sur une chaise 3 (Femme)",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchair4"] = {
        "timetable@ron@ig_3_couch",
        "base",
        "S'asseoir sur une chaise 4",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchair5"] = {
        "timetable@jimmy@mics3_ig_15@",
        "mics3_15_base_tracy",
        "S'asseoir sur une chaise 5",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchair6"] = {
        "timetable@maid@couch@",
        "base",
        "S'asseoir sur une chaise 6",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchairside"] = {
        "timetable@ron@ron_ig_2_alt1",
        "ig_2_alt1_base",
        "S'asseoir sur une chaise de côté",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["sitcute"] = { -- Custom Emote By QueenSistersAnimations
        "sitkylie@queensisters",
        "kylie_clip",
        "S'asseoir de manière cute",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["tpose"] = {
        "missfam5_yoga",
        "a2_pose",
        "T Pose",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["tpose2"] = {
        "mp_sleep",
        "bind_pose_180",
        "T Pose 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["think5"] = {
        "mp_cp_welcome_tutthink",
        "b_think",
        "Réflechir 5",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 2000}
    },
    ["think"] = {
        "misscarsteal4@aliens",
        "rehearsal_base_idle_director",
        "Réflechir",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["think3"] = {
        "timetable@tracy@ig_8@base",
        "base",
        "Réflechir 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["think2"] = {
        "missheist_jewelleadinout",
        "jh_int_outro_loop_a",
        "Réflechir 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["laydownsexy"] = { -- Custom emote by Struggleville
        "anim@female_laying_sexy",
        "laying_sexy_clip",
        "Couché Sexy",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["model"] = { -- Custom emote by Struggleville
        "anim@female_model_showoff",
        "model_showoff_clip",
        "Modele Pose Sexy",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["model2"] = { -- Custom Emote By QueenSistersAnimations
        "sitdownonknees@queensisters",
        "sitdown_clip",
        "Modele Pose 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["model3"] = { -- Custom emote by Struggleville
        "anim@female_model_photo_cute",
        "photo_cute_clip",
        "Modele Pose 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["layncry"] = {
        "anim@amb@nightclub@lazlow@lo_sofa@",
        "lowsofa_dlg_fuckedup_laz",
        "Coucher en pleurs",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["layncry2"] = {
        "anim@amb@nightclub@lazlow@lo_sofa@",
        "lowsofa_base_laz",
        "Coucher en pleurs 2",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["layncry3"] = {
        "anim@amb@nightclub@lazlow@lo_sofa@",
        "lowsofa_dlg_notagain_laz",
        "Coucher en pleurs 3",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["layncry4"] = {
        "anim@amb@nightclub@lazlow@lo_sofa@",
        "lowsofa_dlg_notagain_laz",
        "Coucher en pleurs 4",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["layncry5"] = {
        "anim@amb@nightclub@lazlow@lo_sofa@",
        "lowsofa_dlg_shit2strong_laz",
        "Coucher en pleurs 5",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["layncry6"] = {
        "misschinese2_crystalmaze",
        "2int_loop_a_taocheng",
        "Coucher en pleurs 6",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["laysexy"] = { -- Custom Emote By Amnilka
        "amnilka@photopose@female@homepack001",
        "amnilka_femalehome_photopose_004",
        "Coucher Sexy",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["gungirl1"] = { -- Custom Emote By Struggleville
        "anim@female_gunbunny_rifle_photo",
        "rifle_photo_clip",
        "Pose avec arme (femme)",
        AnimationOptions = {EmoteLoop = true}
    },
    ["vest"] = {
        "anim@male@holding_vest",
        "holding_vest_clip",
        "Attendre en tenant son GPB",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["vest2"] = {
        "anim@holding_side_vest",
        "holding_side_vest_clip",
        "Attendre en tenant son GPB 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["vest3"] = {
        "anim@holding_siege_vest_side",
        "holding_siege_vest_side_clip",
        "Attendre en tenant son GPB 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["vest4"] = {
        "anim@male@holding_vest_2",
        "holding_vest_2_clip",
        "Attendre en tenant son GPB 4",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["vest5"] = {
        "anim@male@holding_vest_siege",
        "holding_vest_siege_clip",
        "Attendre en tenant son GPB 5",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["vest6"] = {
        "anim@male@holding_vest_siege_2",
        "holding_vest_siege_2_clip",
        "Attendre en tenant son GPB 6",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait"] = {
        "random@shop_tattoo",
        "_idle_a",
        "Attendre",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait2"] = {
        "missbigscore2aig_3",
        "wait_for_van_c",
        "Attendre 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait3"] = {
        "amb@world_human_hang_out_street@female_hold_arm@idle_a",
        "idle_a",
        "Attendre 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait4"] = {
        "amb@world_human_hang_out_street@Female_arm_side@idle_a",
        "idle_a",
        "Attendre 4",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait5"] = {
        "missclothing",
        "idle_storeclerk",
        "Attendre 5",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait6"] = {
        "timetable@amanda@ig_2",
        "ig_2_base_amanda",
        "Attendre 6",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait7"] = {
        "rcmnigel1cnmt_1c",
        "base",
        "Attendre 7",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait8"] = {
        "rcmjosh1",
        "idle",
        "Attendre 8",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait9"] = {
        "rcmjosh2",
        "josh_2_intp1_base",
        "Attendre 9",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait10"] = {
        "timetable@amanda@ig_3",
        "ig_3_base_tracy",
        "Attendre 10",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait11"] = {
        "misshair_shop@hair_dressers",
        "keeper_base",
        "Attendre 11",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait12"] = {
        "rcmjosh1",
        "keeper_base",
        "Attendre 12",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["wait13"] = {
        "rcmnigel1a",
        "base",
        "Attendre 13",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["statue2"] = {
        "fra_0_int-1",
        "cs_lamardavis_dual-1",
        "Statue 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["statue3"] = {
        "club_intro2-0",
        "csb_englishdave_dual-0",
        "Statue 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["valet"] = {
        "anim@amb@casino@valet_scenario@pose_a@",
        "base_a_m_y_vinewood_01",
        "Valet",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["valet2"] = {
        "anim@amb@casino@valet_scenario@pose_b@",
        "base_a_m_y_vinewood_01",
        "Valet 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["valet3"] = {
        "anim@amb@casino@valet_scenario@pose_d@",
        "base_a_m_y_vinewood_01",
        "Valet 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["fspose"] = {
        "missfam5_yoga",
        "c2_pose",
        "F Sex Pose",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true},
        AdultAnimation = true
    },
    ["fspose2"] = {
        "missfam5_yoga",
        "c6_pose",
        "F Sex Pose 2",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true},
        AdultAnimation = true
    },
    ["fspose3"] = {
        "anim@amb@carmeet@checkout_car@",
        "female_c_idle_d",
        "F Sex Pose 3",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true},
        AdultAnimation = true
    },
    ["showerf"] = {
        "mp_safehouseshower@female@",
        "shower_enter_into_idle",
        "Entrer Douche - Femme",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["showerf2"] = {
        "mp_safehouseshower@female@",
        "shower_idle_a",
        "Douche - Femme",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["showerf3"] = {
        "mp_safehouseshower@female@",
        "shower_idle_b",
        "Douche 2 - Femme",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["showerm"] = {
        "mp_safehouseshower@male@",
        "male_shower_idle_a",
        "Entrer Douche - Homme",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["showerm2"] = {
        "mp_safehouseshower@male@",
        "male_shower_idle_b",
        "Douche 2 - Homme",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["showerm3"] = {
        "mp_safehouseshower@male@",
        "male_shower_idle_c",
        "Douche 3 - Homme",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["showerm4"] = {
        "mp_safehouseshower@male@",
        "male_shower_idle_d",
        "Douche 4 - Homme",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["policecrowd"] = {
        "amb@code_human_police_crowd_control@idle_a",
        "idle_a",
        "Contrôle de la foule",
        AnimationOptions = {EmoteLoop = true}
    },
    ["policecrowd2"] = {
        "amb@code_human_police_crowd_control@idle_b",
        "idle_d",
        "Contrôle de la foule 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["k9pose"] = {
        "anim@k9_pose",
        "hug_dog",
        "Faire un câlin a son chien",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["sunbathe3"] = {
        "amb@world_human_sunbathe@female@front@base",
        "base",
        "Bronzer sur le ventre",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["femalestandcute"] = {
        "stand_cute_6@dark",
        "stand_cute_6_clip",
        "Female Stand Cute Pose",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femalestandcute1"] = {
        "stand_fem_1@darksj",
        "stand_fem_1_clip",
        "Female Stand Cute Pose 1",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femalestandcute3"] = {
        "anim@female_model_14",
        "f_model_14_clip",
        "Female Stand Cute Pose 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femalestandcutefinger"] = {
        "anim@female_model_15",
        "f_model_15_clip",
        "Female Stand Cute Pose Finger",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femalestandcute4"] = {
        "anim@female_model_17",
        "f_model_17_clip",
        "Female Stand Cute Pose 4",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["malestandpose"] = {
        "anim@male_model_11",
        "m_model_11_clip",
        "Male Stand Pose",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["femalesitcute"] = {
        "sit_cute_1@dark",
        "sit_cute_1_clip",
        "Female Sit Cute",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["femalesitcute1"] = {
        "mrwitt@chin_support_on_floor",
        "mrwitt",
        "Female Sit Cute 1",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["femalesitcute2"] = {
        "beach_1@janina234",
        "beach_1_clip",
        "Female Sit Cute 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["femaleonknees"] = {
        "beach_4@janina234",
        "beach_4_clip",
        "Female On Knees Pose",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "standup",
            ExitEmoteType = "Exits"
        }
    },
    ["femaleonknees1"] = {
        "on_the_knees@darksj",
        "on_the_knees_clip",
        "Female On Knees Pose 1",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "standup",
            ExitEmoteType = "Exits"
        }
    },
    ["femaleonknees2"] = {
        "anim@female_model_21",
        "f_model_21_clip",
        "Female On Knees Pose 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["daydream"] = { --- Custom Emote By Darks Animations
        "girl_groupe_d@darksj",
        "girl_groupe_d_clip",
        "Daydream In The Clouds",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["uwu2"] = { --- Custom Emote By EnchantedBrwny
        "ebrwny_pack000",
        "ebrwny_shy",
        "UwU 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["rawr"] = { --- Custom Emote By EnchantedBrwny
        "ebrwny_pack000",
        "ebrwny_rawr",
        "Rawr",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["stop"] = { --- Custom Emote By EnchantedBrwny
        "ebrwny_pack000",
        "ebrwny_stop",
        "Stop",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["sassy"] = { --- Custom Emote By EnchantedBrwny
        "ebrwny_pack000",
        "ebrwny_sass",
        "Sassy",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    --[[ ["sitsad3"] = { --- Custom Emote By EnchantedBrwny
        "ebrwny_pack000",
        "ebrwny_sitf000",
        "Sit Sad 3",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    }, ]]
    --[[ ["sitsad4"] = { --- Custom Emote By EnchantedBrwny
        "ebrwny_pack000",
        "ebrwny_sitf001",
        "Sit Sad 4",
        AnimationOptions = {
            StartDelay = 600,
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    }, ]]
    ["bend"] = {
        "ebrwny_pack000",
        "ebrwny_bend",
        "Bent over",
        AnimationOptions = {
            StartDelay = 600,
            EmoteLoop = true,
            EmoteMoving = true
        },
        AdultAnimation = true
    },
	["jcheckwatch"] = {
		"amb@code_human_wander_idles_fat@male@idle_a",
		"idle_a_wristwatch",
		"Check Watch · Male",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jpicking"] = {
		"amb@prop_human_movie_bulb@idle_a",
		"idle_a",
		"Picking",
		AnimationOptions =
		{
			EmoteMoving = true,
			EmoteDuration = 2500,
		}
	},
	["jgangaim"] = {
		"combat@aim_variations@1h@gang",
		"aim_variation_b",
		"Gang Aim",
		AnimationOptions =
		{
			EmoteMoving = true,
			EmoteLoop = true
		}
	},
	["jshowboobs"] = {
		"mini@strip_club@backroom@",
		"stripper_b_backroom_idle_b",
		"Show Boobs",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 6000,
		}
	},
	["jcleanleg"] = {
		"mini@strip_club@backroom@",
		"stripper_c_leadin_backroom_idle_a",
		"Clean Legs",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 6000,
		}
	},
	["jshowboobs2"] = {
		"mini@strip_club@idles@stripper",
		"stripper_idle_05",
		"Show Boobs 2",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 6000,
		}
	},
	["jlockcar"] = {
		"anim@mp_player_intmenu@key_fob@",
		"fob_click",
		"Lock Car",
		AnimationOptions =
		{
			EmoteMoving = true,
			EmoteDuration = 2500,
		}
	},
	["jselfie5"] = {
		"cellphone@self",
		"selfie",
		"Selfie 3",
		AnimationOptions =
		{
			EmoteMoving = false,
			Prop = "prop_npc_phone_02",
			PropBone = 28422,
			PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
			EmoteLoop = true
		}
	},
	["jselfiewc"] = {
		"cellphone@self@franklin@",
		"west_coast",
		"Selfie West Coast",
		AnimationOptions =
		{
			EmoteMoving = false,
			Prop = "prop_npc_phone_02",
			PropBone = 28422,
			PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
			EmoteLoop = true
		}
	},
	["jselfie3"] = {
		"cellphone@self@michael@",
		"finger_point",
		"Selfie Finger",
		AnimationOptions =
		{
			Prop = "prop_npc_phone_02",
			PropBone = 28422,
			PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
			EmoteMoving = false,
			EmoteLoop = true
		}
	},
	["jselfie4"] = {
		"cellphone@self@franklin@",
		"chest_bump",
		"Selfie Chest Bump",
		AnimationOptions =
		{
			Prop = "prop_npc_phone_02",
			PropBone = 28422,
			PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
			EmoteMoving = false,
			EmoteLoop = true
		}
	},
	["jselfie1"] = {
		"cellphone@self@trevor@",
		"throat_slit",
		"Selfie",
		AnimationOptions =
		{
			Prop = "prop_npc_phone_02",
			PropBone = 28422,
			PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
			EmoteMoving = false,
			EmoteLoop = true
		}
	},
	["jselfie2"] = {
		"cellphone@self@trevor@",
		"proud_finger",
		"Selfie2",
		AnimationOptions =
		{
			Prop = "prop_npc_phone_02",
			PropBone = 28422,
			PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
			EmoteMoving = false,
			EmoteLoop = true
		}
	},
	["jkhaby"] = {
		"missarmenian3@simeon_tauntsidle_b",
		"areyounotman",
		"Khaby · Special",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jdepressed"] = {
		"oddjobs@bailbond_hobodepressed",
		"base",
		"Depressed",
		AnimationOptions =
		{
			EmoteMoving = true,
		}
	},
	["jcarsign"] = {
		"amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base",
		"idle_a",
		"Gang Sign · Car",
		AnimationOptions =
		{
			EmoteMoving = true,
			EmoteDuration = 2500,
		}
	},
	["jcarsign2"] = {
		"amb@code_human_in_car_mp_actions@gang_sign_a@low@ds@base",
		"idle_a",
		"Gang Signs 2 · Car",
		AnimationOptions =
		{
			EmoteMoving = true,
			EmoteDuration = 2500,
		}
	},
	["jcarlowrider"] = {
		"anim@veh@lowrider@low@front_ds@arm@base",
		"sit",
		"Lowrider Style · Car",
		AnimationOptions =
		{
			EmoteMoving = true,
			EmoteLoop = true
		}
	},
	["jcarlowrider2"] = {
		"anim@veh@lowrider@std@ds@arm@music@mexicanidle_a",
		"idle",
		"Lowrider Mexican Style · Car",
		AnimationOptions =
		{
			EmoteMoving = true,
			EmoteLoop = true
		}
	},
	["jleaningwallback"] = {
		"anim@amb@casino@peds@",
		"amb_world_human_leaning_male_wall_back_mobile_idle_a",
		"Leaning Wall Back · Male",
		AnimationOptions =
		{
			Prop = "prop_npc_phone_02",
			PropBone = 28422,
			PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
			EmoteMoving = true,
			EmoteLoop = true
		}
	},
	["jreactiona"] = {
		"random@shop_robbery_reactions@",
		"absolutely",
		"Reaction Absolutely",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jreactanger"] = {
		"random@shop_robbery_reactions@",
		"anger_a",
		"Reaction Anger",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jreactwhy"] = {
		"random@shop_robbery_reactions@",
		"is_this_it",
		"Reaction Why",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jreactscrew"] = {
		"random@shop_robbery_reactions@",
		"screw_you",
		"Reaction Screw You",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jreactshock"] = {
		"random@shop_robbery_reactions@",
		"shock",
		"Reaction Shock",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jreactgoodc"] = {
		"missclothing",
		"good_choice_storeclerk",
		"Reaction Good Choice",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jtryc"] = {
		"clothingtie",
		"try_tie_neutral_c",
		"Try  Clothes",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jtryc2"] = {
		"clothingtie",
		"try_tie_neutral_d",
		"Try  Clothes 2",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jreacteasy"] = {
		"gestures@m@car@std@casual@ds",
		"gesture_easy_now",
		"Reaction Easy Now",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jreactıwill"] = {
		"gestures@m@car@std@casual@ds",
		"gesture_i_will",
		"Reaction I will",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jreactnoway"] = {
		"gestures@m@car@std@casual@ds",
		"gesture_no_way",
		"Reaction No Way",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jreactbye"] = {
		"gestures@f@standing@casual",
		"gesture_bye_hard",
		"Reaction Bye Hard",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jreacthello"] = {
		"gestures@f@standing@casual",
		"gesture_hello",
		"Reaction Hello",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jlookatplayer"] = {
		"friends@frl@ig_1",
		"look_lamar",
		"Look At Player",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jreactgreat"] = {
		"mp_cp_welcome_tutgreet",
		"greet",
		"Great",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jfakepunch"] = {
		"missarmenian2",
		"fake_punch_walk_by_lamar",
		"Fake Punch",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jreactdamn"] = {
		"missheist_jewel",
		"damn",
		"Reaction Damn",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jimtellingyou"] = {
		"missheist_jewel",
		"im_telling_you",
		"I'm telling you",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jreactno"] = {
		"missheist_jewel",
		"despair",
		"Reaction No",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jdontkillme"] = {
		"missheist_jewel",
		"manageress_kneel_loop",
		"Dont Kill Me",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jbangbang"] = {
		"anim@mp_player_intcelebrationfemale@bang_bang",
		"bang_bang",
		"Bang Bang",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jtryshirtn"] = {
		"clothingshirt",
		"try_shirt_negative_a",
		"Try Shirt Negative",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jtryshirtp"] = {
		"clothingshirt",
		"try_shirt_positive_a",
		"Try Shirt Positive",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jtryshoes"] = {
		"clothingshoes",
		"try_shoes_positive_d",
		"Try Shoes",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jtryshoes2"] = {
		"clothingshoes",
		"try_shoes_positive_c",
		"Try Shoes 2",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["joverhere"] = {
		"friends@fra@ig_1",
		"over_here_idle_a",
		"Over Here",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jwashingface"] = {
		"missmic2_washing_face",
		"michael_washing_face",
		"Washing Face",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jlastday"] = {
		"misstrevor1",
		"ortega_outro_loop_ort",
		"Last Day",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jtryg"] = {
		"mp_clothing@female@glasses",
		"try_glasses_positive_a",
		"Try Glasses · Female",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jpickup"] = {
		"pickup_object",
		"pickup_low",
		"Pick Up",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jstretchl"] = {
		"switch@franklin@bed",
		"stretch_long",
		"Stretch Long",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jhos"] = {
		"amb@world_human_hang_out_street@male_a@idle_a",
		"idle_a",
		"Hang Out Street · Male",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jhos2"] = {
		"amb@world_human_hang_out_street@male_c@base",
		"base",
		"Hang Out Street 2 · Male",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jguardaim"] = {
		"guard_reactions",
		"1hand_aiming_cycle",
		"Guard Aim",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jgready"] = {
		"switch@franklin@getting_ready",
		"002334_02_fras_v2_11_getting_dressed_exit",
		"Getting Ready",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jlao"] = {
		"move_clown@p_m_two_idles@",
		"fidget_look_at_outfit",
		"Look At Outfits",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 6000,
		}
	},
	["jtoilet"] = {
		"switch@trevor@on_toilet",
		"trev_on_toilet_loop",
		"Have A Shit",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jtoilet2"] = {
		"timetable@trevor@on_the_toilet",
		"trevonlav_struggleloop",
		"Have A Shit 2",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jcovermale2"] = {
		"amb@code_human_cower@male@base",
		"base",
		"Cover · Male",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jvalet"] = {
		"anim@amb@world_human_valet@normal@base@",
		"base_a_m_y_vinewood_01",
		"Valet",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jvalet2"] = {
		"anim@amb@world_human_valet@formal_right@base@",
		"base_a_m_y_vinewood_01",
		"Valet 2",
		AnimationOptions =
		{
			EmoteMoving = true,
			EmoteLoop = true
		}
	},
	["jsunbathem"] = {
		"amb@world_human_sunbathe@male@back@idle_a",
		"idle_c",
		"Sunbathe · Male",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true
		}
	},
	["jsunbathem2"] = {
		"amb@world_human_sunbathe@male@front@base",
		"base",
		"Sunbathe 2 · Male",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jleancar"] = {
		"anim@scripted@carmeet@tun_meet_ig2_race@",
		"base",
		"Lean Car",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["jcheckout"] = {
		"anim@amb@carmeet@checkout_car@male_a@idles",
		"idle_b",
		"Check Out · Female",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jcheckout2"] = {
		"anim@amb@carmeet@checkout_car@male_c@idles",
		"idle_a",
		"Check Out 2 · Male",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jreadmessages"] = {
		"anim@amb@carmeet@take_photos@male_a@base",
		"base",
		"Read Messages · Male",
		AnimationOptions =
		{
			Prop = "prop_npc_phone_02",
			PropBone = 28422,
			PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
			EmoteMoving = false,
			EmoteLoop = true
		}
	},
	["jreadmessages2"] = {
		"anim@amb@carmeet@take_photos@female_b@base",
		"base",
		"Read Messages 2 · Female",
		AnimationOptions =
		{
			Prop = "prop_npc_phone_02",
			PropBone = 28422,
			PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
			EmoteMoving = false,
			EmoteLoop = true
		}
	},
	["jlistenmusic"] = {
		"anim@amb@carmeet@listen_music@male_a@trans",
		"a_trans_d",
		"Listen Music",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jogger"] = {
		"move_f@jogger",
		"idle",
		"Jogger · Female",
		AnimationOptions =
		{
			EmoteDuration = 2500,
			EmoteMoving = true,
		}
	},
	["jogger2"] = {
		"move_m@jogger",
		"idle",
		"Jogger · Male",
		AnimationOptions =
		{
			EmoteDuration = 2500,
			EmoteMoving = true,
		}
	},
	["jwtf"] = {
		"mini@triathlon",
		"wot_the_fuck",
		"Wot The Fuck",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jucdt"] = {
		"mini@triathlon",
		"u_cant_do_that",
		"U Cant Do That",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jwarmup"] = {
		"mini@triathlon",
		"ig_2_gen_warmup_01",
		"Warmup",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jwarmup2"] = {
		"mini@triathlon",
		"ig_2_gen_warmup_02",
		"Warmup 2",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jwarmup3"] = {
		"mini@triathlon",
		"jog_idle_f",
		"Warmup 3",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jwarmup4"] = {
		"mini@triathlon",
		"jog_idle_e",
		"Warmup 4",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jhmassage"] = {
		"missheistfbi3b_ig8_2",
		"cpr_loop_paramedic",
		"Heart Massage",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jpassout"] = {
		"missheistfbi3b_ig8_2",
		"cower_loop_victim",
		"Pass Out",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jddealer"] = {
		"amb@world_human_drug_dealer_hard@male@base",
		"base",
		"Drug Dealer · Male",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jswatch"] = {
		"amb@world_human_strip_watch_stand@male_c@idle_a",
		"idle_b",
		"Watch Strip · Male",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jcheckw"] = {
		"amb@world_human_bum_wash@male@high@base",
		"base",
		"Check Water",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jwaitt"] = {
		"oddjobs@taxi@",
		"idle_a",
		"Wait Taxi",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jnoway"] = {
		"oddjobs@towingpleadingbase",
		"base",
		"No Way",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jtsomething"] = {
		"oddjobs@bailbond_hobohang_out_street_c",
		"idle_c",
		"Tell Something",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jlfh"] = {
		"oddjobs@assassinate@old_lady",
		"looking_for_help",
		"Looking For Help",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jmstretch"] = {
		"oddjobs@assassinate@multi@",
		"idle_a",
		"Muscle Stretch",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jdj"] = {
		"anim@mp_player_intcelebrationmale@dj",
		"dj",
		"DJ",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdj2"] = {
		"anim@scripted@nightclub@dj@dj_moodm@",
		"moodm_cdj_left_a_12",
		"DJ 2",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdj3"] = {
		"anim@amb@nightclub@djs@switch@dixn_djset_switchover@",
		"dix_end_bg_female1",
		"DJ 3",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdj4"] = {
		"anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity",
		"trans_dance_facedj_li_to_mi_11_v1_male^3",
		"DJ 4",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jlmic"] = {
		"anim@veh@lowrider@std@ds@arm@music@hiphopidle_a",
		"idle",
		"Listen Music In Car",
		AnimationOptions =
		{
			EmoteMoving = true,
			EmoteDuration = 2500,
		}
	},
	["jgotc"] = {
		"random@getawaydriver@thugs",
		"base_a",
		"Get Off The Car",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["jvsad"] = {
		"anim@amb@business@bgen@bgen_no_work@",
		"sit_phone_phoneputdown_sleeping-noworkfemale",
		"Very Sad",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jdgrave"] = {
		"anim@amb@drug_field_workers@rake@male_a@base",
		"base",
		"Digging Grave",
		AnimationOptions =
		{
			Prop = 'prop_tool_shovel006',
			PropBone = 28422,
			PropPlacement = { 0.0, 0.1, -0.6, 0.0, 0.0, 180.0 },
			EmoteMoving = false,
			EmoteLoop = true
		}
	},
	["jbow3"] = {
		"missheistdockssetup1ig_10@base",
		"talk_pipe_base_worker1",
		"Bend Over Wait",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 2500,
		}
	},
	["jweeding"] = {
		"anim@amb@drug_field_workers@weeding@male_a@base",
		"base",
		"Weeding · Male",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jlookplan"] = {
		"missheist_agency2aig_4",
		"look_plan_c_worker2",
		"Look Plan",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 5000,
		}
	},
	["jgangdrink"] = {
		"amb@world_human_drinking_fat@beer@male@base",
		"base",
		"Gang Drink",
		AnimationOptions =
		{
			Prop = 'prop_cs_beer_bot_40oz_03',
			PropBone = 28422,
			PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
			EmoteMoving = true,
			EmoteLoop = true
		}
	},
	["jmleaning"] = {
		"amb@world_human_leaning@male@wall@back@mobile@base",
		"base",
		"Mobile Leaning · Male",
		AnimationOptions =
		{
			Prop = "prop_npc_phone_02",
			PropBone = 28422,
			PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
			EmoteMoving = false,
			EmoteLoop = true
		}
	},
	["jthanks"] = {
		"random@arrests",
		"thanks_male_05",
		"Thanks",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jtextingmale"] = {
		"amb@world_human_stand_mobile_fat@male@text@base",
		"base",
		"Texting · Male",
		AnimationOptions =
		{
			Prop = "prop_npc_phone_02",
			PropBone = 28422,
			PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
			EmoteMoving = true,
			EmoteLoop = true
		}
	},
	["jffb"] = {
		"timetable@trevor@skull_loving_bear",
		"skull_loving_bear",
		"F*ck From Behind",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jsitchair7"] = {
		"timetable@reunited@ig_10",
		"isthisthebest_jimmy",
		"Sit Chair 7",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jsitchair8"] = {
		"timetable@michael@on_sofabase",
		"sit_sofa_base",
		"Sit Chair 8",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jsitchair9"] = {
		"timetable@trevor@smoking_meth@base",
		"base",
		"Sit Chair 9",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jsitchair10"] = {
		"timetable@tracy@ig_7@base",
		"base",
		"Sit Chair 10",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jstandingt"] = {
		"amb@world_human_bum_standing@twitchy@base",
		"base",
		"Standing Twitchy",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jstandingfit"] = {
		"amb@world_human_jog_standing@male@fitbase",
		"base",
		"Standing Fit",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jstandingm"] = {
		"anim@amb@casino@hangout@ped_male@stand@03b@base",
		"base",
		"Standing · Male",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jstandingf"] = {
		"anim@amb@casino@hangout@ped_female@stand@02a@base",
		"base",
		"Standing · Female",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["jgabgtaunt"] = {
		"switch@franklin@gang_taunt_p1",
		"gang_taunt_loop_lamar",
		"Gang Taunt",
		AnimationOptions =
		{
			EmoteMoving = true,
			EmoteLoop = true
		}
	},
	["jdj5"] = {
		"mini@strip_club@idles@dj@base",
		"base",
		"DJ 5",
		AnimationOptions = {
			EmoteMoving = false,
			EmoteLoop = true
		}
	},
	["jch"] = {
		"amb@code_human_police_investigate@idle_b",
		"idle_f",
		"Cop Search",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteDuration = 7000,
		}
	},
	["fsign"] = {
		"custom@fsign_1",
		"fsign_1",
		"Female Sign 1",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zlaying"] = {
		"timetable@ron@ig_3_couch",
		"laying",
		"Laying  ",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["zcrouch"] = {
		"combat@chg_stance",
		"crouch",
		"Crouch  ",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["zcarsleep"] = {
		"mp_cp_stolen_tut",
		"dazed",
		"Slep In Car  ",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["zhandsup2"] = {
		"mp_defend_base",
		"guard_handsup_loop",
		"Hands Up 2  ",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["scrolling"] = {
		"scrollingpose@queensisters",
		"scrolling_clip",
		"scrolling",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["selfiekylie"] = {
		"selfiekilye@queensisters",
		"kilye_clip",
		"selfiekylie",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["handkylie"] = {
		"handkylie@queensisters",
		"kylie_clip",
		"handkylie",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["sitkylie"] = {
		"sitkylie@queensisters",
		"kylie_clip",
		"SitKylie",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["sitpose"] = {
		"perlenfuchs@sit_pose_peace1",
		"sit_pose_peace1_clip",
		"SitPose",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["bball1"] = {
		"anim@male_basketball_01",
		"m_basketball_01_clip",
		"Basket Ball Pose 1 (Smos)",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["standbag"] = {
		"standbag1@blackqueen",
		"standbag1_clip",
		"StandBag",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["standing"] = {
		"perlenfuchs@standing_wall2",
		"standing_wall2_clip",
		"Standing",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["bball2"] = {
		"anim@male_basketball_02",
		"m_basketball_02_clip",
		"Basket Ball Pose 2 (Smos)",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["ballerin"] = {
		"perlenfuchs@ballerina_1",
		"ballerina_1_clip",
		"Ballerin",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["bball3"] = {
		"anim@male_basketball_03",
		"m_basketball_03_clip",
		"Basket Ball Pose 3 (Smos)",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["bball4"] = {
		"anim@male_basketball_04",
		"m_basketball_04_clip",
		"Basket Ball Pose 4 (Smos)",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["bball5"] = {
		"anim@male_basketball_05",
		"m_basketball_05_clip",
		"Basket Ball Pose 5 (Smos)",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["bball6"] = {
		"anim@male_basketball_06",
		"m_basketball_06_clip",
		"Basket Ball Pose 6 (Smos)",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["sport"] = {
		"perlenfuchs@sport_2",
		"sport_2_clip",
		"Sport",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["wall2"] = {
		"walk2@spider",
		"wall2_clip",
		" Wall2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["walk2"] = {
		"walk2@spider",
		"walk2_clip",
		" Walk2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["hd"] = {
		"hatsdown@animation",
		"hatsdown_clip",
		" Hats Down",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["od"] = {
		"offthat@animation",
		"offthat_clip",
		" Off that",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["so"] = {
		"standon@animation",
		"standon_clip",
		" Top Car",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["westbaby"] = {
		"westbaby@animation",
		"westbaby_clip",
		" WestSide",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["spider"] = {
		"spider42@animation",
		"spider42_clip",
		"Spider",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["heart"] = {
		"heart@animation",
		"heart_clip",
		"Heart",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["gang"] = {
		"gang@animation",
		"gang_clip",
		"Gang",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["woman2"] = {
		"perlenfuchs@woman_pose1",
		"woman_pose1_clip",
		"Woman2",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["sexyWall2"] = {
		"perlenfuchs@sexy_wall1",
		"sexy_wall1_clip",
		"sexywall2",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["freeStyle"] = {
		"custom@freestyle_lxcky",
		"freestyle_clip",
		"freestyle",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["sexywall"] = {
		"perlenfuchs@sexy_wall",
		"sexy_wall_clip",
		"sexywall",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["holdcap"] = {
		"perlenfuchs@hold_cap",
		"hold_cap_clip",
		"holdcap",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["cantseeyou"] = {
		"perlenfuchs@cant_see_you_male",
		"cant_see_you_male_clip",
		"cantseeyou",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["noface"] = {
		"noface2@spider",
		"noface2_clip",
		"noface",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["bike"] = {
		"bike3@animation",
		"bike3_clip",
		"bike",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["posefuchs"] = {
		"perlenfuchs@pose3",
		"pose3_clip",
		"posefuchs",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["malegun"] = {
		"perlenfuchs@male_gun",
		"male_gun_clip",
		"malegun",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["fuchsmale"] = {
		"perlenfuchs@male_fxckyou",
		"male_fxckyou_clip",
		"fuchsmale",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["lamp"] = {
		"perlenfuchs@lamp",
		"lamp_clip",
		"lamp",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["fucs"] = {
		"perlenfuchs@fxckyou",
		"fxckyou_clip",
		"fucs",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["fuchs2"] = {
		"perlenfuchs@fxckyou2",
		"fxckyou2_clip",
		"fuchs2",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom"] = {
		"pastelblood@animation",
		"pastelblood_clip",
		"Custom",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom2"] = {
		"pepitosign4@animation",
		"pepitosign4_clip",
		"Custom2",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom3"] = {
		"westsidesign@animation",
		"westsidesign_clip",
		"Custom3",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom4"] = {
		"banks@juiceplug",
		"banks2",
		"Custom4",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom5"] = {
		"banks@animation",
		"banks1",
		"Custom5",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom6"] = {
		"nocap5@animation",
		"nocap5_clip",
		"Custom6",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom7"] = {
		"nocap7@animation",
		"nocap7_clip",
		"Custom7",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom8"] = {
		"duoanim2@animation",
		"duoanim2_clip",
		"Custom8",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom9"] = {
		"217@aim2x@animation",
		"aim2x_clip",
		"Custom9",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom10"] = {
		"mvpsign3@animacion",
		"mvpsign3_clip",
		"Custom10",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom11"] = {
		"cripsgangsign@animation",
		"cripsgangsign_clip",
		"Custom11",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom12"] = {
		"69nine@animation",
		"69nine_clip",
		"Custom12",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom13"] = {
		"chillpose@animation",
		"chillpose_clip",
		"Custom13",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom14"] = {
		"couple1@animation",
		"couple1_clip",
		"Custom14",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom15"] = {
		"couple2@animation",
		"couple2_clip",
		"Custom15",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom16"] = {
		"glock@animation",
		"dk_clip",
		"Custom16",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom17"] = {
		"lean@animation",
		"dk_clip",
		"Custom17",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom18"] = {
		"pastelgangsign2@animation",
		"pastelgangsign2_clip",
		"Custom18",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom19"] = {
		"pastelpistol@animation",
		"pastelpistol_clip",
		"Custom19",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom20"] = {
		"maosnobolso@animation",
		"maosnobolso_clip",
		"Custom20",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom21"] = {
		"paspose@animation",
		"paspose_clip",
		"Custom21",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom22"] = {
		"cigarpose@animation",
		"cigarpose_clip",
		"Custom22",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom23"] = {
		"drunk@animation",
		"drunk_clip",
		"Custom23",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom24"] = {
		"posepis@animation",
		"posepis_clip",
		"Custom24",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom25"] = {
		"instapose2@animation",
		"instapose2_clip",
		"Custom25",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom26"] = {
		"instapose@animation",
		"instapose_clip",
		"Custom26",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom27"] = {
		"gangpose@animation",
		"gangpose_clip",
		"Custom27",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom28"] = {
		"simple@animation",
		"simple_clip",
		"Custom28",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom29"] = {
		"ohgeesy@animation",
		"ohgeesy_clip",
		"Custom29",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom30"] = {
		"pastel3@animation",
		"pastel3_clip",
		"Custom30",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom31"] = {
		"pastelpose1@animation",
		"pastelpose1_clip",
		"Custom31",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom32"] = {
		"pasteldedos2@animation",
		"pasteldedos2_clip",
		"Custom32",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom33"] = {
		"lukitophoto2@animation",
		"lukitophoto2_clip",
		"Custom33",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom34"] = {
		"draco@arves",
		"draco_clip",
		"Custom34",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom35"] = {
		"wristcheck@animation",
		"wristcheck_clip",
		"Custom35",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom36"] = {
		"crossfinger@animation",
		"crossfinger_clip",
		"Custom36",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom37"] = {
		"seat1@animation",
		"seat1_clip",
		"Custom37",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom38"] = {
		"bag@animation",
		"bag_clip",
		"Custom38",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom39"] = {
		"five@nyck",
		"five_clip",
		"Custom39",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom40"] = {
		"capper@nyck",
		"capper_clip",
		"Custom40",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom41"] = {
		"pose@nyck",
		"pose_clip",
		"Custom41",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom42"] = {
		"pose2@nyck",
		"pose2_clip",
		"Custom42",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom43"] = {
		"pose3@nyck",
		"pose3_clip",
		"Custom43",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom44"] = {
		"mafiag@nyck",
		"mafiag_clip",
		"Custom44",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom45"] = {
		"15idk@animation",
		"15idk_clip",
		"Custom45",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom46"] = {
		"bkcr@animation",
		"bkcr_clip",
		"Custom46",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom47"] = {
		"bhw@animation",
		"bhw_clip",
		"Custom47",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom48"] = {
		"99mafia@animation",
		"99mafia_clip",
		"Custom48",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom49"] = {
		"krank@animation",
		"krank_clip",
		"Custom49",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom50"] = {
		"bangin@casual",
		"girl_clip",
		"Custom50",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom51"] = {
		"bangin@casual",
		"man_clip",
		"Custom51",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom52"] = {
		"hood@casual",
		"girl_clip",
		"Custom52",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom53"] = {
		"hood@casual",
		"male_clip",
		"Custom53",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom54"] = {
		"blooh@animation",
		"blooh_clip",
		"Custom54",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom55"] = {
		"famf@animation",
		"famf_clip",
		"Custom55",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom56"] = {
		"fuckb@animation",
		"fuckb_clip",
		"Custom56",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom57"] = {
		"grabber@animation",
		"grabber_clip",
		"Custom57",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom58"] = {
		"mfnapk@animation",
		"mfnapk_clip",
		"Custom58",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom59"] = {
		"neighbour@animation",
		"neighbour_clip",
		"Custom59",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom60"] = {
		"nonapps@animation",
		"nonapps_clip",
		"Custom60",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom61"] = {
		"zuna@animation",
		"zuna_clip",
		"Custom61",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom62"] = {
		"holdhip@animation",
		"holdhip_clip",
		"Custom62",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom63"] = {
		"holdhipb@animation",
		"holdhipb_clip",
		"Custom63",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom64"] = {
		"holdass@animation",
		"holdass_clip",
		"Custom64",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom65"] = {
		"holdassb@animation",
		"holdassb_clip",
		"Custom65",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom66"] = {
		"coupleseat1@animation",
		"coupleseat1_clip",
		"Custom66",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom67"] = {
		"coupleseat1b@animation",
		"coupleseat1b_clip",
		"Custom67",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom68"] = {
		"crshx@fix",
		"fix",
		"Custom68",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom69"] = {
		"crshx2@fix",
		"fix",
		"Custom69",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom70"] = {
		"mymsign1@animacion",
		"mymsign1_clip",
		"Custom70",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom71"] = {
		"mymsign20@animacion",
		"mymsign20_clip",
		"Custom71",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom72"] = {
		"mymsign30@animacion",
		"mymsign30_clip",
		"Custom72",
		AnimationOptions =
		{
			EmoteLoop = false,
		}
	},
	["custom73"] = {
		"chillimannn@animation",
		"chillimannn_clip",
		"Custom73",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom74"] = {
		"eastside@marisfreepack",
		"eastside",
		"Custom74",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom75"] = {
		"duoanim1@animation",
		"duoanim1_clip",
		"Custom75",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom76"] = {
		"hassanblood@animation",
		"hb_clip",
		"Custom76 Blood",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom77"] = {
		"bloodkiller@marisfreegpack",
		"bloodkiller",
		"Custom77",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom78"] = {
		"mafiacrip@marisfreegsignpack",
		"mafiacrip",
		"Custom78",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom79"] = {
		"cripkiller@marisgfreepack",
		"cripkiller",
		"Custom79",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom80"] = {
		"showback_naybahood@crip",
		"showback_naybahood",
		"Custom80",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom81"] = {
		"187@animation",
		"187",
		"Custom81",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom82"] = {
		"rollin60spose2@animation",
		"rollin60spose2",
		"Custom82",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom83"] = {
		"43_gangster@crip",
		"43_gangster",
		"Custom83",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom84"] = {
		"cripkiler@marisfreegsigns",
		"cripkiler",
		"Custom84",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom85"] = {
		"anim@60sv2",
		"60sv2_clip",
		"Custom85",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom86"] = {
		"anim@sixfingers",
		"six_clip",
		"Custom86",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom87"] = {
		"anim@nhtnh",
		"nhtnh_clip",
		"Custom87",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom88"] = {
		"anim@nayba",
		"nayba_clip",
		"Custom88",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom89"] = {
		"anim@fcktrays",
		"fcktrays_clip",
		"Custom89",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom90"] = {
		"anim@owe",
		"owe_clip",
		"Custom90",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom91"] = {
		"sensual1@casual",
		"girl_clip",
		"Custom91",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom92"] = {
		"sensual1@casual",
		"man_clip",
		"Custom92",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom93"] = {
		"ygzpose@animation",
		"dream_clip",
		"Custom93",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom94"] = {
		"downfingers@dreamdel",
		"dreamdel_clip",
		"Custom94",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom95"] = {
		"woopose@custom_anim",
		"woo_clip",
		"Custom95",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom96"] = {
		"sekposev3@animation",
		"v3",
		"Custom96",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom97"] = {
		"sekpose2v3@animation",
		"v3",
		"Custom97",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom98"] = {
		"sekpose2@animation",
		"clip",
		"Custom98",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom99"] = {
		"doubleo@animation",
		"doubleo_clip",
		"Custom99  Grapes",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom100"] = {
		"missionary@casual",
		"girl_clip",
		"Custom100",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom101"] = {
		"missionary@casual",
		"man_clip",
		"Custom101",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom102"] = {
		"leangunanimation",
		"leangun_clip",
		"Custom102",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom103"] = {
		"whiskaspose1@stand",
		"whiskaspose1_makebywhiskas",
		"Custom103",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom104"] = {
		"whiskaspose2@stand",
		"whiskaspose2_makebywhiskas",
		"Custom104",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom105"] = {
		"whiskaspose3@stand",
		"whiskaspose3_makebywhiskas",
		"Custom105",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom106"] = {
		"holdracks@animation",
		"rackz_clip",
		"Custom106",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom107"] = {
		"customdeneme@anim",
		"customdeneme_clip",
		"Custom107",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom112"] = {
		"nhoneanimation",
		"nhone_clip",
		"Custom112",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom113"] = {
		"ceek2animation",
		"ceek2_clip",
		"Custom113 Crips K",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom114"] = {
		"foek1animation",
		"foek1_clip",
		"Custom114  Rollin 40 K",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom115"] = {
		"drillz@headtilt_anim",
		"headtilt_clip",
		"Custom115",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom116"] = {
		"drillz@laydown_anim",
		"laydown_clip",
		"Custom116",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom117"] = {
		"drillz@selfiewall_anim",
		"selfiewall_clip",
		"Custom117",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom118"] = {
		"drillz@leanfemalesit_anim",
		"leanfemalesit_clip",
		"Custom119",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom119"] = {
		"drillz@ruby_anim",
		"ruby_clip",
		"Custom119",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom120"] = {
		"posing1@animation",
		"posing1_clip",
		"Custom120",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom121"] = {
		"posing2@animation",
		"posing2_clip",
		"Custom121",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom122"] = {
		"posing3@animation",
		"posing3_clip",
		"Custom122",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom123"] = {
		"sureno@rabbit1",
		"rabbit_clip",
		"Custom123",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom124"] = {
		"sureno@thrtn",
		"thrtn_clip",
		"Custom124",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom125"] = {
		"ney3@animation",
		"ney_clip",
		"Custom125",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom126"] = {
		"rollz@walkpeace",
		"walkpeace_clip",
		"Custom126",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom127"] = {
		"ney@animation",
		"ney_clip",
		"Custom127",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom128"] = {
		"idleney@animation",
		"idle_clip",
		"Custom128",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom129"] = {
		"leanwoface@animation",
		"lean_clip",
		"Custom129",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom130"] = {
		"esse@drakowall",
		"drakowall_clip",
		"Custom130",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom131"] = {
		"nbn@animation",
		"nbn_clip",
		"Custom131",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom132"] = {
		"wrldmods@trippieredd",
		"trippieredd",
		"Custom132",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom133"] = {
		"lunyx@random001",
		"random001",
		"Custom133",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom134"] = {
		"lunyx@random002",
		"random002",
		"Custom134",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom135"] = {
		"lunyx@random003",
		"random003",
		"Custom135",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom136"] = {
		"leanganglit@animation",
		"leanganglit_clip",
		"Custom136",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom137"] = {
		"shlass@animation",
		"shlass_clip",
		"Custom137",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom138"] = {
		"gangsign1@animation",
		"gangsign1_clip",
		"Custom138",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom139"] = {
		"doublec@animation",
		"doublec_clip",
		"Custom139",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom140"] = {
		"handsup@animation",
		"handsup_clip",
		"Custom140",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom141"] = {
		"holdhands@anim",
		"holdhands_clip",
		"Custom141",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom142"] = {
		"syx@kiss02a",
		"kiss02a",
		"Custom142",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom143"] = {
		"syx@kiss02b",
		"kiss02b",
		"Custom143",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom144"] = {
		"syx@cute01",
		"cute01",
		"Custom144",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom145"] = {
		"syx@cute02",
		"cute02",
		"Custom145",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom146"] = {
		"syx@cute03",
		"cute03",
		"Custom146",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom147"] = {
		"syx@cute04",
		"cute04",
		"Custom147",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom148"] = {
		"syx@cute05",
		"cute05",
		"Custom148",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom149"] = {
		"lunyx@rgmp01",
		"rgmp01",
		"Custom149",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom150"] = {
		"lunyx@rgmp02",
		"rgmp02",
		"Custom150",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom151"] = {
		"lunyx@rgmp03",
		"rgmp03",
		"Custom151",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom152"] = {
		"lunyx@rgmp06",
		"rgmp06",
		"Custom152",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom153"] = {
		"lunyx@rgmp07",
		"rgmp07",
		"Custom153",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom154"] = {
		"gdkanimationanimation",
		"gdkanimation_clip",
		"Custom154",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom155"] = {
		"moneyspread1@animation",
		"moneyspread1_clip",
		"Custom155",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom156"] = {
		"divined@rpack@new",
		"alchemy",
		"Custom156",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom157"] = {
		"divined@rpack@new",
		"badmood",
		"Custom157",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["gsign500"] = {
		"divined@rpack@new",
		"bunnyhop",
		"YGz Dance Bunny Hop ",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom159"] = {
		"divined@rpack@new",
		"burpee",
		"Custom159 Sport",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom160"] = {
		"divined@rpack@new",
		"callme",
		"Custom160",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom161"] = {
		"divined@rpack@new",
		"coronet",
		"Custom161",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom162"] = {
		"divined@rpack@new",
		"dcry",
		"Custom162",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom163"] = {
		"divined@rpack@new",
		"hailcab",
		"Custom163",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom164"] = {
		"divined@rpack@new",
		"kepler",
		"Custom164",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom165"] = {
		"divined@rpack@new",
		"mindblown",
		"Custom165",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom166"] = {
		"divined@rpack@new",
		"uproar",
		"Custom166  Fight",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom167"] = {
		"divined@rpack@new",
		"yeet",
		"Custom167",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom168"] = {
		"rollz@twofingers",
		"twofingers_clip",
		"Custom168",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom169"] = {
		"rollz@leanmiddle",
		"leanmiddle_clip",
		"Custom169",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom170"] = {
		"anim@playboyig",
		"playboy_clip",
		"Custom170",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom171"] = {
		"anim@doublerabbit",
		"rabbit_clip",
		"Custom171",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom172"] = {
		"nhcanimation",
		"nhc_clip",
		"Custom172",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom173"] = {
		"gangisgn1animation",
		"gangisgn1_clip",
		"Custom173",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom174"] = {
		"gangsign2animation",
		"gangsign2_clip",
		"Custom174",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom175"] = {
		"drillz@femalefuckoff_anim",
		"fuckoff_clip",
		"Custom175",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom176"] = {
		"drillz@fucktheopps_anim",
		"fucktheopps_clip",
		"Custom176",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom177"] = {
		"drillz@fuckyou_anim",
		"fuckyou_clip",
		"Custom177",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom178"] = {
		"drillz@oneleg_anim",
		"oneleg_clip",
		"Custom178",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom179"] = {
		"drillz@thebirdfemale_anim",
		"thebird_clip",
		"Custom179",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom180"] = {
		"f13ganganimation",
		"f13gang_clip",
		"Custom180",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom181"] = {
		"cosmocrippah",
		"crippah_clip",
		"Custom181",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom182"] = {
		"anim@sureno",
		"sureno_clip",
		"Custom182",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom183"] = {
		"anim@guttagang",
		"gutta_clip",
		"Custom183",
		AnimationOptions =
		{
			EmoteLoop = true
		}
	},
	["custom184"] = {
		"anim@fog_rifle_relaxed",
		"rifle_relaxed_clip",
		"Custom184",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom185"] = {
		"anim@stack_pointman",
		"pointman_clip",
		"Custom185",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom186"] = {
		"anim@stack_two_man",
		"two_man_clip",
		"Custom186",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom187"] = {
		"anim@stack_three_man",
		"three_man_clip",
		"Custom187",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom188"] = {
		"anim@highlow_low_lean",
		"low_lean_clip",
		"Custom188",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom189"] = {
		"anim@highlow_high_lean",
		"high_lean_clip",
		"Custom189",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom190"] = {
		"anim@gang_pistol_westside",
		"pistol_westside_clip",
		"Custom190",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom191"] = {
		"anim@gang_one",
		"gang_one_clip",
		"Custom191",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom192"] = {
		"anim@gang_two",
		"gang_two_clip",
		"Custom192",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom193"] = {
		"anim@model_car_fancy",
		"car_fancy_clip",
		"Custom193",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom194"] = {
		"anim@model_stretched_leg",
		"stretched_leg_clip",
		"Custom194",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom195"] = {
		"anim@car_sitting_fuckyou",
		"sitting_fuckyou_clip",
		"Custom195",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom196"] = {
		"anim@car_sitting_cute",
		"sitting_cute_clip",
		"Custom196",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom197"] = {
		"anim@model_bike",
		"bike_clip",
		"Custom197",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom198"] = {
		"anim@model_bike_two",
		"bike_two_clip",
		"Custom198",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom199"] = {
		"anim@peace_selfie",
		"peace_clip",
		"Custom199",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom200"] = {
		"anim@stance_folded_arms",
		"folded_arms_clip",
		"Custom200",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom201"] = {
		"anim@stance_kneeling_cute",
		"kneeling_cute_clip",
		"Custom201",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom202"] = {
		"anim@sit_cute_window",
		"cute_window_clip",
		"Custom202",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom203"] = {
		"anim@car_cute_sit",
		"cute_sit_clip",
		"Custom203",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom204"] = {
		"anim@selfie_peacesign_cute",
		"peacesign_cute_clip",
		"Custom204",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom205"] = {
		"anim@female_smoke_01",
		"f_smoke_01_clip",
		"Custom205",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom206"] = {
		"anim@female_lean_01",
		"f_lean_01_clip",
		"Custom206",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom207"] = {
		"anim@female_selfie_1st_01",
		"f_selfie_1st_01_clip",
		"Custom207",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom208"] = {
		"anim@female_model_01",
		"f_model_01_clip",
		"Custom208",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom209"] = {
		"anim@female_model_02",
		"f_model_02_clip",
		"Custom209",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom210"] = {
		"anim@female_model_03",
		"f_model_03_clip",
		"Custom210",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom211"] = {
		"anim@selfie_knees_cute",
		"knees_cute_clip",
		"Custom211",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom212"] = {
		"anim@sw_sit_chill",
		"sit_chill_clip",
		"Custom212",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom213"] = {
		"anim@sw_chill_pose",
		"chill_pose_clip",
		"Custom213",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom214"] = {
		"anim@stance_handgun",
		"handgun_clip",
		"Custom214",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom215"] = {
		"anim@stance_handgun",
		"handgun_clip",
		"Custom215",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom216"] = {
		"anim@shooter_stance",
		"stance_clip",
		"Custom216",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom217"] = {
		"anim@shooter_stance",
		"stance_clip",
		"Custom217",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom218"] = {
		"thot_pose",
		"thot_clip",
		"Custom218",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom219"] = {
		"anim@fuck_you_selfie",
		"fuck_you_selfie_clip",
		"Custom219",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom220"] = {
		"lunyx@random@v3@pose001",
		"random@v3@pose001",
		"Custom220",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom221"] = {
		"lunyx@random@v3@pose002",
		"random@v3@pose002",
		"Custom221",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom222"] = {
		"lunyx@random@v3@pose003",
		"random@v3@pose003",
		"Custom222",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom223"] = {
		"lunyx@random@v3@pose004",
		"random@v3@pose004",
		"Custom223",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom224"] = {
		"lunyx@random@v3@pose005",
		"random@v3@pose005",
		"Custom224",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom225"] = {
		"lunyx@random@v3@pose006",
		"random@v3@pose006",
		"Custom225",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom226"] = {
		"lunyx@random@v3@pose007",
		"random@v3@pose007",
		"Custom226",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom227"] = {
		"lunyx@random@v3@pose008",
		"random@v3@pose008",
		"Custom227",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom228"] = {
		"lunyx@random@v3@pose009",
		"random@v3@pose009",
		"Custom228",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom229"] = {
		"lunyx@random@v3@pose010",
		"random@v3@pose010",
		"Custom229",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom230"] = {
		"lunyx@random@v3@pose011",
		"random@v3@pose011",
		"Custom230",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom231"] = {
		"lunyx@random@v3@pose012",
		"random@v3@pose012",
		"Custom231",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom232"] = {
		"lunyx@random@v3@pose013",
		"random@v3@pose013",
		"Custom232",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom233"] = {
		"lunyx@random@v3@pose014",
		"random@v3@pose014",
		"Custom233",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom234"] = {
		"lunyx@random@v3@pose015",
		"random@v3@pose015",
		"Custom234",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom235"] = {
		"lunyx@random@v3@pose016",
		"random@v3@pose016",
		"Custom235",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom236"] = {
		"lunyx@random@v3@pose017",
		"random@v3@pose017",
		"Custom236",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom237"] = {
		"lunyx@random@v3@pose018",
		"random@v3@pose018",
		"Custom237",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom238"] = {
		"lunyx@random@v3@pose019",
		"random@v3@pose019",
		"Custom238",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom239"] = {
		"lunyx@random@v3@pose020",
		"random@v3@pose020",
		"Custom239",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom240"] = {
		"testanim@alina",
		"testanim_clip",
		"Custom240",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom241"] = {
		"hoe@anim",
		"hoe_clip",
		"Custom241",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom242"] = {
		"hoe2@anim",
		"hoe2_clip",
		"Custom242",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom243"] = {
		"expertmode@anim",
		"expertmode_clip",
		"Custom243",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom244"] = {
		"pose1@anim",
		"pose1_clip",
		"Custom244",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom245"] = {
		"expertmode2@anim",
		"expertmode2_clip",
		"Custom245",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom246"] = {
		"1foot@anim",
		"1foot_clip",
		"Custom246",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom247"] = {
		"car1@anim",
		"car1_clip",
		"Custom247",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom248"] = {
		"car2@anim",
		"car2_clip",
		"Custom248",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom249"] = {
		"selfie@anim",
		"selfie_clip",
		"Custom249",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom250"] = {
		"selfie2@anim",
		"selfie2_clip",
		"Custom250",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom251"] = {
		"randompose1@anim",
		"randompose1_clip",
		"Custom251",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom252"] = {
		"randompose2@anim",
		"randompose2_clip",
		"Custom252",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom253"] = {
		"stripper1@anim",
		"stripper1_clip",
		"Custom253",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom254"] = {
		"strip2@anim",
		"strip2_clip",
		"Custom254",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom255"] = {
		"pose5@anim",
		"pose5_clip",
		"Custom255",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom256"] = {
		"slavepose@anim",
		"slavepose_clip",
		"Custom256",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom257"] = {
		"gangsign50@animation",
		"gangsign50_clip",
		"Custom257",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom258"] = {
		"stanleylebougla@animation",
		"stanleylebougla_clip",
		"Custom258",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom259"] = {
		"217aim2xanimation",
		"aim2x_clip",
		"Custom259",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom260"] = {
		"dollie_mods@follow_me_001",
		"follow_me_001",
		"Custom260",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom261"] = {
		"dollie_mods@follow_me_002",
		"follow_me_002",
		"Custom261",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom262"] = {
		"tattooshowinn@animation",
		"tattooshowinn_clip",
		"Custom262",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom263"] = {
		"amb@world_human_hang_out_street@male_a@base",
		"base",
		"Custom263",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom264"] = {
		"amb@world_human_hang_out_street@male_a@enter",
		"enter",
		"Custom264",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom265"] = {
		"amb@world_human_hang_out_street@male_a@exit",
		"exit",
		"Custom265",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom266"] = {
		"amb@world_human_hang_out_street@male_a@idle_a",
		"idle_a",
		"Custom266",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom267"] = {
		"amb@world_human_hang_out_street@male_a@idle_a",
		"idle_b",
		"Custom267",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom268"] = {
		"amb@world_human_hang_out_street@male_a@idle_a",
		"idle_c",
		"Custom268",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom269"] = {
		"amb@world_human_hang_out_street@male_a@idle_a",
		"idle_d",
		"Custom269",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom270"] = {
		"amb@world_human_hang_out_street@male_b@base",
		"base",
		"Custom270",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom271"] = {
		"amb@world_human_hang_out_street@male_b@enter",
		"enter",
		"Custom271",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom272"] = {
		"amb@world_human_hang_out_street@male_b@exit",
		"exit",
		"Custom272",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom273"] = {
		"amb@world_human_hang_out_street@male_b@idle_a",
		"idle_a",
		"Custom273",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom274"] = {
		"amb@world_human_hang_out_street@male_b@idle_a",
		"idle_b",
		"Custom274",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom275"] = {
		"amb@world_human_hang_out_street@male_b@idle_a",
		"idle_c",
		"Custom275",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom276"] = {
		"amb@world_human_hang_out_street@male_b@idle_a",
		"idle_d",
		"Custom276",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom277"] = {
		"amb@world_human_hang_out_street@male_c@base",
		"base",
		"Custom277",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom278"] = {
		"amb@world_human_hang_out_street@male_c@enter",
		"enter",
		"Custom278",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom279"] = {
		"amb@world_human_hang_out_street@male_c@exit",
		"exit",
		"Custom279",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom280"] = {
		"amb@world_human_hang_out_street@male_c@idle_a",
		"idle_a",
		"Custom280",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom281"] = {
		"amb@world_human_hang_out_street@male_c@idle_a",
		"idle_b",
		"Custom281",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom282"] = {
		"amb@world_human_hang_out_street@male_c@idle_a",
		"idle_c",
		"Custom282",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom283"] = {
		"amb@world_human_hang_out_street@male_c@idle_a",
		"idle_d",
		"Custom283",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom284"] = {
		"amb@world_human_hang_out_street@female_arm_side@base",
		"base",
		"Custom284",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom285"] = {
		"amb@world_human_hang_out_street@female_arm_side@enter",
		"enter",
		"Custom285",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom286"] = {
		"amb@world_human_hang_out_street@female_arm_side@exit",
		"exit",
		"Custom286",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom287"] = {
		"amb@world_human_hang_out_street@female_arm_side@idle_a",
		"idle_a",
		"Custom287",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom288"] = {
		"amb@world_human_hang_out_street@female_arm_side@idle_a",
		"idle_b",
		"Custom288",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom289"] = {
		"amb@world_human_hang_out_street@female_arm_side@idle_a",
		"idle_c",
		"Custom289",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom290"] = {
		"amb@world_human_hang_out_street@female_arm_side@idle_a",
		"idle_d",
		"Custom290",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom291"] = {
		"amb@world_human_hang_out_street@female_arms_crossed@base",
		"base",
		"Custom291",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom292"] = {
		"amb@world_human_hang_out_street@female_arms_crossed@enter",
		"enter",
		"Custom292",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom293"] = {
		"amb@world_human_hang_out_street@female_arms_crossed@exit",
		"exit",
		"Custom293",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom294"] = {
		"amb@world_human_hang_out_street@female_arms_crossed@idle_a",
		"idle_a",
		"Custom294",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom295"] = {
		"amb@world_human_hang_out_street@female_arms_crossed@idle_a",
		"idle_b",
		"Custom295",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom296"] = {
		"amb@world_human_hang_out_street@female_arms_crossed@idle_a",
		"idle_c",
		"Custom296",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom297"] = {
		"amb@world_human_hang_out_street@female_arms_crossed@idle_a",
		"idle_d",
		"Custom297",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom298"] = {
		"amb@world_human_hang_out_street@female_hold_arm@base",
		"base",
		"Custom298",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom299"] = {
		"amb@world_human_hang_out_street@female_hold_arm@enter",
		"enter",
		"Custom299",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom300"] = {
		"amb@world_human_hang_out_street@female_hold_arm@exit",
		"exit",
		"Custom300",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom301"] = {
		"amb@world_human_hang_out_street@female_hold_arm@idle_a",
		"idle_a",
		"Custom301",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom302"] = {
		"amb@world_human_hang_out_street@female_hold_arm@idle_a",
		"idle_b",
		"Custom302",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom303"] = {
		"amb@world_human_hang_out_street@female_hold_arm@idle_a",
		"idle_c",
		"Custom303",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom304"] = {
		"amb@world_human_hang_out_street@female_hold_arm@idle_a",
		"idle_d",
		"Custom304",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom305"] = {
		"betrex@sunglasses",
		"glasses",
		"Custom305",
		AnimationOptions =
		{
			EmoteLoop = false,
		}
	},
	["custom306"] = {
		"chouko@freeheart",
		"freeheart",
		"Custom306",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom307"] = {
		"chouko@nailpose",
		"nailpose",
		"Custom307",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom308"] = {
		"chid@nyck",
		"chid_clip",
		"Custom308",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom309"] = {
		"move_m@generic_idles@std",
		"idle_a",
		"Custom309",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom310"] = {
		"move_m@generic_idles@std",
		"idle_b",
		"Custom310",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom311"] = {
		"move_m@generic_idles@std",
		"idle_c",
		"Custom311",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom312"] = {
		"move_m@generic_idles@std",
		"idle_d",
		"Custom312",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom313"] = {
		"nhyza1@animation",
		"nhyza1_clip",
		"Custom313",
		AnimationOptions =
		{
			EmoteLoop = false,
		}
	},
	["custom314"] = {
		"qpacc@gangsign1",
		"gangsign1_clip",
		"Custom314",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom315"] = {
		"qpacc@gangsign2",
		"gangsign2_clip",
		"Custom315",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom316"] = {
		"qpacc@gangsign3",
		"gangsign3_clip",
		"Custom316",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom317"] = {
		"qpacc@gangsign4",
		"gangsign4_clip",
		"Custom317",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom318"] = {
		"qpacc@gangsign5",
		"gangsign5_clip",
		"Custom318",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom319"] = {
		"qpacc@gangsign6",
		"gangsign6_clip",
		"Custom319",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom320"] = {
		"qpacc@gangsign7",
		"gangsign7_clip",
		"Custom320",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom321"] = {
		"qpacc@gangsign8",
		"gangsign8_clip",
		"Custom321",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom322"] = {
		"mymsign25@animacion",
		"mymsign25_clip",
		"Custom322",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom323"] = {
		"mymsign67@animacion",
		"mymsign67_clip",
		"Custom323",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom324"] = {
		"cast@sign1@animation",
		"cast@sign1_clip",
		"Custom324",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom325"] = {
		"cast@sign2@animation",
		"cast@sign2_clip",
		"Custom325",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom326"] = {
		"crip@animation",
		"crip_clip",
		"Custom326",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom327"] = {
		"handoverffacefinger@sign@animation",
		"handoverffacefinger@sign_clip",
		"Custom327",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom328"] = {
		"bendover@sign@animation",
		"bendover@sign_clip",
		"Custom328",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom329"] = {
		"whitepower@animation",
		"whitepower_clip",
		"Custom329",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom330"] = {
		"standhand2animation",
		"standhand2_clip",
		"Custom330",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom331"] = {
		"standhand2@animation",
		"standhand2_clip",
		"Custom331",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom332"] = {
		"tidselfie01@animation",
		"tidselfie01_clip",
		"Custom332",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom333"] = {
		"mggyhang1@animation",
		"mggyhang1_clip",
		"Custom333",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom334"] = {
		"mggyhang2@animation",
		"mggyhang2_clip",
		"Custom334",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom335"] = {
		"mggyhang3@animation",
		"mggyhang3_clip",
		"Custom335",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom336"] = {
		"mggypiggypair1@animation",
		"mggypiggypair1_clip",
		"Custom336",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom337"] = {
		"mggypiggypair2@animation",
		"mggypiggypair2_clip",
		"Custom337",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom338"] = {
		"mggyselfie1@animation",
		"mggyselfie1_clip",
		"Custom338",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom339"] = {
		"mggyselfie2@animation",
		"mggyselfie2_clip",
		"Custom339",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom340"] = {
		"mggyselfie4@animation",
		"mggyselfie4_clip",
		"Custom340",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom341"] = {
		"custom@animation",
		"sitting_clip",
		"Custom341",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom342"] = {
		"slave@mchmnk",
		"slave_clip",
		"Custom342",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom343"] = {
		"mistress@mchmnk",
		"mistress_clip",
		"Custom343",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom344"] = {
		"coupleero01fr@mchmnk",
		"coupleero01fr_clip",
		"Custom344",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom345"] = {
		"coupleero01tw@mchmnk",
		"coupleero01tw_clip",
		"Custom345",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom346"] = {
		"waitingfordaddy@mchmnk",
		"waitingfordaddy_clip",
		"Custom346",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom347"] = {
		"tidsitting07@animation",
		"tidsitting07_clip",
		"Custom347",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom348"] = {
		"tidstanding11@animation",
		"tidstanding11_clip",
		"Custom348",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom349"] = {
		"tidstanding14@animation",
		"tidstanding14_clip",
		"Custom349",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom350"] = {
		"tidstanding15@animation",
		"tidstanding15_clip",
		"Custom350",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom351"] = {
		"tidstandingselfie11@animation",
		"tidstandingselfie11_clip",
		"Custom351",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom352"] = {
		"tidstandingselfie12@animation",
		"tidstandingselfie12_clip",
		"Custom352",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom353"] = {
		"christiandior@animation",
		"christiandior_clip",
		"Custom353 Dior Bag",
		AnimationOptions =
		{
			Prop = 'p_ld_heist_bag_s_2',
			PropBone = 24817,
			PropPlacement = { -0.75, 0.18, -0.016, 180.0, -90.0, 90.0 },
			EmoteMoving = false,
			EmoteLoop = true
		}
	},
	["custom354"] = {
		"christiandior2@animation",
		"christiandior2_clip",
		"Custom354 Dior Bag 2",
		AnimationOptions =
		{
			Prop = "p_ld_heist_bag_s_2",
			PropBone = 57005,
			PropPlacement = { -0.335, -0.345, 0.245, 300.0, 180.0, 30.0 },
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["custom355"] = {
		"christiandior2@animation",
		"christiandior2_clip",
		"Custom355 Dior Bag 3",
		AnimationOptions =
		{
			Prop = "p_ld_heist_bag_s_2",
			PropBone = 57005,
			PropPlacement = { -0.335, -0.345, 0.245, 300.0, 180.0, 30.0 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["custom356"] = {
		"longokillaanimation",
		"longokilla_clip",
		"Custom356",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom357"] = {
		"cas2animation",
		"cas2_clip",
		"Custom357",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom358"] = {
		"salutepose@animation",
		"salutepose_clip",
		"Custom358",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom359"] = {
		"sheshanimation",
		"shesh_clip",
		"Custom359",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom360"] = {
		"crouchinganimation",
		"crouching_clip",
		"Custom360",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom361"] = {
		"femalepose6@animation",
		"femalepose6_clip",
		"Custom361",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom362"] = {
		"femalepose5@animation",
		"femalepose5_clip",
		"Custom362",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom363"] = {
		"freeanim1animation",
		"freeanim1_clip",
		"Custom363",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom364"] = {
		"freeanim2animation",
		"freeanim2_clip",
		"Custom364",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom365"] = {
		"mggycas2@animation",
		"mggycas2_clip",
		"Custom365",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom366"] = {
		"mggycas1@animation",
		"mggycas1_clip",
		"Custom366",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom367"] = {
		"mggymirror4@animation",
		"mggymirror4_clip",
		"Custom367",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom368"] = {
		"mggymirror3@animation",
		"mggymirror3_clip",
		"Custom368",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom369"] = {
		"mggymirror2@animation",
		"mggymirror2_clip",
		"Custom369",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom370"] = {
		"mggymirror1@animation",
		"mggymirror1_clip",
		"Custom370",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom371"] = {
		"bfflookback1@animation",
		"bfflookback1_clip",
		"Custom371",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom372"] = {
		"bfflookback2@animation",
		"bfflookback2_clip",
		"Custom372",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom373"] = {
		"bffcasualpose1@animation",
		"bffcasualpose1_clip",
		"Custom373",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom374"] = {
		"bffcasualpose2@animation",
		"bffcasualpose2_clip",
		"Custom374",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom375"] = {
		"bfffun1@animation",
		"bfffun1_clip",
		"Custom375",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom376"] = {
		"bfffun2@animation",
		"bfffun2_clip",
		"Custom376",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom377"] = {
		"bffhandhold1@animation",
		"bffhandhold1_clip",
		"Custom377",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom378"] = {
		"bffhandhold2@animation",
		"bffhandhold2_clip",
		"Custom378",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom379"] = {
		"mggycouplehug1@animation",
		"mggycouplehug1_clip",
		"Custom379",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom380"] = {
		"mggycouplehug2@animation",
		"mggycouplehug2_clip",
		"Custom380",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["custom381"] = {
		"mggycouplehugphone@animation",
		"mggycouplehugphone_clip",
		"Custom381",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["nekofoldarms2"] = {
		"anim@amb@nightclub@peds@",
		"rcmme_amanda1_stand_loop_cop",
		"Custom Fold Arms 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["nekocrossarms6"] = {
		"random@shop_gunstore",
		"_idle",
		"Custom Crossarms 6",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["p1"] = {
		"penguin@head",
		"penguinhead",
		"Custom Pose 1",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["p2"] = {
		"penguin@love",
		"penguinlove",
		"Custom Pose 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["p3"] = {
		"penguin@standpickpocket",
		"penguin_standpickpocket",
		"Custom Pose 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["p4"] = {
		"penguin@2fingers_up",
		"penguin_2_fingers_up",
		"Custom Pose 4",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["p5"] = {
		"penguin@pokcheek",
		"penguin_pok_cheek",
		"Custom Pose 5",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["p6"] = {
		"penguin@hold_the_cheek",
		"penguin_hold_the_cheek",
		"Custom Pose 6",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["p7"] = {
		"penguin@pose",
		"penguin_pose",
		"Custom Pose 7",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["p8"] = {
		"penguin@pose2",
		"penguin_pose2",
		"Custom Pose 8",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["p9"] = {
		"penguin@pose3",
		"penguin_pose3",
		"Custom Pose 9",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["q1"] = {
		"penguin@pose4",
		"penguin_pose4",
		"Custom Pose 10",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["q2"] = {
		"penguin@pose5",
		"penguin_pose5",
		"Custom Pose 11",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["q3"] = {
		"penguin@pose6",
		"penguin_pose6",
		"Custom Pose 12",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["q4"] = {
		"penguin@pose7",
		"penguin_pose7",
		"Custom Pose 13",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["q6"] = {
		"penguin@pose8",
		"penguin_pose8",
		"Custom Pose 14",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["q7"] = {
		"penguin@pose9",
		"penguin_pose9",
		"Custom Pose 15",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["q8"] = {
		"penguin@pose10",
		"penguin_pose10",
		"Custom Pose 16",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["q9"] = {
		"penguin@dab",
		"penguin_dab",
		"Custom Pose 17",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["z1"] = {
		"penguin@dab1",
		"penguin_dab1",
		"Custom Pose 18",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["nekositchair10"] = {
		"misslester1aig_3main",
		"air_guitar_01_b",
		"Custom Sit Chair 10",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositchair11"] = {
		"misslester1aig_5intro",
		"boardroom_intro_f_b",
		"Custom Sit Chair 11",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositchair12"] = {
		"misslester1aig_5intro",
		"boardroom_intro_f_c",
		"Custom Sit Chair 12",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositchair7"] = {
		"anim@amb@nightclub@smoking@",
		"blunt_idle_a",
		"Custom Sit Chair 7",
		AnimationOptions =
		{
			Prop = 'p_cs_joint_02',
			PropBone = 28422,
			PropPlacement = { 0.0800003, -0.004999998, -0.035, 175.5002, 311.0003, 232.0 },
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositchair8"] = {
		"anim@amb@nightclub@smoking@",
		"blunt_idle_b",
		"Custom Sit Chair 8",
		AnimationOptions =
		{
			Prop = 'p_cs_joint_02',
			PropBone = 28422,
			PropPlacement = { 0.0800003, -0.004999998, -0.035, 175.5002, 311.0003, 232.0 },
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekodrink2"] = {
		"friends@frl@ig_1",
		"drink_lamar",
		"Custom Drink 2",
		AnimationOptions =
		{
			Prop = 'prop_beer_patriot',
			PropBone = 60309,
			PropPlacement = { -0.03499999, -0.165, -0.015, 436.7987, 412.3998, 177.4 },
			EmoteLoop = false,
			EmoteMoving = true,

		}
	},
	["nekomc"] = {
		"anim@amb@nightclub@lazlow@ig1_vip@",
		"clubvip_dlg_tonymctony_laz",
		"Custom MC",
		AnimationOptions =
		{
			Prop = 'p_ing_microphonel_01',
			PropBone = 57005,
			PropPlacement = { 0.1249999, 0.03, -0.005000002, 87.10002, 149.8, 200.8 },
			EmoteLoop = true,
			EmoteMoving = true,

		}
	},
	["nekojump1"] = {
		"anim@arena@celeb@flat@solo@no_props@",
		"jump_d_player_a",
		"Custom Jump 1",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},
	["nekojump2"] = {
		"anim@arena@celeb@flat@solo@no_props@",
		"jump_c_player_a",
		"Custom Jump 2",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},
	["nekojump3"] = {
		"anim@arena@celeb@flat@solo@no_props@",
		"jump_b_player_a",
		"Custom Jump 3",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},
	["nekojump4"] = {
		"anim@arena@celeb@flat@solo@no_props@",
		"jump_a_player_a",
		"Custom Jump 4",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},
	["nekoleanbar5"] = {
		"switch@michael@pier",
		"pier_lean_smoke_idle",
		"Custom Lean Bar 5",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 58867,
			PropPlacement = { 0.0599999, 0.005, -0.015, 40.29999, 78.3, 124.1 },
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoleanbar6"] = {
		"switch@michael@pier",
		"pier_lean_smoke_idle",
		"Custom Lean Bar 6",
		AnimationOptions =
		{
			Prop = 'p_cs_joint_02',
			PropBone = 58867,
			PropPlacement = { 0.0599999, 0.005, -0.015, 40.29999, 78.3, 124.1 },
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoleanbar7"] = {
		"switch@michael@pier",
		"pier_lean_smoke_idle",
		"Custom Lean Bar 7",
		AnimationOptions =
		{
			Prop = 'prop_cigar_03',
			PropBone = 58867,
			PropPlacement = { 0.06499989, 0.015, -0.01, 0.0, 78.3, 299.6001 },
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositmafia"] = {
		"safe@michael@ig_3",
		"cigar_idle_b_michael",
		"Custom Sit Mafia",
		AnimationOptions =
		{
			Prop = 'prop_cigar_03',
			PropBone = 58867,
			PropPlacement = { 0.03999992, 0.03, 0.015, 0.0, 78.3002, 180 },
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekosmell2"] = {
		"safe@trevor@ig_8",
		"ig_8_huff_gas_player",
		"Custom Smell 2",
		AnimationOptions =
		{
			--Prop = 'prop_cigar_03',
			--PropBone = 13700,
			--PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekofear"] = {
		"anim@heists@ornate_bank@hostages@cashier_b@",
		"flinch_loop_underfire",
		"Custom Fear",
		AnimationOptions =
		{
			--Prop = 'prop_cigar_03',
			--PropBone = 13700,
			--PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekowipe"] = {
		"switch@franklin@cleaning_car",
		"001946_01_gc_fras_v2_ig_5_base",
		"Custom Wipe",
		AnimationOptions =
		{
			--Prop = 'prop_cigar_03',
			--PropBone = 13700,
			--PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
			EmoteLoop = true,
			EmoteMoving = true,

		}
	},
	["nekositchair9"] = {
		"mini@strip_club@wade@",
		"leadin_loop_idle_a_stripper_a",
		"Custom Sit Chair 9",
		AnimationOptions =
		{
			--Prop = 'prop_cigar_03',
			--PropBone = 13700,
			--PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositmafia2"] = {
		"mini@strip_club@wade@",
		"leadin_loop_idle_a_wade",
		"Custom Sit Mafia 2",
		AnimationOptions =
		{
			--Prop = 'prop_cigar_03',
			--PropBone = 13700,
			--PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekocheer2"] = {
		"mini@triathlon",
		"male_one_handed_a",
		"Custom Cheer 2",
		AnimationOptions =
		{
			--Prop = 'prop_cigar_03',
			--PropBone = 13700,
			--PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekocheer3"] = {
		"mini@triathlon",
		"male_two_handed_a",
		"Custom Cheer 3",
		AnimationOptions =
		{
			--Prop = 'prop_cigar_03',
			--PropBone = 13700,
			--PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekolean6"] = {
		"missarmenian1leadinoutarm_1_ig_14_leadinout",
		"leadin_loop",
		"Custom Lean 6",
		AnimationOptions =
		{
			--Prop = 'prop_cigar_03',
			--PropBone = 13700,
			--PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekodrunk"] = {
		"missbigscore1leadinoutbs_1_int",
		"leadin_loop_c_trevor",
		"Custom Drunk",
		AnimationOptions =
		{
			Prop = 'prop_wine_rose',
			PropBone = 58867,
			PropPlacement = { 0.02499996, -0.009999998, -0.3599998, 172.9002, 183.6, 155.3 },
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekopee2"] = {
		"missbigscore1switch_trevor_piss",
		"piss_loop",
		"Custom Pee 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekolean7"] = {
		"misscarsteal1car_1_ext_leadin",
		"base_driver1",
		"Custom Lean 7",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekopee3"] = {
		"misscarsteal2peeing",
		"peeing_loop",
		"Custom Pee 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoleanbar8"] = {
		"misscarstealfinalecar_5_ig_1",
		"waitloop_lamar",
		"Custom Lean Bar 8",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekodapap"] = {
		"misscarstealfinalecar_5_ig_3",
		"leanleft_loop",
		"Custom Dapap",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekocool"] = {
		"misschinese1leadinoutchi_1_mcs_4",
		"chi_1_mcs_4_tao_idle_2",
		"Custom Cool",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekolean8"] = {
		"missclothing",
		"idle_a",
		"Custom Lean 8",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekolean9"] = {
		"missclothing",
		"idle_b",
		"Custom Lean 9",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekolean10"] = {
		"missclothing",
		"idle_c",
		"Custom Lean 10",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekosadly"] = {
		"missfam4leadinoutmcs2",
		"tracy_loop",
		"Custom Sadly",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoyoga2"] = {
		"missfam5_yoga",
		"c5_pose",
		"Custom Yoga 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoyoga3"] = {
		"missfam5_yoga",
		"c6_pose",
		"Custom Yoga 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoyoga4"] = {
		"missfam5_yoga",
		"c7_pose",
		"Custom Yoga 4",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekopost"] = {
		"missfbi4leadinoutfbi_4_int",
		"agents_idle_a_andreas",
		"Custom post",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekomonkey"] = {
		"missfbi5ig_30monkeys",
		"monkey_a_freakout_loop",
		"Custom Monkey",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekomonkey2"] = {
		"missfbi5ig_30monkeys",
		"monkey_c_freakout_loop",
		"Custom Monkey 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekocry"] = {
		"missfinale_a_ig_2",
		"trevor_death_reaction_pt",
		"Custom Cry",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoreverence"] = {
		"missfra2",
		"lamar_base_idle",
		"Custom Reverence",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekopost2"] = {
		"misshair_shop@barbers",
		"keeper_base",
		"Custom Post 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,

		}
	},
	["nekopost3"] = {
		"misshair_shop@hair_dressers",
		"keeper_idle_a",
		"Custom Post 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoclamber"] = {
		"missheist_agency3aig_19",
		"ground_call_help",
		"Custom Clamber",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekosleep2"] = {
		"missheist_jewel",
		"cop_on_floor",
		"Custom Sleep 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoyoga5"] = {
		"misslamar1leadinout",
		"yoga_01_idle",
		"Custom Yoga 5",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["pose1"] = {
		"custom@female_pose_1",
		"female_pose_1",
		"Pose 1",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["pose2"] = {
		"custom@female_pose_2",
		"female_pose_2",
		"Pose 2",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["pose3"] = {
		"custom@female_pose_3",
		"female_pose_3",
		"Pose 3",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["pose4"] = {
		"custom@male_pose_1",
		"male_pose_1",
		"Pose 4",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["pose5"] = {
		"custom@male_pose_2",
		"male_pose_2",
		"Pose 5",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["pose6"] = {
		"custom@male_pose_3",
		"male_pose_3",
		"Pose 6",
		AnimationOptions =
		{
			EmoteMoving = false,
			EmoteLoop = true,
		}
	},
	["fuckpose"] = {
		"fuckpose@queensister",
		"fuckpose_clip",
		"fuckpose",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["dab"] = {
		"custom@dab",
		"dab",
		"Dab",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["cantsee"] = {
		"custom@cant_see",
		"cant_see",
		"Can't See",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["sheesh"] = {
		"custom@sheeeeesh",
		"sheeeeesh",
		"Sheesh",
		AnimationOptions =
		{
			EmoteMoving = true,
			EmoteDuration = 8000,
		}
	},
	["whatidk"] = {
		"custom@what_idk",
		"what_idk",
		"What? Don't Know",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
}

Lists.Emotes.Other = {
	["anekosawatdee"] = {
		"fam_4_int_alt1-17",
		"cs_amandatownley_dual-17",
		"Custom sawatdee",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = true,
		}
	},
	["anekosawatdee2"] = {
		"fos_ep_1_p1-26",
		"csb_imran_dual-26",
		"Custom sawatdee2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
    ["dispenser"] = {
        "mini@sprunk",
        "plyr_buy_drink_pt1",
        "Distributeur",
        AnimationOptions = {EmoteLoop = false, EmoteMoving = true}
    },
    ["cocaine"] = {
        "missfbi3_party",
        "snort_coke_b_male3",
        "Sniffer de la cocaine",
        AnimationOptions = {EmoteLoop = false}
    },
    ["pee"] = {
        "misscarsteal2peeing",
        "peeing_loop",
        "Pisser - Homme",
        AnimationOptions = {EmoteStuck = true}
    },
    ["pee2"] = {
        "missbigscore1switch_trevor_piss",
        "piss_loop",
        "Pisser 2 - Homme",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["pee3"] = {
        "missbigscore1switch_trevor_piss",
        "piss_loop",
        "Pee 3 Static (Male)",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["hump"] = {
        "timetable@trevor@skull_loving_bear",
        "skull_loving_bear",
        "Hump",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["wank"] = {
        "anim@mp_player_intselfiewank",
        "idle_a",
        "Wank",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true},
        AdultAnimation = true
    },
    ["wank2"] = {
        "anim@mp_player_intupperwank",
        "idle_a",
        "Wank 2",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true},
        AdultAnimation = true
    },
    ["wank3"] = {
        "mp_player_int_upperwank",
        "mp_player_int_wank_02",
        "Wank 3",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true},
        AdultAnimation = true
    },
    ["wank4"] = {
        "mp_player_int_upperwank",
        "mp_player_int_wank_02_fp",
        "Wank 4",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true},
        AdultAnimation = true
    },
    ["wank5"] = {
        "mp_player_intwank",
        "mp_player_int_wank",
        "Wank 5",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = false},
        AdultAnimation = true
    },
    ["grieve"] = {
        "anim@miss@low@fin@vagos@",
        "idle_ped05",
        "Etre triste",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["buzz"] = {
        "anim@apt_trans@buzzer",
        "buzz_reg",
        "Sonner à la porte",
        AnimationOptions = {EmoteLoop = false, EmoteMoving = false}
    },
    ["beast"] = {
        "anim@mp_fm_event@intro",
        "beast_transform",
        "Fou",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 5000}
    },
    ["bringiton"] = {
        "misscommon@response",
        "bring_it_on",
        "Qu'est-ce qu'y a",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 3000}
    },
    ["celebrate"] = {
        "rcmfanatic1celebrate",
        "celebrate",
        "Célébrer",
        AnimationOptions = {EmoteLoop = true}
    },
    ["curtsy"] = {
        "anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left",
        "Danseuse étoile"
    },
    ["airplane"] = {
        "missfbi1",
        "ledge_loop",
        "Se prendre pour un avion",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["nervous2"] = {
        "mp_missheist_countrybank@nervous",
        "nervous_idle",
        "Méfiant 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["nervous"] = {
        "amb@world_human_bum_standing@twitchy@idle_a",
        "idle_c",
        "Méfiant",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["nervous3"] = {
        "rcmme_tracey1",
        "nervous_loop",
        "Méfiant 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["zombiewalk"] = { -- Custom Emote By BoringNeptune
        "zombies_animations",
        "zombi_walk_01",
        "Marcher comme un zombie",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false -- true looks weird but the option is here
        }
    },
    ["zombiewalk2"] = { -- Custom Emote By BoringNeptune
        "zombies_animations",
        "zombi_walk_02",
        "Marcher comme un zombie 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["zombieagony"] = { -- Custom Emote By BoringNeptune
        "zombies_animations",
        "agony",
        "Agoniser comme un zombie",
        AnimationOptions = {EmoteLoop = true}
    },
    ["zombiescream"] = { -- Custom Emote By BoringNeptune
        "zombies_animations",
        "scream",
        "Crier comme un zombie",
        AnimationOptions = {EmoteLoop = true}
    },
    ["zombiecrawl"] = { -- Custom Emote By BoringNeptune
        "zombies_animations",
        "crawl_01",
        "Ramper comme un zombie",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "meditateup",
            ExitEmoteType = "Exits"
        }
    },
    ["peek"] = {
        "random@paparazzi@peek",
        "left_peek_a",
        "Espionner",
        AnimationOptions = {EmoteLoop = true}
    },
    ["push"] = {
        "missfinale_c2ig_11",
        "pushcar_offcliff_f",
        "Pousser",
        AnimationOptions = {EmoteLoop = true}
    },
    ["push2"] = {
        "missfinale_c2ig_11",
        "pushcar_offcliff_m",
        "Pousser 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["stumble"] = {
        "misscarsteal4@actor",
        "stumble",
        "Trébucher",
        AnimationOptions = {EmoteLoop = true}
    },
    ["stunned"] = {
        "stungun@standing",
        "damage",
        "Électrocuté",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lol"] = {
        "anim@arena@celeb@flat@paired@no_props@",
        "laugh_a_player_b",
        "LOL",
        AnimationOptions = {EmoteLoop = true}
    },
    ["lol2"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "giggle_a_player_b",
        "LOL 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["fishdance"] = {
        "anim@mp_player_intupperfind_the_fish",
        "idle_a",
        "Danse du poisson",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["ledge"] = {
        "missfbi1",
        "ledge_loop",
        "Superman",
        AnimationOptions = {EmoteLoop = true}
    },
    ["superhero"] = {
        "rcmbarry",
        "base",
        "Superhero",
        AnimationOptions = {EmoteLoop = true}
    },
    ["superhero2"] = {
        "rcmbarry",
        "base",
        "Superhero 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["mindcontrol"] = {
        "rcmbarry",
        "mind_control_b_loop",
        "Contrôle de la pensée",
        AnimationOptions = {EmoteLoop = true}
    },
    ["mindcontrol2"] = {
        "rcmbarry",
        "bar_1_attack_idle_aln",
        "Contrôle de la pensée 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["clown"] = {
        "rcm_barry2",
        "clown_idle_0",
        "Clown",
        AnimationOptions = {EmoteLoop = true}
    },
    ["clown2"] = {
        "rcm_barry2",
        "clown_idle_1",
        "Clown 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["clown3"] = {
        "rcm_barry2",
        "clown_idle_2",
        "Clown 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["clown4"] = {
        "rcm_barry2",
        "clown_idle_3",
        "Clown 4",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["clown5"] = {
        "rcm_barry2",
        "clown_idle_6",
        "Clown 5",
        AnimationOptions = {EmoteLoop = true}
    },
    ["tryclothes"] = {
        "mp_clothing@female@trousers",
        "try_trousers_neutral_a",
        "Se regarder dans le miroir",
        AnimationOptions = {EmoteLoop = true}
    },
    ["tryclothes2"] = {
        "mp_clothing@female@shirt",
        "try_shirt_positive_a",
        "Se regarder dans le miroir 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["tryclothes3"] = {
        "mp_clothing@female@shoes",
        "try_shoes_positive_a",
        "Se regarder dans le miroir 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["uncuff"] = {
        "mp_arresting",
        "a_uncuff",
        "Démenotter",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["namaste"] = {
        "timetable@amanda@ig_4",
        "ig_4_base",
        "Namaste",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["threaten"] = {
        "random@atmrobberygen",
        "b_atm_mugging",
        "Pointé une arme comme un gangster",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["radio"] = {
        "random@arrests",
        "generic_radio_chatter",
        "Radio",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["pull"] = {
        "random@mugging4",
        "struggle_loop_b_thief",
        "Tirer le maillot de quelqu'un",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["bird"] = {"random@peyote@bird", "wakeup", "Faire l'oiseau"},
    ["chicken"] = {
        "random@peyote@chicken",
        "wakeup",
        "Faire la poule",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["bark"] = {"random@peyote@dog", "wakeup", "Faire le chien par terre"},
    ["rabbit"] = {"random@peyote@rabbit", "wakeup", "Faire le lapin"},
    ["spiderman"] = {
        "missexile3",
        "ex03_train_roof_idle",
        "Spider-Man",
        AnimationOptions = {EmoteLoop = true, NotInVehicle = true}
    },
    ["cuffedfront"] = {
        "anim@move_m@prisoner_cuffed",
        "idle",
        "Handcuffed - Front",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            ExitEmote = "breakfreefont",
            ExitEmoteType = "Exits"
        }
    },
    ["cuffedback"] = {
        "mp_arresting",
        "idle",
        "Handcuffed - Back",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            ExitEmote = "breakfreeback",
            ExitEmoteType = "Exits"
        }
    },
	["nekodig"] = {
		"missmic1leadinoutmic_1_mcs_2",
		"_leadin_trevor",
		"Custom Dig",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekowashface"] = {
		"missmic2_washing_face",
		"michael_washing_face",
		"Custom Wash Face",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekorepent"] = {
		"misstrevor1",
		"threaten_ortega_endloop_ort",
		"Custom Repent",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositchair13"] = {
		"misstrevor3",
		"bike_chat_a_1",
		"Custom Sit Chair 13",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekocheck"] = {
		"misstvrram_5",
		"marines_idle_b",
		"Custom Check",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekowash"] = {
		"timetable@floyd@clean_kitchen@idle_a",
		"idle_a",
		"Custom Wash",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},

	["nekowash2"] = {
		"timetable@floyd@clean_kitchen@base",
		"base",
		"Custom Wash 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},

	["nekositpost"] = {
		"switch@michael@smoking2",
		"loop",
		"Custom Sit Post",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositpost2"] = {
		"switch@trevor@pushes_bodybuilder",
		"001426_03_trvs_5_pushes_bodybuilder_idle_bb2",
		"Custom Sit Post 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositpost3"] = {
		"timetable@reunited@ig_10",
		"base_jimmy",
		"Custom Sit Post 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositpost4"] = {
		"anim@heists@fleeca_bank@hostages@intro",
		"intro_loop_ped_a",
		"Custom Sit Post 4",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositpost5"] = {
		"anim@amb@office@pa@male@",
		"greetng_b_intro",
		"Custom Sit Post 5",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositmafia3"] = {
		"anim@amb@office@boss@female@",
		"idle_d",
		"Custom Sit Mafia 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositpost6"] = {
		"timetable@ron@ig_3_p3",
		"ig_3_p3_base",
		"Custom Sit Post 6",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekositpost7"] = {
		"timetable@trevor@smoking_meth@idle_a",
		"idle_a",
		"Custom Sit Post 7",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekodrunk2"] = {
		"timetable@tracy@ig_7@base",
		"base",
		"Custom Drunk 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoverydrunk"] = {
		"timetable@tracy@ig_7@idle_a",
		"idle_a",
		"Custom Very Drunk",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekodrunk3"] = {
		"timetable@tracy@ig_7@idle_a",
		"idle_b",
		"Custom Drunk 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoparody"] = {
		"anim@mp_player_intupperthumb_on_ears",
		"idle_a",
		"Custom Parody",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,

		}
	},
	["nekoparody2"] = {
		"anim@mp_player_intincarthumb_on_earsstd@ps@",
		"idle_a",
		"Custom Parody 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,

		}
	},
	["nekoparody3"] = {
		"anim@mp_player_intincarfreakoutstd@rps@",
		"idle_a",
		"Custom Parody 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,

		}
	},
	["nekoparody4"] = {
		"anim@mp_player_intcelebrationmale@thumb_on_ears",
		"thumb_on_ears",
		"Custom Parody 4",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,

		}
	},
	["nekoparody5"] = {
		"anim@mp_player_intcelebrationfemale@thumb_on_ears",
		"thumb_on_ears",
		"Custom Parody 5",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,

		}
	},
	["nekoshow"] = {
		"missfbi_s4mop",
		"lobby_security_fp_player",
		"Custom Show",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = true,

		}
	},
	["nekopicksnot"] = {
		"anim@mp_player_intincarnose_pickstd@ps@",
		"exit",
		"Custom Pick snot",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = true,

		}
	},
	["nekoparody6"] = {
		"anim@mp_player_intincardockbodhi@rds@",
		"idle_a_fp",
		"Custom Parody 6",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,

		}
	},
	["nekofear2"] = {
		"anim@heists@prison_heistunfinished_biz@popov_react",
		"popov_flinch_a",
		"Custom Fear 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekofear3"] = {
		"anim@heists@prison_heistunfinished_biz@popov_react",
		"popov_flinch_b",
		"Custom Fear 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoheartbroken"] = {
		"anim@heists@prison_heistig_5_p1_rashkovsky_idle",
		"idle",
		"Custom Heart Broken",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekofear4"] = {
		"anim@heists@ornate_bank@hostages@hit",
		"hit_loop_ped_c",
		"Custom Fear 4",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekofear5"] = {
		"anim@heists@ornate_bank@hostages@hit",
		"hit_loop_ped_d",
		"Custom Fear 5",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekoincite"] = {
		"fos_ep_1_p5-1",
		"csb_anita_dual-1",
		"Custom Incite",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,

		}
	},
	["nekomasturbate"] = {
		"switch@trevor@jerking_off",
		"trev_jerking_off_exit",
		"Custom Masturbate",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},
	["nekomasturbate2"] = {
		"switch@trevor@jerking_off",
		"trev_jerking_off_loop",
		"Custom Masturbate 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekotest87"] = {
		"switch@trevor@puking_into_fountain",
		"trev_fountain_puke_loop",
		"Custom test87",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekotest88"] = {
		"timetable@trevor@skull_loving_bear",
		"skull_loving_bear",
		"Custom test88",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekotest89"] = {
		"anim@move_hostages@male",
		"male_idle_to_cower",
		"Arrestation Police",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},
	["nekositmassage"] = {
		"missheistdocks2aleadinoutlsdh_2a_int",
		"massage_loop_2_floyd",
		"Custom Sit Massage",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekomassage"] = {
		"missheistdocks2aleadinoutlsdh_2a_int",
		"massage_loop_2_trevor",
		"Custom Massage",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekomassage2"] = {
		"missheistdocks2aleadinoutlsdh_2a_int",
		"massage_loop_floyd",
		"Custom Massage 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekomassage3"] = {
		"missheistdocks2bleadinoutlsdh_2b_int",
		"leg_massage_b_floyd",
		"Custom Massage 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekomassage4"] = {
		"missheistdocks2bleadinoutlsdh_2b_int",
		"leg_massage_floyd",
		"Custom Massage 4",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["neko2"] = {
		"fos_ep_1_p1-0",
		"cs_lazlow_dual-0",
		"Custom 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},

	["neko3"] = {
		"fos_ep_1_p1-0",
		"csb_imran_dual-0",
		"Custom 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},

	["neko4"] = {
		"fos_ep_1_p1-1",
		"cs_lazlow_dual-1",
		"Custom 4",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},

	["neko5"] = {
		"fos_ep_1_p1-1",
		"csb_anita_dual-1",
		"Custom 5",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},

	["neko6"] = {
		"fos_ep_1_p1-1",
		"csb_imran_dual-1",
		"Custom 6",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},

	["neko7"] = {
		"fos_ep_1_p5-2",
		"csb_william_dual-2",
		"Custom 7",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["neko8"] = {
		"timetable@trevor@ig_1",
		"ig_1_therearejustsomemoments_patricia",
		"Custom 8",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["neko9"] = {
		"impexp_int_l1-11",
		"mp_m_waremech_01_dual-11",
		"Custom 9",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["neko10"] = {
		"amb@prop_human_seat_computer@male@react_shock",
		"forward",
		"Custom 10",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["neko11"] = {
		"amb@prop_human_seat_bar@male@elbows_on_bar@idle_b",
		"idle_d",
		"Custom 11",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["neko12"] = {
		"amb@incar@male@security@idle_a",
		"idle_a",
		"Custom 12",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekopost4"] = {
		"mpcas_int-2",
		"s_m_y_casino_01^1_dual-2",
		"Custom post4",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["nekohelp"] = {
		"missheist_agency3aig_19",
		"ground_call_help",
		"Custom help",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekosleep3"] = {
		"missheist_agency3amcs_4b",
		"crew_dead_crew2",
		"Custom sleep3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekosleep4"] = {
		"missheist_jewel",
		"gassed_npc_customer1",
		"Custom sleep4",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekosleep5"] = {
		"missheist_jewel",
		"gassed_npc_customer2",
		"Custom sleep5",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekosleep6"] = {
		"missheist_jewel",
		"gassed_npc_customer3",
		"Custom sleep6",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekosleep7"] = {
		"missheist_jewel",
		"gassed_npc_customer4",
		"Custom sleep7",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekositpost8"] = {
		"missheistdockssetup1ig_10@base",
		"talk_pipe_base_worker1",
		"Custom sitpost8",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekocall"] = {
		"missheistdockssetup1ig_14",
		"floyd_ok_now_grab_the_container",
		"Custom Call",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekodrunk4"] = {
		"missheistpaletopinned",
		"pinned_against_wall_pro_loop_buddy",
		"Custom drunk4",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekoyoga6"] = {
		"misslamar1leadinout",
		"yoga_02_idle_b",
		"Custom yoga6",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekolieabout"] = {
		"missmic2ig_11",
		"mic_2_ig_11_a_p_one",
		"Custom lie about",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekobundle"] = {
		"missprologueig_2",
		"idle_on_floor_gaurd",
		"Custom bundle",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekobundle2"] = {
		"missprologueig_2",
		"idle_outside_cuboard_gaurd",
		"Custom bundle2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["nekosleep8"] = {
		"missprologueig_6",
		"lying_dead_brad",
		"Custom sleep8",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekosleep9"] = {
		"missprologueig_6",
		"lying_dead_player0",
		"Custom sleep9",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekorod"] = {
		"misstrevor1ig_3",
		"action_b",
		"Custom rod",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekocheck2"] = {
		"misstrevor3",
		"bike_chat_b_loop_1",
		"Custom check2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekocheck3"] = {
		"misstvrram_5",
		"marines_idle_b",
		"Custom check3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekonumb"] = {
		"mp_arrest_paired",
		"crook_p1_idle",
		"Custom numb",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["nekonumb2"] = {
		"mp_cop_miss",
		"dazed",
		"Custom numb2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["incar"] = {
		"mini@prostitutes@sexnorm_veh",
		"bj_loop_male",
		"Sex in Car",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,
		}
	},

	["incar2"] = {
		"mini@prostitutes@sexnorm_veh",
		"bj_loop_prostitute",
		"Sex in Car 2",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},
	["incar3"] = {
		"mini@prostitutes@sexlow_veh",
		"low_car_sex_loop_female",
		"Sex in Car 3",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},

	["nekosex"] = {
		"misscarsteal2pimpsex",
		"pimpsex_hooker",
		"Custom Sex",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},

	["nekosex2"] = {
		"misscarsteal2pimpsex",
		"pimpsex_pimp",
		"Custom Sex2",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},

	["nekosex3"] = {
		"misscarsteal2pimpsex",
		"pimpsex_punter",
		"Custom Sex3",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},

	["nekosex4"] = {
		"misscarsteal2pimpsex",
		"shagloop_hooker",
		"Custom Sex4",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},

	["nekosex5"] = {
		"misscarsteal2pimpsex",
		"shagloop_pimp",
		"Custom Sex5",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},

	["nekosex6"] = {
		"rcmpaparazzo_2",
		"shag_action_poppy",
		"Custom Sex6",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},

	["nekosex7"] = {
		"rcmpaparazzo_2",
		"shag_action_a",
		"Custom Sex5",
		AnimationOptions =
		{
			EmoteLoop = false,
			EmoteMoving = false,

		}
	},
	["nekogivebirth"] = {
		"mini@cpr@char_a@cpr_str",
		"cpr_kol",
		"Custom Give birth",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["nekotiedup"] = {
		"random@burial",
		"b_burial",
		"Custom Tied up",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["sexo"] = {
		"rcmpaparazzo_2",
		"shag_loop_poppy",
		"Sexo F",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["sexo2"] = {
		"rcmpaparazzo_2",
		"shag_loop_a",
		"Sexo M",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
	["sexo3"] = {
		"anim@mp_player_intcelebrationfemale@air_shagging",
		"air_shagging",
		"Sexo 3",
		AnimationOptions =
		{
			EmoteLoop = true,
		}
	},
}

Lists.Emotes.Activities = {
    ["parcours01"] = {
        "parkour@anims",
        "big_jump_01",
        "Faire du parcours - 1",
        AnimationOptions = {EmoteLoop = false}
    },
    ["parcours02"] = {
        "parkour@anims",
        "front_twist_flip",
        "Faire du parcours - 2",
        AnimationOptions = {EmoteLoop = false}
    },
    ["parcours03"] = {
        "parkour@anims",
        "jump_over_01",
        "Faire du parcours - 3",
        AnimationOptions = {EmoteLoop = false}
    },
    ["parcours04"] = {
        "parkour@anims",
        "jump_over_02",
        "Faire du parcours - 4",
        AnimationOptions = {EmoteLoop = false}
    },
    ["parcours05"] = {
        "parkour@anims",
        "slide_kip_up",
        "Faire du parcours - 5",
        AnimationOptions = {EmoteLoop = false}
    },
    ["parcours06"] = {
        "parkour@anims",
        "jump_over_03",
        "Faire du parcours - 6",
        AnimationOptions = {EmoteLoop = false}
    },
    ["parcours07"] = {
        "parkour@anims",
        "slide_backside",
        "Faire du parcours - 7",
        AnimationOptions = {EmoteLoop = false}
    },
    ["parcours08"] = {
        "parkour@anims",
        "slide",
        "Faire du parcours - 8",
        AnimationOptions = {EmoteLoop = false}
    },
    ["parcours09"] = {
        "parkour@anims",
        "swing_jump",
        "Faire du parcours - 9",
        AnimationOptions = {EmoteLoop = false}
    },
    ["parcours10"] = {
        "parkour@anims",
        "wall_flip",
        "Faire du parcours - 10",
        AnimationOptions = {EmoteLoop = false}
    },
    ["pickfromground"] = {
        "custom@pickfromground",
        "pickfromground",
        "Choisir dans le sol",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["pluck"] = {
        "custom@pluck_fruits",
        "pluck_fruits",
        "Cueillir des fruits",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["waiter"] = {
        "custom@waiter",
        "waiter",
        "Serveur",
        AnimationOptions = {EmoteMoving = true, EmoteLoop = true}
    },
    ["airguitar"] = {
        "anim@mp_player_intcelebrationfemale@air_guitar", "air_guitar",
        "Air Guitar"
    },
    ["airsynth"] = {
        "anim@mp_player_intcelebrationfemale@air_synth", "air_synth",
        "Air Piano"
    },
    ["bow"] = {
        "anim@arena@celeb@podium@no_prop@",
        "regal_c_1st",
        "Merci de fin de spectacle",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["bow2"] = {
        "anim@arena@celeb@podium@no_prop@",
        "regal_a_1st",
        "Merci de fin de spectacle 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["fallover"] = {
        "random@drunk_driver_1", "drunk_fall_over", "Ivre à en tomber"
    },
    ["fallover2"] = {"mp_suicide", "pistol", "Se tirer une balle dans la tête"},
    ["fallover3"] = {"mp_suicide", "pill", "Prendre du poison"},
    ["fallover4"] = {
        "friends@frf@ig_2", "knockout_plyr",
        "Se prendre une balle en pleine tête"
    },
    ["fallover5"] = {
        "anim@gangops@hostage@", "victim_fail", "Se prendre une droite"
    },
    ["hiking"] = {
        "move_m@hiking",
        "idle",
        "Tenir son sac",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["inspect"] = {"random@train_tracks", "idle_e", "Inspecter"},
    ["mechanic"] = {
        "mini@repair",
        "fixing_a_ped",
        "Réparer un moteur",
        AnimationOptions = {EmoteLoop = true}
    },
    ["mechanic2"] = {
        "mini@repair",
        "fixing_a_player",
        "Réparer un moteur 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["mechanic3"] = {
        "amb@world_human_vehicle_mechanic@male@base",
        "base",
        "Réparer l'avant du véhicule",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["mechanic4"] = {
        "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        "machinic_loop_mechandplayer",
        "Réparer un moteur 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["mechanic5"] = {
        "amb@prop_human_movie_bulb@idle_a",
        "idle_b",
        "Réparer un moteur 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["meditate"] = {
        "rcmcollect_paperleadinout@",
        "meditiate_idle",
        "Méditer",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["meditate2"] = {
        "rcmepsilonism3",
        "ep_3_rcm_marnie_meditating",
        "Méditer 2",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["meditate3"] = {
        "rcmepsilonism3",
        "base_loop",
        "Méditer 3",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["type"] = {
        "anim@heists@prison_heiststation@cop_reactions",
        "cop_b_idle",
        "Taper sur un clavier",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["type2"] = {
        "anim@heists@prison_heistig1_p1_guard_checks_bus",
        "loop",
        "Taper sur un clavier 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["type3"] = {
        "mp_prison_break",
        "hack_loop",
        "Taper sur un clavier 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["type4"] = {
        "mp_fbi_heist",
        "loop",
        "Taper sur un clavier 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["petting"] = {
        "creatures@rottweiler@tricks@",
        "petting_franklin",
        "Caresser",
        AnimationOptions = {EmoteLoop = true}
    },
	["circlecrunch"] = {
		"custom@circle_crunch",
		"circle_crunch",
		"Circle Crunch",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
}

Lists.Emotes.Gang = {
    ["mara"] = {
        "mp_player_int_uppergang_sign_a",
        "mp_player_int_gang_sign_a",
        "Marabunta",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["bal3"] = {
        "mp_player_int_uppergang_sign_b",
        "mp_player_int_gang_sign_b",
        "Ballas 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["fam3"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_b@low@ps@base",
        "idle_a",
        "Families 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["vag3"] = {
        "amb@code_human_in_car_mp_actions@v_sign@std@rds@base",
        "idle_a",
        "Vagos 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["anim60s"] = {
        "60anim@animation",
        "60anim_clip",
        "Signe 60 Block",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["bal1"] = {
        "bal1@animation",
        "bal1_clip",
        "Ballas 1",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["bal2"] = {
        "bal2@animation",
        "bal2_clip",
        "Ballas 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["fam1"] = {
        "fam1@animation",
        "fam1_clip",
        "Families 1",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["fam2"] = {
        "fam2@animation",
        "fam2_clip",
        "Families 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["vag1"] = {
        "vag1@animation",
        "vag1_clip",
        "Vagos 1",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["vag2"] = {
        "vag2@animation",
        "vag2_clip",
        "Vagos 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["pipougang"] = {
        "custom@mgsign_01",
        "mgsign_01",
        "Pipou gang",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["gchoowook"] = {
        "94glockychoowook@animation",
        "choowook_clip",
        "Gang Sign CHOO/WOOK",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gdoaogzk"] = {
        "94glockydoaogzk@animation",
        "doaogzk_clip",
        "Gang Sign DOA/OGzK",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gmovin"] = {
        "94glockymovin@animation",
        "movin_clip",
        "Gang Sign M8v3N",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gmakk"] = {
        "94glockymakk@animation",
        "makkballa_clip",
        "Gang Sign Makk Balla",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["goyogzk"] = {
        "oyogzk@94glocky",
        "94glockyoyogzk_clip",
        "Gang Sign OYOGzK",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["anim60s2"] = {
        "anim@60sv2",
        "60sv2_clip",
        "Signe 60 Block 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsixfinger"] = {
        "anim@sixfingers",
        "six_clip",
        "Signe Six Finger",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gnhtnh"] = {
        "anim@nhtnh",
        "nhtnh_clip",
        "Signe NHTNH",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gnayba"] = {
        "anim@nayba",
        "nayba_clip",
        "Signe Nayba",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gfcktrays"] = {
        "anim@fcktrays",
        "fcktrays_clip",
        "Signe Fuck Trays",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dhandsup"] = {
        "drillpack@karxem",
        "handsup",
        "Drill Hands Up",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dpour"] = {
        "drillpack@karxem",
        "pour",
        "Drill Pour",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dcrossfinger"] = {
        "drillpack@karxem",
        "crossfinger",
        "Drill Crossfinger",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["dnope"] = {
        "drillpack@karxem",
        "nope",
        "Drill Nope",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gplayboy"] = {
        "anim@playboyig",
        "playboy_clip",
        "Signe Playboy",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsureno"] = {
        "anim@sureno",
        "sureno_clip",
        "Signe Sureno",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsureno2"] = {
        "sureno@thrtn",
        "thrtn_clip",
        "Signe Sureno 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["grabbit1"] = {
        "sureno@rabbit1",
        "rabbit_clip",
        "Signe Rabbit",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["anim30s"] = {
        "sign@ninety",
        "ninety_clip",
        "Signe 30s",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["anim30s2"] = {
        "sign@ninety2",
        "ninety2_clip",
        "Signe 30s 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["anim90s"] = {
        "signs@30s",
        "thirty_clip",
        "Signe 90s",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["anim90s2"] = {
        "signs@30s2",
        "thirty2_clip",
        "Signe 90s 2",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    --[[ ["gsign01"] = {
        "custom@gsign_05",
        "gsign_05",
        "Signe Gang 1",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    }, ]]
    ["gsign02"] = {
        "custom@gsign_33",
        "gsign_33",
        "Signe Gang 2",
        AnimationOptions = {EmoteLoop = false, EmoteMoving = true}
    },
    ["gsign03"] = {
        "grapes@sign",
        "grapes",
        "Signe Gang 3",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign04"] = {
        "grapes@sign2",
        "grapes",
        "Signe Gang 4",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign05"] = {
        "grapes@sign3",
        "sign",
        "Signe Gang 5",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign06"] = {
        "grapes@sign4",
        "sign",
        "Signe Gang 6",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign07"] = {
        "anim@guttagang",
        "gutta_clip",
        "Signe Gang 7",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign08"] = {
        "byrd@sign",
        "sign",
        "Signe Gang 8",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign09"] = {
        "byrd@sign2",
        "sign",
        "Signe Gang 9",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign10"] = {
        "byrd@sign3",
        "sign",
        "Signe Gang 10",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign11"] = {
        "byrd@sign4",
        "sign",
        "Signe Gang 11",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign12"] = {
        "byrd@sign5",
        "sign",
        "Signe Gang 12",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign13"] = {
        "byrd@sign6",
        "sign",
        "Signe Gang 13",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign14"] = {
        "fucknapps@animation",
        "fucknapps_clip",
        "Signe Gang 14",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign15"] = {
        "hooversit@animation",
        "hooversit_clip",
        "Signe Gang 15",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign16"] = {
        "pistolstand@animation",
        "pistolstand_clip",
        "Signe Gang 16",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign17"] = {
        "hooverlean@animation",
        "hooverlean_clip",
        "Signe Gang 17",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign18"] = {
        "b_k@sharror",
        "b_k_clip_ierrorr",
        "Signe Gang 18",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign19"] = {
        "victory@sharror",
        "victory_clip_ierrorr",
        "Signe Gang 19",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign20"] = {
        "blood@sharror",
        "blood_clip_ierrorr",
        "Signe Gang 20",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign21"] = {
        "compton_crip@sharror",
        "compton_crip_clip_ierrorr",
        "Signe Gang 21",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign22"] = {
        "crip@sharror",
        "crip_clip_ierrorr",
        "Signe Gang 22",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign23"] = {
        "eastside@sharror",
        "eastside_clip_ierrorr",
        "Signe Gang 23",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign24"] = {
        "hoover_crip_gun@sharror",
        "hoover_crip_gun_clip_ierrorr",
        "Signe Gang 24",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign25"] = {
        "killa_gun@sharror",
        "killa_gun_clip_ierrorr",
        "Signe Gang 25",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign26"] = {
        "latin_kings@sharror",
        "latin_kings_clip_ierrorr",
        "Signe Gang 26",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign27"] = {
        "mafia_crips@sharror",
        "mafia_crips_clip_ierrorr",
        "Signe Gang 27",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign28"] = {
        "piru@sharror",
        "piru_clip_ierrorr",
        "Signe Gang 28",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign29"] = {
        "underground_crips@sharror",
        "underground_crips_clip_ierrorr",
        "Signe Gang 29",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign30"] = {
        "westcoast@sharror",
        "westcoast_clip_ierrorr",
        "Signe Gang 30",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
    ["gsign31"] = {
        "westside_westcoast@sharror",
        "westside_westcoast_clip_ierrorr",
        "Signe Gang 31",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = false}
    },
	["gsign004"] = {
		"pose11@94glocky",
		"pose11_clip",
		"Pose 11",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign005"] = {
		"qpacc@nygang1",
		"nygang1_clip",
		"NY Gang 1 Crips",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign006"] = {
		"qpacc@nygang2",
		"nygang2_clip",
		"NY Gang 2 DOAK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign007"] = {
		"qpacc@nygang3",
		"nygang3_clip",
		"NY Gang 3 YGz",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign008"] = {
		"qpacc@nygang4",
		"nygang4_clip",
		"NY Gang 4 WOO",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign009"] = {
		"qpacc@nygang5",
		"nygang5_clip",
		"NY Gang 5 SexMoneyMurda",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign010"] = {
		"qpacc@nygang6",
		"nygang6_clip",
		"NY Gang 6 OGz",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign011"] = {
		"qpacc@nygang7",
		"nygang7_clip",
		"NY Gang 7 OYK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign012"] = {
		"qpacc@nygang8",
		"nygang8_clip",
		"NY Gang 8 MakkBallaFamily",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign013"] = {
		"qpacc@nygang9",
		"nygang9_clip",
		"NY Gang 9 NHC",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign014"] = {
		"qpacc@nygang10",
		"nygang10_clip",
		"NY Gang 10 MakkBalla & Fukk",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign015"] = {
		"qpacc@nygang11",
		"nygang11_clip",
		"NY Gang 11 DOAK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign016"] = {
		"qpacc@nygang12",
		"nygang12_clip",
		"NY Gang 12 4z",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign017"] = {
		"qpacc@nygang13",
		"nygang13_clip",
		"NY Gang 13 NHC",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign018"] = {
		"qpacc@nygang14",
		"nygang14_clip",
		"NY Gang 14 NHCK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign019"] = {
		"qpacc@nygang15",
		"nygang15_clip",
		"NY Gang 15 HoundK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign020"] = {
		"qpacc@nygang16",
		"nygang16_clip",
		"NY Gang 16 GDK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign021"] = {
		"qpacc@nygang17",
		"nygang17_clip",
		"NY Gang 17 WOOK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign022"] = {
		"qpacc@nygang18",
		"nygang18_clip",
		"NY Gang 18 B",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign023"] = {
		"qpacc@nygang19",
		"nygang19_clip",
		"NY Gang 19 OYK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign024"] = {
		"qpacc@nygang20",
		"nygang20_clip",
		"NY Gang 20 Slime ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign025"] = {
		"qpacc@nygang21",
		"nygang21_clip",
		"NY Gang 21 Hound",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign026"] = {
		"qpacc@nygang22",
		"nygang22_clip",
		"NY Gang 22",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign027"] = {
		"qpacc@nygang23",
		"nygang23_clip",
		"NY Gang 23 OYK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign028"] = {
		"qpacc@nygang24",
		"nygang24_clip",
		"NY Gang 24 GD",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign029"] = {
		"qpacc@nygang25",
		"nygang25_clip",
		"NY Gang 25 MakkBallaFamily",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign030"] = {
		"qpacc@nygang26",
		"nygang26_clip",
		"NY Gang 26 YGz",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign031"] = {
		"qpacc@nygang27",
		"nygang27_clip",
		"NY Gang 27 MakkBalla & Props",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign032"] = {
		"qpacc@nygang28",
		"nygang28_clip",
		"NY Gang 28",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign033"] = {
		"qpacc@nygang29",
		"nygang29_clip",
		"NY Gang 29 4z",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign034"] = {
		"qpacc@nygang30",
		"nygang30_clip",
		"NY Gang 30 5zK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign035"] = {
		"qpacc@nygang31",
		"nygang31_clip",
		"NY Gang 31 HoundK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign036"] = {
		"qpacc@nygang32",
		"nygang32_clip",
		"NY Gang 32",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign037"] = {
		"qpacc@nygang33",
		"nygang33_clip",
		"NY Gang 33 GDK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign038"] = {
		"qpacc@regularstance1",
		"regularstance1_clip",
		"Regular Stance 1",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign039"] = {
		"qpacc@regularstance2",
		"regularstance2_clip",
		"Regular Stance 2 Gun Pose",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign040"] = {
		"qpacc@regularstance3",
		"regularstance3_clip",
		"Regular Stance 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign041"] = {
		"qpacc@regularstance4",
		"regularstance4_clip",
		"Regular Stance 4 Chuut!",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign042"] = {
		"qpacc@regularstance5",
		"regularstance5_clip",
		"Regular Stance 5 Gun Pose",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign043"] = {
		"qpacc@regularstance6",
		"regularstance6_clip",
		"Regular Stance 6",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign045"] = {
		"qpacc@regularstance8",
		"regularstance8_clip",
		"Regular Stance 8 Crossarms",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign046"] = {
		"qpacc@regularstance9",
		"regularstance9_clip",
		"Regular Stance 9",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign047"] = {
		"qpacc@regularstance10",
		"regularstance10_clip",
		"Regular Stance 10 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign048"] = {
		"qpacc@regularstance11",
		"regularstance11_clip",
		"Regular Stance 11",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign049"] = {
		"qpacc@regularstance12",
		"regularstance12_clip",
		"Regular Stance 12 Watch",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign050"] = {
		"qpacc@regularstance13",
		"regularstance13_clip",
		"Regular Stance 13 Crossarms ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign051"] = {
		"qpacc@regularstance14",
		"regularstance14_clip",
		"Regular Stance 14",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign052"] = {
		"qpacc@regularstance15",
		"regularstance15_clip",
		"Regular Stance 15 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign053"] = {
		"qpacc@regularstance16",
		"regularstance16_clip",
		"Regular Stance 16",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign054"] = {
		"qpacc@regularstance17",
		"regularstance17_clip",
		"Regular Stance 17",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign055"] = {
		"qpacc@regularstance18",
		"regularstance18_clip",
		"Regular Stance 18",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign056"] = {
		"qpacc@regularstance19",
		"regularstance19_clip",
		"Regular Stance 19",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign057"] = {
		"qpacc@regularstance20",
		"regularstance20_clip",
		"Regular Stance 20",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign052_2"] = {
		"qpacc@regularstance21",
		"regularstance21_clip",
		"Regular Stance 21 WOO",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign053_2"] = {
		"qpacc@regularstance22",
		"regularstance22_clip",
		"Regular Stance 22",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign054_2"] = {
		"qpacc@regularstance23",
		"regularstance23_clip",
		"Regular Stance 23",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign055_2"] = {
		"qpacc@regularstance24",
		"regularstance24_clip",
		"Regular Stance 24 Double Fuck",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign056_2"] = {
		"qpacc@regularstance25",
		"regularstance25_clip",
		"Regular Stance 25",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign057_2"] = {
		"qpacc@regularstance26",
		"regularstance26_clip",
		"Regular Stance 26",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign058"] = {
		"qpacc@regularstance27",
		"regularstance27_clip",
		"Regular Stance 27",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign059"] = {
		"qpacc@regularstance28",
		"regularstance28_clip",
		"Regular Stance 28",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign060"] = {
		"qpacc@regularstance29",
		"regularstance29_clip",
		"Regular Stance 29",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign061"] = {
		"qpacc@regularstance30",
		"regularstance30_clip",
		"Regular Stance 30 Double Fuck",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign062"] = {
		"qpacc@regularstance31",
		"regularstance31_clip",
		"Regular Stance 31 Movin Crips",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign063"] = {
		"qpacc@regularstance32",
		"regularstance32_clip",
		"Regular Stance 32",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign064"] = {
		"qpacc@regularstance33",
		"regularstance33_clip",
		"Regular Stance 33 Money Pose",
		AnimationOptions =
		{
			Prop = 'bkr_prop_cutter_moneypage',
			PropBone = 64096,
			PropPlacement = { 0.0900, 0.0160, -0.0300, 0.2461856, 0.7872477, 0.0023882 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign065"] = {
		"qpacc@regularstance34",
		"regularstance34_clip",
		"Regular Stance 34 Fuck",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign066"] = {
		"qpacc@regularstance35",
		"regularstance35_clip",
		"Regular Stance 35",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign066_2"] = {
		"qpacc@regularstance36",
		"regularstance36_clip",
		"Regular Stance 36 Fuck",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign067"] = {
		"qpacc@regularstance37",
		"regularstance37_clip",
		"Regular Stance 37  Facepalm",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign069"] = {
		"qpacc@regularstance39",
		"regularstance39_clip",
		"Regular Stance 39",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign070"] = {
		"qpacc@regularstance40",
		"regularstance40_clip",
		"Regular Stance 40 Crips",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign071"] = {
		"qpacc@regularstance41",
		"regularstance41_clip",
		"Regular Stance 41",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign072"] = {
		"qpacc@regularstance42",
		"regularstance42_clip",
		"Regular Stance 42",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign073"] = {
		"qpacc@regularstance43",
		"regularstance43_clip",
		"Regular Stance 43",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign074"] = {
		"qpacc@regularstance44",
		"regularstance44_clip",
		"Regular Stance 44 Money Pose",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 4090,
			PropPlacement = { 0.0000, -0.0390, -0.0290, 2.2304, 58.3771, 31.8549 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign075"] = {
		"qpacc@regularstance45",
		"regularstance45_clip",
		"Regular Stance 45",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign076"] = {
		"qpacc@regularstance46",
		"regularstance46_clip",
		"Regular Stance 46",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign077"] = {
		"qpacc@regularstance47",
		"regularstance47_clip",
		"Regular Stance 47",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign078"] = {
		"qpacc@regularstance48",
		"regularstance48_clip",
		"Regular Stance 48 Money Pose",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 64017,
			PropPlacement = { 0.0110, -0.0450, -0.0040, 7.4405, -67.5842, -2.3618 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign079"] = {
		"qpacc@regularstance49",
		"regularstance49_clip",
		"Regular Stance 49",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign080"] = {
		"qpacc@regularstance50",
		"regularstance50_clip",
		"Regular Stance 50",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign081"] = {
		"qpacc@regularstance51",
		"regularstance51_clip",
		"Regular Stance 51",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign082"] = {
		"qpacc@regularstance52",
		"regularstance52_clip",
		"Regular Stance 52 Gun Pose",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign083"] = {
		"qpacc@regularstance53",
		"regularstance53_clip",
		"Regular Stance 53",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign084"] = {
		"qpacc@regularstance54",
		"regularstance54_clip",
		"Regular Stance 54",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign085"] = {
		"qpacc@regularstance55",
		"regularstance55_clip",
		"Regular Stance 55 Smoke Pose",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 4090,
			PropPlacement = { 0.0280, -0.0020, 0.0150, -7.0345092, 67.9037057, -17.6946468 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign086"] = {
		"qpacc@regularstance56",
		"regularstance56_clip",
		"Regular Stance 56 Double Fuck",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign087"] = {
		"qpacc@regularstance57",
		"regularstance57_clip",
		"Regular Stance 57  Phone Pose",
		AnimationOptions =
		{
			Prop = 'prop_amb_phone',
			PropBone = 26611,
			PropPlacement = { 0.0450, -0.0280, 0.0010, -3.3698368, 30.0689668, 3.8289125 },
			SecondProp = 'v_res_fa_book01',
			SecondPropBone = 64017,
			SecondPropPlacement = { 0.0350, -0.0320, 0.0040, 8.0000, 0.0000, 0.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign089"] = {
		"qpacc@regularstance58",
		"regularstance58_clip",
		"Regular Stance 58  Gun Pose & Cup",
		AnimationOptions =
		{
			Prop = 'prop_plastic_cup_02',
			PropBone = 4089,
			PropPlacement = { 0.0410, -0.0120, -0.0150, -170.0000008, 0.00000, -30.000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign090"] = {
		"qpacc@regularstance59",
		"regularstance59_clip",
		"Regular Stance 59",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign091"] = {
		"qpacc@regularstance60",
		"regularstance60_clip",
		"Regular Stance 60 Hound",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign092"] = {
		"qpacc@regularstance61",
		"regularstance61_clip",
		"Regular Stance 61",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign093"] = {
		"qpacc@regularstance62",
		"regularstance62_clip",
		"Regular Stance 62 Gun Pose",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign094"] = {
		"qpacc@regularstance63",
		"regularstance63_clip",
		"Regular Stance 63",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign095"] = {
		"qpacc@regularstance64",
		"regularstance64_clip",
		"Regular Stance 64",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign096"] = {
		"qpacc@regularstance65",
		"regularstance65_clip",
		"Regular Stance 65",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign097"] = {
		"qpacc@regularstance66",
		"regularstance66_clip",
		"Regular Stance 66 Money Pose",
		AnimationOptions =
		{
			Prop = 'prop_anim_cash_note_b',
			PropBone = 4089,
			PropPlacement = { 0.0480, 0.0580, -0.0150, -4.5620378, 8.0600729, -42.7619593 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign098"] = {
		"qpacc@regularstance67",
		"regularstance67_clip",
		"Regular Stance 67",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign099"] = {
		"qpacc@regularstance68",
		"regularstance68_clip",
		"Regular Stance 68 Money Pose",
		AnimationOptions =
		{
			Prop = 'bkr_prop_cutter_moneypage',
			PropBone = 64097,
			PropPlacement = { 0.0100, 0.0150, -0.0260, 11.8467003, 96.6172508, 15.8535182 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4090,
			SecondPropPlacement = { 0.0720, -0.0390, -0.0270, 0.0000, -100.0000, 0.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	--[[ ["gsign0100"] = {
		"qpacc@regularstance69",
		"regularstance69_clip",
		"Regular Stance 69",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	}, ]]
	["gsign195"] = {
		"94glockymovin@animation",
		"movin_clip",
		"Gang Sign 195 Movin Crips",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["gsign197"] = {
		"94glockychoowook@animation",
		"choowook_clip",
		"Gang Sign 197 CHOO/WOOK ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign198"] = {
		"94glockypocket@animation",
		"pocket_clip",
		"Gang Sign 198 Handspocket ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["gsign199"] = {
		"94glockycrips3@animation",
		"crips3_clip",
		"Gang Sign 199 NLE Choppa",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["gsign200"] = {
		"pose1@94glocky",
		"94glockypose1_clip",
		"Gang Sign 200 Slime Pose",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign201"] = {
		"oyogzk@94glocky",
		"94glockyoyogzk_clip",
		"Gang Sign 201 OGzK ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign202"] = {
		"pose2@94glocky",
		"94glockypose2_clip",
		"Gang Sign 202 Simple Pose ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign203"] = {
		"94glockydoaogzk@animation",
		"doaogzk_clip",
		"Gang Sign 203 DOA OYK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign204"] = {
		"pose3@94glocky",
		"94glockypose3_clip",
		"Gang Sign 204 Pose KayKay",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign205"] = {
		"ygz@94glocky",
		"ygz_clip",
		"Gang Sign 205 YGz ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign206"] = {
		"pose4@94glocky",
		"94glockypose4_clip",
		"Gang Sign 206 Watch",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign207"] = {
		"handspocket3@94glocky",
		"handspocket3_clip",
		"Gang Sign 207 Handspocket",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["gsign208"] = {
		"gunpose1@94glocky",
		"gunpose1_clip",
		"Gang Sign 208 Gun Pose 1",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign209"] = {
		"2fuck@94glocky",
		"2fuck_clip",
		"Gang Sign 209 Double Fuck",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign210"] = {
		"pose8@94glocky",
		"94glockypose8_clip",
		"Gang Sign 210 Fuck & Smoke Props",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64097,
			PropPlacement = { 0.0130, 0.0120, -0.0080, 27.3209, -45.5643, 30.4325 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign211"] = {
		"wook@94glocky",
		"wook_clip",
		"Gang Sign 211 WOOK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign212"] = {
		"wook2@94glocky",
		"wook2_clip",
		"Gang Sign 212 WOOK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign213"] = {
		"pose9@94glocky",
		"94glockypose9_clip",
		"Gang Sign 213 Lean Cup Props",
		AnimationOptions =
		{
			Prop = 'p_amb_coffeecup_01',
			PropBone = 4170,
			PropPlacement = { 0.0170, -0.0590, 0.0100, 0.0000, 0.0000, 0.0000 },
			SecondProp = 'p_watch_04',
			SecondPropBone = 35502,
			SecondPropPlacement = { -0.1800, -0.0010, 0.0300, 0.0000, 0.0000, 0.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign214"] = {
		"gd@94glocky",
		"gd_clip",
		"Gang Sign 214 Gangster Disciple",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign215"] = {
		"choocripsk@94glocky",
		"choocripsk_clip",
		"Gang Sign 215 CHOO/CK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign216"] = {
		"41@94glocky",
		"41_clip",
		"Gang Sign 216 41",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign217"] = {
		"ogzk@94glocky",
		"ogzk_clip",
		"Gang Sign 217 OYK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign218"] = {
		"gunpose2@94glocky",
		"gunpose2_clip",
		"Gang Sign 218 Gun Pose",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign219"] = {
		"6wild@94glocky",
		"6wild_clip",
		"Gang Sign 219 6Wild",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign220"] = {
		"nottiboppin@94glocky",
		"nottiboppin_clip",
		"Gang Sign 220 Notti Boppin",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["gsign221"] = {
		"pose10@94glocky",
		"pose10_clip",
		"Gang Sign 221 Fuck",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign222"] = {
		"3ni@94glocky",
		"3ni_clip",
		"Gang Sign 222 3ni",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign223"] = {
		"3ni2@94glocky",
		"3ni2_clip",
		"Gang Sign 223 3ni",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign224"] = {
		"mbk@94glocky",
		"mbk_clip",
		"Gang Sign 224 MBFK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign225"] = {
		"3nik@94glocky",
		"3nik_clip",
		"Gang Sign 225 3ni K",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign226"] = {
		"movink@94glocky",
		"movink_clip",
		"Gang Sign 226 MovinK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign227"] = {
		"doak@94glocky",
		"doak_clip",
		"Gang Sign 227 DOAK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign228"] = {
		"ygzkdoa@94glocky",
		"ygzkdoa_clip",
		"Gang Sign 228 DOA/YGK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["gsign230"] = {
		"doa@94glocky",
		"doa_clip",
		"Gang Sign 230 MBF/DOA",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign231"] = {
		"gunpose8kf@94glocky",
		"gunpose8kf_clip",
		"Gang Sign 231 Gun Pose KayKay",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign232"] = {
		"makkballa@94glocky@kenzoballa",
		"makkballakenzo_clip",
		"Gang Sign 232 MBF Kenzo Balla Props",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 64080,
			PropPlacement = { 0.0330, 0.0430, 0.0400, -80.4744, -71.9308, 7.1861 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign233"] = {
		"kflockpose@94glocky",
		"kflockpose_clip",
		"Gang Sign 233 KayKay Slime Pose",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign234"] = {
		"gsc@94glocky",
		"gsc_clip",
		"Gang Sign 234 Grape",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign235"] = {
		"r30k@94glocky",
		"r30k_clip",
		"Gang Sign 235 R30K",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign236"] = {
		"gunpose9@94glocky",
		"gunpose9_clip",
		"Gang Sign 236 Gun Pose 9",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign237"] = {
		"crips@pose1@94glocky",
		"crips194glocky_clip",
		"Gang Sign 237 Pose C & Smoke",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 4169,
			PropPlacement = { 0.0410, -0.0320, 0.0010, 0.0000, -99.0, -11.0 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign238"] = {
		"nhck@94glocky",
		"nhck_clip",
		"Gang Sign 238 NHC K",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign239"] = {
		"ygz@1@94glocky",
		"ygz1_clip",
		"Gang Sign 239 YGz",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign240"] = {
		"gdk@1@94glocky",
		"gdk1_clip",
		"Gang Sign 240 GDK",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign242"] = {
		"lbic@1@94glocky",
		"lbic1_clip",
		"Gang Sign 242 InsaneBaby23 LB Crips",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign243"] = {
		"smm@1@94glocky",
		"smm1_clip",
		"Gang Sign 243 SMM",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign244"] = {
		"slime@kr@94glocky",
		"slimekylerich_clip",
		"Gang Sign 244 Slime Kyle Rich Pose",
		AnimationOptions =
		{
			Prop = 'prop_paper_box_05',
			PropBone = 4169,
			PropPlacement = { 0.0980, 0.0290, -0.0240, -163.6197, -153.2180, 40.0483 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign245"] = {
		"pose@kr41@94glocky",
		"pose41kr_clip",
		"Gang Sign 245 Pose Kyle Rich",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign246"] = {
		"pose@kayflock1@94glocky",
		"posekf1_clip",
		"Gang Sign 246 KayKay Fuck",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign247"] = {
		"pose@drilly@94glocky",
		"posedrilly1_clip",
		"Gang Sign 247 Hound 1",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign248"] = {
		"smokecup@pose@94glocky",
		"smokecup1_clip",
		"Gang Sign 248 Smoke Cup",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64017,
			PropPlacement = { 0.0450, 0.0030, 0.0000, 61.9707, -67.7540, -1.0330 },
			SecondProp = 'p_amb_coffeecup_01',
			SecondPropBone = 4185,
			SecondPropPlacement = { 0.0220, -0.0600, 0.0000, 0.0000, 0.0000, 0.0000 },
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["gsign249"] = {
		"slime@gunpose@94glocky",
		"slimegp1_clip",
		"Gang Sign 249 Slime Gun Pose",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign250"] = {
		"ok@2@94glocky",
		"ok2_clip",
		"Gang Sign O's K",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign251"] = {
		"gdk@2@94glocky",
		"gdk2_clip",
		"Gang Sign 251 GDK2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign252"] = {
		"posesmoke@1@94glocky",
		"posesmoke1_clip",
		"Gang Sign 252 Pose Smoke Duo",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64017,
			PropPlacement = { 0.0370, -0.0090, 0.0000, 0.0000, 315.0, 0.0000 },
			EmoteLoop = true,
			EmoteMoving = false,

		}
	},
	["gsign253"] = {
		"smelly@1@94glocky",
		"smelly1_clip",
		"Gang Sign 253 Smelly 1",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign254"] = {
		"smelly@2@94glocky",
		"smelly2_clip",
		"Gang Sign 254 Movin 1",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign255"] = {
		"mitchel@1@94glocky",
		"mitchel1_clip",
		"Gang Sign 255 Mitchel",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign256"] = {
		"gunpose@rifle@94glocky",
		"gunposerifle_clip",
		"Gang Sign 256 Gun Pose & Rifle",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign257"] = {
		"ygzk@1@94glocky",
		"1ygzk_clip",
		"Gang Sign 257 YGK 1",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign258"] = {
		"6blockcity@1@94glocky",
		"6bc1_clip",
		"Gang Sign 258 6BC Harlem",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign259"] = {
		"6blockcity@2@94glocky",
		"26bc_clip",
		"Gang Sign 259 6BC OY Harlem",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign261"] = {
		"slime@94glocky@slime",
		"slimslim_clip",
		"Gang Sign 261 Slime",
		AnimationOptions =
		{
			Prop = 'v_res_investbook01',
			PropBone = 4090,
			PropPlacement = { 0.0540, -0.0090, 0.0000, -27.9559, -20.4167, 41.3180 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign262"] = {
		"props@pose@1@94glocky",
		"pp194_clip",
		"Gang Sign 262 Cyan Flag & Smoke Props",
		AnimationOptions =
		{
			Prop = 'vw_prop_casino_art_bottle_01a',
			PropBone = 58868,
			PropPlacement = { 0.1400, 0.2600, 0.0400, 0.0000, 0.0000, 0.0000 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4090,
			SecondPropPlacement = { 0.0350, -0.0120, 0.0000, 76.0858, 101.2346, 30.4004 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign2621"] = {
		"props@pose@1@94glocky",
		"pp194_clip",
		"Gang Sign 262 Red Flag & Smoke Props",
		AnimationOptions =
		{
			Prop = 'ex_office_swag_jewelwatch',
			PropBone = 58868,
			PropPlacement = { 0.1400, 0.2600, 0.0400, 0.0000, 0.0000, 0.0000 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4090,
			SecondPropPlacement = { 0.0350, -0.0120, 0.0000, 76.0858, 101.2346, 30.4004 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign2622"] = {
		"props@pose@1@94glocky",
		"pp194_clip",
		"Gang Sign 262 Blue Flag & Smoke Props",
		AnimationOptions =
		{
			Prop = 'ng_proc_sodacup_03c',
			PropBone = 58868,
			PropPlacement = { 0.1400, 0.2600, 0.0400, 0.0000, 0.0000, 0.0000 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4090,
			SecondPropPlacement = { 0.0350, -0.0120, 0.0000, 76.0858, 101.2346, 30.4004 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign263"] = {
		"pose@smokecup@94glocky",
		"posesmokecup_clip",
		"Gang Sign 263 Smoke Cup 2 Props ",
		AnimationOptions =
		{
			Prop = 'prop_energy_drink',
			PropBone = 4186,
			PropPlacement = { 0.0210, -0.0510, 0.0790, 0.0000, 0.0000, 0.0000 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 64017,
			SecondPropPlacement = { 0.0360, -0.0120, 0.0090, 32.7324, -57.2675, 24.4044 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign264"] = {
		"props@blunt@1@94glocky",
		"pb194_clip",
		"Gang Sign 264 Smoke Blunt Props (Move)",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64017,
			PropPlacement = { 0.0310, -0.0100, 0.0200, 0.0000, -100.0000, 0.0000 },
			SecondProp = 'p_cs_lighter_01',
			SecondPropBone = 4186,
			SecondPropPlacement = { 0.0300, -0.0170, 0.0190, 168.3079, 164.6601, 48.9735391 },
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["gsign2641"] = {
		"props@blunt@1@94glocky",
		"pb194_clip",
		"Gang Sign 264 Smoke Blunt Props (Fix)",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64017,
			PropPlacement = { 0.0310, -0.0100, 0.0200, 0.0000, -100.0000, 0.0000 },
			SecondProp = 'p_cs_lighter_01',
			SecondPropBone = 4186,
			SecondPropPlacement = { 0.0300, -0.0170, 0.0190, 168.3079, 164.6601, 48.9735391 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign265"] = {
		"pose@hands@94glocky",
		"posehands1_clip",
		"Gang Sign 265 Pose Simple",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign266"] = {
		"oyk@tata@94glocky",
		"tataoyk_clip",
		"Gang Sign 266 Tata Pose OYK",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 58867,
			PropPlacement = { -0.0010, 0.0570, -0.0010, -1.3643, -51.0451, -14.0412 },
			SecondProp = 'bkr_prop_money_wrapped_01',
			SecondPropBone = 58867,
			SecondPropPlacement = { 0.0260, 0.0600, -0.0410, -0.7251, -51.0595, -14.8071 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign267"] = {
		"ygz@4sev@94glocky",
		"4sevygz_clip",
		"Gang Sign 267 YGz 4z",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign268"] = {
		"gunpose@blunt@94glocky",
		"gunposeblunt_clip",
		"Gang Sign 268 Gun Blunt Props",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 4090,
			PropPlacement = { 0.0340, -0.0040, -0.0210, 180.0000, 90.0000, 40.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign269"] = {
		"th@94glocky",
		"th_94glocky_clip",
		"Gang Sign 269 Woo Lotti ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign270"] = {
		"mbk@2@94glocky",
		"mbk2_clip",
		"Gang Sign 270 MBF K ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign271"] = {
		"slatteryboyz@1@94glocky",
		"sb1_clip",
		"Gang Sign 271 Smelly 2 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign272"] = {
		"m8v3nok@94glocky",
		"m8v3ok_clip",
		"Gang Sign 272 Movin 2 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign273"] = {
		"slime@kf@94glocky",
		"slimekf_clip",
		"Gang Sign 273 Slime",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign274"] = {
		"twoshotz@94glocky",
		"twoshotz_clip",
		"Gang Sign 274 9ineowe 1 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign275"] = {
		"twoshotz@2@94glocky",
		"twoshotz2_clip",
		"Gang Sign 275 9ineowe 2 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign276"] = {
		"doak@2@94glocky",
		"doak2_clip",
		"Gang Sign 276 DOAK 2 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign277"] = {
		"oyk@2@94glocky",
		"oyk2_clip",
		"Gang Sign 277 OYK ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign278"] = {
		"smm@mbf@94glocky",
		"smm_mbf_clip",
		"Gang Sign 278 SMM MBF ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign279"] = {
		"gsb@1@94glocky",
		"gsb1_clip",
		"Gang Sign 279 Gorilla Stones Bloods ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign280"] = {
		"slime@kf2@from94",
		"slimekf2_clip",
		"Gang Sign 280 Slime KayKay ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign281"] = {
		"smmmbfk@from94",
		"smmmbfk_clip",
		"Gang Sign 281 MBF SMM K ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign282"] = {
		"slime@oyk@from94",
		"slimeoyk_clip",
		"Gang Sign 282 Slime OYK ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign283"] = {
		"gunpose@from94",
		"gunposefrom94_clip",
		"Gang Sign 283 Gun Pose 4 Props ",
		AnimationOptions =
		{
			Prop = 'prop_amb_phone',
			PropBone = 26611,
			PropPlacement = { 0.0510, -0.0330, 0.0000, 0.0000, 0.0000, 0.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign284"] = {
		"o@from94",
		"ofrom94_clip",
		"Gang Sign 284 O's ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign285"] = {
		"gunpose4@94glocky",
		"gunpose4_clip",
		"Gang Sign 285 Gun Pose 5 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign286"] = {
		"gunpose5@94glocky",
		"gunpose5_clip",
		"Gang Sign 286 Gun Pose 6 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign286_2"] = {
		"doa@makkballa@from94",
		"doamakkballa_clip",
		"Gang Sign 287 DOA 2 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign291"] = {
		"bigdoa@from94",
		"bigdoa_clip",
		"Gang Sign 291 DOA 3 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign293"] = {
		"oyk@from94",
		"oyk_clip",
		"Gang Sign 293 OYK 2 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign296"] = {
		"ygz@from94",
		"ygzfrom94_clip",
		"Gang Sign 296 YGz ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign299"] = {
		"gunpose@slime@from94",
		"gunposeslime_clip",
		"Gang Sign 299 Gun Pose & Slime 2 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign300"] = {
		"gunpose@4@from94",
		"gunpose4_clip",
		"Gang Sign 300 Gun Pose 8 ",
		AnimationOptions =
		{
			Prop = 'prop_amb_phone',
			PropBone = 26611,
			PropPlacement = { 0.0500, -0.0520, -0.0100, -20.0000, 0.0000, -30.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign301"] = {
		"dthanggz@from94",
		"dthanggz_clip",
		"Gang Sign 301 Dthang Gz ",
		AnimationOptions =
		{
			Prop = 'prop_amb_phone',
			PropBone = 26612,
			PropPlacement = { 0.0520, -0.0360, -0.0060, -19.9999, 0.0000, -11.9999 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign302"] = {
		"chook2@from94",
		"chook2_clip",
		"Gang Sign 302 Hound K ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign303"] = {
		"movin@from94",
		"movinfrom94_clip",
		"Gang Sign 303 Movin 3 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign305"] = {
		"4sevkygzk@from94",
		"4sevkygzk_clip",
		"Gang Sign 304 4zK YGK ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign306"] = {
		"smelly@3@from94",
		"smelly3_clip",
		"Gang Sign 305 Smelly 3 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign307"] = {
		"nhc@from94",
		"nhcfrom94_clip",
		"Gang Sign 306 NHC ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign308"] = {
		"gunclip@from94",
		"gunclip94_clip",
		"Gang Sign 307 Gun Pose 9 ",
		AnimationOptions =
		{
			Prop = 'w_pi_appistol',
			PropBone = 64097,
			PropPlacement = { 0.0100, 0.0280, -0.0200, 3.6164416, 10.6275841, -19.6834981 },
			SecondProp = 'w_pi_appistol_mag2',
			SecondPropBone = 64096,
			SecondPropPlacement = { -0.0300, 0.0400, -0.0020, 4.9728141, -7.2560318, 15.5126862 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign309"] = {
		"pillspose@from94",
		"pillspose_clip",
		"Gang Sign 308 Pills Pose Props ",
		AnimationOptions =
		{
			Prop = 'ba_prop_club_water_bottle',
			PropBone = 4170,
			PropPlacement = { 0.0176, -0.0400, -0.0080, -180.0000, -180.0000, 10.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign310"] = {
		"backpack@from94",
		"backpack_clip",
		"Gang Sign 309 BackPack Pose Props ",
		AnimationOptions =
		{
			Prop = 'vw_prop_vw_backpack_01a',
			PropBone = 58868,
			PropPlacement = { 0.4900, 0.2100, -0.1700, 18.8817, -71.1182, 6.7177 },
			SecondProp = 'prop_coffee_cup_trailer',
			SecondPropBone = 26612,
			SecondPropPlacement = { 0.2030, -0.0500, -0.1000, -1.1160, -61.5482, 22.2421 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign311"] = {
		"cuppose@from94",
		"cuppose_clip",
		"Gang Sign 310 Cup Pose Props ",
		AnimationOptions =
		{
			Prop = 'p_watch_06',
			PropBone = 64097,
			PropPlacement = { 0.0390, 0.0550, 0.0250, 6.4836, -1.1054, 25.8912 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign312"] = {
		"settybpose@from94",
		"settybpose_clip",
		"Gang Sign 311 Smoke Bottle Props ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64064,
			PropPlacement = { 0.0051, -0.0380, 0.0481, 0.0000, 0.0000, 0.0000 },
			SecondProp = 'prop_energy_drink',
			SecondPropBone = 58867,
			SecondPropPlacement = { -0.0080, 0.0570, -0.0210, 17.4952, 28.4812, 9.8465 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign313"] = {
		"doa@k@from94",
		"doakk_clip",
		"Gang Sign 312 DOAK 3 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign314"] = {
		"gunpose@5@from94",
		"gunpose5_clip",
		"Gang Sign 313 Gun Pose 10 Props ",
		AnimationOptions =
		{
			Prop = 'w_pi_appistol',
			PropBone = 64096,
			PropPlacement = { 0.0321, 0.0100, 0.0030, -4.6293, -11.0096, -24.5947 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign315"] = {
		"ygz@smoke@from94",
		"ygzsmoke_clip",
		"Gang Sign 314 YGz Smoke Props ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 4170,
			PropPlacement = { 0.0270, -0.0050, 0.0210, -45.6102, -111.1178, 23.2374 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign316"] = {
		"dthanggz@2@from94",
		"dthanggz2_clip",
		"Gang Sign 315 YGz DThang Props ",
		AnimationOptions =
		{
			Prop = 'ba_prop_battle_whiskey_bottle_2_s',
			PropBone = 64081,
			PropPlacement = { -0.0520, 0.0380, -0.0200, -8.8909, -8.8909, 1.4022 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4090,
			SecondPropPlacement = { 0.0450, -0.0310, 0.0190, 136.7808, -133.2191, 62.0091 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign317"] = {
		"bhb@from94",
		"bhb_clip",
		"Gang Sign 316 Hound ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign323"] = {
		"dababy@from94",
		"dababy_clip",
		"Gang Sign 322 Dababy Pose ",
		AnimationOptions =
		{

			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign324"] = {
		"smokefuck@from94",
		"smokefuck_clip",
		"Gang Sign 323 Smoke Fuck Props ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64017,
			PropPlacement = { 0.0330, -0.0100, 0.0080, -9.4921, -72.3347, 34.9029 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign325"] = {
		"syrupcup@from94",
		"syrupcup_clip",
		"Gang Sign 324 Syrup Cup Props ",
		AnimationOptions =
		{
			Prop = 'prop_cs_whiskey_bot_stop',
			PropBone = 64016,
			PropPlacement = { 0.0240, -0.1270, -0.0460, -3.0970, -10.2106, -11.6415 },
			SecondProp = 'p_amb_coffeecup_01',
			SecondPropBone = 26611,
			SecondPropPlacement = { 0.0240, -0.0620, -0.0070, -19.7197, 9.4080, -3.4048 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign326"] = {
		"hound@from94",
		"hound_clip",
		"Gang Sign 325 Hound 2 ",
		AnimationOptions =
		{
			Prop = 'prop_amb_phone',
			PropBone = 4169,
			PropPlacement = { 0.0240, -0.0220, -0.0020, -26.9999, 0.0000, 0.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign327"] = {
		"5tothesevk@from94",
		"5tothesevk_clip",
		"Gang Sign 326 5z K ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign328"] = {
		"graaa@from94",
		"graaa_clip",
		"Gang Sign 327 Hound 3 & Props ",
		AnimationOptions =
		{
			Prop = 'prop_energy_drink',
			PropBone = 26613,
			PropPlacement = { 0.0270, -0.0490, 0.0000, -31.6844, -20.8117, -26.0134 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4186,
			SecondPropPlacement = { 0.0130, -0.0090, 0.0150, 0.0000, 0.0000, -79.9999 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign329"] = {
		"notti@from94",
		"notti_clip",
		"Gang Sign 328 Notti Pose Props ",
		AnimationOptions =
		{
			Prop = 'prop_cs_cashenvelope',
			PropBone = 26612,
			PropPlacement = { 0.0180, -0.0630, 0.0020, 21.0587, -79.8030, 26.2084 },
			SecondProp = 'prop_cs_cashenvelope',
			SecondPropBone = 26612,
			SecondPropPlacement = { -0.0300, -0.1100, 0.0100, 9.9731, -76.8506, 26.6466 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign330"] = {
		"smm2@from94",
		"smm2_clip",
		"Gang Sign 329 SMM 2 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign331"] = {
		"ygzgunpose@from94",
		"ygzgunpose@clip",
		"Gang Sign 330 YGz Gun Pose  2 ",
		AnimationOptions =
		{
			Prop = 'w_pi_appistol',
			PropBone = 4169,
			PropPlacement = { 0.0270, -0.0640, 0.0140, -7.6768, 2.9894, -6.4092 },
			SecondProp = 'w_pi_combatpistol',
			SecondPropBone = 4169,
			SecondPropPlacement = { -0.0130, -0.0270, 0.0140, -7.9468, 0.9917, -3.1387 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign332"] = {
		"fooddrink@from94",
		"fooddrink_clip",
		"Gang Sign 331 Food Drink Props ",
		AnimationOptions =
		{
			Prop = 'v_res_harddrive',
			PropBone = 26612,
			PropPlacement = { 0.0390, -0.0620, -0.0730, -159.4290, 163.3733, 68.6586 },
			SecondProp = 'v_res_pestle',
			SecondPropBone = 58867,
			SecondPropPlacement = { 0.1300, 0.0500, -0.0200, -119.3149, -171.4364, -11.2093 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign333"] = {
		"ygzk@3@from94",
		"ygzk3_clip",
		"Gang Sign 329 YGK 2 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign334"] = {
		"makkballa@from94",
		"makkballa_clip",
		"Gang Sign 330 MBF 2",
		AnimationOptions =
		{
			Prop = 'prop_amb_phone',
			PropBone = 4169,
			PropPlacement = { 0.0310, -0.0070, 0.0260, -29.9999, 0.0000, 10.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign335"] = {
		"trendy@from94",
		"trendy_clip",
		"Gang Sign 331 SMM 3 ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 4170,
			PropPlacement = { 0.0330, -0.0130, 0.0150, -28.6668, -93.8271, 13.5870 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign336"] = {
		"hound2@from94",
		"hound2_clip",
		"Gang Sign 332 Hound 4 ",
		AnimationOptions =
		{
			Prop = 'v_res_harddrive',
			PropBone = 26611,
			PropPlacement = { 0.0420, -0.0920, -0.1200, -118.0253, 112.2639, 68.3662 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign337"] = {
		"houndk@from94",
		"houndk_clip",
		"Gang Sign 333 Hound K 2 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign338"] = {
		"houndk2@from94",
		"houndk2_clip",
		"Gang Sign 334 Hound K 3 ",
		AnimationOptions =
		{
			Prop = 'prop_amb_phone',
			PropBone = 4169,
			PropPlacement = { 0.0310, -0.0070, 0.0260, -29.9999, 0.0000, 10.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign339"] = {
		"custompose@from94",
		"custompose_clip",
		"Gang Sign 335 Drink Pose Props ",
		AnimationOptions =
		{
			Prop = 'prop_energy_drink',
			PropBone = 4138,
			PropPlacement = { 0.0200, -0.0480, 0.0110, -3.0000, 0.0000, 0.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign340"] = {
		"bandomoney@from94",
		"bandomoney_clip",
		"Gang Sign 336 Bando Money Pose ",
		AnimationOptions =
		{
			Prop = 'prop_anim_cash_note_b',
			PropBone = 18905,
			PropPlacement = { 0.1320, 0.0590, 0.0310, -21.4501, -64.0298, -27.4011 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign341"] = {
		"dthangmoney@from94",
		"dthangmoney_clip",
		"Gang Sign 337 DThang Money Pose ",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 4186,
			PropPlacement = { 0.0310, -0.0470, -0.0020, -69.5285, -85.1123, 15.6198 },
			SecondProp = 'bkr_prop_money_unsorted_01',
			SecondPropBone = 64113,
			SecondPropPlacement = { 0.0220, 0.0520, -0.0010, 107.9773, 80.5700, 6.4065 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign342"] = {
		"showgun@from94",
		"showgun_clip",
		"Gang Sign 338 Show Gun ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign343"] = {
		"duopose7@nicocsanim",
		"duopose7_clip",
		"Gang Sign 339 Slime ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign344"] = {
		"duopose8@nicocsanim",
		"duopose8_clip",
		"Gang Sign 340 Face",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign345"] = {
		"duopose9@nicocsanim",
		"duopose9_clip",
		"Gang Sign 341 Phone & Smoke",
		AnimationOptions =
		{
			Prop = 'prop_amb_phone',
			PropBone = 58867,
			PropPlacement = { 0.0400, 0.0290, 0.0000, 176.7299304, -163.8222109, -10.301716 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4186,
			SecondPropPlacement = { 0.0000, -0.0100, 0.0150, 15.9899995, 0.0000, -70.9999961 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign346"] = {
		"duopose10@nicocsanim",
		"duopose10_clip",
		"Gang Sign 342 Gun Pose",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign347"] = {
		"duopose11@nicocsanim",
		"duopose11_clip",
		"Gang Sign 343",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign348"] = {
		"duopose12@nicocsanim",
		"duopose12_clip",
		"Gang Sign 344 Smoke",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64016,
			PropPlacement = { 0.0960, -0.0750, 0.0000, -6.9325499, 83.0674501, 21.2145097 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign349"] = {
		"showdat@bhary",
		"showdat_clip",
		"Gang Sign 345 Show That",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 4090,
			PropPlacement = { 0.0390, 0.0190, -0.0220, -7.3327677, -158.4091822, 13.2704441 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign350"] = {
		"facepalm@bhary",
		"facepalm_clip",
		"Gang Sign 346 Facepalm",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 4089,
			PropPlacement = { 0.0690, -0.0180, -0.0050, 100.1510818, -178.2462165, -9.8465523 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign351"] = {
		"couch@bhary",
		"couch_clip",
		"Gang Sign 347 Sit W Gun",
		AnimationOptions =
		{
			Prop = 'prop_amb_phone',
			PropBone = 64096,
			PropPlacement = { -0.0020, 0.0270, -0.0050, -177.7501419, -158.6730351, 22.1605531 },
			SecondProp = 'w_pi_sns_pistol',
			SecondPropBone = 4169,
			SecondPropPlacement = { 0.0390, -0.0340, 0.0010, -21.9353525, -7.4185966, 1.9968561 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign352"] = {
		"drankface@bhary",
		"drankface_clip",
		"Gang Sign 348 Drank Face",
		AnimationOptions =
		{
			Prop = 'v_res_harddrive',
			PropBone = 4090,
			PropPlacement = { -0.0100, 0.0270, 0.2100, 37.4313292, -150.361315, -54.6694121 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4090,
			SecondPropPlacement = { 0.0200, 0.0000, -0.0200, 30.0000001, 180.0000, -40.0000019 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign353"] = {
		"rollin@from94",
		"rollin_clip",
		"Gang Sign 349 ",
		AnimationOptions =
		{
			Prop = 'vw_prop_vw_backpack_01a',
			PropBone = 4090,
			PropPlacement = { 0.5270, -0.1050, 0.0130, -17.0459, -106.5831, -62.8211 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign354"] = {
		"dthanggz@3@from94",
		"dthanggz3_clip",
		"Gang Sign 350 ",
		AnimationOptions =
		{
			Prop = 'v_res_harddrive',
			PropBone = 26611,
			PropPlacement = { 0.0170, -0.0810, -0.0550, -32.1847, 30.2632, 45.3858056 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign355"] = {
		"dthanggz@4@from94",
		"dthanggz4_clip",
		"Gang Sign 350 ",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 64016,
			PropPlacement = { 0.0700, -0.0530, 0.0470, 106.4081246, -86.9139257, 14.4164295 },
			SecondProp = 'bkr_prop_money_unsorted_01',
			SecondPropBone = 64016,
			SecondPropPlacement = { 0.0380, -0.0220, 0.0000, 67.3136993, 87.4270622, -14.0831107 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign356"] = {
		"dthanggz@5@from94",
		"dthanggz5_clip",
		"Gang Sign 350 ",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 64016,
			PropPlacement = { 0.0570, -0.0590, 0.0410, 106.4081246, -86.9139257, 14.4164295 },
			SecondProp = 'bkr_prop_money_unsorted_01',
			SecondPropBone = 64016,
			SecondPropPlacement = { 0.0250, -0.0200, 0.0130, 67.3136993, 87.4270622, -14.0831107 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign357"] = {
		"nasgpgfuck@from94",
		"nasgpg_clip",
		"Gang Sign 351 ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64017,
			PropPlacement = { 0.0400, -0.0500, 0.0400, 17.4952407, 118.4812386, 9.8465523 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign358"] = {
		"smokestance@from94",
		"smokestance_clip",
		"Gang Sign 352 ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64017,
			PropPlacement = { 0.0380, 0.0280, 0.0310, 4.110867, -147.9458892, 56.0750666 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign359"] = {
		"dthanggz6@from94",
		"dthanggz6_clip",
		"Gang Sign 353 ",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 4090,
			PropPlacement = { 0.0000, -0.0380, -0.0170, -104.385204, -96.3561214, -45.7930341 },
			SecondProp = 'bkr_prop_money_unsorted_01',
			SecondPropBone = 4090,
			SecondPropPlacement = { 0.0000, -0.0900, -0.0400, -109.6567906, -108.0964678, -39.960719 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign360"] = {
		"ot9@from94",
		"ot9_clip",
		"Gang Sign 354 ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 4090,
			PropPlacement = { 0.0280, 0.0040, -0.0170, 105.3398139, 78.3079235, 48.9735391 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign361"] = {
		"grinder@from94",
		"grinder_clip",
		"Gang Sign 355 ",
		AnimationOptions =
		{
			Prop = 'ex_office_swag_booze_cigs2',
			PropBone = 64064,
			PropPlacement = { -0.0300, 0.0360, 0.0160, -95.9616729, -58.4004469, -5.6920067 },
			SecondProp = 'ex_office_swag_booze_cigs',
			SecondPropBone = 4090,
			SecondPropPlacement = { 0.0290, -0.0070, -0.0260, -105.3398139, -11.6920765, -48.9735391 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign362"] = {
		"sitwith2gun@from94",
		"sitwith2gun_clip",
		"Gang Sign 356 ",
		AnimationOptions =
		{
			Prop = 'w_pi_pistol',
			PropBone = 26611,
			PropPlacement = { 0.0700, -0.0200, 0.0100, -0.7168147, 0.0000, 3.0000 },
			SecondProp = 'w_pi_pistol',
			SecondPropBone = 58869,
			SecondPropPlacement = { 0.0800, 0.0160, 0.0700, -0.9226431, -4.1048612, -12.9677798 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign363"] = {
		"ck@from94",
		"ck_clip",
		"Gang Sign 357 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign364"] = {
		"balla@from94",
		"balla_clip",
		"Gang Sign 358 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign365"] = {
		"fanta@from94",
		"fanta_clip",
		"Gang Sign 359 ",
		AnimationOptions =
		{
			Prop = 'ex_office_swag_furcoats2',
			PropBone = 4170,
			PropPlacement = { 0.0220, -0.0580, 0.0280, -10.2777536, 10.5251825, 61.506782 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4170,
			SecondPropPlacement = { 0.0200, -0.0080, -0.0090, 0.0000, 0.0000, -59.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign367"] = {
		"chilliman@animation",
		"chilliman_clip",
		"Regular Stances 360 ",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 64065,
			PropPlacement = { 0.0320, 0.0660, 0.0000, -79.9999997, -90.0000, 0.0000 },
			SecondProp = 'bkr_prop_money_unsorted_01',
			SecondPropBone = 64113,
			SecondPropPlacement = { 0.0400, 0.0200, 0.0000, -90.0000, -92.9999999, -20.0000007 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign368"] = {
		"downassnigga@animation",
		"downassnigga_clip",
		"Regular Stances 361 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign369"] = {
		"drizzlin@animation",
		"drizzlin_clip",
		"Regular Stances 362 ",
		AnimationOptions =
		{
			Prop = 'p_watch_04',
			PropBone = 64080,
			PropPlacement = { 0.0830, 0.1680, 0.0640, 65.9959021, -86.1338459, -6.0967766 },
			SecondProp = 'prop_amb_phone',
			SecondPropBone = 26611,
			SecondPropPlacement = { 0.0400, -0.0350, -0.0200, -14.6175514, -5.1172459, -17.8057133 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign370"] = {
		"imbusysippin@animation",
		"imbusysippin_clip",
		"Regular Stances 363 ",
		AnimationOptions =
		{
			Prop = 'p_watch_06',
			PropBone = 58867,
			PropPlacement = { 0.0450, 0.0750, 0.0000, 21.9458874, -15.984012, 3.87516 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign371"] = {
		"lookatmygun@animation",
		"lookatmygun_clip",
		"Regular Stances ",
		AnimationOptions =
		{
			Prop = 'w_pi_sns_pistol',
			PropBone = 64065,
			PropPlacement = { 0.0900, 0.0300, 0.0400, 0.0000, -49.9999987, 0.0000 },
			SecondProp = 'w_pi_sns_pistol_mag2',
			SecondPropBone = 64065,
			SecondPropPlacement = { 0.0200, 0.0300, 0.0200, 179.4187473, 150.9580431, -3.1083054 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign372"] = {
		"lookatmygunspt2@animation",
		"lookatmygunspt2_clip",
		"Regular Stances 365 ",
		AnimationOptions =
		{
			Prop = 'w_pi_ceramic_pistol',
			PropBone = 26611,
			PropPlacement = { 0.0700, -0.0500, 0.0000, -4.7730419, 5.0448853, 8.6173279 },
			SecondProp = 'w_pi_vintage_pistol',
			SecondPropBone = 58867,
			SecondPropPlacement = { 0.0700, 0.0200, 0.0000, 21.3567215, 9.4518568, -6.460671 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign376"] = {
		"onlyaboutchilli@animation",
		"onlyaboutchilli_clip",
		"Regular Stances 366 ",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 4185,
			PropPlacement = { 0.0250, -0.0420, 0.0140, -5.7251053, 78.4916069, -29.4987035 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign377"] = {
		"wockboy@animation",
		"wockboy_clip",
		"Regular Stances 367 ",
		AnimationOptions =
		{
			Prop = 'p_watch_06',
			PropBone = 64064,
			PropPlacement = { 0.0300, 0.0600, 0.0000, -3.0000, 0.0000, 0.0000 },
			SecondProp = 'p_watch_04',
			SecondPropBone = 4090,
			SecondPropPlacement = { 0.0400, -0.0200, 0.1600, -1.0000, -180.0000, -30.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign380"] = {
		"spazzpose3@animation",
		"spazz_clip",
		"Regular Stances 368 ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64097,
			PropPlacement = { 0.0070, 0.0220, 0.0020, 48.2367014, -103.1678276, -15.1889236 },
			SecondProp = 'prop_plastic_cup_02',
			SecondPropBone = 4138,
			SecondPropPlacement = { 0.0190, -0.0460, 0.0690, 0.0000, 0.0000, 0.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign381"] = {
		"spazzpose4@animation",
		"spazz_clip",
		"Regular Stances 369 ",
		AnimationOptions =
		{
			Prop = 'p_watch_06',
			PropBone = 26613,
			PropPlacement = { 0.0440, -0.0470, 0.0790, -25.5970058, 18.2528474, 56.9076561 },
			SecondProp = 'vw_prop_vw_backpack_01a',
			SecondPropBone = 64065,
			SecondPropPlacement = { -0.5020, 0.1920, 0.1300, 160.2802535, -80.5919563, -3.4048673 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign382"] = {
		"qpacc@regularstance93",
		"regularstance93_clip",
		"Regular Stances 370 ",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 4090,
			PropPlacement = { -0.0040, -0.0380, 0.0380, -6.2056164, -96.2056164, 14.8687239 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign383"] = {
		"qpacc@regularstance94",
		"regularstance94_clip",
		"Regular Stances 371 ",
		AnimationOptions =
		{
			Prop = 'w_ar_carbinerifle',
			PropBone = 58867,
			PropPlacement = { -0.0580, 0.1580, -0.2370, -19.295343, -70.704657, -30.4319789 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4090,
			SecondPropPlacement = { 0.0710, -0.0370, -0.0310, 3.4511785, -110.2835598, 9.3912858 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign384"] = {
		"qpacc@regularstance95",
		"regularstance95_clip",
		"Regular Stances 372 ",
		AnimationOptions =
		{
			Prop = 'p_amb_coffeecup_01',
			PropBone = 64017,
			PropPlacement = { -0.0020, -0.0470, -0.0650, 3.9611968, 7.9807643, 0.556249 },
			SecondProp = 'w_ar_carbinerifle',
			SecondPropBone = 26614,
			SecondPropPlacement = { 0.0300, -0.0180, 0.1680, -9.723207, -39.7754439, -2.2968618 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign385"] = {
		"qpacc@regularstance96",
		"regularstance96_clip",
		"Regular Stances 373 ",
		AnimationOptions =
		{
			Prop = 'p_amb_coffeecup_01',
			PropBone = 64016,
			PropPlacement = { 0.0010, -0.0060, -0.0960, 24.3248861, 36.3937686, -57.0011521 },
			SecondProp = 'w_ar_carbinerifle',
			SecondPropBone = 4186,
			SecondPropPlacement = { -0.0100, -0.0300, 0.0600, -10.0000001, 0.0000, 11.9999997 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign386"] = {
		"obk@from94",
		"obk_clip",
		"Gang Sign ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign387"] = {
		"ballak@from94",
		"ballak_clip",
		"Gang Sign 376 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign388"] = {
		"customoyogz@from94",
		"oyogzcustom_clip",
		"Gang Sign 377 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign389"] = {
		"jayhound@from94",
		"jayhound_clip",
		"Gang Sign 378 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign390"] = {
		"jaydohitz@from94",
		"jaydohitz_clip",
		"Gang Sign 379 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign391"] = {
		"ygzcupsmoke@from94",
		"ygzcupsmoke_clip",
		"Gang Sign 380 ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64065,
			PropPlacement = { -0.0200, -0.0300, 0.0500, 0.0000, 0.0000, 0.0000 },
			SecondProp = 'v_res_harddrive',
			SecondPropBone = 64016,
			SecondPropPlacement = { 0.0470, -0.0570, -0.0770, -8.3550282, 8.2786576, 15.9986359 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign391_2"] = {
		"sdotgopose@from94",
		"sdot_clip",
		"Gang Sign 380 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign392"] = {
		"mbmb@from94",
		"mbmb_clip",
		"Gang Sign 381 ",
		AnimationOptions =
		{
			Prop = 'p_watch_06',
			PropBone = 26611,
			PropPlacement = { 0.0320, -0.0560, 0.0700, 0.0000, -10.0000003, 0.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign393"] = {
		"gelo@slausongirl",
		"slausongirl_clip",
		"Gang Sign 382 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign394"] = {
		"gelo@redd",
		"redd_clip",
		"Gang Sign 383 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign395"] = {
		"gelo@rackedupshawty",
		"rackedup_clip",
		"Gang Sign 384 ",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 58870,
			PropPlacement = { 0.0200, 0.0500, 0.0800, 0.00000, -85.0000, 0.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign397"] = {
		"gelo@nocameras",
		"nocameras_clip",
		"Gang Sign 385 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign399"] = {
		"snot_grimey@animation",
		"snot_grimey_clip",
		"Gang Sign 386 ",
		AnimationOptions =
		{
			Prop = 'prop_plastic_cup_02',
			PropBone = 26611,
			PropPlacement = { 0.0300, -0.0700, -0.0200, -74.6900248, -11.6695648, 48.9775869 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign401"] = {
		"standing_smoking2@animation",
		"standing_smoking2_clip",
		"Gang Sign 387 ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 64017,
			PropPlacement = { 0.0340, 0.0000, 0.0100, 90.0000, -59.9999996, 59.9999982 },
			SecondProp = 'prop_amb_phone',
			SecondPropBone = 26614,
			SecondPropPlacement = { 0.0570, -0.0490, 0.0300, 0.0000, 0.0000, -40.0000019 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign403"] = {
		"snot_wawg@animation",
		"snot_wawg_clip",
		"Gang Sign 388 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign415"] = {
		"rundown@from94",
		"rundown_clip",
		"Gang Sign 389  ",
		AnimationOptions =
		{
			Prop = 'w_ar_assaultrifle',
			PropBone = 64096,
			PropPlacement = { 0.0100, 0.0300, 0.0000, 1.7537835, 10.1510818, -9.8465523 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4090,
			SecondPropPlacement = { 0.0400, -0.0100, 0.0000, -11.8371427, 160.9765143, -37.4361423 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign416"] = {
		"fuckcupsmoke@from94",
		"fuckcupsmoke_clip",
		"Gang Sign 390 ",
		AnimationOptions =
		{
			Prop = 'p_amb_coffeecup_01',
			PropBone = 26613,
			PropPlacement = { 0.0890, -0.1510, -0.0210, -47.4053252, -77.2705853, -14.2237612 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4170,
			SecondPropPlacement = { 0.0100, -0.0040, -0.0100, -71.0000004, 0.0000, -79.9999923 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign417"] = {
		"femalepose@from94",
		"femalepose_clip",
		"Gang Sign 391 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign419"] = {
		"pologpose@from94",
		"pologpose_clip",
		"Gang Sign 392 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign420"] = {
		"posesit@from94",
		"posesit_clip",
		"Gang Sign 393 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign421"] = {
		"spotemmoneypose@from94",
		"spotemmoneypose_clip",
		"Gang Sign 394 ",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 4138,
			PropPlacement = { 0.0520, -0.0690, 0.0100, 110.2835598, -86.5488215, -9.3912858 },
			SecondProp = 'bkr_prop_money_unsorted_01',
			SecondPropBone = 4138,
			SecondPropPlacement = { 0.0430, -0.0440, 0.0210, -69.3531027, -84.7638107, -14.0760953 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign422"] = {
		"fucksmokecup@from94",
		"fsc_clip",
		"Gang Sign 395 ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 4169,
			PropPlacement = { 0.0400, -0.0100, -0.0100, -18.747238, -7.0959699, -68.8271678 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign423"] = {
		"femalepose2@from94",
		"femalepose2_clip",
		"Gang Sign 396 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign434"] = {
		"poohpose@dd",
		"poohpose_clip",
		"Gang Sign 397 ",
		AnimationOptions =
		{
			Prop = 'bkr_prop_cutter_moneypage',
			PropBone = 58869,
			PropPlacement = { 0.1380, 0.0550, 0.0130, 12.8959689, -15.9443881, 8.8034293 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign438"] = {
		"onehands@from94",
		"onehands_clip",
		"Gang Sign 398 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = true,
		}
	},
	["gsign439"] = {
		"justslime@from94",
		"justslime_clip",
		"Gang Sign 399 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign440"] = {
		"slimegdk@from94",
		"slimegdk_clip",
		"Gang Sign 400 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign441"] = {
		"nbafuck@from94",
		"nbafuck_clip",
		"Gang Sign 401 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign442"] = {
		"cupandbottle@from94",
		"cupandbottle_clip",
		"Gang Sign 402 ",
		AnimationOptions =
		{
			Prop = 'v_res_harddrive',
			PropBone = 4090,
			PropPlacement = { 0.0300, -0.0700, -0.2500, -168.8430382, 166.4708958, 48.0412793 },
			SecondProp = 'p_watch_06',
			SecondPropBone = 4090,
			SecondPropPlacement = { 0.0400, -0.0230, 0.0950, -8.9958125, 27.0857648, 6.6471686 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign444"] = {
		"moneyspread@from94",
		"moneyspread_clip",
		"Gang Sign 403 ",
		AnimationOptions =
		{
			Prop = 'v_res_ipoddock',
			PropBone = 4090,
			PropPlacement = { -0.1830, 0.0980, -0.2070, 54.8383608, -107.1371147, 8.85103 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign445"] = {
		"moneyspread2@from94",
		"moneyspread2_clip",
		"Gang Sign 404 ",
		AnimationOptions =
		{
			Prop = 'v_res_ipoddock',
			PropBone = 26611,
			PropPlacement = { -0.0050, 0.1600, -0.1740, 41.4285761, -179.1342383, -29.3411091 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign446"] = {
		"scooterfuck@from94",
		"scooterfuck_clip",
		"Gang Sign 405 ",
		AnimationOptions =
		{
			Prop = 'prop_tumbler_01b',
			PropBone = 64113,
			PropPlacement = { 0.4540, -0.9820, 0.2000, -90.0000, 0.00000, 20.0000 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign447"] = {
		"drakopose@from94",
		"drakopose_clip",
		"Gang Sign 406 ",
		AnimationOptions =
		{
			Prop = 'w_ar_assaultrifle_mag2',
			PropBone = 26611,
			PropPlacement = { -0.0280, -0.0380, -0.0060, -24.0000006, 0.0000, 0.0000 },
			SecondProp = 'w_ar_assaultrifle',
			SecondPropBone = 26613,
			SecondPropPlacement = { -0.0250, -0.0730, -0.0900, 25.6621914, -45.7382796, 26.180082 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign448"] = {
		"pose94@from94",
		"pose94_clip",
		"Gang Sign 407 ",
		AnimationOptions =
		{
			Prop = 'bkr_prop_money_unsorted_01',
			PropBone = 4186,
			PropPlacement = { 0.0100, -0.0600, 0.0100, -61.1245223, -74.4640596, 13.3562105 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign449"] = {
		"backmoney@from94",
		"backmoney_clip",
		"Gang Sign 408 ",
		AnimationOptions =
		{
			Prop = 'prop_anim_cash_note_b',
			PropBone = 64017,
			PropPlacement = { 0.0310, -0.0010, 0.0410, 59.6237443, 45.9202947, -4.1967536 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign450"] = {
		"oyoy@from94",
		"oyoy_clip",
		"Gang Sign 409 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign451"] = {
		"drinksmoke@from94",
		"drinksmoke_clip",
		"Gang Sign 410 ",
		AnimationOptions =
		{
			Prop = 'p_watch_06',
			PropBone = 58870,
			PropPlacement = { 0.0360, 0.0620, 0.0800, 8.9663098, -4.938748, -0.7812041 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 4170,
			SecondPropPlacement = { 0.0200, -0.0200, 0.0100, -5.1608082, -100.364092, -29.5935632 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign452"] = {
		"houndkphone@from94",
		"houndkphone_clip",
		"Gang Sign 411 ",
		AnimationOptions =
		{
			Prop = 'prop_amb_phone',
			PropBone = 26611,
			PropPlacement = { 0.0400, -0.0450, -0.0020, 1.4205163, 23.9960445, 1.7269448 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign453"] = {
		"carljohnsongsfcustom1@from94",
		"carljohnsongsfcustom1_clip",
		"Gang Sign 412 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla1"] = {
		"qpacc@gangsign1",
		"gangsign1_clip",
		"Gang Sign 1 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla2"] = {
		"qpacc@gangsign2",
		"gangsign2_clip",
		"Gang Sign 2 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla3"] = {
		"qpacc@gangsign3",
		"gangsign3_clip",
		"Gang Sign 3 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla4"] = {
		"qpacc@gangsign4",
		"gangsign4_clip",
		"Gang Sign 4 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla5"] = {
		"qpacc@gangsign5",
		"gangsign5_clip",
		"Gang Sign 5 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla6"] = {
		"qpacc@gangsign6",
		"gangsign6_clip",
		"Gang Sign 6 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla7"] = {
		"qpacc@gangsign7",
		"gangsign7_clip",
		"Gang Sign 7 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla8"] = {
		"qpacc@gangsign8",
		"gangsign8_clip",
		"Gang Sign 8 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla9"] = {
		"qpacc@gangsign9",
		"gangsign9_clip",
		"Gang Sign 9 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla92"] = {
		"qpacc@gangsign10",
		"gangsign10_clip",
		"Gang Sign 10 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla93"] = {
		"qpacc@gangsign11",
		"gangsign11_clip",
		"Gang Sign 11 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla94"] = {
		"qpacc@gangsign12",
		"gangsign12_clip",
		"Gang Sign 12 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla95"] = {
		"qpacc@gangsign13",
		"gangsign13_clip",
		"Gang Sign 13 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla96"] = {
		"qpacc@gangsign14",
		"gangsign14_clip",
		"Gang Sign 14 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla97"] = {
		"qpacc@gangsign15",
		"gangsign15_clip",
		"Gang Sign 15 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla98"] = {
		"qpacc@gangsign16",
		"gangsign16_clip",
		"Gang Sign 16 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla99"] = {
		"qpacc@gangsign17",
		"gangsign17_clip",
		"Gang Sign 17 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla991"] = {
		"qpacc@gangsign18",
		"gangsign18_clip",
		"Gang Sign 18 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla992"] = {
		"qpacc@gangsign19",
		"gangsign19_clip",
		"Gang Sign 19 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla993"] = {
		"qpacc@gangsign20",
		"gangsign20_clip",
		"Gang Sign 20 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla994"] = {
		"qpacc@gangsign21",
		"gangsign21_clip",
		"Gang Sign 21 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla995"] = {
		"qpacc@gangsign22",
		"gangsign22_clip",
		"Gang Sign 22 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla996"] = {
		"qpacc@gangsign23",
		"gangsign23_clip",
		"Gang Sign 23 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla997"] = {
		"qpacc@gangsign24",
		"gangsign24_clip",
		"Gang Sign 24 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla998"] = {
		"qpacc@gangsign32",
		"gangsign32_clip",
		"Gang Sign 25 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla999"] = {
		"qpacc@gangsign26",
		"gangsign26_clip",
		"Gang Sign 26 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla9991"] = {
		"qpacc@gangsign27",
		"gangsign27_clip",
		"Gang Sign 27 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla9992"] = {
		"qpacc@gangsign28",
		"gangsign28_clip",
		"Gang Sign 28 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla9993"] = {
		"qpacc@gangsign29",
		"gangsign29_clip",
		"Gang Sign 29 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla9994"] = {
		"qpacc@gangsign30",
		"gangsign30_clip",
		"Gang Sign 30 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla9995"] = {
		"qpacc@gangsign31",
		"gangsign31_clip",
		"Gang Sign 31 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla9996"] = {
		"qpacc@gangsign32",
		"gangsign32_clip",
		"Gang Sign 32 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla9997"] = {
		"qpacc@gangsign33",
		"gangsign33_clip",
		"Gang Sign 33 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignla9999"] = {
		"qpacc@gangsign34",
		"gangsign34_clip",
		"Gang Sign 34 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz99991"] = {
		"qpacc@gangsign35",
		"gangsign35_clip",
		"Gang Sign 35 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz99992"] = {
		"qpacc@gangsign36",
		"gangsign36_clip",
		"Gang Sign 36 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz99993"] = {
		"qpacc@gangsign37",
		"gangsign37_clip",
		"Gang Sign 37 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz99994"] = {
		"qpacc@gangsign38",
		"gangsign38_clip",
		"Gang Sign 38 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz99995"] = {
		"qpacc@gangsign39",
		"gangsign39_clip",
		"Gang Sign 39 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz99996"] = {
		"qpacc@gangsign40",
		"gangsign40_clip",
		"Gang Sign 40  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz99997"] = {
		"qpacc@gangsign41",
		"gangsign41_clip",
		"Gang Sign 41 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz99998"] = {
		"qpacc@gangsign42",
		"gangsign42_clip",
		"Gang Sign 42 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz99999"] = {
		"qpacc@gangsign43",
		"gangsign43_clip",
		"Gang Sign 43 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz999991"] = {
		"qpacc@gangsign44",
		"gangsign44_clip",
		"Gang Sign 44 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz999992"] = {
		"qpacc@gangsign45",
		"gangsign45_clip",
		"Gang Sign 45 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz999993"] = {
		"qpacc@gangsign46",
		"gangsign46_clip",
		"Gang Sign 46 LA  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz999994"] = {
		"qpacc@gangsign47",
		"gangsign47_clip",
		"Gang Sign 47 LA  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz999995"] = {
		"qpacc@gangsign48",
		"gangsign48_clip",
		"Gang Sign 48 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz999996"] = {
		"qpacc@gangsign49",
		"gangsign49_clip",
		"Gang Sign 49 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz999997"] = {
		"qpacc@gangsign50",
		"gangsign50_clip",
		"Gang Sign 50 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz999998"] = {
		"qpacc@gangsign51",
		"gangsign51_clip",
		"Gang Sign 51 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz999999"] = {
		"qpacc@gangsign52",
		"gangsign52_clip",
		"Gang Sign 52 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz9999991"] = {
		"qpacc@gangsign53",
		"gangsign53_clip",
		"Gang Sign 53 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz9999992"] = {
		"qpacc@gangsign54",
		"gangsign54_clip",
		"Gang Sign 54 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz9999993"] = {
		"qpacc@gangsign55",
		"gangsign55_clip",
		"Gang Sign 55 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz9999994"] = {
		"qpacc@gangsign56",
		"gangsign56_clip",
		"Gang Sign 56 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz9999995"] = {
		"qpacc@gangsign57",
		"gangsign57_clip",
		"Gang Sign 57 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz9999996"] = {
		"qpacc@gangsign58",
		"gangsign58_clip",
		"Gang Sign 58 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz9999997"] = {
		"qpacc@gangsign59",
		"gangsign59_clip",
		"Gang Sign 59 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz9999998"] = {
		"qpacc@gangsign60",
		"gangsign60_clip",
		"Gang Sign 60 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz9999999"] = {
		"qpacc@gangsign61",
		"gangsign61_clip",
		"Gang Sign 61 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsignlaz99999991"] = {
		"qpacc@gangsign62",
		"gangsign62_clip",
		"Gang Sign 62 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla1"] = {
		"qpacc@gangsign63",
		"gangsign63_clip",
		"Gang Sign 63 LA  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla2"] = {
		"qpacc@gangsign64",
		"gangsign64_clip",
		"Gang Sign 64 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla3"] = {
		"qpacc@gangsign65",
		"gangsign65_clip",
		"Gang Sign 65 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla4"] = {
		"qpacc@gangsign66",
		"gangsign66_clip",
		"Gang Sign 66 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla5"] = {
		"qpacc@gangsign67",
		"gangsign67_clip",
		"Gang Sign 67 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla7"] = {
		"qpacc@gangsign69",
		"gangsign69_clip",
		"Gang Sign 69 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla8"] = {
		"qpacc@gangsign70",
		"gangsign70_clip",
		"Gang Sign 70 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9"] = {
		"qpacc@gangsign71",
		"gangsign71_clip",
		"Gang Sign 71 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla91"] = {
		"qpacc@gangsign72",
		"gangsign72_clip",
		"Gang Sign 72 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla92"] = {
		"qpacc@gangsign73",
		"gangsign73_clip",
		"Gang Sign 73 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla93"] = {
		"qpacc@gangsign74",
		"gangsign74_clip",
		"Gang Sign 74 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla94"] = {
		"qpacc@gangsign75",
		"gangsign75_clip",
		"Gang Sign 75 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla95"] = {
		"qpacc@gangsign76",
		"gangsign76_clip",
		"Gang Sign 76 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla96"] = {
		"qpacc@gangsign77",
		"gangsign77_clip",
		"Gang Sign 77 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla97"] = {
		"qpacc@gangsign78",
		"gangsign78_clip",
		"Gang Sign 78 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla98"] = {
		"qpacc@gangsign79",
		"gangsign79_clip",
		"Gang Sign 79 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla99"] = {
		"qpacc@gangsign80",
		"gangsign80_clip",
		"Gang Sign 80 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla991"] = {
		"qpacc@gangsign81",
		"gangsign81_clip",
		"Gang Sign 81 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla992"] = {
		"qpacc@gangsign83",
		"gangsign83_clip",
		"Gang Sign 82 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla993"] = {
		"qpacc@gangsign84",
		"gangsign84_clip",
		"Gang Sign 83 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla994"] = {
		"qpacc@gangsign85",
		"gangsign85_clip",
		"Gang Sign 84 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla995"] = {
		"qpacc@gangsign86",
		"gangsign86_clip",
		"Gang Sign 85 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla996"] = {
		"qpacc@gangsign87",
		"gangsign87_clip",
		"Gang Sign 87 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla997"] = {
		"qpacc@gangsign88",
		"gangsign88_clip",
		"Gang Sign 88 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla998"] = {
		"qpacc@gangsign89",
		"gangsign89_clip",
		"Gang Sign 89 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla999"] = {
		"qpacc@gangsign90",
		"gangsign90_clip",
		"Gang Sign 90 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9991"] = {
		"qpacc@gangsign91",
		"gangsign91_clip",
		"Gang Sign 91 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9992"] = {
		"qpacc@gangsign92",
		"gangsign92_clip",
		"Gang Sign 93 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9993"] = {
		"qpacc@gangsign93",
		"gangsign93_clip",
		"Gang Sign 94 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9994"] = {
		"qpacc@gangsign94",
		"gangsign94_clip",
		"Gang Sign 95 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9995"] = {
		"qpacc@gangsign95",
		"gangsign95_clip",
		"Gang Sign 96 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9996"] = {
		"qpacc@gangsign96",
		"gangsign96_clip",
		"Gang Sign 97 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9997"] = {
		"qpacc@gangsign97",
		"gangsign97_clip",
		"Gang Sign 98 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9998"] = {
		"qpacc@gangsign98",
		"gangsign98_clip",
		"Gang Sign 99 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9999"] = {
		"qpacc@gangsign99",
		"gangsign99_clip",
		"Gang Sign 100 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla99991"] = {
		"qpacc@gangsign100",
		"gangsign100_clip",
		"Gang Sign 101 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla99992"] = {
		"qpacc@gangsign101",
		"gangsign101_clip",
		"Gang Sign 102 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla99993"] = {
		"qpacc@gangsign102",
		"gangsign102_clip",
		"Gang Sign 103 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla99994"] = {
		"qpacc@gangsign103",
		"gangsign103_clip",
		"Gang Sign 104 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla99995"] = {
		"qpacc@gangsign104",
		"gangsign104_clip",
		"Gang Sign 105 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla99996"] = {
		"qpacc@gangsign105",
		"gangsign105_clip",
		"Gang Sign 106 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla99997"] = {
		"qpacc@gangsign107",
		"gangsign107_clip",
		"Gang Sign 107 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla99998"] = {
		"qpacc@gangsign108",
		"gangsign108_clip",
		"Gang Sign 108 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla99999"] = {
		"qpacc@gangsign109",
		"gangsign109_clip",
		"Gang Sign 109 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla999991"] = {
		"qpacc@gangsign126",
		"gangsign126_clip",
		"Gang Sign 110 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla999992"] = {
		"qpacc@gangsign111",
		"gangsign111_clip",
		"Gang Sign 111 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla999993"] = {
		"qpacc@gangsign112",
		"gangsign112_clip",
		"Gang Sign 112 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla999994"] = {
		"qpacc@gangsign113",
		"gangsign113_clip",
		"Gang Sign 113 LA  ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla999995"] = {
		"qpacc@gangsign114",
		"gangsign114_clip",
		"Gang Sign 114 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla999996"] = {
		"qpacc@gangsign115",
		"gangsign115_clip",
		"Gang Sign 115 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla999997"] = {
		"qpacc@gangsign116",
		"gangsign116_clip",
		"Gang Sign 116 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla999998"] = {
		"qpacc@gangsign117",
		"gangsign117_clip",
		"Gang Sign 117 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla999999"] = {
		"qpacc@gangsign118",
		"gangsign118_clip",
		"Gang Sign 118 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9999991"] = {
		"qpacc@gangsign119",
		"gangsign119_clip",
		"Gang Sign 119 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9999992"] = {
		"qpacc@gangsign120",
		"gangsign120_clip",
		"Gang Sign 120 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9999993"] = {
		"qpacc@gangsign121",
		"gangsign121_clip",
		"Gang Sign 121 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9999994"] = {
		"qpacc@gangsign122",
		"gangsign122_clip",
		"Gang Sign 122 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9999995"] = {
		"qpacc@gangsign123",
		"gangsign123_clip",
		"Gang Sign 123 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9999996"] = {
		"qpacc@gangsign125",
		"gangsign125_clip",
		"Gang Sign 124 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["zgsignla9999997"] = {
		"qpacc@gangsign127",
		"gangsign127_clip",
		"Gang Sign 125 LA ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign404"] = {
		"chiraq1@from94",
		"chiraq1_clip",
		"Chicago Sign 1 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign405"] = {
		"chiraq2@from94",
		"chiraq2_clip",
		"Chicago Sign 2 ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 4090,
			PropPlacement = { 0.0220, -0.0180, -0.0100, -113.2467459, 91.9941464, 31.41819 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign406"] = {
		"chiraq3@from94",
		"chiraq3_clip",
		"Chicago Sign 3 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign424"] = {
		"chiraq4@from94",
		"chiraq4_clip",
		"Chicago Sign 4 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign425"] = {
		"chiraq5@from94",
		"chiraq5_clip",
		"Chicago Sign 5 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign426"] = {
		"chiraq6@from94",
		"chiraq6_clip",
		"Chicago Sign 6 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign427"] = {
		"chiraq7@from94",
		"chiraq7_clip",
		"Chicago Sign 7 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign428"] = {
		"chiraq8_@from94",
		"chiraq8_clip",
		"Chicago Sign 8 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign429"] = {
		"chiraq9@from94",
		"chiraq9_clip",
		"Chicago Sign 9 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign430"] = {
		"chiraq10@from94",
		"chiraq10_clip",
		"Chicago Sign 10 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign431"] = {
		"chiraq11@from94",
		"chiraq11_clip",
		"Chicago Sign 11 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign435"] = {
		"chiraq12@from94",
		"chiraq12_clip",
		"Chicago Sign 12 ",
		AnimationOptions =
		{
			Prop = 'p_amb_coffeecup_01',
			PropBone = 58869,
			PropPlacement = { 0.0360, 0.0570, 0.0110, -4.0342252, -0.99813, -1.9299437 },
			SecondProp = 'prop_cs_ciggy_01',
			SecondPropBone = 64097,
			SecondPropPlacement = { 0.0170, 0.0150, -0.0070, -44.5614522, -44.5614522, 75.8939552 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign443"] = {
		"chiraq13@from94",
		"chiraq13_clip",
		"Chicago Sign 13 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign4334"] = {
		"oblock@from94",
		"oblock_clip",
		"Chicago Sign 14 ",
		AnimationOptions =
		{
			Prop = 'prop_cs_ciggy_01',
			PropBone = 4138,
			PropPlacement = { -0.0150, 0.0160, 0.0500, -10.7241905, -63.5087434, -5.4162076 },
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign407"] = {
		"grizzlybdk@from94",
		"grizzlybdk_clip",
		"Stacking Anim 1 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign408"] = {
		"gunaim@from94",
		"gunaim_clip",
		"Stacking Anim 2 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign409"] = {
		"graaaa@from94",
		"graaaa_clip",
		"Stacking Anim 3 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign410"] = {
		"984msc@from94",
		"984msc_clip",
		"Stacking Anim 4 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign411"] = {
		"107hxxva@from94",
		"107hxxva_clip",
		"Stacking Anim 5 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign412"] = {
		"rollin60@from94",
		"rollin60_clip",
		"Stacking Anim 6 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign413"] = {
		"gunaim2@from94",
		"gunaim2_clip",
		"Stacking Anim 7 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign414"] = {
		"chiraqselfie1@from94",
		"chiraqselfie1_clip",
		"Stacking Anim 8 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign418"] = {
		"ws99mc@from94",
		"ws99_clip",
		"Stacking Anim 9 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign432"] = {
		"chiraqstacking1@from94",
		"chiraqstacking1_clip",
		"Stacking Anim 10 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign433"] = {
		"makkstakking@from94",
		"makkstakking_clip",
		"Stacking Anim 11 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign436"] = {
		"62brimstacking@from94",
		"62brimstacking_clip",
		"Stacking Anim 12 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign437"] = {
		"rundownstacking@from94",
		"rundownstacking_clip",
		"Stacking Anim 13 ",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	--[[ ["gsign1"] = {
		"custom@gsign_01",
		"gsign_01",
		"Gang Sign 1",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	}, ]]
	["gsign2"] = {
		"custom@gsign_02",
		"gsign_02",
		"Gang Sign 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign3"] = {
		"custom@gsign_03",
		"gsign_03",
		"Gang Sign 3",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign4"] = {
		"custom@gsign_04",
		"gsign_04",
		"Gang Sign 4 Hound Blood",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign5"] = {
		"custom@gsign_05",
		"gsign_05",
		"Gang Sign 5 WOO",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign6"] = {
		"custom@gsign_06",
		"gsign_06",
		"Gang Sign 6 Crips",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign7"] = {
		"custom@gsign_07",
		"gsign_07",
		"Gang Sign 7 Grapes Crips",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign8"] = {
		"custom@gsign_08",
		"gsign_08",
		"Gang Sign 8  Grapes Crips 2",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["gsign9"] = {
		"custom@gsign_09",
		"gsign_09",
		"Gang Sign 9",
		AnimationOptions =
		{
			EmoteLoop = true,
			EmoteMoving = false,
		}
	},
	["jgangsign5"] = {
		"anim@mp_player_intupperdock",
		"idle_a",
		"Gang Sign",
		AnimationOptions =
		{
			EmoteMoving = true,
			EmoteDuration = 2500,
		}
	},
}

Lists.Emotes.Sport = {
    ["circle_crunch"] = {
        "custom@circle_crunch",
        "circle_crunch",
        "Tourner ses mains en rond",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["boxing"] = {
        "anim@mp_player_intcelebrationmale@shadow_boxing",
        "shadow_boxing",
        "Entraînement de boxe",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 4000}
    },
    ["boxing2"] = {
        "anim@mp_player_intcelebrationfemale@shadow_boxing",
        "shadow_boxing",
        "Entraînement de boxe 2",
        AnimationOptions = {EmoteMoving = true, EmoteDuration = 4000}
    },
    ["fightme"] = {
        "anim@deathmatch_intros@unarmed", "intro_male_unarmed_c",
        "Se mettre en position de combat"
    },
    ["fightme2"] = {
        "anim@deathmatch_intros@unarmed", "intro_male_unarmed_e",
        "S'étirer avant un combat"
    },
    ["jog2"] = {
        "amb@world_human_jog_standing@male@idle_a",
        "idle_a",
        "Faire son jogging",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["jog3"] = {
        "amb@world_human_jog_standing@female@idle_a",
        "idle_a",
        "Jogging heureux",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["jog4"] = {
        "amb@world_human_power_walker@female@idle_a",
        "idle_a",
        "Jogging avec les bras tendu",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["jog5"] = {
        "move_m@joy@a",
        "walk",
        "Jogging comme un robot",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["jumpingjacks"] = {
        "timetable@reunited@ig_2",
        "jimmy_getknocked",
        "Faire des Jumping Jacks",
        AnimationOptions = {EmoteLoop = true}
    },
    ["karate"] = {
        "anim@mp_player_intcelebrationfemale@karate_chops", "karate_chops",
        "Karate"
    },
    ["karate2"] = {
        "anim@mp_player_intcelebrationmale@karate_chops", "karate_chops",
        "Karate 2"
    },
    ["outofbreath"] = {
        "re@construction",
        "out_of_breath",
        "A bout de souffle",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["pushup"] = {
        "amb@world_human_push_ups@male@idle_a",
        "idle_d",
        "Faire des pompes",
        AnimationOptions = {EmoteLoop = true}
    },
    ["situp"] = {
        "amb@world_human_sit_ups@male@idle_a",
        "idle_a",
        "Faire des abdos",
        AnimationOptions = {EmoteLoop = true}
    },
    ["punching"] = {
        "rcmextreme2",
        "loop_punching",
        "Taper dans le ventre",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["flip2"] = {
        "anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Demi salto"
    },
    ["flip"] = {
        "anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Salto"
    },
    ["slide"] = {
        "anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a",
        "Glissade sur les genoux"
    },
    ["slide2"] = {
        "anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a",
        "Glissade sur les genoux 2"
    },
    ["slide3"] = {
        "anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a",
        "Glissade sur les genoux 3"
    },
    ["slugger"] = {
        "anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Slugger"
    },
    ["stretch"] = {
        "mini@triathlon",
        "idle_e",
        "S'échauffer en s'étirant",
        AnimationOptions = {EmoteLoop = true}
    },
    ["stretch2"] = {
        "mini@triathlon",
        "idle_f",
        "S'échauffer en s'étirant 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["stretch3"] = {
        "mini@triathlon",
        "idle_d",
        "S'échauffer en s'étirant 3",
        AnimationOptions = {EmoteLoop = true}
    },
    ["stretch4"] = {
        "rcmfanatic1maryann_stretchidle_b",
        "idle_e",
        "S'échauffer en s'étirant 4",
        AnimationOptions = {EmoteLoop = true}
    },
    ["tighten"] = {
        "timetable@denice@ig_1",
        "idle_b",
        "Faire des étirements (Yoga)",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["flex2"] = { -- Custom Emote By Amnilka
        "frabi@malepose@solo@firstsport",
        "pose_sport_002",
        "Flex 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true --- Allows us to flex while performing another animation
        }
    },
    ["gym"] = { -- Custom Female Emote By Souris
        "mouse@air_squat",
        "air_squat_clip",
        "Gym - Squats",
        AnimationOptions = {EmoteLoop = true}
    },
    ["gym2"] = { -- Custom Female Emote By Souris
        "mouse@byc_crunch",
        "byc_crunch_clip",
        "Gym - Crunches",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 400,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["gym3"] = { -- Custom Female Emote By Souris
        "mouse@jump_exc",
        "jump_exc_clip",
        "Gym - Jumping",
        AnimationOptions = {EmoteLoop = true}
    },
    ["gym4"] = { -- Custom Female Emote By Souris
        "mouse@jump_jack",
        "jump_jack_clip",
        "Gym - Jumping Jacks",
        AnimationOptions = {EmoteLoop = true}
    },
    ["gym5"] = { -- Custom Female Emote By Souris
        "mouse@situp",
        "situp_clip",
        "Gym - Sit Up",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 550,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["gympose"] = { -- Custom Emote By Amnilka
        "frabi@malepose@solo@firstsport",
        "pose_sport_001",
        "Gym Pose",
        AnimationOptions = {EmoteLoop = true}
    },
    ["gympose2"] = { -- Custom Emote By Amnilka
        "frabi@malepose@solo@firstsport",
        "pose_sport_005",
        "Gym Pose 2 - Pompe a une main",
        AnimationOptions = {EmoteLoop = true}
    },
    ["gympose3"] = { -- Custom Female Emote By Frabi
        "frabi@femalepose@solo@firstsport",
        "fem_pose_sport_004",
        "Gym Pose 3 - Planche",
        AnimationOptions = {EmoteLoop = true}
    },
    ["gympose4"] = { -- Custom Female Emote By Frabi
        "frabi@femalepose@solo@firstsport",
        "fem_pose_sport_005",
        "Gym Pose 4 - Abdos",
        AnimationOptions = {EmoteLoop = true}
    },
    ["kick"] = {
        "missheistdockssetup1ig_13@kick_idle",
        "guard_beatup_kickidle_guard1",
        "Kick",
        AnimationOptions = {EmoteLoop = true}
    },
    ["kick2"] = {
        "missheistdockssetup1ig_13@kick_idle",
        "guard_beatup_kickidle_guard2",
        "Kick 2",
        AnimationOptions = {EmoteLoop = true}
    },
    ["kick3"] = {
        "melee@unarmed@streamed_core",
        "kick_close_a",
        "Kick 3",
        AnimationOptions = {EmoteDuration = 1750}
    }
}

Lists.Emotes.Health = {
    ["convulsion"] = {
        "custom@convulsion",
        "convulsion",
        "Convulsion",
        AnimationOptions = {EmoteMoving = false, EmoteLoop = true}
    },
    ["cpr"] = {
        "mini@cpr@char_a@cpr_str",
        "cpr_pumpchest",
        "Massage cardiaque au sol",
        AnimationOptions = {EmoteLoop = true}
    },
    ["cpr2"] = {
        "mini@cpr@char_a@cpr_str",
        "cpr_pumpchest",
        "Massage cardiaque sur une table",
        AnimationOptions = {EmoteLoop = true, EmoteMoving = true}
    },
    ["medic2"] = {
        "amb@medic@standing@tendtodead@base",
        "base",
        "Médecin inspectant un blessé",
        AnimationOptions = {EmoteLoop = true}
    },
    ["shot"] = {
        "random@dealgorong",
        "idle_a",
        "Blesser par balle au sol",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["passout"] = {
        "missarmenian2",
        "drunk_loop",
        "Perdre connaissance",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 900,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["passout2"] = {
        "missarmenian2",
        "corpse_search_exit_ped",
        "Perdre connaissance 2",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 900,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["passout3"] = {
        "anim@gangops@morgue@table@",
        "body_search",
        "Perdre connaissance 3",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 900,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["passout4"] = {
        "mini@cpr@char_b@cpr_def",
        "cpr_pumpchest_idle",
        "Perdre connaissance 4",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 900,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["passout5"] = {
        "random@mugging4",
        "flee_backward_loop_shopkeeper",
        "Perdre connaissance 5",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 900,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["crawl"] = {
        "move_injured_ground",
        "front_loop",
        "Ramper",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "meditateup",
            ExitEmoteType = "Exits"
        }
    }
}
