local QBCore = exports['qb-core']:GetCoreObject()
HandleStore = function()
    local storeData = Config.OrangeShop

    WaitForModel(storeData["ped"]["model"])

    local pedHandle = CreatePed(5, storeData["ped"]["model"], storeData["ped"]["position"], storeData["ped"]["heading"], false)

    SetEntityInvincible(pedHandle, true)
    SetEntityAsMissionEntity(pedHandle, true, true)
    SetBlockingOfNonTemporaryEvents(pedHandle, true)

    cachedData["storeOwner"] = pedHandle

    SetModelAsNoLongerNeeded(storeData["ped"]["model"])

    local storeBlip = AddBlipForCoord(storeData["ped"]["position"])
	
    SetBlipSprite(storeBlip, storeData["blip"]["sprite"])
    SetBlipScale(storeBlip, 0.65)
    SetBlipColour(storeBlip, storeData["blip"]["color"])
    SetBlipAsShortRange(storeBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(storeData["name"])
    EndTextCommandSetBlipName(storeBlip)
end


SellOrange = function()
    QBCore.Functions.TriggerCallback('qb-orange:GetItemData', function(count)
        TaskTurnPedToFaceEntity(cachedData["storeOwner"], cachedData["ped"], 1000)
        TaskTurnPedToFaceEntity(cachedData["ped"], cachedData["storeOwner"], 1000)

        TriggerServerEvent("qb-orange:sellorange", function(sold, venisonSold) end)
    end)
end

FadeOut = function(duration)
    DoScreenFadeOut(duration)
    
    while not IsScreenFadedOut() do
        Citizen.Wait(0)
    end
end

FadeIn = function(duration)
    DoScreenFadeIn(500)

    while not IsScreenFadedIn() do
        Citizen.Wait(0)
    end
end

WaitForModel = function(model)
    if not IsModelValid(model) then
        return
    end

	if not HasModelLoaded(model) then
		RequestModel(model)
	end
	
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
end

DrawBusySpinner = function(text)
    SetLoadingPromptTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    ShowLoadingPrompt(3)
end

ShowHelpNotification = function(msg, thisFrame, beep, duration)
	AddTextEntry('qbHelpNotification', msg)

	if thisFrame then
		DisplayHelpTextThisFrame('qbHelpNotification', false)
	else
		if beep == nil then beep = true end
		BeginTextCommandDisplayHelp('qbHelpNotification')
		EndTextCommandDisplayHelp(0, false, beep, duration or -1)
	end
end