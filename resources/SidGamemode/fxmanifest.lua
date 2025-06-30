fx_version 'cerulean'
game 'gta5'

description 'San Andreas Stories Gamemode'
version '1.0.0'
author 'SID'

use_experimental_fxv2_oal 'yes'
lua54 'yes'

shared_scripts {
    'shared/config/*.lua',
    'shared/utils/*.lua',
    'shared/security/*.lua',
    'shared/modules/*.lua',
    'shared/enums/*.lua',
    'shared/classes/*.lua',
    'shared/*.lua',
}

server_scripts {
    "@oxmysql/MySQL.lua",
    'server/utils/*.lua',
    'server/models/*.lua',
    'server/classes/*.lua',
    'server/core/*.lua',
    'server/modules/**/*.lua',
    'server/exports/**/*.lua',
    'server/*.lua'
}

-- Polyzone
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
}

client_scripts {
    'client/security/*.lua',
    'client/lists/*.lua',
    'client/utils/*.lua',
    'client/classes/*.lua',
    'client/core/callback.lua',
    'client/core/game_events.lua',
	'client/core/player.lua',
	'client/core/needs.lua',
    'client/core/death.lua',
    'client/core/markers.lua',
    'client/core/blips.lua',
    'client/core/zones.lua',
    'client/modules/**/*.lua',
    'client/modules/**/*.js',
    'client/exports/**/*.lua',
}

escrow_ignore {
    "server/**/*.lua"
}
