return {
    Name = "BubbleBowl", 
    DisplayName = "Sweet Victory!", 
    Description = "", 
    Map = "BubbleBowl", 
    UnlockCondition = {
        PlayerLevel = 25, 
        PreviousChapterCompleted = nil
    }, 
    Lighting = "BubbleBowl.Night", 
    PathCutscene = "BubbleBowlPathCutscene", 
    PathUnlocks = {
        [1] = 1, 
        [2] = 1, 
        [3] = 5, 
        [4] = 10, 
        [5] = 15, 
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
    Base = {
        Health = 250, 
        StarterGold = 800
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
            EnemyHealthRate = 4, 
            ExperiencePointsModifier = 1, 
            CurrencyModifier = 1, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }, 
        {
            PerPlayerEnemyHealthRate = {
                [1] = 1, 
                [2] = 1.9, 
                [3] = 2.85, 
                [4] = 3.8
            }, 
            BaseHealthModifier = 1, 
            StarterCurrencyModifier = 1, 
            IntervalTimeModifier = 1, 
            EnemyDeployRate = 1, 
            EnemyAmountRate = 1, 
            EnemySpeedRate = 0.9, 
            EnemyHealthRate = 1.9, 
            ExperiencePointsModifier = 1.05, 
            CurrencyModifier = 1.3, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }, 
        {
            PerPlayerEnemyHealthRate = {
                [1] = 1, 
                [2] = 1.85, 
                [3] = 2.7, 
                [4] = 3.55
            }, 
            BaseHealthModifier = 1, 
            StarterCurrencyModifier = 1, 
            IntervalTimeModifier = 1, 
            EnemyDeployRate = 1.25, 
            EnemyAmountRate = 1, 
            EnemySpeedRate = 1, 
            EnemyHealthRate = 10, 
            ExperiencePointsModifier = 1.1, 
            CurrencyModifier = 1.5, 
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
            EnemyHealthRate = 140, 
            ExperiencePointsModifier = 1.15, 
            CurrencyModifier = 1.15, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }
    }, 
    WaveRewards = {
        [1] = {
            Currency = 400, 
            Experience = 5
        }, 
        [2] = {
            Currency = 400, 
            Experience = 5
        }, 
        [3] = {
            Currency = 400, 
            Experience = 5
        }, 
        [4] = {
            Currency = 400, 
            Experience = 5
        }, 
        [5] = {
            Currency = 500, 
            Experience = 5
        }, 
        [6] = {
            Currency = 500, 
            Experience = 10
        }, 
        [7] = {
            Currency = 500, 
            Experience = 10
        }, 
        [8] = {
            Currency = 500, 
            Experience = 10
        }, 
        [9] = {
            Currency = 500, 
            Experience = 10
        }, 
        [10] = {
            Currency = 1000, 
            Experience = 10
        }, 
        [11] = {
            Currency = 500, 
            Experience = 10
        }, 
        [12] = {
            Currency = 500, 
            Experience = 10
        }, 
        [13] = {
            Currency = 500, 
            Experience = 10
        }, 
        [14] = {
            Currency = 500, 
            Experience = 10
        }, 
        [15] = {
            Currency = 1500, 
            Experience = 15
        }, 
        [16] = {
            Currency = 500, 
            Experience = 15
        }, 
        [17] = {
            Currency = 500, 
            Experience = 15
        }, 
        [18] = {
            Currency = 500, 
            Experience = 15
        }, 
        [19] = {
            Currency = 500, 
            Experience = 15
        }, 
        [20] = {
            Currency = 500, 
            Experience = 15
        }, 
        [21] = {
            Currency = 500, 
            Experience = 15
        }, 
        [22] = {
            Currency = 500, 
            Experience = 15
        }, 
        [23] = {
            Currency = 500, 
            Experience = 15
        }, 
        [24] = {
            Currency = 500, 
            Experience = 15
        }, 
        [25] = {
            Currency = 500, 
            Experience = 15
        }
    }, 
    Waves = {
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 10, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.05, 
                    Health = 1
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 1
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.15, 
                    Health = 1.1
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 0.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSquilliamFancyson", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1.1
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 1.2
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.3
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 1.35
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 0.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSquilliamFancyson", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSquilliamFancyson", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.45, 
                    Health = 2
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
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
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.55, 
                    Health = 3
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.6, 
                    Health = 3
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.65, 
                    Health = 3
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 0.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSquilliamFancyson", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSquilliamFancyson", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1.25, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSquilliamFancyson", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1.25, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.7, 
                    Health = 3
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.75, 
                    Health = 1
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.8, 
                    Health = 3
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 3
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.9, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 0.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSquilliamFancyson", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1.5, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSquilliamFancyson", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1.5, 
                    Health = 2.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSquilliamFancyson", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1.5, 
                    Speed = 1.5, 
                    Health = 2.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSquilliamFancyson", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1.5, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.95, 
                    Health = 3
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2, 
                    Health = 1
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.05, 
                    Health = 1
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.85, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.1, 
                    Health = 1
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.15, 
                    Health = 6
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FootballKingJellyfish", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1.2, 
                    PathID = 3, 
                    Scale = 0.7, 
                    Speed = 0.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FootballKingJellyfish", 
                    UnitCount = 1, 
                    DeployRate = 1.2, 
                    PathID = 5, 
                    Scale = 0.75, 
                    Speed = 0.75, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FootballKingJellyfish", 
                    UnitCount = 1, 
                    DeployRate = 1.2, 
                    PathID = 4, 
                    Scale = 0.75, 
                    Speed = 0.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FootballKingJellyfish", 
                    UnitCount = 1, 
                    DeployRate = 1.2, 
                    PathID = 6, 
                    Scale = 0.75, 
                    Speed = 0.75, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FootballKingJellyfish", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FootballKingJellyfish", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FootballKingJellyfish", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FootballKingJellyfish", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "OffenseFootballAnchovy2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DefenseFootballAnchovy1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BandAnchovy4", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 2.2, 
                    Health = 6
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }
    }
};