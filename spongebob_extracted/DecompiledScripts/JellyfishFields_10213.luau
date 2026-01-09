return {
    Name = "JellyfishJamboree", 
    DisplayName = "Jellyfish Jamboree", 
    RecommendedPlayerLevel = {
        Normal = 1, 
        Hard = 5, 
        Nightmare = 60
    }, 
    Description = "", 
    Map = "JellyfishFields", 
    UnlockCondition = {
        PlayerLevel = 1, 
        PreviousChapterCompleted = nil
    }, 
    Lighting = "Universal.Afternoon", 
    PathId = 2, 
    PathUnlocks = {
        [1] = 0, 
        [2] = 1
    }, 
    Rewards = {
        Normal = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 40
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 45
            }, 
            {
                type = "Inventory", 
                name = "Kelp Shake", 
                amountRange = NumberRange.new(3, 3)
            }, 
            {
                type = "Experience", 
                amount = 150
            }
        }, 
        Hard = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 50
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 55
            }, 
            {
                type = "Inventory", 
                name = "Kelp Shake", 
                amountRange = NumberRange.new(4, 4)
            }, 
            {
                type = "Experience", 
                amount = 225
            }
        }, 
        Nightmare = {
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
                name = "Kelp Shake", 
                amountRange = NumberRange.new(5, 5)
            }, 
            {
                type = "Experience", 
                amount = 350
            }
        }, 
        ["Davy Jones"] = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 70
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 75
            }, 
            {
                type = "Inventory", 
                name = "Kelp Shake", 
                amountRange = NumberRange.new(7, 7)
            }, 
            {
                type = "Experience", 
                amount = 450
            }
        }
    }, 
    Base = {
        Health = 100, 
        StarterGold = 800
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
            EnemySpeedRate = 0.75, 
            EnemyHealthRate = 5, 
            ExperiencePointsModifier = 1, 
            CurrencyModifier = 1.1, 
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
            EnemyHealthRate = 12.5, 
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
            EnemyHealthRate = 25.1, 
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
            EnemyHealthRate = 643.5, 
            ExperiencePointsModifier = 1.15, 
            CurrencyModifier = 1, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }
    }, 
    WaveRewards = {
        [1] = {
            Currency = 600, 
            Experience = 6
        }, 
        [2] = {
            Currency = 600, 
            Experience = 6
        }, 
        [3] = {
            Currency = 600, 
            Experience = 6
        }, 
        [4] = {
            Currency = 600, 
            Experience = 6
        }, 
        [5] = {
            Currency = 800, 
            Experience = 6
        }, 
        [6] = {
            Currency = 800, 
            Experience = 11
        }, 
        [7] = {
            Currency = 800, 
            Experience = 11
        }, 
        [8] = {
            Currency = 800, 
            Experience = 11
        }, 
        [9] = {
            Currency = 800, 
            Experience = 11
        }, 
        [10] = {
            Currency = 1000, 
            Experience = 11
        }, 
        [11] = {
            Currency = 1000, 
            Experience = 17
        }, 
        [12] = {
            Currency = 1000, 
            Experience = 17
        }, 
        [13] = {
            Currency = 1000, 
            Experience = 17
        }, 
        [14] = {
            Currency = 1000, 
            Experience = 17
        }, 
        [15] = {
            Currency = 0, 
            Experience = 17
        }
    }, 
    Waves = {
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 3, 
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
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 3, 
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
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 3, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 6, 
                    DeployRate = 2, 
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
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 4, 
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
                    UnitCount = 5, 
                    DeployRate = 2, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 3, 
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
                    UnitName = "Jellyfish2", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 2, 
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
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 5, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 2, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 5, 
                    DeployRate = 2, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 6, 
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
                    UnitName = "BigJellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
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
                    UnitName = "Dennis", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
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
                    UnitName = "BigJellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 2, 
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
                    UnitName = "Jellyfish2", 
                    UnitCount = 6, 
                    DeployRate = 2, 
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
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 7, 
                    DeployRate = 2, 
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
                    UnitName = "BigJellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 6, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 5, 
                    DeployRate = 2, 
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
                    UnitName = "BigJellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
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
                    UnitName = "BossArmoredAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 2, 
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
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 6, 
                    DeployRate = 2, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 5, 
                    DeployRate = 2, 
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
                    UnitName = "BossAnchovy_Blue", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 2, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 8, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 2, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 5, 
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
                    UnitName = "BossAnchovy_Orange", 
                    UnitCount = 3, 
                    DeployRate = 3, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 6, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossAnchovy_Yellow", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "Jellyfish2", 
                    UnitCount = 6, 
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
                    UnitName = "BigJellyfish1", 
                    UnitCount = 2, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 6, 
                    DeployRate = 1, 
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
                    UnitName = "QueenJellyfish", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 6, 
                    DeployRate = 1, 
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
                    UnitName = "BigJellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 2, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 5, 
                    DeployRate = 2, 
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
                    UnitName = "BossAnchovy_Blue", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 8, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "BossAnchovy_Orange", 
                    UnitCount = 3, 
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
                    UnitName = "Jellyfish2", 
                    UnitCount = 6, 
                    DeployRate = 2, 
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
                    UnitName = "BigJellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "BossArmoredAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 4, 
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
                    UnitName = "BossAnchovy_Yellow", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 7, 
                    DeployRate = 2, 
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
                    UnitName = "BossAnchovy_Blue", 
                    UnitCount = 4, 
                    DeployRate = 2, 
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
                    UnitName = "BigJellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 9, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "BossAnchovy_Orange", 
                    UnitCount = 4, 
                    DeployRate = 2, 
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
                    UnitName = "Jellyfish2", 
                    UnitCount = 6, 
                    DeployRate = 2, 
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
                    UnitName = "BigJellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "BossAnchovy_Yellow", 
                    UnitCount = 4, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 9, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "BossAnchovy_Orange", 
                    UnitCount = 4, 
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
                    UnitName = "BossArmoredAnchovy", 
                    UnitCount = 3, 
                    DeployRate = 4, 
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
                    UnitName = "BigJellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "BossAnchovy_Blue", 
                    UnitCount = 3, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 7, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "KingJellyfish", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
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
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 7, 
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
                    UnitName = "BossAnchovy_Yellow", 
                    UnitCount = 3, 
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
                    UnitName = "BigJellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "Jellyfish2", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }
    }
};