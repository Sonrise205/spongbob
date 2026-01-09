return {
    Name = "Jellyfish Jolt", 
    DisplayName = "Jellyfish Jolt", 
    RecommendedPlayerLevel = {
        Normal = 1, 
        Hard = 5, 
        Nightmare = 60
    }, 
    Description = "", 
    Map = "SandysTreedomeSnow", 
    UnlockCondition = {
        PlayerLevel = 1, 
        PreviousChapterCompleted = nil
    }, 
    Lighting = "Universal.SnowDay", 
    PathUnlocks = {
        [1] = 1, 
        [2] = 1
    }, 
    Rewards = {
        [1] = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 6
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 6
            }, 
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 18
            }, 
            {
                type = "Experience", 
                amount = 18
            }
        }, 
        [10] = {
            {
                type = "Inventory", 
                name = "Heart Acorn", 
                amount = 3
            }
        }, 
        [15] = {
            {
                type = "Currency", 
                name = "Swashbucks", 
                amount = 7
            }
        }, 
        [50] = {
            {
                type = "Inventory", 
                name = "TreasureChest", 
                amount = 1
            }
        }
    }, 
    Base = {
        Health = 100, 
        StarterGold = 1500
    }, 
    DifficultyModifiers = {
        {
            PerPlayerEnemyHealthRate = {
                [1] = 1, 
                [2] = 1.8, 
                [3] = 2.6, 
                [4] = 3.4
            }, 
            BaseHealthModifier = 1, 
            StarterCurrencyModifier = 1, 
            IntervalTimeModifier = 1, 
            EnemyDeployRate = 1, 
            EnemyAmountRate = 1, 
            EnemySpeedRate = 0.8, 
            EnemyHealthRate = 14, 
            ExperiencePointsModifier = 1, 
            CurrencyModifier = 1, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }, 
        {
            PerPlayerEnemyHealthRate = {
                [1] = 1, 
                [2] = 1.8, 
                [3] = 2.6, 
                [4] = 3.4
            }, 
            BaseHealthModifier = 1, 
            StarterCurrencyModifier = 1, 
            IntervalTimeModifier = 1, 
            EnemyDeployRate = 1, 
            EnemyAmountRate = 1, 
            EnemySpeedRate = 0.85, 
            EnemyHealthRate = 71, 
            ExperiencePointsModifier = 1, 
            CurrencyModifier = 1, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }, 
        {
            PerPlayerEnemyHealthRate = {
                [1] = 1, 
                [2] = 1.8, 
                [3] = 2.6, 
                [4] = 3.4
            }, 
            BaseHealthModifier = 1, 
            StarterCurrencyModifier = 1, 
            IntervalTimeModifier = 1, 
            EnemyDeployRate = 1, 
            EnemyAmountRate = 1, 
            EnemySpeedRate = 1, 
            EnemyHealthRate = 89, 
            ExperiencePointsModifier = 1, 
            CurrencyModifier = 1, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }
    }, 
    WaveRewards = {
        [1] = {
            Currency = 300, 
            Experience = 10
        }, 
        [2] = {
            Currency = 300, 
            Experience = 10
        }, 
        [3] = {
            Currency = 300, 
            Experience = 10
        }, 
        [4] = {
            Currency = 300, 
            Experience = 10
        }, 
        [5] = {
            Currency = 1000, 
            Experience = 10
        }, 
        [6] = {
            Currency = 400, 
            Experience = 19
        }, 
        [7] = {
            Currency = 400, 
            Experience = 19
        }, 
        [8] = {
            Currency = 400, 
            Experience = 19
        }, 
        [9] = {
            Currency = 400, 
            Experience = 19
        }, 
        [10] = {
            Currency = 2000, 
            Experience = 19
        }, 
        [11] = {
            Currency = 500, 
            Experience = 29
        }, 
        [12] = {
            Currency = 500, 
            Experience = 29
        }, 
        [13] = {
            Currency = 500, 
            Experience = 29
        }, 
        [14] = {
            Currency = 1000, 
            Experience = 29
        }, 
        [15] = {
            Currency = 0, 
            Experience = 29
        }
    }, 
    Waves = {
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
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
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
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
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
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
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
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
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
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
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "MegaChumControlledFish", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
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
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 9, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "MegaChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 9, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleLarge", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "MegaChumControlledFish", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "MegaChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "MegaChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 1, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "MegaChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "AtomicFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 5, 
                    IsBoss = true
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "MegaChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "MegaChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 2, 
                    DeployRate = 12, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "MegaChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "MegaChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "HibernationSandy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2, 
                    IsBoss = true
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "MegaChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }
    }
};