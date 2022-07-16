ESX = nil

local PlayerData = {}

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                Config.ESXClient,
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end

        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        PlayerData = ESX.GetPlayerData()
    end
)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler(
    "esx:playerLoaded",
    function(xPlayer)
        while true do
            if ESX == nil then
                Citizen.Wait(1)
            else
                ESX.PlayerData = xPlayer
                break
            end
        end
    end
)

RegisterNetEvent("esx:setJob")
AddEventHandler(
    "esx:setJob",
    function(job)
        ESX.PlayerData.job = job
    end
)

local posStartWork = Config.posStartWork 
local StartWork = false

local posClothesWork = Config.posClothesWork
local onDuty = false

local posSelectRouteMenu = Config.posSelectRouteMenu
local MenuOpened = false
local CheckRoute = false
local posFinishJob = Config.posFinishJob

local posRoute1 = Config.posRoute1
local Route1 = false
local FinishRoute1 = false

local posRoute2 = Config.posRoute2
local Route2 = false
local FinishRoute2 = false

Citizen.CreateThread(
    function()
        while true do
            sleepthread = 500
            local ped = PlayerPedId()
            local pPed = PlayerPedId()
            local pCoords = GetEntityCoords(pPed)
            local distance = #(pCoords - posStartWork)
            local distance2 = #(pCoords - posClothesWork)
            local distance3 = #(pCoords - posSelectRouteMenu)
            local distance4 = #(pCoords - posRoute1)
            local distance5 = #(pCoords - posFinishJob)
            local distance6 = #(pCoords - posRoute2)

            if distance <= 5.0 then
                sleepthread = 1
                if distance <= 1.5 then
                    DrawText3D(posStartWork.x, posStartWork.y, posStartWork.z, Config.Locales["start_work"])
                    if IsControlJustPressed(1, 38) then
                        if StartWork then
                            exports["mythic_notify"]:DoHudText("error", Config.Locales["start_work_error"])
                        else
                            playTypeAnimation()
                            exports.rprogress:Custom(
                                {
                                    Duration = 6500,
                                    Label = Config.Locales["start_work_progress"],
                                    DisableControls = {
                                        Mouse = true,
                                        Player = true,
                                        Vehicle = true
                                    }
                                }
                            )
                            TriggerServerEvent("InteractSound_SV:PlayOnSource", "laptop", 0.9)
                            Citizen.Wait(6500)
                            SetNuiFocus(true, true)
                            SendNUIMessage(
                                {
                                    type = "show",
                                    status = true
                                }
                            )
                        end
                    end
                end
            end

            if distance2 <= 5.0 then
                sleepthread = 1
                if distance2 <= 1.5 then
                    DrawText3D(posClothesWork.x, posClothesWork.y, posClothesWork.z, Config.Locales["clothes_work"])

                    if IsControlJustPressed(1, 38) then
                        if ESX ~= nil then
                            PlayerJobInfo = ESX.PlayerData.job

                            if PlayerJobInfo ~= nil then
                                if PlayerJobInfo.name == Config.JobSQL and StartWork then
                                    if onDuty then
                                        exports["mythic_notify"]:DoHudText(
                                            "error",
                                            Config.Locales["ready_work_clothes"]
                                        )
                                    else
                                        DoScreenFadeOut(800)
                                        Citizen.Wait(800)
                                        exports.rprogress:Custom(
                                            {
                                                Duration = 12000,
                                                Label = Config.Locales["work_clothes_progress"],
                                                DisableControls = {
                                                    Mouse = false,
                                                    Player = true,
                                                    Vehicle = true
                                                }
                                            }
                                        )
                                        TriggerServerEvent("InteractSound_SV:PlayOnSource", "bagopen", 0.9)
                                        Citizen.Wait(12000)
                                        DoScreenFadeIn(800)
                                        onDuty = true
                                        playWardrobeAnimation()
                                        ESX.TriggerServerCallback(
                                            "esx_skin:getPlayerSkin",
                                            function(skin, jobSkin)
                                                if skin.sex == 0 then
                                                    TriggerEvent(
                                                        "skinchanger:loadClothes",
                                                        skin,
                                                        Config.ClothesTrucker.male
                                                    )
                                                elseif skin.sex == 1 then
                                                    TriggerEvent(
                                                        "skinchanger:loadClothes",
                                                        skin,
                                                        Config.ClothesTrucker.female
                                                    )
                                                end
                                            end
                                        )
                                    end
                                else
                                    exports["mythic_notify"]:DoHudText("error", Config.Locales["no_job"])
                                end
                            end
                        end
                    end
                end
            end

            if distance3 <= 5.0 then
                sleepthread = 1
                if distance3 <= 1.5 then
                    DrawText3D(
                        posSelectRouteMenu.x,
                        posSelectRouteMenu.y,
                        posSelectRouteMenu.z,
                        Config.Locales["route"]
                    )

                    if IsControlJustPressed(1, 38) then
                        if ESX ~= nil then
                            PlayerJobInfo = ESX.PlayerData.job

                            if PlayerJobInfo ~= nil then
                                if PlayerJobInfo.name == Config.JobSQL then
                                    if CheckRoute then
                                        exports["mythic_notify"]:DoHudText("error", Config.Locales["ready_route"])
                                    else
                                        if MenuOpened then
                                            exports["mythic_notify"]:DoHudText("error", Config.Locales["menu_open"])
                                        else
                                            OpenMenuRoutes()
                                        end
                                    end
                                else
                                    exports["mythic_notify"]:DoHudText("error", Config.Locales["no_job"])
                                end
                            end
                        end
                    end
                end
            end

            if distance4 <= 5.0 then
                sleepthread = 1
                if distance4 <= 1.5 then
                    DrawText3D(posRoute1.x, posRoute1.y, posRoute1.z, Config.Locales["route2"])

                    if IsControlJustPressed(1, 38) then
                        if ESX ~= nil then
                            PlayerJobInfo = ESX.PlayerData.job

                            if PlayerJobInfo ~= nil then
                                if PlayerJobInfo.name == Config.JobSQL then
                                    if Route1 then
                                        Route1 = false
                                        DoScreenFadeOut(800)
                                        Citizen.Wait(800)
                                        exports.rprogress:Custom(
                                            {
                                                Duration = 5500,
                                                Label = Config.Locales["finish_product"],
                                                DisableControls = {
                                                    Mouse = false,
                                                    Player = true,
                                                    Vehicle = true
                                                }
                                            }
                                        )
                                        Citizen.Wait(5500)
                                        DoScreenFadeIn(800)
                                        exports["mythic_notify"]:DoHudText("success", Config.Locales["finish"])
                                        Central_Function()
                                        FinishRoute1 = true
                                    else
                                        exports["mythic_notify"]:DoHudText("error", Config.Locales["no_request"])
                                    end
                                else
                                    exports["mythic_notify"]:DoHudText("error", Config.Locales["no_job"])
                                end
                            end
                        end
                    end
                end
            end

            if distance5 <= 5.0 then
                sleepthread = 1
                if distance5 <= 1.5 then
                    DrawText3D(posFinishJob.x, posFinishJob.y, posFinishJob.z, Config.Locales["route2"])

                    if IsControlJustPressed(1, 38) then
                        if ESX ~= nil then
                            PlayerJobInfo = ESX.PlayerData.job

                            if PlayerJobInfo ~= nil then
                                if PlayerJobInfo.name == Config.JobSQL then
                                    if FinishRoute1 or FinishRoute2 then
                                        TriggerServerEvent("pay-route-1")
                                        FinishRoute1 = false
                                        Route1 = false
                                        onDuty = false
                                        CheckRoute = false
                                        StartWork = false
                                        DoScreenFadeOut(800)
                                        Citizen.Wait(800)
                                        exports.rprogress:Custom(
                                            {
                                                Duration = 5500,
                                                Label = Config.Locales["finish_product_2"],
                                                DisableControls = {
                                                    Mouse = false,
                                                    Player = true,
                                                    Vehicle = true
                                                }
                                            }
                                        )
                                        local vehicle = GetVehiclePedIsIn(ped)
                                        ESX.Game.DeleteVehicle(vehicle)
                                        ESX.TriggerServerCallback(
                                            "esx_skin:getPlayerSkin",
                                            function(skin)
                                                TriggerEvent("skinchanger:loadSkin", skin)
                                            end
                                        )
                                        Citizen.Wait(5500)
                                        DoScreenFadeIn(800)
                                        exports["mythic_notify"]:DoHudText("success", Config.Locales["finish_2"])
                                    else
                                        exports["mythic_notify"]:DoHudText("error", Config.Locales["no_request_2"])
                                    end
                                else
                                    exports["mythic_notify"]:DoHudText("error", Config.Locales["no_job"])
                                end
                            end
                        end
                    end
                end
            end

            if distance6 <= 5.0 then
                sleepthread = 1
                if distance6 <= 1.5 then
                    DrawText3D(posRoute2.x, posRoute2.y, posRoute2.z, Config.Locales["route2"])

                    if IsControlJustPressed(1, 38) then
                        if ESX ~= nil then
                            PlayerJobInfo = ESX.PlayerData.job

                            if PlayerJobInfo ~= nil then
                                if PlayerJobInfo.name == Config.JobSQL then
                                    if Route2 then
                                        Route2 = false
                                        DoScreenFadeOut(800)
                                        Citizen.Wait(800)
                                        exports.rprogress:Custom(
                                            {
                                                Duration = 5500,
                                                Label = Config.Locales["finish_product"],
                                                DisableControls = {
                                                    Mouse = false,
                                                    Player = true,
                                                    Vehicle = true
                                                }
                                            }
                                        )
                                        Citizen.Wait(5500)
                                        DoScreenFadeIn(800)
                                        exports["mythic_notify"]:DoHudText("success", Config.Locales["finish"])
                                        Central_Function()
                                        FinishRoute2 = true
                                    else
                                        exports["mythic_notify"]:DoHudText("error", Config.Locales["no_request"])
                                    end
                                else
                                    exports["mythic_notify"]:DoHudText("error", Config.Locales["no_job"])
                                end
                            end
                        end
                    end
                end
            end
            Citizen.Wait(sleepthread)
        end
    end
)

local blips = {
    {
        title = Config.CentralNameBlips,
        colour = Config.CentralColorBlips,
        id = Config.CentralIDBlips,
        x = Config.CentralPosX,
        y = Config.CentralPosY,
        z = 30.30774
    }
}

Citizen.CreateThread(
    function()
        for _, info in pairs(blips) do
            info.blip = AddBlipForCoord(info.x, info.y, info.z)
            SetBlipSprite(info.blip, info.id)
            SetBlipDisplay(info.blip, 4)
            SetBlipScale(info.blip, Config.CentralScaleBlips)
            SetBlipColour(info.blip, info.colour)
            SetBlipAsShortRange(info.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.title)
            EndTextCommandSetBlipName(info.blip)
        end
    end
)

Citizen.CreateThread(
    function()
        RequestModel(Config.PedHash)
        while not HasModelLoaded(Config.PedHash) do
            Wait(1)
        end
        pedJob = CreatePed(1, Config.PedHash, Config.PedX, Config.PedY, Config.PedZ - 1, Config.PedH, false, true)
        SetBlockingOfNonTemporaryEvents(pedJob, true)
        SetPedDiesWhenInjured(pedJob, false)
        SetPedCanPlayAmbientAnims(pedJob, true)
        SetPedCanRagdollFromPlayerImpact(pedJob, false)
        SetEntityInvincible(pedJob, true)
        FreezeEntityPosition(pedJob, true)
        if Config.AnimationActive then
            TaskStartScenarioInPlace(pedJob, Config.PedAnimationList, 0, true)
        else
        end
    end
)

--functions
function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function playTypeAnimation()
    local ped = PlayerPedId()
    local dict, anim = "mp_prison_break", "hack_loop"

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(33)
    end

    TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 48, 0.0, false, false, false)
end

function playWardrobeAnimation()
    local ped = PlayerPedId()
    local dict, anim = "mp_clothing@female@shirt", "try_shirt_positive_a"

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(33)
    end

    TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 48, 0.0, false, false, false)
end

function OpenMenuRoutes()
    MenuOpened = true
    local ped = PlayerPedId()
    ESX.UI.Menu.Open(
        "default",
        GetCurrentResourceName(),
        "routes_menu",
        {
            title = Config.MenuTitle,
            align = Config.MenuPos,
            elements = {
                {label = Config.MenuRoute1, value = "route_1"},
                {label = Config.MenuRoute2, value = "route_2"}
            }
        },
        function(Data, LockerMenu) -- Selection
            if Data.current.value == "route_1" then
                MenuOpened = false
                if onDuty then
                    CheckRoute = true
                    Route1 = true
                    ESX.UI.Menu.CloseAll()
                    DoScreenFadeOut(800)
                    Citizen.Wait(800)
                    exports.rprogress:Custom(
                        {
                            Duration = 25000,
                            Label = Config.Locales["garage_progress"],
                            DisableControls = {
                                Mouse = false,
                                Player = true,
                                Vehicle = true
                            }
                        }
                    )
                    TriggerServerEvent("InteractSound_SV:PlayOnSource", "trucksound", 0.6)
                    ESX.Game.SpawnVehicle(
                        Config.CarModelName,
                        vector3(
                            Config.Locations["cardeposit"].coords.x,
                            Config.Locations["cardeposit"].coords.y,
                            Config.Locations["cardeposit"].coords.z
                        ),
                        Config.Locations["cardeposit"].coords.h,
                        function(vehicle)
                            SetVehicleNumberPlateText(vehicle, "ANG" .. tostring(math.random(1000, 9999)))
                            TaskWarpPedIntoVehicle(ped, vehicle, -1)
                            SetVehicleEngineOn(vehicle, true, true)
                            SetVehicleLivery(vehicle, 1)
                        end
                    )
                    Citizen.Wait(25000)
                    DoScreenFadeIn(800)
                    Route1_Function()
                else
                    exports["mythic_notify"]:DoHudText("error", Config.Locales["no_job2"])
                end
            elseif Data.current.value == "route_2" then
                MenuOpened = false
                if onDuty then
                    CheckRoute = true
                    Route2 = true
                    FinishRoute2 = true
                    ESX.UI.Menu.CloseAll()
                    DoScreenFadeOut(800)
                    Citizen.Wait(800)
                    exports.rprogress:Custom(
                        {
                            Duration = 25000,
                            Label = Config.Locales["garage_progress"],
                            DisableControls = {
                                Mouse = false,
                                Player = true,
                                Vehicle = true
                            }
                        }
                    )
                    TriggerServerEvent("InteractSound_SV:PlayOnSource", "trucksound", 0.6)
                    ESX.Game.SpawnVehicle(
                        Config.CarModelName,
                        vector3(
                            Config.Locations["cardeposit"].coords.x,
                            Config.Locations["cardeposit"].coords.y,
                            Config.Locations["cardeposit"].coords.z
                        ),
                        Config.Locations["cardeposit"].coords.h,
                        function(vehicle)
                            SetVehicleNumberPlateText(vehicle, "ANG" .. tostring(math.random(1000, 9999)))
                            TaskWarpPedIntoVehicle(ped, vehicle, -1)
                            SetVehicleEngineOn(vehicle, true, true)
                            SetVehicleLivery(vehicle, 4)
                        end
                    )
                    Citizen.Wait(25000)
                    DoScreenFadeIn(800)
                    Route2_Function()
                else
                    exports["mythic_notify"]:DoHudText("error", Config.Locales["no_job2"])
                end
            end

            LockerMenu.close()
            MenuOpened = false
        end,
        function(Data, LockerMenu) -- Close
            LockerMenu.close()
            MenuOpened = false
        end
    )
end

function Route1_Function()
    x, y, z = Config.YouToolsRouteX, Config.YouToolsRouteY, 35.02563
    SetBlipSprite(blip, 50)
    SetNewWaypoint(x, y)
end

function Route2_Function()
    x, y, z = Config.PharmacyRouteX, Config.PharmacyRouteY, 35.02563
    SetBlipSprite(blip, 50)
    SetNewWaypoint(x, y)
end

function Central_Function()
    x, y, z = Config.CentralPosX, Config.CentralPosY, 35.02563
    SetBlipSprite(blip, 50)
    SetNewWaypoint(x, y)
end
--Callbacks js

RegisterNUICallback(
    "closeWindow",
    function(data, cb)
        SetNuiFocus(false, false)
        SendNUIMessage(
            {
                type = "show",
                status = false
            }
        )
    end
)

RegisterNUICallback(
    "start_work",
    function(data, cb)
        StartWork = true
        SetNuiFocus(false, false)
        SendNUIMessage(
            {
                type = "show",
                status = false
            }
        )
        exports["mythic_notify"]:DoHudText("inform", Config.Locales["clothes_job_inform"])
        Citizen.Wait(2500)
        exports["mythic_notify"]:DoHudText("inform", Config.Locales["clothes_job_inform"])
        Citizen.Wait(2500)
        exports["mythic_notify"]:DoHudText("inform", Config.Locales["clothes_job_inform"])
    end
)

--Prints

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(12000)
            print("Trucker job created by Gianluigi#2245")
            print("Trucker job created by Gianluigi#2245")
            print("Trucker job created by Gianluigi#2245")
            print("Trucker job created by Gianluigi#2245")
            print("Trucker job created by Gianluigi#2245")
        end
    end
)

--Resource start and stop calls
AddEventHandler(
    "onResourceStop",
    function(resource)
        if resource == GetCurrentResourceName() then
            if Config.PreventBugMenuOnRestartOrStop then
                ESX.UI.Menu.CloseAll()
            end
        end
    end
)
