local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
return {
    {
        type = "Inventory", 
        name = "NeptuneTrident", 
        amount = 1, 
        cost = {
            purchaseType = "DevProducts", 
            purchaseName = "NeptuneTrident"
        }, 
        inactiveAfter = v1:GetForCTUnix({
            Year = 2025, 
            Month = 5, 
            Day = 19, 
            Hour = 23, 
            Minute = 59, 
            Second = 59
        })
    }, 
    {
        type = "Inventory", 
        name = "PattyWagon", 
        amount = 1, 
        cost = {
            purchaseType = "DevProducts", 
            purchaseName = "PattyWagon"
        }
    }, 
    {
        type = "Inventory", 
        name = "Boatmobile", 
        amount = 1, 
        cost = {
            currency = "DriverLicense", 
            amount = 150
        }
    }, 
    {
        type = "Inventory", 
        name = "BassBlaster3000", 
        amount = 1, 
        cost = {
            currency = "DriverLicense", 
            amount = 500
        }
    }, 
    {
        type = "Inventory", 
        name = "Chariot", 
        amount = 1, 
        cost = {
            currency = "DriverLicense", 
            amount = 1500
        }
    }, 
    {
        type = "Inventory", 
        name = "RoadReaper", 
        amount = 1, 
        cost = {
            currency = "ChallengeToken", 
            amount = 2500
        }
    }, 
    {
        type = "Inventory", 
        name = "WarSeahorse", 
        amount = 1, 
        cost = {
            currency = "GoldenSpatula", 
            amount = 2500
        }
    }
};