local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v2 = {
    Name = "CaptainMagma", 
    Rarity = select(2, v1:GetRarity("CaptainMagma"))
};
return {
    {
        displayName = "{amount} Jelly Patties", 
        type = "Inventory", 
        name = "JellyPatty", 
        amount = 3, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 25
        }
    }, 
    {
        displayName = "(x{amount}) x2 Coins Boost", 
        type = "Inventory", 
        name = "COINS_60", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 100
        }
    }, 
    {
        displayName = "(x{amount}) x2 Gems Boost", 
        type = "Inventory", 
        name = "GEMS_60", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 150
        }
    }, 
    {
        displayName = "{amount} Trait Rerolls", 
        type = "Currency", 
        name = "TraitRolls", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 250
        }
    }, 
    {
        displayName = "{amount} Magic Conch", 
        type = "Currency", 
        name = "MagicConch", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 500
        }
    }, 
    {
        displayName = "{amount} Legendary Chests", 
        type = "Inventory", 
        name = "LegendaryTreasureChest", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 1000
        }
    }, 
    {
        displayName = "{amount} Mythic Chests", 
        type = "Inventory", 
        name = "MythicTreasureChest", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 2000
        }
    }, 
    {
        displayName = "War Seahorse", 
        type = "Inventory", 
        name = "WarSeahorse", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 2500
        }
    }, 
    {
        displayName = "{name}", 
        type = "Unit", 
        name = v2.Name, 
        rarity = v2.Rarity, 
        extraData = {}, 
        poolName = "Standard", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 10000
        }
    }, 
    {
        displayName = "{name}", 
        type = "Unit", 
        name = v2.Name, 
        rarity = v2.Rarity, 
        extraData = {
            Shiny = true, 
            Wumbo = true
        }, 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 25000
        }
    }, 
    {
        displayName = "{name}", 
        type = "Unit", 
        name = "KingKrabs", 
        rarity = select(2, v1:GetRarity("KingKrabs")), 
        extraData = {}, 
        poolName = "Standard", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 10000
        }
    }, 
    {
        displayName = "{name}", 
        type = "Unit", 
        name = "KingKrabs", 
        rarity = select(2, v1:GetRarity("KingKrabs")), 
        extraData = {
            Shiny = true, 
            Wumbo = true
        }, 
        poolName = "Standard", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 25000
        }
    }
};