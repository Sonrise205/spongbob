return {
    Name = "Update Me!", 
    DisplayName = "Update Me!", 
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
                name = "Glove Candy", 
                amount = 2
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
            EnemyHealthRate = 12, 
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
            EnemyHealthRate = 30, 
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
            EnemyHealthRate = 40, 
            ExperiencePointsModifier = 1, 
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
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2
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
                    Duration = 5
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
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.2
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
                    UnitCount = 6, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
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
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
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
                    Health = 50
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
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
                    PathID = 1, 
                    Health = 2.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 6, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 1, 
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
                    UnitCount = 6, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
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
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
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
                    UnitCount = 7, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 3.1
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
                    PathID = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
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
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
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
                    UnitCount = 7, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
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
                    UnitCount = 5, 
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
                    UnitCount = 6, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 3.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "TiffBoss", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 2, 
                    Speed = 1.2, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 11
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 3.7
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
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 7, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 6, 
                    DeployRate = 1.5, 
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
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Health = 4
                }, 
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
                    UnitName = "Bert", 
                    UnitCount = 7, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
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
                    UnitName = "SandCreature", 
                    UnitCount = 7, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 5, 
                    DeployRate = 2, 
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
                    UnitCount = 1, 
                    DeployRate = 0, 
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
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
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
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 8, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 6, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 0, 
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
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BadBubbleBass", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 4.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 8, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Bert", 
                    UnitCount = 7, 
                    DeployRate = 1.5, 
                    PathID = 1, 
                    Health = 4.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Health = 4.8
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
                    UnitName = "Jojo", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SeaBear", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dopey", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 7, 
                    DeployRate = 1.5, 
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
                    UnitCount = 5, 
                    DeployRate = 1.5, 
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
                    UnitCount = 4, 
                    DeployRate = 2, 
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