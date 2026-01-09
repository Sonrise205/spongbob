local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local _ = {
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
        displayName = "{amount} Jelly Patties", 
        type = "Inventory", 
        name = "JellyPatty", 
        amount = 10, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 75
        }
    }, 
    {
        displayName = "{amount} Trait Rerolls", 
        type = "Currency", 
        name = "TraitRolls", 
        amount = 3, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 150
        }
    }, 
    {
        displayName = "{amount} Golden Trait Reroll", 
        type = "Currency", 
        name = "GoldenTraitRolls", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 250
        }
    }, 
    {
        displayName = "{amount} Magic Conches", 
        type = "Currency", 
        name = "MagicConch", 
        amount = 2, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 500
        }
    }, 
    {
        displayName = "{amount} Magic Conches", 
        type = "Currency", 
        name = "MagicConch", 
        amount = 5, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 1000
        }
    }, 
    {
        displayName = "{amount} Mythic Chest", 
        type = "Inventory", 
        name = "MythicTreasureChest", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 2500
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
        displayName = "{amount} Mythic Chests", 
        type = "Inventory", 
        name = "MythicTreasureChest", 
        amount = 3, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 5000
        }
    }, 
    {
        displayName = "{name}", 
        type = "Unit", 
        name = "BarnacleMan", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 10000
        }
    }, 
    {
        displayName = "{name}", 
        type = "Unit", 
        name = "BarnacleMan", 
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
        name = "TheRodent", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 35000
        }
    }, 
    {
        displayName = "{name}", 
        type = "Unit", 
        name = "TheRodent", 
        amount = 1, 
        extraData = {
            Shiny = true, 
            Wumbo = true
        }, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 50000
        }
    }
};