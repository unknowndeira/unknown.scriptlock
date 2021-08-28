ESX = nil

--[[Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		--print(ESX)
	end
end--]]

RegisterNetEvent('canWork')
AddEventHandler("canWork", function()
  ESX = true
end)