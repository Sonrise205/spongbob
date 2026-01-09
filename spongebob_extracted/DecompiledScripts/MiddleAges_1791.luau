return {
    Name = "MiddleAges", 
    DisplayName = "Middle Age Madness", 
    Description = "", 
    Map = "MiddleAges", 
    UnlockCondition = {
        PlayerLevel = 25, 
        PreviousChapterCompleted = nil
    }, 
    Lighting = "MiddleAges.MiddleAges", 
    PathCutscenes = {
        [2] = "MiddleAgesCutscene_2-3", 
        [3] = "MiddleAgesCutscene_2-3", 
        [4] = "MiddleAgesCutscene_4", 
        [5] = "MiddleAgesCutscene_5-6"
    }, 
    PathUnlocks = {
        [1] = 1, 
        [2] = 5, 
        [3] = 10, 
        [4] = 15, 
        [5] = 20, 
        [6] = 20
    }, 
    Rewards = {
        Hard = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 350
            }, 
            {
                type = "Currency", 
                name = "GoldenSpatula", 
                amount = 75
            }, 
            {
                type = "Inventory", 
                name = "JellyPatty", 
                amount = 3
            }, 
            {
                type = "Experience", 
                amount = 600
            }
        }, 
        Nightmare = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 500
            }, 
            {
                type = "Currency", 
                name = "GoldenSpatula", 
                amount = 150
            }, 
            {
                type = "Inventory", 
                name = "JellyPatty", 
                amount = 5
            }, 
            {
                type = "Experience", 
                amount = 1000
            }
        }, 
        ["Davy Jones"] = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 650
            }, 
            {
                type = "Currency", 
                name = "GoldenSpatula", 
                amount = 200
            }, 
            {
                type = "Inventory", 
                name = "JellyPatty", 
                amount = 8
            }, 
            {
                type = "Experience", 
                amount = 1000
            }
        }
    }, 
    LootRewards = {
        Hard = {
            {
                type = "Unit", 
                name = "Planktonamor", 
                amount = 1, 
                weight = 10, 
                extraData = {}
            }, 
            {
                type = "Unit", 
                name = "Planktonamor", 
                amount = 1, 
                weight = 2.5, 
                extraData = {
                    Shiny = true
                }
            }, 
            {
                type = "Unit", 
                name = "Planktonamor", 
                amount = 1, 
                weight = 1.5, 
                extraData = {
                    Mega = true
                }
            }, 
            {
                type = "Unit", 
                name = "Planktonamor", 
                amount = 1, 
                weight = 1, 
                extraData = {
                    Shiny = true, 
                    Mega = true
                }
            }
        }, 
        Nightmare = {
            {
                type = "Unit", 
                name = "Planktonamor", 
                amount = 1, 
                weight = 10, 
                extraData = {}
            }, 
            {
                type = "Unit", 
                name = "Planktonamor", 
                amount = 1, 
                weight = 2.5, 
                extraData = {
                    Shiny = true
                }
            }, 
            {
                type = "Unit", 
                name = "Planktonamor", 
                amount = 1, 
                weight = 1.5, 
                extraData = {
                    Mega = true
                }
            }, 
            {
                type = "Unit", 
                name = "Planktonamor", 
                amount = 1, 
                weight = 1, 
                extraData = {
                    Shiny = true, 
                    Mega = true
                }
            }
        }, 
        ["Davy Jones"] = {
            {
                type = "Unit", 
                name = "Planktonamor", 
                amount = 1, 
                weight = 10, 
                extraData = {}
            }, 
            {
                type = "Unit", 
                name = "Planktonamor", 
                amount = 1, 
                weight = 2.5, 
                extraData = {
                    Shiny = true
                }
            }, 
            {
                type = "Unit", 
                name = "Planktonamor", 
                amount = 1, 
                weight = 1.5, 
                extraData = {
                    Mega = true
                }
            }, 
            {
                type = "Unit", 
                name = "Planktonamor", 
                amount = 1, 
                weight = 1, 
                extraData = {
                    Shiny = true, 
                    Mega = true
                }
            }
        }
    }, 
    Base = {
        Health = 150, 
        StarterGold = 1250
    }, 
    DifficultyModifiers = {
        {
            PerPlayerEnemyHealthRate = {
                [1] = 1, 
                [2] = 1.9, 
                [3] = 2.8, 
                [4] = 3.7
            }, 
            BaseHealthModifier = 1, 
            StarterCurrencyModifier = 1, 
            IntervalTimeModifier = 1, 
            EnemyDeployRate = 1, 
            EnemyAmountRate = 1, 
            EnemySpeedRate = 1, 
            EnemyHealthRate = 1, 
            ExperiencePointsModifier = 1, 
            CurrencyModifier = 1, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }, 
        {
            PerPlayerEnemyHealthRate = {
                [1] = 1, 
                [2] = 1.7, 
                [3] = 2.55, 
                [4] = 3.4
            }, 
            BaseHealthModifier = 1, 
            StarterCurrencyModifier = 1, 
            IntervalTimeModifier = 1, 
            EnemyDeployRate = 1, 
            EnemyAmountRate = 1, 
            EnemySpeedRate = 1, 
            EnemyHealthRate = 3.4, 
            ExperiencePointsModifier = 1.05, 
            CurrencyModifier = 1.25, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }, 
        {
            PerPlayerEnemyHealthRate = {
                [1] = 1, 
                [2] = 1.8, 
                [3] = 2.75, 
                [4] = 3.6
            }, 
            BaseHealthModifier = 1, 
            StarterCurrencyModifier = 1, 
            IntervalTimeModifier = 1, 
            EnemyDeployRate = 1, 
            EnemyAmountRate = 1, 
            EnemySpeedRate = 1, 
            EnemyHealthRate = 6.8, 
            ExperiencePointsModifier = 1.1, 
            CurrencyModifier = 1.15, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }, 
        {
            PerPlayerEnemyHealthRate = {
                [1] = 1, 
                [2] = 1.8, 
                [3] = 2.75, 
                [4] = 3.6
            }, 
            BaseHealthModifier = 1, 
            StarterCurrencyModifier = 1, 
            IntervalTimeModifier = 1, 
            EnemyDeployRate = 1, 
            EnemyAmountRate = 1, 
            EnemySpeedRate = 1, 
            EnemyHealthRate = 24, 
            ExperiencePointsModifier = 1.15, 
            CurrencyModifier = 1.15, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }
    }, 
    WaveRewards = {
        [1] = {
            Currency = 300, 
            Experience = 5
        }, 
        [2] = {
            Currency = 350, 
            Experience = 5
        }, 
        [3] = {
            Currency = 400, 
            Experience = 5
        }, 
        [4] = {
            Currency = 450, 
            Experience = 5
        }, 
        [5] = {
            Currency = 500, 
            Experience = 5
        }, 
        [6] = {
            Currency = 550, 
            Experience = 10
        }, 
        [7] = {
            Currency = 600, 
            Experience = 10
        }, 
        [8] = {
            Currency = 650, 
            Experience = 10
        }, 
        [9] = {
            Currency = 700, 
            Experience = 10
        }, 
        [10] = {
            Currency = 750, 
            Experience = 10
        }, 
        [11] = {
            Currency = 800, 
            Experience = 15
        }, 
        [12] = {
            Currency = 850, 
            Experience = 15
        }, 
        [13] = {
            Currency = 900, 
            Experience = 15
        }, 
        [14] = {
            Currency = 950, 
            Experience = 15
        }, 
        [15] = {
            Currency = 1000, 
            Experience = 15
        }, 
        [16] = {
            Currency = 1100, 
            Experience = 5
        }, 
        [17] = {
            Currency = 1200, 
            Experience = 10
        }, 
        [18] = {
            Currency = 1300, 
            Experience = 10
        }, 
        [19] = {
            Currency = 1400, 
            Experience = 10
        }, 
        [20] = {
            Currency = 1500, 
            Experience = 10
        }, 
        [21] = {
            Currency = 1600, 
            Experience = 10
        }, 
        [22] = {
            Currency = 1700, 
            Experience = 15
        }, 
        [23] = {
            Currency = 1800, 
            Experience = 15
        }, 
        [24] = {
            Currency = 1900, 
            Experience = 15
        }, 
        [25] = {
            Currency = 2000, 
            Experience = 15
        }
    }, 
    Waves = {
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard Recruit", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.1, 
                    Speed = 1, 
                    Health = 15
                }, 
                {
                    Type = "Interval", 
                    Duration = 14
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard Recruit", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.1, 
                    Speed = 1, 
                    Health = 15
                }, 
                {
                    Type = "Interval", 
                    Duration = 14
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard Recruit", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.2, 
                    Speed = 1, 
                    Health = 15
                }, 
                {
                    Type = "Interval", 
                    Duration = 13
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard Recruit", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.2, 
                    Speed = 1, 
                    Health = 15
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard Recruit", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.2, 
                    Speed = 1, 
                    Health = 18
                }, 
                {
                    Type = "Interval", 
                    Duration = 12
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Squire", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.2, 
                    Speed = 1.1, 
                    Health = 18
                }, 
                {
                    Type = "Interval", 
                    Duration = 12
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Burly Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.3, 
                    Speed = 1, 
                    Health = 18
                }, 
                {
                    Type = "Interval", 
                    Duration = 11
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Burly Seahorse Squire", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.3, 
                    Speed = 1.1, 
                    Health = 18
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1.3, 
                    Speed = 1, 
                    Health = 20
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Large Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.4, 
                    Speed = 1.1, 
                    Health = 20
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Rattlin' Bones", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 20
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.3, 
                    Speed = 1, 
                    Health = 20
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Large Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.4, 
                    Speed = 1.1, 
                    Health = 20
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Rattlin' Bones", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 20
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.3, 
                    Speed = 1, 
                    Health = 20
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 25
                }, 
                {
                    Type = "Interval", 
                    Duration = 9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Big Boned Fish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 25
                }, 
                {
                    Type = "Interval", 
                    Duration = 9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Speedy Bones", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.3, 
                    Speed = 1.3, 
                    Health = 25
                }, 
                {
                    Type = "Interval", 
                    Duration = 9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 25
                }, 
                {
                    Type = "Interval", 
                    Duration = 9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Large Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.4, 
                    Speed = 1.1, 
                    Health = 20
                }, 
                {
                    Type = "Interval", 
                    Duration = 9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Rattlin' Bones", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 20
                }, 
                {
                    Type = "Interval", 
                    Duration = 9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.3, 
                    Speed = 1, 
                    Health = 20
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 27
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 1.1, 
                    Health = 27
                }, 
                {
                    Type = "Interval", 
                    Duration = 12
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DarkKnight", 
                    UnitNameOverride = "Dark Knight Sandy", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 0.8, 
                    Health = 75
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Captain's Steed", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.8, 
                    Speed = 0.9, 
                    Health = 40
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Reinforcement", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 27
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Reinforcement", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 27
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Sturdy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 0.9, 
                    Health = 39
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 35
                }, 
                {
                    Type = "Interval", 
                    Duration = 9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 1.1, 
                    Health = 35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 35
                }, 
                {
                    Type = "Interval", 
                    Duration = 9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Sturdy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 0.9, 
                    Health = 39
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 1.1, 
                    Health = 35
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Sturdy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 0.9, 
                    Health = 39
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 35
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 1.1, 
                    Health = 35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Castle Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 35
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Sturdy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 0.9, 
                    Health = 39
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 1.1, 
                    Health = 35
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.2, 
                    Speed = 1.8, 
                    Health = 36
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1.1, 
                    Health = 40
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1.1, 
                    Health = 40
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.2, 
                    Speed = 1.8, 
                    Health = 36
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Large Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 40
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 40
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1.1, 
                    Health = 40
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.2, 
                    Speed = 1.8, 
                    Health = 36
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.7, 
                    Speed = 0.9, 
                    Health = 50
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1.1, 
                    Health = 45
                }, 
                {
                    Type = "Interval", 
                    Duration = 4.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.3, 
                    Speed = 1.8, 
                    Health = 41
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Burly Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 45
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1.1, 
                    Health = 45
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.7, 
                    Speed = 0.9, 
                    Health = 50
                }, 
                {
                    Type = "Interval", 
                    Duration = 4.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Burly Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 45
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.3, 
                    Speed = 1.8, 
                    Health = 41
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1.1, 
                    Health = 45
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.7, 
                    Speed = 0.9, 
                    Health = 50
                }, 
                {
                    Type = "Interval", 
                    Duration = 4.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Burly Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 45
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.3, 
                    Speed = 1.8, 
                    Health = 41
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Phalanx", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 50
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 50
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Bonefish Phalanx", 
                    UnitCount = 2, 
                    DeployRate = 5.5, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 50
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Horde", 
                    UnitCount = 3, 
                    DeployRate = 4, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 50
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Phalanx", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 50
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 50
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Bonefish Phalanx", 
                    UnitCount = 2, 
                    DeployRate = 5.5, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 50
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Horde", 
                    UnitCount = 3, 
                    DeployRate = 4, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 50
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Phalanx", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 50
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 50
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 52
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.5, 
                    Speed = 1.1, 
                    Health = 52
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 52
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Planktonamor", 
                    UnitNameOverride = "Planktonamor", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 2.2, 
                    Speed = 0.7, 
                    Health = 170
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Bonefish Captain", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.8, 
                    Speed = 0.9, 
                    Health = 70
                }, 
                {
                    Type = "Interval", 
                    Duration = 2.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Captain", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.8, 
                    Speed = 1, 
                    Health = 70
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Support", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 52
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Support", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 52
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Bonefish Support", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 52
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.7, 
                    Speed = 1, 
                    Health = 66
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 60
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.4, 
                    Speed = 1.6, 
                    Health = 54
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.4, 
                    Speed = 1.6, 
                    Health = 54
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.7, 
                    Speed = 1, 
                    Health = 66
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 60
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 60
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 60
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 60
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.8, 
                    Speed = 1, 
                    Health = 72
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 65
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 1.6, 
                    Health = 59
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 65
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.4, 
                    Speed = 1.6, 
                    Health = 59
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.8, 
                    Speed = 1, 
                    Health = 72
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 65
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.5, 
                    Speed = 1.1, 
                    Health = 65
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 6, 
                    PathID = 1, 
                    Scale = 1.8, 
                    Speed = 1, 
                    Health = 77
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 2, 
                    DeployRate = 4.5, 
                    PathID = 3, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 70
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 2, 
                    Scale = 1.3, 
                    Speed = 1.6, 
                    Health = 63
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 6, 
                    PathID = 3, 
                    Scale = 1.8, 
                    Speed = 1, 
                    Health = 77
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 2, 
                    DeployRate = 4.5, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 70
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1.3, 
                    Speed = 1.6, 
                    Health = 63
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 6, 
                    PathID = 1, 
                    Scale = 1.8, 
                    Speed = 1, 
                    Health = 77
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 2, 
                    DeployRate = 4.5, 
                    PathID = 3, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 70
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 2, 
                    Scale = 1.3, 
                    Speed = 1.6, 
                    Health = 63
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 6, 
                    PathID = 3, 
                    Scale = 1.8, 
                    Speed = 1, 
                    Health = 77
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 2, 
                    DeployRate = 4.5, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 1, 
                    Health = 70
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1.3, 
                    Speed = 1.6, 
                    Health = 63
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 2.4, 
                    Speed = 1.1, 
                    Health = 84
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Large Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.7, 
                    Speed = 1.1, 
                    Health = 75
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Speedy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1.7, 
                    Health = 68
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 2.4, 
                    Speed = 1.1, 
                    Health = 84
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 75
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 75
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 2.4, 
                    Speed = 1.1, 
                    Health = 84
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Large Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.7, 
                    Speed = 1.1, 
                    Health = 75
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Speedy Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.5, 
                    Speed = 1.7, 
                    Health = 68
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 77
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 77
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.6, 
                    Speed = 1.2, 
                    Health = 77
                }, 
                {
                    Type = "Interval", 
                    Duration = 9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Royal Plankton Guard", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 2, 
                    Speed = 0.9, 
                    Health = 275
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Planktonamor", 
                    UnitNameOverride = "Planktonamor", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 2.2, 
                    Speed = 1, 
                    Health = 170
                }, 
                {
                    Type = "Interval", 
                    Duration = 2.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Royal Plankton Guard", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 2, 
                    Speed = 0.9, 
                    Health = 275
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Support", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 77
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Support", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 77
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Support", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 77
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 94
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.3, 
                    Speed = 2, 
                    Health = 77
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.7, 
                    Speed = 1, 
                    Health = 85
                }, 
                {
                    Type = "Interval", 
                    Duration = 9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.3, 
                    Speed = 2, 
                    Health = 77
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.7, 
                    Speed = 1, 
                    Health = 85
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 94
                }, 
                {
                    Type = "Interval", 
                    Duration = 9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Heavy Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 2, 
                    Speed = 0.9, 
                    Health = 94
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 1.3, 
                    Speed = 2, 
                    Health = 77
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.7, 
                    Speed = 1.1, 
                    Health = 85
                }, 
                {
                    Type = "Interval", 
                    Duration = 9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.3, 
                    Speed = 2, 
                    Health = 77
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.7, 
                    Speed = 1, 
                    Health = 85
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 94
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 1.9, 
                    Health = 81
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1.2, 
                    Health = 90
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 3, 
                    Scale = 1.3, 
                    Speed = 2.1, 
                    Health = 81
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1.5, 
                    Health = 90
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 1.5, 
                    Health = 90
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 3, 
                    Scale = 1.6, 
                    Speed = 1.5, 
                    Health = 90
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 2, 
                    Health = 81
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 3, 
                    Scale = 1.5, 
                    Speed = 1.2, 
                    Health = 90
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 1.4, 
                    Speed = 1.9, 
                    Health = 81
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1.5, 
                    Health = 90
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 1.5, 
                    Health = 90
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 3, 
                    Scale = 1.6, 
                    Speed = 1.5, 
                    Health = 90
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 2, 
                    Scale = 1.4, 
                    Speed = 2, 
                    Health = 81
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 3, 
                    Scale = 1.5, 
                    Speed = 1.2, 
                    Health = 90
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 1.4, 
                    Speed = 1.9, 
                    Health = 81
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Elite Bone Knight", 
                    UnitCount = 2, 
                    DeployRate = 6.5, 
                    PathID = 2, 
                    Scale = 2.2, 
                    Speed = 1.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Elite Guard", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 1.8, 
                    Speed = 1.1, 
                    Health = 95
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Elite Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 3, 
                    Scale = 1.5, 
                    Speed = 2.2, 
                    Health = 86
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Elite Bone Knight", 
                    UnitCount = 2, 
                    DeployRate = 6.5, 
                    PathID = 4, 
                    Scale = 2.2, 
                    Speed = 1.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Elite Guard", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 3, 
                    Scale = 1.8, 
                    Speed = 1.1, 
                    Health = 95
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Elite Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 2.2, 
                    Health = 86
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Elite Bone Knight", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 2.3, 
                    Speed = 1.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Elite Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.9, 
                    Speed = 1, 
                    Health = 95
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Elite Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 2.1, 
                    Health = 86
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Elite Bone Knight", 
                    UnitCount = 2, 
                    DeployRate = 6.5, 
                    PathID = 2, 
                    Scale = 2.2, 
                    Speed = 1.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Elite Guard", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 1.8, 
                    Speed = 1.1, 
                    Health = 95
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Elite Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 3, 
                    Scale = 1.5, 
                    Speed = 2.2, 
                    Health = 86
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Elite Bone Knight", 
                    UnitCount = 2, 
                    DeployRate = 6.5, 
                    PathID = 4, 
                    Scale = 2.2, 
                    Speed = 1.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Elite Guard", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 3, 
                    Scale = 1.8, 
                    Speed = 1.1, 
                    Health = 95
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Elite Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 2.2, 
                    Health = 86
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Elite Bone Knight", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Scale = 2.3, 
                    Speed = 1.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Elite Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Scale = 1.9, 
                    Speed = 1, 
                    Health = 95
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Elite Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 2.1, 
                    Health = 86
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Bone Knight", 
                    UnitCount = 3, 
                    DeployRate = 6.5, 
                    PathID = 2, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 3, 
                    Scale = 1.5, 
                    Speed = 1.8, 
                    Health = 90
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Phalanx", 
                    UnitCount = 2, 
                    DeployRate = 4.5, 
                    PathID = 2, 
                    Scale = 1.7, 
                    Speed = 1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Phalanx", 
                    UnitCount = 2, 
                    DeployRate = 4.5, 
                    PathID = 3, 
                    Scale = 1.7, 
                    Speed = 1.1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Bone Knight Phalanx", 
                    UnitCount = 2, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1.8, 
                    Speed = 1.1, 
                    Health = 110
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1.5, 
                    Health = 90
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 1.5, 
                    Health = 90
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 3, 
                    Scale = 1.6, 
                    Speed = 1.5, 
                    Health = 90
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Bone Knight", 
                    UnitCount = 3, 
                    DeployRate = 6.5, 
                    PathID = 3, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1.8, 
                    Health = 90
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 2, 
                    Scale = 1.6, 
                    Speed = 1.5, 
                    Health = 90
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 1.5, 
                    Health = 90
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Cavalry", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 3, 
                    Scale = 1.6, 
                    Speed = 1.5, 
                    Health = 90
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.8, 
                    Speed = 1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 1.8, 
                    Speed = 1.1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 1.8, 
                    Speed = 1.1, 
                    Health = 100
                }, 
                {
                    Type = "Interval", 
                    Duration = 12
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DarkKnight", 
                    UnitNameOverride = "Dark Knight Sandy", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 0.7, 
                    Health = 450
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Baron", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 2, 
                    Speed = 0.9, 
                    Health = 200
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Baron", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 2, 
                    Speed = 0.9, 
                    Health = 200
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Large Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.9, 
                    Speed = 1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Large Seahorse", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 1.9, 
                    Speed = 1.1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Large Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 1.9, 
                    Speed = 1, 
                    Health = 100
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 2.3, 
                    Speed = 1.2, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Giant Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Large Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 1.7, 
                    Speed = 2, 
                    Health = 100
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 2.3, 
                    Speed = 1.2, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Giant Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Large Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.7, 
                    Speed = 2, 
                    Health = 100
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 2.3, 
                    Speed = 1.2, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Giant Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Large Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 1.7, 
                    Speed = 2, 
                    Health = 100
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 2.3, 
                    Speed = 1.2, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Giant Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Large Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.7, 
                    Speed = 2, 
                    Health = 100
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 2.3, 
                    Speed = 1.2, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Giant Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 100
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Large Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 1.7, 
                    Speed = 2, 
                    Health = 100
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bone Knight", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 2.2, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 1.5, 
                    Speed = 2.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 1.8, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 2.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 1.8, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bone Knight", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 2.2, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Large Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.9, 
                    Speed = 1, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bone Knight", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 2.1, 
                    Speed = 1.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Elite Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 1.6, 
                    Speed = 2.1, 
                    Health = 105
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bone Knight", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 2.2, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 1.5, 
                    Speed = 2.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 1.8, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 2.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 1.8, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Heavy Bone Knight", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 2.2, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Large Guard", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.9, 
                    Speed = 1, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bone Knight", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 2.1, 
                    Speed = 1.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Elite Swift Bonefish", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 1.6, 
                    Speed = 2.1, 
                    Health = 105
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 3, 
                    DeployRate = 4.5, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 4, 
                    DeployRate = 5, 
                    PathID = 5, 
                    Scale = 1.4, 
                    Speed = 1.3, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 3, 
                    DeployRate = 4.5, 
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Horde", 
                    UnitCount = 4, 
                    DeployRate = 4, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Horde", 
                    UnitCount = 3, 
                    DeployRate = 4, 
                    PathID = 5, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish Horde", 
                    UnitCount = 4, 
                    DeployRate = 5, 
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1.2, 
                    Health = 105
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 1.4, 
                    Speed = 1.3, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 3, 
                    DeployRate = 4.5, 
                    PathID = 5, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 3, 
                    DeployRate = 4.5, 
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 3, 
                    DeployRate = 4.5, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1.2, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 4, 
                    DeployRate = 5, 
                    PathID = 5, 
                    Scale = 1.4, 
                    Speed = 1.3, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 3, 
                    DeployRate = 4.5, 
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard Horde", 
                    UnitCount = 4, 
                    DeployRate = 4, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 1, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse Horde", 
                    UnitCount = 3, 
                    DeployRate = 4, 
                    PathID = 5, 
                    Scale = 1.6, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish Horde", 
                    UnitCount = 4, 
                    DeployRate = 5, 
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1.2, 
                    Health = 105
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitNameOverride = "Bonefish", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 1.4, 
                    Speed = 1.3, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Guard", 
                    UnitCount = 3, 
                    DeployRate = 4.5, 
                    PathID = 5, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 105
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WarSeahorse", 
                    UnitNameOverride = "Seahorse", 
                    UnitCount = 3, 
                    DeployRate = 4.5, 
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1.1, 
                    Health = 105
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bone Knight", 
                    UnitCount = 2, 
                    DeployRate = 6.5, 
                    PathID = 4, 
                    Scale = 2.3, 
                    Speed = 1.3, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Giant Guard", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 5, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Large Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 6, 
                    Scale = 1.7, 
                    Speed = 2, 
                    Health = 110
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bone Knight", 
                    UnitCount = 2, 
                    DeployRate = 6.5, 
                    PathID = 5, 
                    Scale = 2.3, 
                    Speed = 1.3, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Giant Guard", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 6, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Large Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 1.7, 
                    Speed = 2, 
                    Health = 110
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bone Knight", 
                    UnitCount = 2, 
                    DeployRate = 6.5, 
                    PathID = 6, 
                    Scale = 2.3, 
                    Speed = 1.3, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Giant Guard", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Large Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 5, 
                    Scale = 1.7, 
                    Speed = 2, 
                    Health = 110
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bone Knight", 
                    UnitCount = 2, 
                    DeployRate = 6.5, 
                    PathID = 4, 
                    Scale = 2.3, 
                    Speed = 1.3, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Giant Guard", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 5, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Large Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 6, 
                    Scale = 1.7, 
                    Speed = 2, 
                    Health = 110
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bone Knight", 
                    UnitCount = 2, 
                    DeployRate = 6.5, 
                    PathID = 5, 
                    Scale = 2.3, 
                    Speed = 1.3, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Giant Guard", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 6, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Large Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 1.7, 
                    Speed = 2, 
                    Health = 110
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Giant Bone Knight", 
                    UnitCount = 2, 
                    DeployRate = 6.5, 
                    PathID = 6, 
                    Scale = 2.3, 
                    Speed = 1.3, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Giant Guard", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 2, 
                    Speed = 1.1, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Large Swift Bonefish", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 5, 
                    Scale = 1.7, 
                    Speed = 2, 
                    Health = 110
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitNameOverride = "Dragon Escort Swift", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Scale = 1.6, 
                    Speed = 2, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Dragon Escort Guard", 
                    UnitCount = 2, 
                    DeployRate = 4.5, 
                    PathID = 6, 
                    Scale = 1.6, 
                    Speed = 1.2, 
                    Health = 110
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Dragon's Lieutenant", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 2.2, 
                    Speed = 1, 
                    Health = 560
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "JellyfishDragon", 
                    UnitNameOverride = "Jellyfish Dragon", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 0.6, 
                    Health = 1375
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DarkKnight", 
                    UnitNameOverride = "Dark Knight Sandy", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 2, 
                    Speed = 0.8, 
                    Health = 560
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Dragon Guard Heavy", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Scale = 2.2, 
                    Speed = 1.2, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonamorGuard", 
                    UnitNameOverride = "Dragon Guard Mid", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Scale = 1.8, 
                    Speed = 1.1, 
                    Health = 110
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitNameOverride = "Dragon Guard Heavy", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Scale = 2.2, 
                    Speed = 1.2, 
                    Health = 110
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }
    }
};