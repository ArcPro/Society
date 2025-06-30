fx_version 'cerulean'
game 'common'
use_experimental_fxv2_oal 'yes'
lua54 'yes'

name 'oxmysql'
author 'Overextended'
version '2.9.0'
license 'LGPL-3.0-or-later'
repository 'https://github.com/overextended/oxmysql.git'
description 'FXServer to MySQL communication via node-mysql2'

dependencies {
    '/server:7290',
}

server_script 'build.js'

provide 'mysql-async'
provide 'ghmattimysql'

convar_category 'OxMySQL' {
	'Configuration',
	{
		{ 'Connection string', 'mysql_connection_string', 'CV_STRING', 'mysql://user:password@localhost/database' },
		{ 'Debug', 'mysql_debug', 'CV_BOOL', 'false' }
	}
}
