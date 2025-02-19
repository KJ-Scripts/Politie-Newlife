RegisterNetEvent("KJ-Newlife:teleportPlayer")
AddEventHandler("KJ-Newlife:teleportPlayer", function(x, y, z)
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, x, y, z, false, false, false, true)
end)

RegisterNetEvent("openNewlifemenu")
AddEventHandler("openNewlifemenu", function()
    lib.showContext('newlifemenu')
end)

lib.registerContext({
    id = "newlifemenu",
    title = "Newlife Menu",
    options = {
        {
            title = "Newlife Politie",
            description = "Je geeft jezelf een nieuw leven op het Politie HB",
            onSelect = function()
                TriggerServerEvent('politiehbnewlife')
            end,
            icon = "person"
        }
    }
})