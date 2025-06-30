fx_version 'cerulean'
game 'gta5'


description 'Outro Quicktime Events scripts'
version '1.0.0'
author ' '

use_experimental_fxv2_oal 'yes'
lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/styles.css',
    'html/script.js'
}

client_scripts({ "client/*.lua" })
