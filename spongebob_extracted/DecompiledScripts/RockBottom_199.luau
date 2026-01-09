return {
    Name = "Wrong Bus!", 
    DisplayName = "Wrong Bus!", 
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
    Lighting = "RockBottom.Act1", 
    PathUnlocks = {
        [1] = 1, 
        [2] = 0, 
        [3] = 0
    }, 
    Rewards = {
        Normal = {
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
                name = "Glove Candy", 
                amountRange = NumberRange.new(2, 2)
            }, 
            {
                type = "Experience", 
                amount = 250
            }, 
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 125
            }
        }, 
        Hard = {
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
                amount = 375
            }, 
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 200
            }
        }, 
        Nightmare = {
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
                amount = 500
            }, 
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 300
            }
        }, 
        ["Davy Jones"] = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 105
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 110
            }, 
            {
                type = "Inventory", 
                name = "Glove Candy", 
                amountRange = NumberRange.new(6, 6)
            }, 
            {
                type = "Experience", 
                amount = 800
            }, 
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 400
            }
        }
    }, 
    Base = {
        Health = 100, 
        StarterGold = 700
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
            EnemyHealthRate = 598, 
            ExperiencePointsModifier = 1.15, 
            CurrencyModifier = 1, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }
    }, 
    WaveRewards = {
        [1] = {
            Currency = 600, 
            Experience = 8
        }, 
        [2] = {
            Currency = 600, 
            Experience = 8
        }, 
        [3] = {
            Currency = 600, 
            Experience = 8
        }, 
        [4] = {
            Currency = 600, 
            Experience = 8
        }, 
        [5] = {
            Currency = 700, 
            Experience = 8
        }, 
        [6] = {
            Currency = 700, 
            Experience = 16
        }, 
        [7] = {
            Currency = 800, 
            Experience = 16
        }, 
        [8] = {
            Currency = 800, 
            Experience = 16
        }, 
        [9] = {
            Currency = 900, 
            Experience = 16
        }, 
        [10] = {
            Currency = 900, 
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
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
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
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 1.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 1.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2.5, 
                    PathID = 1, 
                    Health = 1.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 1.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2.5, 
                    PathID = 1, 
                    Health = 1.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 1.3
                }, 
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
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2.5, 
                    PathID = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreatureBoss", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 3, 
                    Speed = 0.75, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 30
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 2, 
                    DeployRate = 2.5, 
                    PathID = 1, 
                    Health = 1.5
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
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 1.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 1.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 1.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2.5, 
                    PathID = 1, 
                    Health = 1.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 1.7
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
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2.5, 
                    PathID = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 4, 
                    DeployRate = 1.2, 
                    PathID = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2.5, 
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
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 2.5
                }, 
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
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 3, 
                    DeployRate = 1.2, 
                    PathID = 1, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2.5, 
                    PathID = 1, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 3, 
                    DeployRate = 1.2, 
                    PathID = 1, 
                    Health = 2.5
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
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 3
                }, 
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
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 4, 
                    DeployRate = 2.5, 
                    PathID = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 4, 
                    DeployRate = 1.2, 
                    PathID = 1, 
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
                    UnitName = "Tiff", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "TiffBoss", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 2, 
                    Speed = ".85", 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 7
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2.5, 
                    PathID = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 3, 
                    DeployRate = 1.2, 
                    PathID = 1, 
                    Health = 3.5
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
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "SeaBear", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Health = 4.3
                }, 
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
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 3, 
                    DeployRate = 1.2, 
                    PathID = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "SeaBear", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 4.6
                }, 
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
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "SeaBear", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Health = 4.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Health = 4.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 4.8
                }, 
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
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "Dopey", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SeaBear", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 5
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }
    }
};