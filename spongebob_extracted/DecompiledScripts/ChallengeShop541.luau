local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
return {
    {
        dontShow = true, 
        displayName = "{amount} Scoop Capsule", 
        type = "Inventory", 
        name = "ScoopCapsule", 
        crateDisplayName = "Scoop Capsule", 
        amount = 1, 
        cost = {
            currency = "SandDollar", 
            amount = 150
        }, 
        canPurchaseMultiple = true, 
        eventName = "GooLagoon"
    }, 
    {
        displayName = "{amount} Fruit Cakes", 
        type = "Inventory", 
        name = "Fruit Cake", 
        amount = 5, 
        cost = {
            currency = "ChallengeToken", 
            amount = 10
        }
    }, 
    {
        displayName = "{amount} Apples", 
        type = "Inventory", 
        name = "Apple", 
        amount = 15, 
        cost = {
            currency = "ChallengeToken", 
            amount = 25
        }
    }, 
    {
        displayName = "{amount} Krabby Meal", 
        type = "Inventory", 
        name = "Krusty Kids Meal", 
        amount = 35, 
        cost = {
            currency = "ChallengeToken", 
            amount = 50
        }
    }, 
    {
        displayName = "{amount} Golden Trait Reroll", 
        type = "Currency", 
        name = "GoldenTraitRolls", 
        amount = 1, 
        cost = {
            currency = "ChallengeToken", 
            amount = 250
        }
    }, 
    {
        displayName = "{amount} Mythic+ Chest", 
        type = "Inventory", 
        name = "MythicTreasureChest", 
        amount = 1, 
        cost = {
            currency = "ChallengeToken", 
            amount = 300
        }
    }, 
    {
        dontShow = true, 
        canPurchaseMultiple = true, 
        displayName = "{amount} Challenger Crate", 
        type = "Inventory", 
        name = "ChallengeGift", 
        crateDisplayName = "Challenger Crate", 
        amount = 1, 
        cost = {
            currency = "ChallengeToken", 
            amount = 150
        }
    }, 
    {
        dontShow = true, 
        canPurchaseMultiple = true, 
        displayName = "{amount} Challenger Crate 2.0", 
        type = "Inventory", 
        name = "ChallengeCrate2", 
        crateDisplayName = "Challenger Crate 2.0", 
        amount = 1, 
        cost = {
            currency = "ChallengeToken", 
            amount = 500
        }
    }, 
    {
        displayName = "{amount} Road Reaper Mount", 
        type = "Inventory", 
        name = "RoadReaper", 
        amount = 1, 
        cost = {
            currency = "ChallengeToken", 
            amount = 2500
        }
    }, 
    {
        displayName = "{amount} Secret Chest", 
        type = "Inventory", 
        name = "SecretTreasureChest", 
        amount = 1, 
        cost = {
            currency = "ChallengeToken", 
            amount = 5000
        }
    }
};