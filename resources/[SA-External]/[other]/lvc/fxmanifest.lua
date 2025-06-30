------------------------------

fx_version 'adamant'
games { 'gta5' }

author 'TrevorBarns w/ credits see GitHub'
description 'A siren / emergency lights controller for FiveM.'

version '3.2.9'			-- Readonly version of currently installed version.
compatible '3.2.2'		-- Readonly save reverse compatiability.

------------------------------

beta_checking 'true'	-- Notifications for beta revisions and new betas.
experimental 'false'	-- Mute unstable version warning in server console.
debug_mode 'false' 		-- More verbose printing on client console.

------------------------------

ui_page('/UI/html/index.html')

files({
    'UI/html/index.html',
    'UI/html/lvc.js',
    'UI/html/style.css',
	'UI/sounds/*.ogg',
	'UI/sounds/**/*.ogg',
	'UI/textures/**/*.png',
	'UI/textures/**/*.gif',
	'PLUGINS/**/*.json',
	'data/*.dat54.rel',
})


shared_script {
	'/UTIL/semver.lua',
	'/UI/cl_locale.lua',
	'/UI/locale/en.lua',	-- Set locale / language file here.
	'SETTINGS.lua',
}

client_scripts {
	---------------RAGE-UI---------------
    'dependencies/RageUI/RMenu.lua',
    'dependencies/RageUI/menu/RageUI.lua',
    'dependencies/RageUI/menu/Menu.lua',
    'dependencies/RageUI/menu/MenuController.lua',
    'dependencies/RageUI/components/Audio.lua',
    'dependencies/RageUI/components/Enum.lua',
    'dependencies/RageUI/components/Keys.lua',
    'dependencies/RageUI/components/Rectangle.lua',
    'dependencies/RageUI/components/Sprite.lua',
    'dependencies/RageUI/components/Text.lua',
    'dependencies/RageUI/components/Visual.lua',
    'dependencies/RageUI/menu/elements/ItemsBadge.lua',
    'dependencies/RageUI/menu/elements/ItemsColour.lua',
    'dependencies/RageUI/menu/elements/PanelColour.lua',
    'dependencies/RageUI/menu/items/UIButton.lua',
    'dependencies/RageUI/menu/items/UICheckBox.lua',
    'dependencies/RageUI/menu/items/UIList.lua',
    'dependencies/RageUI/menu/items/UISeparator.lua',
    'dependencies/RageUI/menu/items/UISlider.lua',
    'dependencies/RageUI/menu/items/UISliderHeritage.lua',
    'dependencies/RageUI/menu/items/UISliderProgress.lua',
    'dependencies/RageUI/menu/panels/UIColourPanel.lua',
    'dependencies/RageUI/menu/panels/UIGridPanel.lua',
    'dependencies/RageUI/menu/panels/UIPercentagePanel.lua',
    'dependencies/RageUI/menu/panels/UIStatisticsPanel.lua',
    'dependencies/RageUI/menu/windows/UIHeritage.lua',
	-------------------------------------
	'SIRENS.lua',
	'/UTIL/cl_*.lua',
	'/UI/cl_*.lua',
	'/PLUGINS/cl_plugins.lua',
	'/PLUGINS/**/SETTINGS.lua',
	'/PLUGINS/**/cl_*.lua',
}

server_script {
	'/UTIL/sv_lvc.lua',
	'/PLUGINS/**/sv_*.lua'
}
------------------------------


-- sas --
files { 
	"dlc_serversideaudio/oiss_ssa_vehaud_lspd_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_lspd_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_lssd_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_lssd_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_bcso_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_bcso_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_sahp_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_sahp_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_sahp_bike.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_noose_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_noose_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_fib_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_fib_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_rhpd_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_rhpd_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_dppd_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_dppd_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_lsia_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_lsia_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_lspp_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_lspp_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_lsfd_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_lsfd_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_lscofd_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_lscofd_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_bcfd_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_bcfd_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_sanfire_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_sanfire_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_sams_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_sams_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_usfs_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_usfs_old.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_usss_new.awc",
	"dlc_serversideaudio/oiss_ssa_vehaud_etc.awc",
	"data/serversideaudio_sounds.dat54.rel"
}

data_file "AUDIO_WAVEPACK" "dlc_serversideaudio"
data_file "AUDIO_SOUNDDATA" "data/serversideaudio_sounds.dat"