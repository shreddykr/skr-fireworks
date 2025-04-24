--
--░██████╗██╗░░██╗██████╗░░░░░░░███████╗██╗██████╗░███████╗░██╗░░░░░░░██╗░█████╗░██████╗░██╗░░██╗░██████╗
--██╔════╝██║░██╔╝██╔══██╗░░░░░░██╔════╝██║██╔══██╗██╔════╝░██║░░██╗░░██║██╔══██╗██╔══██╗██║░██╔╝██╔════╝
--╚█████╗░█████═╝░██████╔╝█████╗█████╗░░██║██████╔╝█████╗░░░╚██╗████╗██╔╝██║░░██║██████╔╝█████═╝░╚█████╗░
--░╚═══██╗██╔═██╗░██╔══██╗╚════╝██╔══╝░░██║██╔══██╗██╔══╝░░░░████╔═████║░██║░░██║██╔══██╗██╔═██╗░░╚═══██╗
--██████╔╝██║░╚██╗██║░░██║░░░░░░██║░░░░░██║██║░░██║███████╗░░╚██╔╝░╚██╔╝░╚█████╔╝██║░░██║██║░╚██╗██████╔╝
--╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░░░░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░
--

Config = {}

Config.Debug = false -- Enable debug mode for Ox Lib zones

Config.Core = "QB-Core" -- "QB-Core"

if Config.Core == "QB-Core" then
    QBCore = exports['qb-core']:GetCoreObject()
end

-- Use Ox Library notifications, with a fallback if 'lib' is not available
Config.Notification = function(message, type)
    if lib and lib.notify then
        lib.notify({
            description = message,
            type = type, -- success, error, or info
            duration = 5000 -- 5 seconds
        })
    else
        -- Fallback to a simple print statement if Ox Library is not loaded
        print(("[Notification Fallback] %s: %s"):format(type, message))
    end
end

Config.Translate = {
    ['CANNOT_START'] = "You can't set off several fireworks at once. Wait until the current one finishes.",
    ['NEED_LIGHTER'] = "You need a lighter to start the firework!",
    ['YOU_PLACE_FIREWORK'] = "You have placed the firework!",
}

Config.PlacingAnimation = {'anim@mp_fireworks', 'place_firework_3_box'} -- Animation for placing fireworks

Config.DisableMultiplyFireworks = false -- Allow only one firework at a time if set to true

Config.NeedLighter = true
Config.LighterItem = 'lighter'

Config.Fireworks = {
    [1] = {
        item = 'firework_1', -- name or nil
        itemRemovable = true, -- if it is on the item, is it to be removed after use 
        command = 'fire_1', -- name of command or nil
        shoots = 50, -- count of shots
        prop = "ind_prop_firework_03",
        timeToStart = 5500, -- +/- 5000 == 5 seconds
        timeBetweenShoots = 1250,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_starburst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 120},
            {name = "proj_indep_firework", effect = "scr_indep_firework_grd_burst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 300},
            {name = "proj_indep_firework", effect = "scr_indep_firework_air_burst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 600},
        },
    },
    [2] = {
        item = 'firework_2',
        itemRemovable = true,
        command = 'fire_2',
        shoots = 80,
        prop = "ind_prop_firework_03",
        timeToStart = 5500,
        timeBetweenShoots = 250,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_trailburst", scale = 2.0, plusHeight = 10.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "proj_xmas_firework", effect = "scr_firework_xmas_ring_burst_rgw", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
        },
    },
    [3] = {
        item = 'firework_3',
        itemRemovable = true,
        command = 'fire_3',
        shoots = 80,
        prop = "ind_prop_firework_03",
        timeToStart = 5500,
        timeBetweenShoots = 250,
        particles = {
            {name = "proj_indep_firework", effect = "scr_indep_firework_air_burst", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_spiral_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_repeat_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_starburst", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
        },
    },
    [4] = {
        item = 'firework_4',
        itemRemovable = true,
        command = 'fire_4',
        shoots = 50,
        prop = "ind_prop_firework_03",
        timeToStart = 5000,
        timeBetweenShoots = 550,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_trailburst", scale = 4.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 10},
        },
    },
    [5] = {
        item = 'fontain_4',
        itemRemovable = true,
        command = 'fontain_4',
        shoots = 80,
        prop = "ind_prop_firework_04",
        timeToStart = 3500,
        timeBetweenShoots = 700,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_fountain", scale = 0.25, plusHeight = 0.25, randomizeXY = false, timeToNextShoot = 500},
        },
    },
}
