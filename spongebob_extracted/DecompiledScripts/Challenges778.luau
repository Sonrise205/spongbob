return {
    _order = 1, 
    FullCompletionRewards = {
        {
            type = "Currency", 
            name = "MagicConch", 
            amount = 25
        }
    }; 
    {
        Name = "HardChallenge", 
        DisplayName = "Hard I", 
        Description = "Complete a Hard Challenge", 
        Type = "ChallengeCompleted_Hard", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "Coins", 
                amount = 250
            }
        }
    }, 
    {
        Name = "NightmareChallenge", 
        DisplayName = "Nightmare I", 
        Description = "Complete a Nightmare Challenge", 
        Type = "ChallengeCompleted_Nightmare", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 100
            }
        }
    }, 
    {
        Name = "HardChallengeRare", 
        DisplayName = "Hard II", 
        Description = "Complete a Hard Challenge with Rare Units Only", 
        Type = "ChallengeCompleted_Hard_Rare_Units", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "TraitRolls", 
                amount = 5
            }
        }
    }, 
    {
        Name = "NightmareChallengeRare", 
        DisplayName = "Nightmare II", 
        Description = "Complete a Nightmare Challenge with Rare Units Only", 
        Type = "ChallengeCompleted_Nightmare_Rare_Units", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "MagicConch", 
                amount = 5
            }
        }
    }, 
    {
        Name = "HardChallenge100", 
        DisplayName = "Hard III", 
        Description = "Complete 100 Hard Challenges", 
        Type = "ChallengeCompleted_Hard", 
        RequiredValue = 100, 
        Rewards = {
            {
                type = "Inventory", 
                name = "LegendaryTreasureChest", 
                amount = 25
            }
        }
    }, 
    {
        Name = "NightmareChallenge100", 
        DisplayName = "Nightmare III", 
        Description = "Complete 100 Nightmare Challenges", 
        Type = "ChallengeCompleted_Nightmare", 
        RequiredValue = 100, 
        Rewards = {
            {
                type = "Currency", 
                name = "GoldenTraitRolls", 
                amount = 10
            }
        }
    }
};