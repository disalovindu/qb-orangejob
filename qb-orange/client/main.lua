QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()
cachedData = {}

local JobBusy = false

Citizen.CreateThread(function()
	while not QBCore do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

		Citizen.Wait(0)
	end
end)

-- function SellOrange()

Citizen.CreateThread(function()
	Citizen.Wait(500)
	HandleStore()
	while true do
		local sleepThread = 500
		local ped = cachedData["ped"]
		if DoesEntityExist(cachedData["storeOwner"]) then
			local pedCoords = GetEntityCoords(ped)
			local dstCheck = #(pedCoords - GetEntityCoords(cachedData["storeOwner"]))
			if dstCheck < 3.0 then
				if JobBusy == false then
					sleepThread = 5
					local displayText = not IsEntityDead(cachedData["storeOwner"]) and "Press ~INPUT_CONTEXT~ to sell your Orange Juice to the owner." or "The owner is dead, WHAT THE FUCK DID YOU DO!!."
					if IsControlJustPressed(0, 38) then
						SellOrange()
					end
					ShowHelpNotification(displayText)
				end
			end
		end
		Citizen.Wait(sleepThread)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1500)

		local ped = PlayerPedId()

		if cachedData["ped"] ~= ped then
			cachedData["ped"] = ped
		end
	end
end)