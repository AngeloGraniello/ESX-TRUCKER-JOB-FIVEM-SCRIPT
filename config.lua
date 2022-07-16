Keys = { --Don't touch this.
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DEL'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = {} --Don't touch this.

--This script was entirely created by Gianluigi#2245 (Angelo Graniello). 
--If you need help don't hesitate to contact me by discord or gmail. 
--Remember that if you don't understand what something is for or how a configuration works you can contact me.
--Discord: Gianluigi#2245
--Gmail: gianlucaangelodev@gmail.com

--I apologize if my variables don't make sense but I don't understand much English, I did my best :D, if you don't understand how any of them work you can write me in my contact channels.

--Remember that this script currently only works with ESX, soon it will work on QBUS, but if you need a version for a custom framework or qbus as soon as possible you can contact me and I could do it for you.


--░█████╗░███╗░░██╗░██████╗░███████╗██╗░░░░░░█████╗░  ███████╗░█████╗░██████╗░
--██╔══██╗████╗░██║██╔════╝░██╔════╝██║░░░░░██╔══██╗  ██╔════╝██╔══██╗██╔══██╗
--███████║██╔██╗██║██║░░██╗░█████╗░░██║░░░░░██║░░██║  █████╗░░██║░░██║██████╔╝
--██╔══██║██║╚████║██║░░╚██╗██╔══╝░░██║░░░░░██║░░██║  ██╔══╝░░██║░░██║██╔══██╗
--██║░░██║██║░╚███║╚██████╔╝███████╗███████╗╚█████╔╝  ██║░░░░░╚█████╔╝██║░░██║
--╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝╚══════╝░╚════╝░  ╚═╝░░░░░░╚════╝░╚═╝░░╚═╝



--░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░██╗░░░██╗██████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗
--██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░██║░░░██║██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
--██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░██║░░░██║██████╔╝███████║░░░██║░░░██║██║░░██║██╔██╗██║
--██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗██║░░░██║██╔══██╗██╔══██║░░░██║░░░██║██║░░██║██║╚████║
--╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝╚██████╔╝██║░░██║██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║
--░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝

--Don't touch this if you don't know what it is or don't need it, please read line 18 and 20.
Config.ESXClient = "esx:getSharedObject"
Config.ESXServer =  "esx:getSharedObject"

--Here you can change the language of the 3d texts.
Config.Locales = {
    ['start_work'] = 'Press ~g~[E]~s~ to start work', 
    ['start_work_progress'] = 'Opening company program...', 
    ['start_work_error'] = 'You have already signed your work ticket, make sure you are working correctly', 
    ['clothes_job_inform'] = 'Go to the next room and change into your work uniform',
    ['clothes_work'] = 'Press ~g~[E]~s~ to work clothes', 
    ['ready_work_clothes'] = 'You already have your work clothes on', 
    ['no_job'] = 'You dont have the job of a truck driver', 
    ['no_job2'] = 'You are not on duty, go and work correctly', 
    ['work_clothes_progress'] = 'Laying out clothes...',
    ['route'] = 'Press ~r~[E]~s~ to request a route',  
    ['route2'] = 'Press ~r~[E]~s~ to deliver the cargo to the company',  
    ['ready_route'] = 'You already have a truck route', 
    ['menu_open'] = 'You already have the menu open', 
    ['garage_progress'] = 'Pulling truck out of garage...',
    ['no_request'] = 'This company has not requested product, make sure you are working correctly', 
    ['no_request_2'] = 'You are not working correctly', 
    ['finish_product'] = 'Delivering pruduct to workers...', 
    ['finish_product_2'] = 'Leaving truck and removing work clothes...', 
    ['finish'] = 'return to central and keep the truck to collect your money', 
    ['finish_2'] = 'Congratulations you finished the job and got paid in cash.', 
}

--Here you will be able to find work clothes for men and women.
Config.ClothesTrucker = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 41,   ['torso_2'] = 0,
        ['arms'] = 11,
        ['pants_1'] = 4,   ['pants_2'] = 0,
        ['shoes_1'] = 12,   ['shoes_2'] = 5,
        ['helmet_1'] = 72,  ['helmet_2'] = 4,
    },
    female = {
        ['tshirt_1'] = 112,  ['tshirt_2'] = 0,
        ['torso_1'] = 304,   ['torso_2'] = 0,
        ['arms'] = 9,
        ['pants_1'] = 0,   ['pants_2'] = 10,
        ['shoes_1'] = 54,   ['shoes_2'] = 0,
        ['helmet_1'] = 73,  ['helmet_2'] = 9,
    }
}

Config.CentralNameBlips = "Trucker Central"
Config.CentralColorBlips = 40
Config.CentralIDBlips = 318
Config.CentralPosX = 717.455
Config.CentralPosY = -977.8154
Config.CentralScaleBlips = 0.9

Config.PedHash = 0xD172497E
Config.PedX = 713.9341
Config.PedY = -977.7758
Config.PedZ = 24.10693
Config.PedH = 201.2598
Config.AnimationActive = true
Config.PedAnimationList = "WORLD_HUMAN_CLIPBOARD"

Config.MenuTitle = "Routes"
Config.MenuPos = "bottom-right"
Config.PreventBugMenuOnRestartOrStop = true --dont touch
Config.MenuRoute1 = "Clucking Bell"
Config.MenuRoute2 = "Pharmacy"

Config.CarModelName = "brickadeb"
Config.Locations = {
    ['cardeposit'] = {
        coords = {x = 689.9868, y = -960.4352, z = 23.85425, h = 181.4173}, --Here you can change the spaw of the truck. 
    },
}

Config.posFinishJob = vector3(693.0725, -1011.152, 23.0791)

Config.AccountPay = "money"

Config.posRoute1 = vector3(-74.26813, 6270.633, 31.68933)
Config.PayRoute1 = 250000

Config.YouToolsRouteX = -74.26813
Config.YouToolsRouteY = 6270.633
Config.YouToolsRouteZ = 31.68933

Config.posRoute2 = vector3(94.33847, -216.7912, 54.82422)
Config.PayRoute2 = 150000

Config.PharmacyRouteX = 94.33847
Config.PharmacyRouteY = -216.7912
Config.PharmacyRouteZ = 31.68933

Config.JobSQL = "trucker"

Config.posStartWork = vector3(707.2747, -966.9495, 30.40881)
Config.posClothesWork = vector3(720.9758, -969.2308, 30.39197)
Config.posSelectRouteMenu = vector3(713.9341, -977.7758, 25.10693)

--░██████╗░██╗░█████╗░███╗░░██╗██╗░░░░░██╗░░░██╗░█████╗░░█████╗░  ███████╗░█████╗░██████╗░
--██╔════╝░██║██╔══██╗████╗░██║██║░░░░░██║░░░██║██╔══██╗██╔══██╗  ██╔════╝██╔══██╗██╔══██╗
--██║░░██╗░██║███████║██╔██╗██║██║░░░░░██║░░░██║██║░░╚═╝███████║  █████╗░░██║░░██║██████╔╝
--██║░░╚██╗██║██╔══██║██║╚████║██║░░░░░██║░░░██║██║░░██╗██╔══██║  ██╔══╝░░██║░░██║██╔══██╗
--╚██████╔╝██║██║░░██║██║░╚███║███████╗╚██████╔╝╚█████╔╝██║░░██║  ██║░░░░░╚█████╔╝██║░░██║
--░╚═════╝░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚══════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝  ╚═╝░░░░░░╚════╝░╚═╝░░╚═╝