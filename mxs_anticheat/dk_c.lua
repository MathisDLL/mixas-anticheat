ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end) --ESX KULLANMAK İÇİN GEREKLİ
---// YASAKLI TUŞ // //--- 
Citizen.CreateThread(function()
  while true do
      local sleep = false
      if IsControlJustReleased(0, 121) then
        Citizen.Wait(60000)
        TriggerServerEvent("mxs:hilelog", "Kişi insert tuşuna bastı, olası hile durumunda birinci şüpheli.")
        exports['screenshot-basic']:requestScreenshotUpload("https://upload.hard-ware.online/upload.php", "files[]", function(data)
              local img = json.decode(data)
              --print(img.files[1].url)
              TriggerServerEvent("imgToDiscord", img.files[1].url)
          end)
          sleep = true
      end
      if sleep == true then
          Citizen.Wait(5000)
      else
          Citizen.Wait(1)
      end
  end
end)
---// ANTI-VDM // DOPAMINE RAM VEHICLE FİX //--- 
Citizen.CreateThread(function()
  while true do
      Citizen.Wait(60000)
      N_0x4757f00bc6323cfe(-1553120962, 0.0) --undocumented damage modifier. 1st argument is hash, 2nd is modified (0.0-1.0)
      Wait(0)
  end
end)
-- YASAKLI SİLAH 
Citizen.CreateThread(function()
	while true do
    Citizen.Wait(30000)
		for _,theWeapon in ipairs(Config.BlacklistedWeapons) do
			Wait(1)
			if HasPedGotWeapon(PlayerPedId(),GetHashKey(theWeapon),false) == 1 then
                  RemoveAllPedWeapons(PlayerPedId(),false)
                  TriggerServerEvent("mxs:hilelog", "Yasaklı silah tespit edildi")
                  exports['screenshot-basic']:requestScreenshotUpload("https://upload.hard-ware.online/upload.php", "files[]", function(data)
                    local img = json.decode(data)
                    --print(img.files[1].url)
                    TriggerServerEvent("imgToDiscord", img.files[1].url)
                end)
					break
			end
		end
	end
end)
----ANTI BYPASS
AddEventHandler("onClientResourceStop", function(resourceName)
  TriggerServerEvent("mxs:kick", "By pass tespit edildi.")
  TriggerServerEvent("mxs:hilelog", "Kişi script stopladı ve anticheat tarafından kicklendi "..resourceName, true, true)
end)

RegisterNetEvent('mxsrev')
AddEventHandler('mxsrev', function()
      for i = 0, 4000 do
     if NetworkIsPlayerActive(i) then
         TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(i))
      end
   end
end)
------- ANTI SPECTATE
Citizen.CreateThread(function()
  while true do
    Wait(5000)
    local ped = NetworkIsInSpectatorMode()
    if ped == 1 then
  TriggerServerEvent("mxs:hilelog", "Spectate tespit edildi")
      exports['screenshot-basic']:requestScreenshotUpload("https://upload.hard-ware.online/upload.php", "files[]", function(data)
      local img = json.decode(data)
      --print(img.files[1].url)
      TriggerServerEvent("imgToDiscord", img.files[1].url)
      end)
    end
end
end)
--------ANTIBLIPS
Citizen.CreateThread(function()
while true do
Citizen.Wait(6000)
BlipAC()
end
end)

local amountA = 0
local policzone = 0
function BlipAC()
local amountB = GetNumberOfActiveBlips()
local roz = amountB - amountA
if roz >= 40 and amountA > 0 and not whitelisted and amountA > 160 then
policzone = policzone + 1
TriggerServerEvent("mxs:hilelog", "Kişinin bliplerinin açık olduğu tespit edildi ve anticheat tarafından kicklendi ")
exports['screenshot-basic']:requestScreenshotUpload("https://upload.hard-ware.online/upload.php", "files[]", function(data)
local img = json.decode(data)
TriggerServerEvent("imgToDiscord", img.files[1].url)
end)
  TriggerServerEvent("mxs:kick", "İnject tespit edildi MIXAS GUARD 🛡️")
if policzone >= 5 then
amountA = amountB
policzone = 0
end
else
amountA = amountB
end
end

 RegisterNetEvent('esx:getSharedObject')
 AddEventHandler('esx:getSharedObject', function()
 TriggerServerEvent("mxs:hilelog", "Kişi menü inject etmeye çalışıyor.")
 end)