local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = require(l_ReplicatedStorage_0.Shared.Data.Purchases);
return {
    {
        reward = {
            type = "Inventory", 
            name = "SecretTreasureChest", 
            amount = 1
        }, 
        purchaseName = "SecretChestOffer1"
    }, 
    {
        reward = {
            type = "Inventory", 
            name = "SecretTreasureChest", 
            amount = 3
        }, 
        purchaseName = "SecretChestOffer2"
    }, 
    {
        reward = {
            type = "Inventory", 
            name = "SecretTreasureChest", 
            amount = 5
        }, 
        purchaseName = "SecretChestOffer3"
    }, 
    {
        reward = {
            type = "Inventory", 
            name = "SecretTreasureChest", 
            amount = 10
        }, 
        purchaseName = "SecretChestOffer4"
    }, 
    {
        reward = {
            type = "Inventory", 
            name = "SecretTreasureChest", 
            amount = 25
        }, 
        purchaseName = "SecretChestOffer5"
    }
};