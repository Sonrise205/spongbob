return {
    _resetType = "Weekly"; 
    {
        Name = "PartyStory1", 
        DisplayName = "Party Story I", 
        Description = "Complete 50 Chapters in a Party (Story Mode)", 
        Type = "PartyChapterCompleted", 
        RequiredValue = 50, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 2000
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 5000
            }
        }
    }, 
    {
        Name = "PartyStory2", 
        DisplayName = "Party Story II", 
        Description = "Complete 100 Chapters in a Party (Story Mode)", 
        Type = "PartyChapterCompleted", 
        RequiredValue = 100, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 5000
            }, 
            {
                type = "Currency", 
                name = "Gems", 
                amount = 2500
            }
        }
    }, 
    {
        Name = "PartyChallenge1", 
        DisplayName = "Party Challenge I", 
        Description = "Complete 15 Challenges in a Party", 
        Type = "PartyChallengeCompleted", 
        RequiredValue = 15, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 1500
            }, 
            {
                type = "Inventory", 
                name = "LegendaryTreasureChest", 
                amount = 1
            }
        }
    }, 
    {
        Name = "PartyChallenge2", 
        DisplayName = "Party Challenge II", 
        Description = "Complete 30 Challenges in a Party", 
        Type = "PartyChallengeCompleted", 
        RequiredValue = 30, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 4000
            }, 
            {
                type = "Inventory", 
                name = "LegendaryTreasureChest", 
                amount = 3
            }
        }
    }, 
    {
        Name = "PartyRaid1", 
        DisplayName = "Party Raid I", 
        Description = "Complete 10 Raids in a Party", 
        Type = "PartyRaidCompleted", 
        RequiredValue = 10, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 3000
            }, 
            {
                type = "Currency", 
                name = "GoldenSpatula", 
                amount = 500
            }
        }
    }, 
    {
        Name = "PartyRaid2", 
        DisplayName = "Party Raid II", 
        Description = "Complete 20 Raids in a Party", 
        Type = "PartyRaidCompleted", 
        RequiredValue = 20, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 7500
            }, 
            {
                type = "Currency", 
                name = "GoldenSpatula", 
                amount = 1000
            }
        }
    }, 
    {
        Name = "CompleteAll", 
        DisplayName = "Party Completionist", 
        Description = ("Complete All %* Quests"):format(script.Name), 
        Type = "CompletedParty", 
        RequiredValue = 6, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 30000
            }, 
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 10
            }, 
            {
                type = "Inventory", 
                name = "ChallengeGift", 
                amount = 5
            }
        }
    }
};