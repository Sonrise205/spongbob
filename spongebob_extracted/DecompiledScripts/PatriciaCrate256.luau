return {
    PityEnabled = true, 
    RaritiesPool = {
        Legendary = {
            weight = 45
        }, 
        Mythic = {
            weight = 40
        }, 
        Secret = {
            weight = 10
        }, 
        Exotic = {
            weight = 5
        }
    }, 
    LootPool = {
        Legendary = {
            {
                type = "Inventory", 
                name = "LegendaryTreasureChest", 
                amount = 25, 
                weight = 45
            }
        }, 
        Mythic = {
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 15, 
                weight = 40
            }
        }, 
        Secret = {
            {
                type = "Inventory", 
                name = "SecretTreasureChest", 
                amount = 2, 
                weight = 10
            }
        }, 
        Exotic = {
            {
                type = "Unit", 
                name = "Patricia", 
                extraData = {}, 
                amount = 1, 
                weight = 2.5, 
                pityAmount = 26
            }, 
            {
                type = "Unit", 
                name = "Patricia", 
                extraData = {
                    Shiny = true
                }, 
                weight = 1.5, 
                amount = 1
            }, 
            {
                type = "Unit", 
                name = "Patricia", 
                extraData = {
                    Wumbo = true
                }, 
                weight = 0.75, 
                amount = 1
            }, 
            {
                type = "Unit", 
                name = "Patricia", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true, 
                    Stars = 5, 
                    Trait = {
                        Name = "Strike", 
                        Tier = 1
                    }, 
                    Trait2 = {
                        Name = "Reach", 
                        Tier = 1
                    }
                }, 
                weight = 0.25, 
                amount = 1, 
                pityAmount = 125, 
                resetPity = true
            }
        }
    }
};