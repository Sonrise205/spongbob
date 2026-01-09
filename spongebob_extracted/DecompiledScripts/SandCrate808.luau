return {
    VariantsPool = {
        Normal = {
            weight = 98
        }, 
        Shiny = {
            weight = 1
        }, 
        Wumbo = {
            weight = 0.67
        }, 
        ShinyWumbo = {
            weight = 0.33
        }
    }, 
    RaritiesPool = {
        Legendary = {
            weight = 45.2
        }, 
        Mythic = {
            weight = 33
        }, 
        Secret = {
            weight = 20
        }, 
        Exotic = {
            weight = 1.8
        }
    }, 
    LootPool = {
        Legendary = {
            {
                type = "Inventory", 
                name = "SANDwich", 
                amount = 1, 
                weight = 45.2
            }
        }, 
        Mythic = {
            {
                type = "Inventory", 
                name = "SandJet", 
                amount = 1, 
                weight = 33
            }
        }, 
        Secret = {
            {
                type = "Inventory", 
                name = "SandMechHelmet", 
                amount = 1, 
                weight = 20
            }
        }, 
        Exotic = {
            {
                type = "Unit", 
                name = "PatrickSandRobot", 
                extraData = {}, 
                amount = 1, 
                weight = 1
            }, 
            {
                type = "Unit", 
                name = "PatrickSandRobot", 
                extraData = {
                    Shiny = true
                }, 
                amount = 1, 
                weight = 0.5
            }, 
            {
                type = "Unit", 
                name = "PatrickSandRobot", 
                extraData = {
                    Wumbo = true
                }, 
                amount = 1, 
                weight = 0.25
            }, 
            {
                type = "Unit", 
                name = "PatrickSandRobot", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                amount = 1, 
                weight = 0.05
            }
        }
    }
};