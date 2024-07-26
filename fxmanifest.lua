fx_version 'cerulean'
game 'gta5'

description 'Redzone Lootsystem, med support til QBcore og ESX'

author 'Hondo'
version '1.0.0'

server_scripts {
    'config.lua',
    'server/main.lua',
    '@oxmysql/lib/MySQL.lua'
}

client_scripts {
    'config.lua',
    'client/main.lua'
}

shared_scripts {
    '@ox_lib/init.lua'
}

dependencies {
    'ox_inventory',
    'ox_lib',
    'qb-core',  -- For QBCore
    'es_extended'  -- For ESX
}
