-- FXVersion Version
fx_version 'adamant'
games {"rdr3","gta5"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page "client/html/index.html"

-- Files needed for NUI
-- DON'T FORGET TO ADD THE SOUND FILES TO THIS!
files {
    'client/html/index.html',
    -- Begin Sound Files Here...
    -- client/html/sounds/ ... .ogg
    'client/html/sounds/tweet.ogg', 
    'client/html/sounds/elevador.ogg',
    'client/html/sounds/callpizza.ogg',
    'client/html/sounds/trucksound.ogg',
    'client/html/sounds/bagopen.ogg',
    'client/html/sounds/water.ogg',
    'client/html/sounds/pop.ogg',
    'client/html/sounds/mia.ogg',
    'client/html/sounds/fire.ogg',
    'client/html/sounds/oven.ogg',
    'client/html/sounds/clean.ogg',
    'client/html/sounds/janitor.ogg',
    'client/html/sounds/laptop.ogg',
    'client/html/sounds/dooropen.ogg',
}
