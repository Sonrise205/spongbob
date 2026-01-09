return {
    Name = "Strange Noises", 
    DisplayName = "Strange Noises", 
    RecommendedPlayerLevel = {
        Normal = 1, 
        Hard = 5, 
        Nightmare = 60
    }, 
    Description = "", 
    Map = "KampKoral", 
    UnlockCondition = {
        PlayerLevel = 1, 
        PreviousChapterCompleted = nil
    }, 
    Lighting = "KampKoral.Act1", 
    PathUnlocks = {
        [1] = 1, 
        [2] = 0
    }, 
    Rewards = {
        Normal = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 65
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 70
            }, 
            {
                type = "Inventory", 
                name = "Heart Acorn", 
                amountRange = NumberRange.new(2, 2)
            }, 
            {
                type = "Experience", 
                amount = 300
            }
        }, 
        Hard = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 75
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 80
            }, 
            {
                type = "Inventory", 
                name = "Heart Acorn", 
                amountRange = NumberRange.new(3, 3)
            }, 
            {
                type = "Experience", 
                amount = 450
            }
        }, 
        Nightmare = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 90
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 95
            }, 
            {
                type = "Inventory", 
                name = "Heart Acorn", 
                amountRange = NumberRange.new(4, 4)
            }, 
            {
                type = "Experience", 
                amount = 675
            }
        }, 
        ["Davy Jones"] = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 95
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 100
            }, 
            {
                type = "Inventory", 
                name = "Heart Acorn", 
                amountRange = NumberRange.new(6, 6)
            }, 
            {
                type = "Experience", 
                amount = 750
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
            EnemyHealthRate = 8, 
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
            EnemyHealthRate = 33, 
            ExperiencePointsModifier = 1.05, 
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
            EnemyHealthRate = 42, 
            ExperiencePointsModifier = 1.1, 
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
            EnemyHealthRate = 709.33, 
            ExperiencePointsModifier = 1.15, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
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
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
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
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 1, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 1, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 1, 
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
                    UnitName = "DirtyBubbleSmall", 
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
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
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
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
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
                    UnitCount = 2, 
                    DeployRate = 1, 
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
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
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
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 1, 
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
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 2, 
                    DeployRate = 1, 
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
                    DeployRate = ".5", 
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
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 1, 
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
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 2, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
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
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
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
                    DeployRate = ".5", 
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
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 1, 
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
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
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
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 1, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1, 
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
                    PathID = 1, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 1, 
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
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1, 
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
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1, 
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
                    DeployRate = ".5", 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 1, 
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
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3
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
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1, 
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
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
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
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 0.7, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 1, 
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
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
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
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 0.7, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 0.7, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 1, 
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
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
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
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
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
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 0.7, 
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
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 0.7, 
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
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
        }, 
        {
            Timeline = {
                {
                    Type = "EnemySpawn", 
                    UnitName = "SeaBear", 
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
                    DeployRate = ".5", 
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
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 4, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = ".5", 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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