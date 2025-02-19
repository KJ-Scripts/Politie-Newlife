ESX = exports["es_extended"]:getSharedObject()

local cooldowns = {}

RegisterCommand("newlife", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name == "police" then

        if not cooldowns[source] or (os.time() - cooldowns[source]) >= 30 then

            TriggerClientEvent("openNewlifemenu", source)

            cooldowns[source] = os.time()
        else
            local remainingTime = 30 - (os.time() - cooldowns[source])
            TriggerClientEvent('frp-notifications:client:notify', source, "error", 'Je kunt dit commando niet zo snel herhalen. Wacht ' .. remainingTime .. ' seconden.', 4000)
        end
    else
        TriggerClientEvent('frp-notifications:client:notify', source, "error", 'Je bent geen politie!', 4000)
    end
end, false)


RegisterServerEvent("politiehbnewlife")
AddEventHandler("politiehbnewlife", function()
    local source = source
    TriggerClientEvent('frp-notifications:client:notify', source, "info", 'Je zal over een minuut een nieuw leven krijgen!', 4000)
    Citizen.Wait(60000)
    TriggerClientEvent('KJ-Newlife:teleportPlayer', source, -1081.0905, -860.8408, 5.0423)
    TriggerClientEvent('frp-ambulance:client:staffrevive:player', source)
    TriggerClientEvent('frp-notifications:client:notify', source, "success", 'Je hebt jezelf succesvol een nieuw leven gegeven!', 4000)
end)
