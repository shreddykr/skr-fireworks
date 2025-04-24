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
    -- Firework 1: Basic Starburst
    [1] = {
        item = 'firework_1',
        itemRemovable = true,
        command = 'fire_1',
        shoots = 50,
        prop = "ind_prop_firework_03",
        timeToStart = 5000,
        timeBetweenShoots = 1250,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_starburst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 120},
        },
    },
    -- Firework 2: Ground Burst
    [2] = {
        item = 'firework_2',
        itemRemovable = true,
        command = 'fire_2',
        shoots = 30,
        prop = "ind_prop_firework_02",
        timeToStart = 3000,
        timeBetweenShoots = 1000,
        particles = {
            {name = "proj_indep_firework", effect = "scr_indep_firework_grd_burst", scale = 3.0, plusHeight = 10.0, randomizeXY = false, timeToNextShoot = 200},
        },
    },
    -- Firework 3: Multi-Color Explosion
    [3] = {
        item = 'firework_3',
        itemRemovable = true,
        command = 'fire_3',
        shoots = 70,
        prop = "ind_prop_firework_04",
        timeToStart = 7000,
        timeBetweenShoots = 1500,
        particles = {
            {name = "scr_xmas_fireworks", effect = "scr_firework_xmas_ring_burst_rgw", scale = 4.0, plusHeight = 60.0, randomizeXY = true, timeToNextShoot = 150},
            {name = "scr_xmas_fireworks", effect = "scr_firework_xmas_spiral_burst_rgw", scale = 3.5, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 300},
        },
    },
    -- Firework 4: Rapid Shooter
    [4] = {
        item = 'firework_4',
        itemRemovable = true,
        command = 'fire_4',
        shoots = 100,
        prop = "ind_prop_firework_01",
        timeToStart = 2000,
        timeBetweenShoots = 500,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_shotburst", scale = 1.5, plusHeight = 30.0, randomizeXY = true, timeToNextShoot = 100},
        },
    },
    -- Firework 5: Mega Display
    [5] = {
        item = 'firework_5',
        itemRemovable = true,
        command = 'fire_5',
        shoots = 150,
        prop = "ind_prop_firework_05",
        timeToStart = 10000,
        timeBetweenShoots = 2500,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_starburst", scale = 5.0, plusHeight = 70.0, randomizeXY = true, timeToNextShoot = 200},
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_shotburst", scale = 4.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 150},
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_trailburst", scale = 6.0, plusHeight = 80.0, randomizeXY = true, timeToNextShoot = 300},
        },
    },
}
