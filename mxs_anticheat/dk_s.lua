RegisterServerEvent("mxs:kick")
AddEventHandler("mxs:kick", function(reason)
	DropPlayer(source, reason)	
end)
-------
RegisterServerEvent("mxs:hilelog")
AddEventHandler("mxs:hilelog", function(reason)
  local _source = source
      local connect = {
            {
                ["color"] = 23295,
                ["title"] = reason,
                ["description"] = "Kullanıcı: "..GetPlayerName(_source).. " "  ..GetPlayerIdentifiers(_source)[1].."  ",
                ["footer"] = {
                ["text"] = "Made by MIXAS#1234",
                },
            }
        }
      PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = "MIXAS AC", embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })  
end)
-------------
RegisterServerEvent("imgToDiscord")
AddEventHandler("imgToDiscord", function(img)
    -- img, foto url si oluyor
  PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = "MIXAS AC.", content = img}), { ['Content-Type'] = 'application/json' })
end)

ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
---------
local cd = 0
AddEventHandler('explosionEvent', function(sender, ev)
    CancelEvent()
      local name = GetPlayerName
      sendToWebhook("Kişi patlayıcı spawnladı  "  ..GetPlayerName(sender))
    end
end)
-----
function sendToWebhook(content)
          local connect = {
        {
            ["color"] = "23295",
            ["title"] = "MIXAS-ANTICHEAT",
            ["description"] = content,
            ["footer"] = {
            ["text"] = "Made By MIXAS#1234",
            },
        }
    }
  PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = "MIXAS-ANTICHEAT", embeds = connect}), { ['Content-Type'] = 'application/json' })
end
------
TriggerEvent('es:addGroupCommand', 'herkesirevle', 'superadmin', function(source, args, user)
	TriggerClientEvent('mxsrev', source)
  end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Bu komutu kullanmak icin superadmin olmalısınız.")
  end, {help = 'Bütün oyuncuları canlandır'})
