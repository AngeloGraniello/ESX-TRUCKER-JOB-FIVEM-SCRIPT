fx_version 'adamant' --Don't touch this

game 'gta5' --Don't touch this

author 'Angelo Graniello gianlucaangelodev@gmail.com'
description 'This is a trucker job for esx, if you want to get it, contact me. '
version '1.0.0'

ui_page "web/index.html"  ---Don't touch this

client_script { ---Don't touch this
    '@es_extended/locale.lua', ---Don't touch this
	'config.lua', ---Don't touch this
	'client.lua' ---Don't touch this
}

server_script { ---Don't touch this
    '@es_extended/locale.lua', ---Don't touch this
	'config.lua', ---Don't touch this
	'server.lua' ---Don't touch this
}

dependencies { ---Don't touch this
	'interact-sound', ---Don't touch this
	'rprogress', ---Don't touch this
	'mythic_notify', ---Don't touch this
	'dpemotes' ---Don't touch this
}

data_file 'HANDLING_FILE'            'data/**/handling*.meta' --Delete this and the folders if you were to use your own vehicle.
data_file 'VEHICLE_LAYOUTS_FILE'    'data/**/vehiclelayouts*.meta' --Delete this and the folders if you were to use your own vehicle.
data_file 'VEHICLE_METADATA_FILE'    'data/**/vehicles*.meta' --Delete this and the folders if you were to use your own vehicle.
data_file 'CARCOLS_FILE'            'data/**/carcols*.meta' --Delete this and the folders if you were to use your own vehicle.
data_file 'VEHICLE_VARIATION_FILE'    'data/**/carvariations*.meta' --Delete this and the folders if you were to use your own vehicle.
data_file 'CONTENT_UNLOCKING_META_FILE' 'data/**/*unlocks.meta' --Delete this and the folders if you were to use your own vehicle.
data_file 'PTFXASSETINFO_FILE' 'data/**/ptfxassetinfo.meta' --Delete this and the folders if you were to use your own vehicle.

files {  --Delete this and the folders if you were to use your own vehicle.
    'data/**/*.meta', --Delete this and the folders if you were to use your own vehicle.
    'data/**/*.xml', --Delete this and the folders if you were to use your own vehicle.
    'data/**/*.dat', --Delete this and the folders if you were to use your own vehicle.
	'web/index.html', ---Don't touch this
    'web/script.js', ---Don't touch this
	'web/sound.mp3', ---Don't touch this
	'web/img/*.png', ---Don't touch this
    'web/style.css', ---Don't touch this
    'data/**/*.ytyp' --Delete this and the folders if you were to use your own vehicle.
} --Delete this and the folders if you were to use your own vehicle.
 
--Fact: Imagine it's the first version and it's still incredible.

lua54 'yes' 