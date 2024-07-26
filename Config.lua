Config = {}

-- Hvilket framework du bruger
Config.Framework = 'qb-core' -- 'qb-core' eller 'esx'

-- Hvilke ting der skal være i boksen
Config.LootItems = {
    { name = 'water', amount = 1 },
    { name = 'bread', amount = 1 }
}

-- Burde give sig selv, hvor lang til der skal gå imellem hvert drop.
Config.LootDropInterval = { min = 3600000, max = 7200000 } -- 1 til 2 timer

-- Hvor stor radius man skal kunne røre ved boksen fra. (bare lad vær med at pille ved det hvis du ik ved hvad du laver)
Config.LootDropRadius = 3.0 -- Hvor langt væk skal du kunne bruge øjet fra

-- Hvor ca. lootet skal kunne spawne henne og hvor højt oppe (pt er det over alt det kan spawne, self højt oppe.)
Config.RandomCoordsRange = { x = { -2000, 2000 }, y = { -2000, 2000 }, z = { 100, 150 } } -- Z værdien skal generalt være høj for at få faldskærms effekten.

-- Hvilken model vi bruger for loot boksen.
Config.ParachuteModel = 'prop_box_ammo04a' --Model

-- Hvor lang tid det tager for lootet at despawn (så der ikke ligger lort over alt)
Config.LootDespawnTime = 240000 -- Tid (i millisekunder) Efter første spiller har rørt boksen "øjet" (4 minutter)

-- Hvor lang tid der skal gå imellem bip lyden der kommer fra boksen
Config.BeepInterval = 2000 -- Tid i millisekunder
