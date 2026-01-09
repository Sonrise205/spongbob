return {
    _order = 1, 
    _displayName = "Raids Rumble", 
    FullCompletionRewards = {
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
    }; 
    {
        Name = "HardRaid", 
        DisplayName = "Hard I", 
        Description = "Complete a Hard Raid", 
        Type = "RaidCompleted_Hard", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "Coins", 
                amount = 500
            }
        }
    }, 
    {
        Name = "NightmareRaid", 
        DisplayName = "Nightmare I", 
        Description = "Complete a Nightmare Raid", 
        Type = "RaidCompleted_Nightmare", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 250
            }
        }
    }, 
    {
        Name = "HardRaidRare", 
        DisplayName = "Hard II", 
        Description = "Complete a Hard Raid with Rare Units Only", 
        Type = "RaidCompleted_Hard_Rare_Units", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "TraitRolls", 
                amount = 10
            }
        }
    }, 
    {
        Name = "NightmareRaidRare", 
        DisplayName = "Nightmare II", 
        Description = "Complete a Nightmare Raid with Rare Units Only", 
        Type = "RaidCompleted_Nightmare_Rare_Units", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "MagicConch", 
                amount = 10
            }
        }
    }, 
    {
        Name = "HardRaid100", 
        DisplayName = "Hard III", 
        Description = "Complete 100 Hard Raids", 
        Type = "RaidCompleted_Hard", 
        RequiredValue = 100, 
        Rewards = {
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 25
            }
        }
    }, 
    {
        Name = "NightmareRaid100", 
        DisplayName = "Nightmare III", 
        Description = "Complete 100 Nightmare Raids", 
        Type = "RaidCompleted_Nightmare", 
        RequiredValue = 100, 
        Rewards = {
            {
                type = "Currency", 
                name = "GoldenTraitRolls", 
                amount = 15
            }
        }
    }
};