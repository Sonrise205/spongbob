local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
return {
    [1] = {
        {
            item = {
                type = "Inventory", 
                name = "Aged Patty", 
                amount = 1
            }, 
            cost = 500, 
            stock = 100
        }, 
        {
            item = {
                type = "Currency", 
                name = "TraitRolls", 
                amount = 1
            }, 
            cost = 2500, 
            stock = 25
        }, 
        {
            item = {
                type = "Currency", 
                name = "MagicConch", 
                amount = 1
            }, 
            cost = 5000, 
            stock = 10
        }, 
        {
            item = {
                type = "Inventory", 
                name = "LegendaryTreasureChest", 
                amount = 1
            }, 
            cost = 7500, 
            stock = 10
        }
    }, 
    [2] = {
        {
            item = {
                type = "Inventory", 
                name = "Aged Patty", 
                amount = 1
            }, 
            cost = 500, 
            stock = 100
        }, 
        {
            item = {
                type = "Inventory", 
                name = v1.BOOST_NAMES.ChallengeToken, 
                amount = 1
            }, 
            cost = 2500, 
            stock = 1
        }, 
        {
            item = {
                type = "Currency", 
                name = "GoldenTraitRolls", 
                amount = 1
            }, 
            cost = 5000, 
            stock = 10
        }, 
        {
            item = {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 1
            }, 
            cost = 15000, 
            stock = 5
        }
    }, 
    [3] = {
        {
            item = {
                type = "Inventory", 
                name = "Pretty Patties", 
                amount = 1
            }, 
            cost = 1250, 
            stock = 100
        }, 
        {
            item = {
                type = "Inventory", 
                name = v1.BOOST_NAMES.GoldenSpatula, 
                amount = 1
            }, 
            cost = 2500, 
            stock = 1
        }, 
        {
            item = {
                type = "Inventory", 
                name = "EpicTreasureChest", 
                amount = 1
            }, 
            cost = 5000, 
            stock = 25
        }, 
        {
            item = {
                type = "Currency", 
                name = "ChallengeToken", 
                amount = 1
            }, 
            cost = 7500, 
            stock = 4
        }
    }, 
    SpecialOffers = {
        {
            item = {
                type = "RandomUnit", 
                poolName = "KrabsMerchant", 
                rarity = "Mythic", 
                amount = 1, 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }
            }, 
            cost = 25000, 
            currency = "Gems", 
            stock = 1, 
            weight = 5
        }, 
        {
            item = {
                type = "Inventory", 
                name = "SecretTreasureChest", 
                amount = 1
            }, 
            cost = 25000, 
            currency = "Gems", 
            stock = 1, 
            weight = 2.5
        }, 
        {
            item = {
                type = "Inventory", 
                name = "BoostedSecretChest", 
                amount = 1
            }, 
            cost = 50000, 
            currency = "Gems", 
            stock = 1, 
            weight = 1.25
        }, 
        {
            item = {
                type = "RandomUnit", 
                poolName = "KrabsMerchant", 
                rarity = "Secret", 
                amount = 1
            }, 
            cost = 100000, 
            currency = "Gems", 
            stock = 1, 
            weight = 0.5
        }
    }
};