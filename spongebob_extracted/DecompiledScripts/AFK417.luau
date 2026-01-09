return {
    _order = 1, 
    FullCompletionRewards = {
        {
            type = "Unit", 
            name = "RobotMantis", 
            extraData = {
                Shiny = true, 
                Wumbo = true
            }, 
            amount = 1
        }
    }; 
    {
        Name = "AFK1", 
        DisplayName = "AFK I", 
        Description = "AFK for 24 Hours", 
        Type = "AFKTime", 
        RequiredValue = 86400, 
        Rewards = {
            {
                type = "Inventory", 
                name = "EpicTreasureChest", 
                amount = 10
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "AFK2", 
        DisplayName = "AFK II", 
        Description = "AFK for 48 Hours", 
        Type = "AFKTime", 
        RequiredValue = 172800, 
        Rewards = {
            {
                type = "Inventory", 
                name = "EpicTreasureChest", 
                amount = 25
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "AFK3", 
        DisplayName = "AFK III", 
        Description = "AFK for 72 Hours", 
        Type = "AFKTime", 
        RequiredValue = 259200, 
        Rewards = {
            {
                type = "Inventory", 
                name = "EpicTreasureChest", 
                amount = 35
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "AFK4", 
        DisplayName = "AFK IV", 
        Description = "AFK for 96 Hours", 
        Type = "AFKTime", 
        RequiredValue = 345600, 
        Rewards = {
            {
                type = "Inventory", 
                name = "LegendaryTreasureChest", 
                amount = 10
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "AFK5", 
        DisplayName = "AFK V", 
        Description = "AFK for 120 Hours", 
        Type = "AFKTime", 
        RequiredValue = 432000, 
        Rewards = {
            {
                type = "Inventory", 
                name = "LegendaryTreasureChest", 
                amount = 15
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "AFK6", 
        DisplayName = "AFK VI", 
        Description = "AFK for 144 Hours", 
        Type = "AFKTime", 
        RequiredValue = 518400, 
        Rewards = {
            {
                type = "Inventory", 
                name = "LegendaryTreasureChest", 
                amount = 25
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "AFK7", 
        DisplayName = "AFK VII", 
        Description = "AFK for 200 Hours", 
        Type = "AFKTime", 
        RequiredValue = 720000, 
        Rewards = {
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 10
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "AFK8", 
        DisplayName = "AFK VIII", 
        Description = "AFK for 300 Hours", 
        Type = "AFKTime", 
        RequiredValue = 1080000, 
        Rewards = {
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 15
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "AFK9", 
        DisplayName = "AFK IX", 
        Description = "AFK for 500 Hours", 
        Type = "AFKTime", 
        RequiredValue = 1800000, 
        Rewards = {
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 25
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "AFK10", 
        DisplayName = "AFK X", 
        Description = "AFK for 1,000 Hours", 
        Type = "AFKTime", 
        RequiredValue = 3600000, 
        Rewards = {
            {
                type = "RandomUnit", 
                rarity = "Mythic", 
                poolName = "Standard", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                amount = 1
            }
        }, 
        AFKAllowed = true
    }
};