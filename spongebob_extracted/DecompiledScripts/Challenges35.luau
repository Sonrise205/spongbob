return {
    _resetType = "Weekly"; 
    {
        Name = "Challenge1", 
        DisplayName = "Hardly a Challenge", 
        Description = "Complete a Challenge on Hard", 
        Type = "ChallengeCompleted_Hard", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 250
            }, 
            {
                type = "Inventory", 
                name = "TreasureChest", 
                amount = 5
            }
        }
    }, 
    {
        Name = "Challenge2", 
        DisplayName = "Dreaming of the End", 
        Description = "Complete a Challenge on Nightmare", 
        Type = "ChallengeCompleted_Nightmare", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 500
            }, 
            {
                type = "Inventory", 
                name = "EpicTreasureChest", 
                amount = 5
            }
        }
    }, 
    {
        Name = "Challenge3", 
        DisplayName = "Dead Men Tell No Tales", 
        Description = "Complete a Challenge on Davy Jones", 
        Type = "ChallengeCompleted_Davy Jones", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 1000
            }, 
            {
                type = "Inventory", 
                name = "CHALLENGETOKEN_60", 
                amount = 1
            }
        }
    }, 
    {
        Name = "Challenge4", 
        DisplayName = "Rarely Successful", 
        Description = "Complete a Challenge on Nightmare with Rare or Worse Units", 
        Type = "ChallengeCompleted_Nightmare_Rare_Units", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 500
            }, 
            {
                type = "Currency", 
                name = "GoldenTraitRolls", 
                amount = 3
            }
        }
    }, 
    {
        Name = "Challenge6", 
        DisplayName = "Fort Knox", 
        Description = "Complete a Challenge on Davy Jones with the Hardcore Modifier", 
        Type = "ChallengeCompleted_Davy Jones_Hardcore", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 2500
            }, 
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 5
            }
        }
    }, 
    {
        Name = "CompleteAll", 
        DisplayName = "Challenge Conqueror", 
        Description = ("Complete All %* Quests"):format(script.Name), 
        Type = "CompletedChallenges", 
        RequiredValue = 5, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 10000
            }, 
            {
                type = "Inventory", 
                name = "CHALLENGETOKEN_60", 
                amount = 5
            }, 
            {
                type = "Currency", 
                name = "ChallengeToken", 
                amount = 1000
            }, 
            {
                type = "Inventory", 
                name = "ChallengeGift", 
                amount = 5
            }
        }
    }
};