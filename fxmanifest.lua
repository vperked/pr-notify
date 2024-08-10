
fx_version 'cerulean'
games { 'gta5' }

author 'Perked'
description 'Kill Notifications'
version '1.0.0'
lua54 'yes'

client_scripts {
    "client.lua"
}

server_scripts {
    'server.lua'
}

shared_scripts {
	'@ox_lib/init.lua',
}