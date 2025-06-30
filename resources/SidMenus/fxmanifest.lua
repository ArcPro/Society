fx_version 'cerulean'
game 'gta5'

description 'San Andreas Stories Menus'
author 'Sid'
version '1.0'

use_experimental_fxv2_oal 'yes'
lua54 'yes'

ui_page 'ui/index.html'

files {
	'ui/index.html',
	'ui/assets/*.js',
	'ui/assets/*.css',
}

client_scripts {
	'classes/Menu.lua',
	'classes/Items.lua',
	'utils.lua',
	'keys.lua',
	'menus.lua',
	'callbacks.lua',
	'controls.lua',
	'threads.lua',
}