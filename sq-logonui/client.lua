local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    local id = GetPlayerServerId(PlayerId())
    TriggerServerEvent('sq-logonui:server:UpdatePlayersCount')
    SendNUIMessage({
        type = 'logoShow',
        me = id,
    })
end)

RegisterNetEvent('sq-logonui:client:UpdatePlayersCount', function(Players)
  --  print('hello')
    SendNUIMessage({
        type = 'UpdatePlayersCount',
        Players = Players,
    })
end)