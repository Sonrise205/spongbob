return {
    Disabled = true, 
    _resetType = "Weekly"; 
    {
        _uniqueChaptersRequired = true, 
        Name = "Nightmare1", 
        DisplayName = "Nightmare Conqueror", 
        Description = "Complete 25 Different Nightmare Story Mode Chapters", 
        Type = "NightmareStoryChapterCompleted", 
        RequiredValue = 25, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 2500
            }, 
            {
                type = "Experience", 
                amount = 2500
            }, 
            {
                type = "Currency", 
                name = "GoldenTraitRolls", 
                amount = 2
            }
        }
    }, 
    {
        Name = "Raid1", 
        DisplayName = "Raid Underdog", 
        Description = "Complete a Raid on Nightmare with No Units Better Than Rare Equipped", 
        Type = "RaidCompleted_Nightmare_Rare_Units", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 1500
            }, 
            {
                type = "Experience", 
                amount = 1500
            }, 
            {
                type = "Currency", 
                name = "MagicConch", 
                amount = 5
            }
        }
    }, 
    {
        Name = "Challenge1", 
        DisplayName = "Challenge Champion", 
        Description = "Complete a Challenge on Hard with No Units Better Than Uncommon Equipped", 
        Type = "ChallengeCompleted_Hard_Uncommon_Units", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 1000
            }, 
            {
                type = "Experience", 
                amount = 1000
            }, 
            {
                type = "Currency", 
                name = "TraitRolls", 
                amount = 10
            }
        }
    }, 
    {
        Name = "CompleteAll", 
        DisplayName = "Elite Completionist", 
        Description = ("Complete All %* Quests"):format(script.Name), 
        Type = "CompletedElite", 
        RequiredValue = 3, 
        Rewards = {
            {
                type = "Inventory", 
                name = "LegendaryTreasureChest", 
                amount = 5
            }
        }
    }
};