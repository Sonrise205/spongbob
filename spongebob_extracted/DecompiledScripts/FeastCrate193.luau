return {
    RaritiesPool = {
        Legendary = {
            weight = 50
        }, 
        Mythic = {
            weight = 35
        }, 
        Secret = {
            weight = 12
        }, 
        Limited = {
            weight = 2.85
        }, 
        Exotic = {
            weight = 0.15
        }
    }, 
    LootPool = {
        Legendary = {
            {
                type = "Inventory", 
                name = "PattyFeast", 
                amount = 1, 
                weight = 50
            }
        }, 
        Mythic = {
            {
                type = "Inventory", 
                name = "CecilDinner", 
                amount = 1, 
                weight = 35
            }
        }, 
        Secret = {
            {
                type = "Inventory", 
                name = "FamilyBoatmobile", 
                amount = 1, 
                weight = 12
            }
        }, 
        Limited = {
            {
                type = "Unit", 
                name = "PioneerPatrick", 
                extraData = {}, 
                amount = 1, 
                weight = 2.6
            }, 
            {
                type = "Unit", 
                name = "PioneerPatrick", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                amount = 1, 
                weight = 0.25
            }
        }, 
        Exotic = {
            {
                type = "Pet", 
                name = "Cecil", 
                extraData = {}, 
                amount = 1, 
                weight = 0.1
            }, 
            {
                type = "Pet", 
                name = "Cecil", 
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