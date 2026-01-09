return {
    Name = "FrozenFaceOff", 
    DisplayName = "Frozen Face-Off", 
    Description = "", 
    Map = "ConchStreetSnow", 
    UnlockCondition = {
        PlayerLevel = 25, 
        PreviousChapterCompleted = nil
    }, 
    Lighting = "Universal.SnowMorning", 
    PathUnlocks = {
        [1] = 1
    }, 
    Base = {
        Health = 100, 
        StarterGold = 950
    }, 
    DifficultyModifiers = {
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
            EnemySpeedRate = 0.8, 
            EnemyHealthRate = 5, 
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
            EnemySpeedRate = 1, 
            EnemyHealthRate = 4, 
            ExperiencePointsModifier = 1, 
            CurrencyModifier = 1.75, 
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
            EnemySpeedRate = 1.1, 
            EnemyHealthRate = 6, 
            ExperiencePointsModifier = 1, 
            CurrencyModifier = 2, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }, 
        {
            PerPlayerEnemyHealthRate = {
                [1] = 1, 
                [2] = 2, 
                [3] = 3, 
                [4] = 4
            }, 
            BaseHealthModifier = 1, 
            StarterCurrencyModifier = 1, 
            IntervalTimeModifier = 1, 
            EnemyDeployRate = 1, 
            EnemyAmountRate = 1, 
            EnemySpeedRate = 1.2, 
            EnemyHealthRate = 10, 
            ExperiencePointsModifier = 1, 
            CurrencyModifier = 2.5, 
            BossMonsterAmountRate = 1, 
            EnemyOverrides = {}
        }
    }, 
    WaveRewards = {
        [1] = {
            Currency = 500, 
            Experience = 10
        }, 
        [2] = {
            Currency = 600, 
            Experience = 10
        }, 
        [3] = {
            Currency = 600, 
            Experience = 10
        }, 
        [4] = {
            Currency = 700, 
            Experience = 10
        }, 
        [5] = {
            Currency = 700, 
            Experience = 10
        }, 
        [6] = {
            Currency = 800, 
            Experience = 10
        }, 
        [7] = {
            Currency = 900, 
            Experience = 10
        }, 
        [8] = {
            Currency = 1000, 
            Experience = 10
        }, 
        [9] = {
            Currency = 1000, 
            Experience = 10
        }, 
        [10] = {
            Currency = 1500, 
            Experience = 10
        }, 
        [11] = {
            Currency = 1500, 
            Experience = 10
        }, 
        [12] = {
            Currency = 2000, 
            Experience = 10
        }, 
        [13] = {
            Currency = 2000, 
            Experience = 10
        }, 
        [14] = {
            Currency = 2500, 
            Experience = 10
        }, 
        [15] = {
            Currency = 0, 
            Experience = 10
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
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 2, 
                    DeployRate = 3, 
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
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 2, 
                    DeployRate = 3, 
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
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 2, 
                    DeployRate = 3, 
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
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 5
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
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossAnchovy_Blue", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleMedium", 
                    UnitCount = 1, 
                    DeployRate = 3.5, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
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
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
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
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 7
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
                    Speed = 1.2, 
                    Health = 7
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
                    Speed = 1.2, 
                    Health = 7
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 7
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.2, 
                    Health = 7
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
                    UnitName = "WumboAnchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
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
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 6, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 7
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 7
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 7
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 7
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 7
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 7
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
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
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 8
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 8
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 8
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 3, 
                    DeployRate = 4, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 8
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 8
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 8
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.3, 
                    Health = 8
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
                    UnitCount = 4, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 9
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 9
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
                    Speed = 1.4, 
                    Health = 9
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 9
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 9
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 8
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 9
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
                    Speed = 1.4, 
                    Health = 9
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 10
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 9
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 10
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 10
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 10
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 9
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 10
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 10
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
                    UnitName = "WumboAnchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 11
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 11
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 11
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 11
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 11
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 10
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 6, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 11
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
                    UnitCount = 4, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 12
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 12
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossAnchovy_Blue", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 12
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 12
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 12
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 12
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 11
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
                    Speed = 1.4, 
                    Health = 12
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.4, 
                    Health = 11
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
                    Speed = 1.4, 
                    Health = 12
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
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 11
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 13
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 11
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 13
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WumboAnchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.1, 
                    Health = 13
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 13
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 11
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 13
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 13
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 13
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
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 12
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 15
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 12
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 15
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
                    Speed = 1.5, 
                    Health = 15
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Orange", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 15
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 15
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 12
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
                    UnitName = "SnowMollusk", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1.25, 
                    Speed = 1.3, 
                    Health = 10
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 15
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 15
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 12
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 15
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 15
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SpeedyAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 1, 
                    PathID = 1, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 15
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }
    }
};