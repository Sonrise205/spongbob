return {
    PityEnabled = true, 
    RaritiesPool = {
        Limited = {
            weight = 100
        }
    }, 
    LootPool = {
        Limited = {
            {
                type = "Inventory", 
                name = "LegendaryTreasureChest", 
                amount = 25, 
                weight = 45
            }, 
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 15, 
                weight = 40
            }, 
            {
                type = "Inventory", 
                name = "SecretTreasureChest", 
                amount = 2, 
                weight = 10
            }, 
            {
                type = "Unit", 
                name = "KrustyKrushers", 
                amount = 1, 
                weight = 2.5, 
                pityAmount = 26
            }, 
            {
                type = "Unit", 
                name = "KrustyKrushers", 
                amount = 1, 
                weight = 1.5, 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }
            }, 
            {
                type = "Unit", 
                name = "JumboShrimp", 
                amount = 1, 
                weight = 0.75, 
                pityAmount = 125
            }, 
            {
                type = "Unit", 
                name = "JumboShrimp", 
                amount = 1, 
                weight = 0.25, 
                extraData = {
                    Shiny = true, 
                    Wumbo = true, 
                    Stars = 5
                }
            }
        }
    }
};