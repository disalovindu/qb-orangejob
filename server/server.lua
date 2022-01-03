QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)


RegisterServerEvent('orange:getItem')
AddEventHandler('orange:getItem', function()
	local xPlayer, randomItem = QBCore.Functions.GetPlayer(source), Config.Items[math.random(1, #Config.Items)]
	
	if math.random(0, 100) <= Config.ChanceToGetItem then
		local Item = xPlayer.Functions.GetItemByName('orange')
		if Item == nil then
			xPlayer.Functions.AddItem(randomItem, 1)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[randomItem], "add")
		else	
		if Item.amount < 20 then
		xPlayer.Functions.AddItem(randomItem, 1)
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[randomItem], "add")
		else
			TriggerClientEvent('QBCore:Notify', source, 'full inventory, go make Orange Juice!', "error")  
		end
	    end
    end
end)


RegisterServerEvent('orange_weed:processweed2')
AddEventHandler('orange_weed:processweed2', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.GetItemByName('orange') then
		local chance = math.random(1, 8)
		if chance == 1 or chance == 2 or chance == 3 or chance == 4 or chance == 5 or chance == 6 or chance == 7 or chance == 8 then
			Player.Functions.RemoveItem('orange', 1)
			Player.Functions.AddItem('orange_juice', 1)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['orange'], "remove")
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['orange_juice'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'Your Orange Juice has been Made!', "success")  
		else
			
		end 
	else
		TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the right items to make Orange juice!', "error") 
	end
end)


RegisterServerEvent('orange:sell')
AddEventHandler('orange:sell', function()

    local xPlayer = QBCore.Functions.GetPlayer(source)
	local Item = xPlayer.Functions.GetItemByName('orange_juice')
   
	
	if Item == nil then
       TriggerClientEvent('QBCore:Notify', source, 'orange_juice', "error")  
	else
	 for k, v in pairs(Config.Prices) do
        
		
		if Item.amount > 0 then
            local reward = 0
            for i = 1, Item.amount do
                reward = reward + math.random(v[1], v[2])
            end
			xPlayer.Functions.RemoveItem('orange_juice', 1)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['orange_juice'], "remove")
			xPlayer.Functions.AddMoney("cash", reward, "sold-pawn-items")
			TriggerClientEvent('QBCore:Notify', source, 'you sold', "success")  
			--end
        end
		
		
     end
	end
	
		
	
end)
