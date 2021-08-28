fx_version 'cerulean'
game 'gta5'
--lua54 'yes'

shared_scripts {
	'config.lua'
}

client_scripts {
	'client/main.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}
