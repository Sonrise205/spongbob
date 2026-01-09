return {
    Name = "Neon Shadows", 
    DisplayName = "Neon Shadows", 
    RecommendedPlayerLevel = {
        Normal = 1, 
        Hard = 5, 
        Nightmare = 60
    }, 
    Description = "", 
    Map = "RockBottom", 
    UnlockCondition = {
        PlayerLevel = 1, 
        PreviousChapterCompleted = nil
    }, 
    Lighting = "RockBottom.Act2", 
    PathUnlocks = {
        [1] = 1, 
        [2] = 1, 
        [3] = 1
    }, 
    Rewards = {
        Normal = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 85
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 90
            }, 
            {
                type = "Inventory", 
                name = "Glove Candy", 
                amountRange = NumberRange.new(3, 3)
            }, 
            {
                type = "Experience", 
                amount = 250
            }, 
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 150
            }
        }, 
        Hard = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 100
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 100
            }, 
            {
                type = "Inventory", 
                name = "Glove Candy", 
                amountRange = NumberRange.new(4, 4)
            }, 
            {
                type = "Experience", 
                amount = 375
            }, 
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 300
            }
        }, 
        Nightmare = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 115
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 125
            }, 
            {
                type = "Inventory", 
                name = "Glove Candy", 
                amountRange = NumberRange.new(4, 4)
            }, 
            {
                type = "Experience", 
                amount = 500
            }, 
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 400
            }
        }, 
        ["Davy Jones"] = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 110
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 115
            }, 
            {
                type = "Inventory", 
                name = "Glove Candy", 
                amountRange = NumberRange.new(7, 7)
            }, 
            {
                type = "Experience", 
                amount = 800
            }, 
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 500
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
            EnemySpeedRate = 0.8, 
            EnemyHealthRate = 16, 
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
            EnemyHealthRate = 60, 
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
            EnemyHealthRate = 70, 
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
            EnemySpeedRate = 0.75, 
            EnemyHealthRate = 405.6, 
            ExperiencePointsModifier = 1.15, 
            CurrencyModifier = 1, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }
    }, 
    WaveRewards = {
        [1] = {
            Currency = 800, 
            Experience = 8
        }, 
        [2] = {
            Currency = 800, 
            Experience = 8
        }, 
        [3] = {
            Currency = 800, 
            Experience = 8
        }, 
        [4] = {
            Currency = 900, 
            Experience = 8
        }, 
        [5] = {
            Currency = 900, 
            Experience = 8
        }, 
        [6] = {
            Currency = 900, 
            Experience = 16
        }, 
        [7] = {
            Currency = 900, 
            Experience = 16
        }, 
        [8] = {
            Currency = 900, 
            Experience = 16
        }, 
        [9] = {
            Currency = 1000, 
            Experience = 16
        }, 
        [10] = {
            Currency = 1000, 
            Experience = 16
        }, 
        [11] = {
            Currency = 1000, 
            Experience = 24
        }, 
        [12] = {
            Currency = 1000, 
            Experience = 24
        }, 
        [13] = {
            Currency = 1000, 
            Experience = 24
        }, 
        [14] = {
            Currency = 1000, 
            Experience = 24
        }, 
        [15] = {
            Currency = 0, 
            Experience = 24
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
                    UnitName = "SandCreature", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
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
                    UnitName = "Bert", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 6, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.1
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
                    UnitName = "Tiff", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Health = 2.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 6, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.2
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
                    UnitName = "Bert", 
                    UnitCount = 7, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Health = 2.3
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
                    UnitName = "SandCreature", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Health = 2.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "JojoBoss", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 3, 
                    Speed = 0.75, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 35
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Health = 2.4
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
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 2.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Health = 2.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Health = 2.6
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
                    UnitName = "Bert", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Health = 2.8
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
                    UnitName = "SandCreature", 
                    UnitCount = 6, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Health = 3.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Health = 3.1
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
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 6, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Health = 3.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 6, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Health = 3.4
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
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Health = 3.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Health = 3.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 3, 
                    Health = 3.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossBert", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 2, 
                    Speed = 1.2, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 12
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Health = 3.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 3, 
                    Health = 3.7
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
                    UnitName = "SeaBear", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 3, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Health = 4
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
                    UnitName = "BadBubbleBass", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 6, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Health = 4.3
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
                    UnitName = "SandCreature", 
                    UnitCount = 6, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 7, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Health = 4.6
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
                    UnitName = "SeaBear", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 4.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Health = 4.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Health = 4.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 7, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 2, 
                    Health = 4.8
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
                    UnitName = "SandCreature", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 3, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dopey", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 2, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 3, 
                    Health = 5
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }
    }
};