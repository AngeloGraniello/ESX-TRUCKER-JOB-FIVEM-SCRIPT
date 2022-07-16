ESX = nil
TriggerEvent(
    Config.ESXServer,
    function(obj)
        ESX = obj
    end
)

RegisterNetEvent("pay-route-1")
AddEventHandler(
    "pay-route-1",
    function()
        local xPlayer = ESX.GetPlayerFromId(source)

        xPlayer.addMoney(Config.PayRoute1)
    end
)

RegisterNetEvent("pay-route-2")
AddEventHandler(
    "pay-route-2",
    function()
        local xPlayer = ESX.GetPlayerFromId(source)

        xPlayer.addMoney(Config.PayRoute2)
    end
)
