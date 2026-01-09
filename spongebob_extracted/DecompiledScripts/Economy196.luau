return {
    BuriedTreasure = {
        displayName = "Buried Treasure", 
        aura = 3, 
        image = "rbxassetid://120036295863060", 
        buffs = {
            {
                type = "Aura", 
                amount = 5
            }
        }, 
        nerfs = {
            {
                type = "TowerStat", 
                name = "Damage", 
                amount = -20
            }
        }
    }, 
    GoldenSpatula = {
        displayName = "Golden Spatula", 
        aura = 3, 
        image = "rbxassetid://120560589705076", 
        buffs = {
            {
                type = "Takedown", 
                name = "Gold", 
                amount = 50
            }
        }, 
        nerfs = {
            {
                type = "EnemyStat", 
                name = "Health", 
                amount = 25
            }
        }
    }, 
    KrabbyHourDeal = {
        displayName = "Krabby Hour Deal", 
        aura = 3, 
        image = "rbxassetid://108852640434890", 
        buffs = {
            {
                type = "UpgradeCost", 
                amount = -20
            }
        }, 
        nerfs = {
            {
                type = "GoldIncome", 
                amount = -15
            }
        }
    }, 
    TipJarTime = {
        displayName = "Tip Jar Time", 
        aura = 3, 
        image = "rbxassetid://89252124888498", 
        buffs = {
            {
                type = "WaveGold", 
                amount = 25
            }
        }, 
        nerfs = {
            {
                type = "TowerStat", 
                name = "Damage", 
                amount = -10
            }
        }
    }, 
    TreasureMap = {
        displayName = "Treasure Map", 
        aura = 5, 
        image = "rbxassetid://116350213961992", 
        buffs = {
            {
                type = "Reward", 
                rewardInterval = 15, 
                reward = {
                    type = "Inventory", 
                    name = "LegendaryTreasureChest", 
                    amount = 1
                }
            }
        }, 
        nerfs = {
            {
                type = "EnemyStat", 
                name = "Speed", 
                amount = 25
            }
        }
    }
};