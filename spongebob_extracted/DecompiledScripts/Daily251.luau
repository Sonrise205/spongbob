return {
    _resetType = "Daily"; 
    {
        Name = "Waves1", 
        DisplayName = "Daily Waves I", 
        Description = "Clear 30 Waves (Story Mode)", 
        Type = "ClearWaves", 
        RequiredValue = 30, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 150
            }, 
            {
                type = "Experience", 
                amount = 150
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 250
            }
        }
    }, 
    {
        Name = "Waves2", 
        DisplayName = "Daily Waves II", 
        Description = "Clear 60 Waves (Story Mode)", 
        Type = "ClearWaves", 
        RequiredValue = 60, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 200
            }, 
            {
                type = "Experience", 
                amount = 200
            }, 
            {
                type = "Currency", 
                name = "Gems", 
                amount = 100
            }
        }
    }, 
    {
        Name = "Waves3", 
        DisplayName = "Daily Waves III", 
        Description = "Clear 120 Waves (Story Mode)", 
        Type = "ClearWaves", 
        RequiredValue = 120, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 250
            }, 
            {
                type = "Experience", 
                amount = 250
            }, 
            {
                type = "Inventory", 
                name = "COINS_60", 
                amount = 1
            }
        }
    }, 
    {
        Name = "Challenge1", 
        DisplayName = "Daily Challenge I", 
        Description = "Clear 1 Challenge (Any Challenge)", 
        Type = "ClearChallenge", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 100
            }, 
            {
                type = "Experience", 
                amount = 100
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 500
            }
        }
    }, 
    {
        Name = "Summoning1", 
        DisplayName = "Daily Summoning I", 
        Description = "Summon 10 Units", 
        Type = "SummonUnits", 
        RequiredValue = 10, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 50
            }, 
            {
                type = "Experience", 
                amount = 50
            }, 
            {
                type = "Inventory", 
                name = "Fruit Cake", 
                amount = 3
            }
        }
    }, 
    {
        Name = "Summoning2", 
        DisplayName = "Daily Summoning II", 
        Description = "Summon 25 Units", 
        Type = "SummonUnits", 
        RequiredValue = 25, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 100
            }, 
            {
                type = "Experience", 
                amount = 100
            }, 
            {
                type = "Inventory", 
                name = "Fruit Cake", 
                amount = 5
            }
        }
    }, 
    {
        Name = "Kills1", 
        DisplayName = "Daily Takedowns I", 
        Description = "Takedown 500 Enemies (Any Mode)", 
        Type = "KillUnits", 
        RequiredValue = 500, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 100
            }, 
            {
                type = "Experience", 
                amount = 100
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 250
            }
        }
    }, 
    {
        Name = "Kills2", 
        DisplayName = "Daily Takedowns II", 
        Description = "Takedowns 2500 Enemies (Any Mode)", 
        Type = "KillUnits", 
        RequiredValue = 2500, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 250
            }, 
            {
                type = "Experience", 
                amount = 250
            }, 
            {
                type = "Currency", 
                name = "Gems", 
                amount = 100
            }
        }
    }, 
    {
        Name = "Kills3", 
        DisplayName = "Daily Takedowns III", 
        Description = "Takedown 5000 Enemies (Any Mode)", 
        Type = "KillUnits", 
        RequiredValue = 5000, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 500
            }, 
            {
                type = "Experience", 
                amount = 500
            }, 
            {
                type = "Inventory", 
                name = "GEMS_60", 
                amount = 1
            }
        }
    }, 
    {
        Name = "Playtime1", 
        DisplayName = "Daily Playtime I", 
        Description = "Play for 30 Minutes", 
        Type = "Playtime", 
        RequiredValue = 1800, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 150
            }, 
            {
                type = "Experience", 
                amount = 150
            }, 
            {
                type = "Inventory", 
                name = "TreasureChest", 
                amount = 2
            }
        }
    }, 
    {
        Name = "Playtime2", 
        DisplayName = "Daily Playtime II", 
        Description = "Play for 60 Minutes", 
        Type = "Playtime", 
        RequiredValue = 3600, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 250
            }, 
            {
                type = "Experience", 
                amount = 250
            }, 
            {
                type = "Inventory", 
                name = "TreasureChest", 
                amount = 3
            }
        }
    }, 
    {
        Name = "Raid1", 
        DisplayName = "Daily Raids I", 
        Description = "Complete 1 Raid (Any Raid)", 
        Type = "RaidCompleted", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 150
            }, 
            {
                type = "Experience", 
                amount = 150
            }, 
            {
                type = "Currency", 
                name = "GoldenSpatula", 
                amount = 25
            }, 
            {
                type = "Inventory", 
                name = "EpicTreasureChest", 
                amount = 1
            }
        }
    }, 
    {
        Name = "CompleteAll", 
        DisplayName = "100% Complete", 
        Description = "Complete All Daily Quests", 
        Type = "CompletedDaily", 
        RequiredValue = 12, 
        Rewards = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 5000
            }, 
            {
                type = "Experience", 
                amount = 1500
            }, 
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 25
            }
        }
    }
};