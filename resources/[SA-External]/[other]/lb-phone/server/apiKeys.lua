local APIKey = exports.config:Get().APIKey

-- Webhook for instapic posts, recommended to be a public channel
INSTAPIC_WEBHOOK = "https://discord.com/api/webhooks/1223080058541969509/vhE7a1v9S8RZXDqfAi6_F_D61JgJ3FmXVGCaQpRTVUBtgDExvvQCsLsdqkIaPzkJdR39"
BIRDY_WEBHOOK = "https://discord.com/api/webhooks/1223079786969043016/psBMca9C1puEc4psRtO3HwyYdwQdxqskmlkJFL8-qggluyVC_UR5I_ehnboQRCr3MvQc"

-- Discord webhook for server logs
LOGS = {
    Default = false, -- set to false to disable
    Calls = "https://discord.com/api/webhooks/1223080999684935816/Q7a_TagGqt6A6YaypGWyeaIZWBTb5MkjypKldYFZBAXaNj6kNllpDyPfkvyY4XB7h0Cm",
    Messages = "https://discord.com/api/webhooks/1223080518120247387/p35UvvqWFfE49ckKKayg8Gt--iYOeBvb2zKHj7x4kPSuxQd0GDq0CgOLzfvSJRnr2pcL",
    InstaPic = "https://discord.com/api/webhooks/1223080420451811450/2yEya0L8t3v_52oBdrn3yaac7tCHw_xH54pjfLO6DkFECVPbbE1N6bgYfJ-44paUunI3",
    Birdy = "https://discord.com/api/webhooks/1223080925408133161/34DEhJQWvKxj4OFr_P32VcMztcEg_NJ_Vp5KcH2-TiEL1vPIiG8pmX95nmY7aDvSuo1L",
    YellowPages = "https://discord.com/api/webhooks/1223080273663496283/EVfCWqnuCIPftYnwMZFR1gEZegoYpnrc62umYjOjnsY11wxFPcOunDVf-xqd1yWkRoCA",
    Marketplace = "https://discord.com/api/webhooks/1223080227530346498/jZJnA9iS0SEZBatYEeRCTdAi4mLa8vgTxqeOVABjIl7PAlnhg3nb4KV0csS5p_ZUih6o",
    Mail = "https://discord.com/api/webhooks/1223081056773607424/PMb92eB3jl6wbTmUiPo6FA0SZcW0K2BbdsC8midYCQy7INaMskV7ImXPtaoJDzAB8v_T",
    Wallet = "https://discord.com/api/webhooks/1223080850841665587/yfb6vw5eqNCWhI6APQUxttRyf9QqjYo7jdJlfQdrQIdELsMcIaTMwTskAi2ZQL5wnVwO",
    DarkChat = "https://discord.com/api/webhooks/1223080335907225683/a_gxZyuAarNJXNYasV654F-G3edCI632uWpJYJaOlpDTtADhL2mcb7j9njFUVIsC00B5",
    Services = "https://discord.com/api/webhooks/1223080595589042307/mpkDBLzxzV4gOqAL2IX_-zSzlvDdUgR1temkkJVqD6Cy6smAS4WpcYJoI_wAZlTyvX0E",
    Crypto = "https://discord.com/api/webhooks/1223080724836515941/ijigc_lFDawYhEAtvgkakRDcJV7SzA_fDwiIRDGUL4fG8Cjt_JwGUu8wWErJ3Kw8VzsX",
    Trendy = "https://discord.com/api/webhooks/1223080788795326516/4NaKFCbtRZKt0ywMVu-eEhW2jjEF6am6gFMPnqAuufNVJUyjx2eXSAQcTtOl_gYH3j8_",
    Uploads = "https://discord.com/api/webhooks/1223080657547427941/YrYtxnLuOSble6Kju1Fsd7I5j1cDVhuBk3mppVqQ1UXnfruU5dDiumok9LB8Ypr2hA6Q"
}

DISCORD_TOKEN = nil -- you can set a discord bot token here to get the players discord avatar for logs

-- Set your API keys for uploading media here.
-- Please note that the API key needs to match the correct upload method defined in Config.UploadMethod.
-- The default upload method is Fivemanage
-- We STRONGLY discourage using Discord as an upload method, as uploaded files may become inaccessible after a while.
-- You can get your API keys from https://fivemanage.com/
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
API_KEYS = {
    Video = APIKey,
    Image = APIKey,
    Audio = APIKey,
}

WEBRTC = {
    -- You can get your credentials from https://dash.cloudflare.com/?to=/:account/realtime/turn/overview
    TokenID = nil,
    APIToken = nil,
}
