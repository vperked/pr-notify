fx_version 'cerulean'
games { 'gta5' }

author 'Perked <vperked.online>'
description 'Kill Notifications'
version '1.0.0'
lua54 'yes'


client_scripts {
    'config.lua',
    "client.lua"
    
}

escrow_ignore {
    'config.lua'
  }

shared_script '@ox_lib/init.lua'