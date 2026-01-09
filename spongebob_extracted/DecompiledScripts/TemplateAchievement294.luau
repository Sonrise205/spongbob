return {
    _order = 1, 
    FullCompletionRewards = {
        {
            type = "Inventory", 
            name = "MythicTreasureChest", 
            amount = 5
        }
    }; 
    {
        Name = "NormalMaster", 
        DisplayName = "100% Normal Difficulty", 
        Description = "Clear All Chapters of {worldName} on Normal Difficulty", 
        _uniqueChaptersRequired = true, 
        Type = "ChapterCompleted_Normal", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 500
            }
        }
    }, 
    {
        Name = "HardMaster", 
        DisplayName = "100% Hard Difficulty", 
        Description = "Clear All Chapters of {worldName} on Hard Difficulty", 
        _uniqueChaptersRequired = true, 
        Type = "ChapterCompleted_Hard", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Inventory", 
                name = "EpicTreasureChest", 
                amount = 5
            }
        }
    }, 
    {
        Name = "NightmareMaster", 
        DisplayName = "100% Nightmare Difficulty", 
        Description = "Clear All Chapters of {worldName} on Nightmare Difficulty", 
        _migrateOldData = {
            Nightmare1 = {
                key = "{worldName}-1", 
                targetValue = true
            }, 
            Nightmare2 = {
                key = "{worldName}-2", 
                targetValue = true
            }, 
            Nightmare3 = {
                key = "{worldName}-3", 
                targetValue = true
            }, 
            Nightmare4 = {
                key = "{worldName}-4", 
                targetValue = true
            }, 
            Nightmare5 = {
                key = "{worldName}-5", 
                targetValue = true
            }, 
            Nightmare6 = {
                key = "{worldName}-6", 
                targetValue = true
            }, 
            Nightmare7 = {
                key = "{worldName}-7", 
                targetValue = true
            }, 
            Nightmare8 = {
                key = "{worldName}-8", 
                targetValue = true
            }, 
            Nightmare9 = {
                key = "{worldName}-9", 
                targetValue = true
            }, 
            Nightmare10 = {
                key = "{worldName}-10", 
                targetValue = true
            }
        }, 
        _uniqueChaptersRequired = true, 
        Type = "ChapterCompleted_Nightmare", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "TraitRolls", 
                amount = 25
            }
        }
    }, 
    {
        Name = "Nightmare10Rare", 
        DisplayName = "Nightmare 10 Rare Units", 
        Description = "Complete Nightmare 10 with Rare Units Only", 
        Type = "NightmareWinChapter_10_RareUnits", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "GoldenTraitRolls", 
                amount = 1
            }
        }
    }
};