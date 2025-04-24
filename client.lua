local function reqAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(2)
    end
end

local function reqParticle(dict)
    RequestNamedPtfxAsset(dict)
    while not HasNamedPtfxAssetLoaded(dict) do
        Wait(1)
    end
end

for k, v in pairs(Config.Fireworks) do
    if v.command then
        RegisterCommand(v.command, function()
            TriggerEvent('skr-fireworks:startPlacingFirework', k)
        end)
    end
end

local hasBox = nil

RegisterNetEvent('skr-fireworks:startPlacingFirework', function(type)
    if Config.DisableMultiplyFireworks and hasBox then
        TriggerEvent('QBCore:Notify', ('You can only place one at a time.'))
        return
    end

    if Config.Fireworks[type] then
        local myFirework = Config.Fireworks[type]
        local myPed = PlayerPedId()
        local myOffset = GetOffsetFromEntityInWorldCoords(myPed, 0, 1.0, 0) -- Adjusted offset to ensure proper placement

        -- Play placement animation
        reqAnimDict(Config.PlacingAnimation[1])
        TaskPlayAnim(myPed, Config.PlacingAnimation[1], Config.PlacingAnimation[2], -1, -8.0, 3000, 0, 0, false, false, false)
        Citizen.Wait(2000) -- Wait for the animation to complete

        -- Create the firework box
        hasBox = CreateObjectNoOffset(myFirework.prop, myOffset.x, myOffset.y, myOffset.z, true, true, false)
        if DoesEntityExist(hasBox) then
            PlaceObjectOnGroundProperly(hasBox)
            FreezeEntityPosition(hasBox, true)

            -- Notify the player
            TriggerEvent('QBCore:Notify', ('You placed a firework!'))

            -- Add Ox Target interaction to the firework
            local boxCoords = GetEntityCoords(hasBox)
            exports.ox_target:addBoxZone({
                coords = boxCoords,
                size = vector3(1.0, 1.0, 1.0),
                options = {
                    {
                        name = 'light_firework',
                        icon = 'fa-solid fa-fire',
                        label = 'Light Firework',
                        onSelect = function()
                            TriggerEvent('skr-fireworks:lightFirework', type)
                        end
                    }
                },
                debug = Config.Debug
            })
        else
            TriggerEvent('QBCore:Notify', ('Failed to place Firework. Try Again...'))
            hasBox = nil
        end
    end
end)

RegisterNetEvent('skr-fireworks:lightFirework', function(type)
    if not hasBox or not Config.Fireworks[type] then
        TriggerEvent('QBCore:Notify', ('No Firework to Light!'))
        return
    end

    local myFirework = Config.Fireworks[type]
    local boxCoords = GetEntityCoords(hasBox)
    local fireworkShoots = myFirework.shoots

    -- Set the countdown to 10 seconds
    local secondsToStart = 10000

    -- Countdown before firework starts using QB-Core notifications
    for i = secondsToStart / 1000, 1, -1 do
        TriggerEvent('QBCore:Notify', ('Firework launching in %d seconds!'):format(i), 'primary')
        Citizen.Wait(1000)
    end

    -- Firework effects
    for k, v in pairs(myFirework.particles) do
        reqParticle(v.name)
    end

    while fireworkShoots ~= 0 do
        fireworkShoots = fireworkShoots - 1
        for k, v in pairs(myFirework.particles) do
            UseParticleFxAsset(v.name)
            StartNetworkedParticleFxNonLoopedAtCoord(
                v.effect,
                boxCoords.x + (v.randomizeXY and math.random(-10, 10) or 0.0),
                boxCoords.y + (v.randomizeXY and math.random(-10, 10) or 0.0),
                boxCoords.z + v.plusHeight,
                0.0, 0.0, 0.0, v.scale, false, false, false
            )
            Citizen.Wait(v.timeToNextShoot)
        end
        Citizen.Wait(myFirework.timeBetweenShoots or 300)
    end

    -- Clean up
    NetworkFadeOutEntity(hasBox, true, false)
    Citizen.Wait(2000)
    DeleteEntity(hasBox)
    hasBox = nil
end)

RegisterNetEvent('skr-fireworks:notification', function(message, type)
    Config.Notification(message, type)
end)