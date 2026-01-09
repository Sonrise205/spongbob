return {
    Name = "MetroMayhem", 
    DisplayName = "Metro Mayhem", 
    RecommendedPlayerLevel = {
        Normal = 1, 
        Hard = 50, 
        Nightmare = 60
    }, 
    Description = "", 
    Map = "BikiniBottom", 
    UnlockCondition = {
        PlayerLevel = 1, 
        PreviousChapterCompleted = nil
    }, 
    Lighting = "Universal.MorningCity", 
    PathId = 1, 
    PathUnlocks = {
        [1] = 1
    }, 
    Base = {
        Health = 100, 
        StarterGold = 1700
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
            EnemySpeedRate = 1, 
            EnemyHealthRate = 5, 
            ExperiencePointsModifier = 1, 
            CurrencyModifier = 1, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }, 
        {
            PerPlayerEnemyHealthRate = {
                [1] = 15, 
                [2] = 1.8, 
                [3] = 2.6, 
                [4] = 3.4
            }, 
            BaseHealthModifier = 1, 
            StarterCurrencyModifier = 1, 
            IntervalTimeModifier = 1, 
            EnemyDeployRate = 0.6, 
            EnemyAmountRate = 1, 
            EnemySpeedRate = 1, 
            EnemyHealthRate = 6, 
            ExperiencePointsModifier = 1, 
            CurrencyModifier = 0.75, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }, 
        {
            PerPlayerEnemyHealthRate = {
                [1] = 1, 
                [2] = 1.8, 
                [3] = 2.5, 
                [4] = 3
            }, 
            BaseHealthModifier = 1, 
            StarterCurrencyModifier = 1, 
            IntervalTimeModifier = 1, 
            EnemyDeployRate = 1, 
            EnemyAmountRate = 1, 
            EnemySpeedRate = 1, 
            EnemyHealthRate = 5, 
            ExperiencePointsModifier = 1, 
            CurrencyModifier = 1.11, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }
    }, 
    WaveRewards = {
        [1] = {
            Currency = 250, 
            Experience = 100
        }, 
        [2] = {
            Currency = 250, 
            Experience = 100
        }, 
        [3] = {
            Currency = 250, 
            Experience = 100
        }, 
        [4] = {
            Currency = 250, 
            Experience = 100
        }, 
        [5] = {
            Currency = 250, 
            Experience = 100
        }, 
        [6] = {
            Currency = 250, 
            Experience = 100
        }, 
        [7] = {
            Currency = 250, 
            Experience = 100
        }, 
        [8] = {
            Currency = 250, 
            Experience = 100
        }, 
        [9] = {
            Currency = 250, 
            Experience = 100
        }, 
        [10] = {
            Currency = 250, 
            Experience = 100
        }, 
        [11] = {
            Currency = 250, 
            Experience = 100
        }, 
        [12] = {
            Currency = 250, 
            Experience = 100
        }, 
        [13] = {
            Currency = 250, 
            Experience = 100
        }, 
        [14] = {
            Currency = 250, 
            Experience = 100
        }, 
        [15] = {
            Currency = 250, 
            Experience = 100
        }
    }, 
    Waves = {
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 2, 
                    DeployRate = 6, 
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
                    Type = "WaveEnd"
                }
            }
        }, 
        {
            Timeline = {
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 6, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 6, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossAnchovy_Orange", 
                    UnitCount = 1, 
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
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.25, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.25, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.25, 
                    Health = 1.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.25, 
                    Health = 1.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.25, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.25, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 3, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 0.75, 
                    Speed = 1.25, 
                    Health = 0.75
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.25, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleMedium", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1.75, 
                    Speed = 1.35, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.35, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.35, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossAnchovy_Blue", 
                    UnitCount = 4, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.35, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.35, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 5, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.35, 
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.35, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.35, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.35, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.35, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 1, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossAnchovy_Blue", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 1, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossAnchovy_Orange", 
                    UnitCount = 1, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.5, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.5, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 2, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.4, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.4, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.4, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 3, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.4, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSlowAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.25, 
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
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.4, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.4, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.4, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "CyborgPlanktonLarge", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 1.6
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }
    }
};