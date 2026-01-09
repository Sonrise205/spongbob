local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
return {
    VariantsPool = {
        Normal = {
            weight = 40
        }, 
        Shiny = {
            weight = 35
        }, 
        Wumbo = {
            weight = 20
        }, 
        ShinyWumbo = {
            weight = 5
        }
    }, 
    LootPool = {
        {
            type = "Inventory", 
            name = "CruiseCrate", 
            extraData = {}, 
            amount = 1, 
            weight = 5.0E-5, 
            expireOn = v1.CHRISTMAS_START - 1
        }, 
        {
            type = "Inventory", 
            name = "SnowCrate", 
            extraData = {}, 
            amount = 1, 
            weight = 5.0E-5, 
            startOn = v1.CHRISTMAS_START, 
            expireOn = v1.CHRISTMAS_DEAL_ENDS
        }, 
        {
            type = "Pet", 
            name = "LeSpatula", 
            extraData = {}, 
            amount = 1, 
            weight = 6.666666666666667E-5, 
            expireOn = v1.CHRISTMAS_DEAL_ENDS
        }, 
        {
            type = "Unit", 
            name = "Maximus", 
            extraData = {}, 
            amount = 1, 
            weight = 2.0E-5
        }, 
        {
            type = "Inventory", 
            name = "PlanktonsTank", 
            amount = 1, 
            weight = 2.0E-4
        }, 
        {
            type = "Inventory", 
            name = "GIFT_5xGameSpeed", 
            amount = 1, 
            weight = 4.0E-4
        }, 
        {
            type = "Inventory", 
            name = "SecretTreasureChest", 
            amount = 1, 
            weight = 0.002
        }, 
        {
            type = "Inventory", 
            name = "GIFT_GameSpeed", 
            amount = 1, 
            weight = 0.0025
        }, 
        {
            type = "Inventory", 
            name = "MythicTreasureChest", 
            amount = 5, 
            weight = 0.0025
        }, 
        {
            type = "Currency", 
            name = "GoldenTraitRolls", 
            amount = 10, 
            weight = 0.0025
        }, 
        {
            type = "Inventory", 
            name = "LegendaryTreasureChest", 
            amount = 10, 
            weight = 0.005
        }, 
        {
            type = "Currency", 
            name = "MagicConch", 
            amount = 25, 
            weight = 0.01
        }, 
        {
            type = "Currency", 
            name = "TraitRolls", 
            amount = 15, 
            weight = 0.014925373134328358
        }, 
        {
            type = "Currency", 
            name = "Gems", 
            amount = 2500, 
            weight = 0.014925373134328358
        }, 
        {
            type = "Currency", 
            name = "GoldenSpatula", 
            amount = 1000, 
            weight = 0.014925373134328358
        }, 
        {
            type = "Currency", 
            name = "ChallengeToken", 
            amount = 500, 
            weight = 0.014925373134328358
        }, 
        {
            type = "Inventory", 
            name = "Pretty Patties", 
            amount = 25, 
            weight = 0.04
        }, 
        {
            type = "Inventory", 
            name = "JellyPatty", 
            amount = 50, 
            weight = 0.04
        }, 
        {
            type = "Inventory", 
            name = "Aged Patty", 
            amount = 75, 
            weight = 0.04
        }, 
        {
            type = "Inventory", 
            name = "Fruit Cake", 
            amount = 100, 
            weight = 0.04
        }, 
        {
            type = "Inventory", 
            name = "EpicTreasureChest", 
            amount = 10, 
            weight = 0.05
        }, 
        {
            type = "Inventory", 
            name = "ChallengeGift", 
            amount = 1, 
            weight = 0.05
        }, 
        {
            type = "Currency", 
            name = "TraitRolls", 
            amount = 5, 
            weight = 0.058823529411764705
        }, 
        {
            type = "Inventory", 
            name = "TreasureChest", 
            amount = 5, 
            weight = 0.058823529411764705
        }, 
        {
            type = "Currency", 
            name = "Coins", 
            amount = 1000, 
            weight = 0.058823529411764705
        }, 
        {
            type = "Currency", 
            name = "Gems", 
            amount = 500, 
            weight = 0.058823529411764705
        }, 
        {
            type = "Inventory", 
            name = "OLIPOPRaceCar", 
            amount = 1, 
            weight = 0.1, 
            isAd = true
        }, 
        {
            type = "RandomBoost", 
            name = "Random Boost", 
            rarity = "Legendary", 
            amount = 1, 
            weight = 0.1
        }, 
        {
            type = "Currency", 
            name = "Gems", 
            amount = 250, 
            weight = 0.14285714285714285
        }, 
        {
            type = "Currency", 
            name = "Coins", 
            amount = 500, 
            weight = 0.14285714285714285
        }
    }
};