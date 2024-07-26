if Config.Framework == 'qb-core' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
else
    print('Intet framework valgt i config.lua din snotskovl!')
    return
end

local function generateRandomCoords()
    local x = math.random(Config.RandomCoordsRange.x[1], Config.RandomCoordsRange.x[2])
    local y = math.random(Config.RandomCoordsRange.y[1], Config.RandomCoordsRange.y[2])
    local z = math.random(Config.RandomCoordsRange.z[1], Config.RandomCoordsRange.z[2])
    return vector3(x, y, z)
end

local function spawnLootDrop()
    local coords = generateRandomCoords()
    TriggerClientEvent('redzone:spawnParachuteDrop', -1, coords)

    SetTimeout(math.random(Config.LootDropInterval.min, Config.LootDropInterval.max), spawnLootDrop)
end

CreateThread(spawnLootDrop)

RegisterServerEvent('redzone:lootCollected')
AddEventHandler('redzone:lootCollected', function(coords)
    exports.ox_inventory:RemoveStash('loot_'..coords)
    TriggerClientEvent('redzone:removeBlip', -1, coords)
    -- Fjerner Boksen efter 4 minutter
    SetTimeout(Config.LootDespawnTime, function()
        TriggerClientEvent('redzone:removeLootBox', -1, coords)
    end)
end)
