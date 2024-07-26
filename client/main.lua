local ox_target = exports.ox_target
local lootBlips = {}
local lootBoxes = {}

RegisterNetEvent('redzone:spawnParachuteDrop')
AddEventHandler('redzone:spawnParachuteDrop', function(coords)
    local parachuteObject = CreateObject(GetHashKey(Config.ParachuteModel), coords.x, coords.y, coords.z, true, true, true)
    SetEntityLodDist(parachuteObject, 1000)
    lootBoxes[coords] = parachuteObject

    local fallHeight = 150.0 -- Højde hvor det skal spawnes (nix pille)
    local landHeight = 0.0 -- Hvor jorden er iforhold til (nix pille)

    local function dropParachute()
        local currentHeight = fallHeight

        CreateThread(function()
            while currentHeight > landHeight do
                Wait(10)
                SetEntityCoords(parachuteObject, coords.x, coords.y, currentHeight, false, false, false, true)
                currentHeight = currentHeight - 0.5
            end

            -- Den er landet og her skulle man kunne bruge øjet på den.
            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(blip, 1)
            SetBlipColour(blip, 1)
            SetBlipScale(blip, 0.8)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Sinsygt loot") -- Text der skal være på mappet
            EndTextCommandSetBlipName(blip)
            table.insert(lootBlips, { blip = blip, coords = coords })

            exports.ox_inventory:RegisterStash('loot_'..coords, 'Loot Drop', Config.LootItems)

            ox_target:addSphereZone({
                coords = coords,
                radius = Config.LootDropRadius,
                options = {
                    {
                        name = 'loot',
                        label = 'Tjek Boksen',
                        onSelect = function(data)
                            TriggerServerEvent('redzone:lootCollected', data.coords)
                            ox_target:removeZone('loot_'..data.coords)
                            for i, v in ipairs(lootBlips) do
                                if v.coords == coords then
                                    RemoveBlip(v.blip)
                                    table.remove(lootBlips, i)
                                    break
                                end
                            end
                        end
                    }
                }
            })

            -- Lyd begynder
            CreateThread(function()
                while lootBoxes[coords] do
                    PlaySoundFromCoord(-1, "Beep_Red", coords.x, coords.y, coords.z, "DLC_HEISTS_BIOLAB_PREP_HACKING_SOUNDS", false, 0, false)
                    Wait(Config.BeepInterval)
                end
            end)
        end)
    end

    dropParachute()
end)

RegisterNetEvent('redzone:removeBlip')
AddEventHandler('redzone:removeBlip', function(coords)
    for i, v in ipairs(lootBlips) do
        if v.coords == coords then
            RemoveBlip(v.blip)
            table.remove(lootBlips, i)
            break
        end
    end
end)

RegisterNetEvent('redzone:removeLootBox')
AddEventHandler('redzone:removeLootBox', function(coords)
    if lootBoxes[coords] then
        DeleteObject(lootBoxes[coords])
        lootBoxes[coords] = nil
    end
end)
