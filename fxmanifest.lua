fx_version 'adamant'
lua54 'yes'
game 'gta5'

authur 'KJ Scripts'
description 'Newlife Script Voor Politie'

shared_scripts { '@es_extended/imports.lua', '@ox_lib/init.lua'}
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'client.lua',
}