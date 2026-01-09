return {
    _order = 2, 
    FullCompletionRewards = {
        {
            type = "Unit", 
            name = "GorillaMan", 
            extraData = {
                Shiny = true, 
                Wumbo = true
            }, 
            amount = 1
        }
    }; 
    {
        Name = "Chest1", 
        DisplayName = "Snoozefest I", 
        Description = "Earn 125 Treasure Chests in AFK", 
        Type = "AFKChestEarned", 
        RequiredValue = 125, 
        Rewards = {
            {
                type = "Inventory", 
                name = "EpicTreasureChest", 
                amount = 100
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "Chest2", 
        DisplayName = "Snoozefest II", 
        Description = "Earn 250 Treasure Chests in AFK", 
        Type = "AFKChestEarned", 
        RequiredValue = 250, 
        Rewards = {
            {
                type = "Inventory", 
                name = "LegendaryTreasureChest", 
                amount = 100
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "Chest3", 
        DisplayName = "Snoozefest III", 
        Description = "Earn 500 Treasure Chests in AFK", 
        Type = "AFKChestEarned", 
        RequiredValue = 500, 
        Rewards = {
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 100
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "Chest4", 
        DisplayName = "Snoozefest IV", 
        Description = "Earn 750 Treasure Chests in AFK", 
        Type = "AFKChestEarned", 
        RequiredValue = 750, 
        Rewards = {
            {
                type = "Inventory", 
                name = "SecretTreasureChest", 
                amount = 5
            }
        }, 
        AFKAllowed = true
    }, 
    {
        Name = "Chest5", 
        DisplayName = "Snoozefest V", 
        Description = "Earn 1,000 Treasure Chests in AFK", 
        Type = "AFKChestEarned", 
        RequiredValue = 1000, 
        Rewards = {
            {
                type = "Inventory", 
                name = "ExoticTreasureChest", 
                amount = 2
            }
        }, 
        AFKAllowed = true
    }
};