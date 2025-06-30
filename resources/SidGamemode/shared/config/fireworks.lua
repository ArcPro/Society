Config = Config or {}


Config.Fireworks = {
    {
        shoots = 50,
        timeBetweenShoots = 1250,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_starburst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 120},
            {name = "proj_indep_firework", effect = "scr_indep_firework_grd_burst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 300},
            {name = "proj_indep_firework", effect = "scr_indep_firework_air_burst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 600},
        },
    }, {
        shoots = 80,
        timeBetweenShoots = 250,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_trailburst", scale = 2.0, plusHeight = 10.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "proj_xmas_firework", effect = "scr_firework_xmas_ring_burst_rgw", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
        },
    }, {
        shoots = 80,
        timeBetweenShoots = 250,
        particles = {
            {name = "proj_indep_firework", effect = "scr_indep_firework_air_burst", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_spiral_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_repeat_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_starburst", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
        },
    }, {
        shoots = 50,
        timeBetweenShoots = 550,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_trailburst", scale = 4.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 10},
        },
    }, {
        shoots = 80,
        timeBetweenShoots = 700,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_fountain", scale = 0.25, plusHeight = 0.25, randomizeXY = false, timeToNextShoot = 500},
        },
    }, {
        shoots = 1,
        timeBetweenShoots = 100,
        particles = {
            {name = "proj_indep_firework", effect = "scr_indep_firework_grd_burst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 600},
            {name = "proj_indep_firework", effect = "scr_indep_firework_air_burst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 600},

            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_spiral_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_ring_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            {name = "proj_indep_firework_v2", effect = "scr_xmas_firework_burst_fizzle", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_repeat_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},

            {name = "proj_xmas_firework", effect = "scr_firework_xmas_ring_burst_rgw", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            {name = "proj_xmas_firework", effect = "scr_firework_xmas_burst_rgw", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            {name = "proj_xmas_firework", effect = "scr_firework_xmas_repeat_burst_rgw", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            {name = "proj_xmas_firework", effect = "scr_firework_xmas_spiral_burst_rgw", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},

            {name = "scr_indep_fireworks", effect = "scr_indep_firework_starburst", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_shotburst", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_trailburst", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_trailburst_spawn", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_burst_spawn", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_fountain", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
        },
    }
}
