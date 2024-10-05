local QBCore = exports['qb-core']:GetCoreObject()

UpdateTime = 60 -- Sec

Citizen.CreateThread(function()
    while true do
        local src = source
        local players = {}
        for k, v in pairs(GetPlayers()) do
          --  print(GetPlayerName(v)) -- steam name
          --  print(GetPlayerPing(v)) -- ping
            players[#players+1] = {
                id = v
            }
        end
      --  print(players)
      TriggerClientEvent("sq-logonui:client:UpdatePlayersCount",-1,players)
      
      Wait(UpdateTime * 1000)
    end
  end)

  RegisterNetEvent('sq-logonui:server:UpdatePlayersCount', function()
    local src = source
    local players = {}
    for k, v in pairs(GetPlayers()) do
      --  print(GetPlayerName(v)) -- steam name
      --  print(GetPlayerPing(v)) -- ping
        players[#players+1] = {
            id = v
        }
    end
  --  print(players)
  TriggerClientEvent("sq-logonui:client:UpdatePlayersCount",src,players)
  end)