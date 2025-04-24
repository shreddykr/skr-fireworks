fx_version 'cerulean'
game 'gta5'

author 'shreddykr'
description 'Firework script to place fireworks and light them using ox_target'
version '1.2.9'

lua54 'yes'

-- Client and Server Scripts
client_scripts {
    'config.lua',
    'client.lua',
}

server_scripts {
    'config.lua',
    'server.lua',
}

-- Dependencies
dependencies {
    'qb-core',
    'ox_lib',
    'ox_target',
    'ox_inventory',
}

