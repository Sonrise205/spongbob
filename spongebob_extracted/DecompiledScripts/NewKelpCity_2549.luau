return {
    Name = "Hard", 
    DisplayName = "Pro Difficulty", 
    RecommendedPlayerLevel = {
        Normal = 1, 
        Hard = 5, 
        Nightmare = 60
    }, 
    Description = "", 
    Map = "NewKelpCity", 
    UnlockCondition = {
        PlayerLevel = 1, 
        PreviousChapterCompleted = nil
    }, 
    Lighting = "Universal.Afternoon", 
    MaxGameSpeed = 3, 
    TripleSpeedUnlocked = true, 
    PathUnlocks = {
        [1] = 0, 
        [2] = 1, 
        [3] = 1, 
        [4] = 0, 
        [5] = 0, 
        [6] = 0
    }, 
    PresetLoadout = {
        {
            UnitName = "ElasticWaistband", 
            ExtraData = {
                Level = 50, 
                Trait = {
                    Name = "Pursuit"
                }, 
                Shiny = true, 
                Mega = true
            }
        }, 
        {
            UnitName = "BandSandy", 
            ExtraData = {
                Level = 50, 
                Trait = {
                    Name = "Pursuit"
                }, 
                Shiny = true
            }
        }, 
        {
            UnitName = "MermaidManSpongebob", 
            ExtraData = {
                Level = 30, 
                Trait = {
                    Name = "Pursuit"
                }
            }
        }, 
        {
            UnitName = "FlyingDutchman", 
            ExtraData = {
                Level = 25, 
                Trait = {
                    Name = "Pursuit"
                }
            }
        }, 
        {
            UnitName = "Squog", 
            ExtraData = {
                Level = 25, 
                Trait = {
                    Name = "Pursuit"
                }
            }
        }, 
        {
            UnitName = "Dennis", 
            ExtraData = {
                Level = 20, 
                Trait = {
                    Name = "Pursuit"
                }
            }
        }
    }, 
    Rewards = {
        Hard = {
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
                type = "Currency", 
                name = "KelpDollar", 
                amount = 50
            }, 
            {
                type = "Experience", 
                amount = 375
            }
        }
    }, 
    LootRewards = {
        Hard = {
            {
                type = "Unit", 
                name = "MorbidSpongebob", 
                amount = 1, 
                weight = 1.5
            }, 
            {
                type = "Unit", 
                name = "MorbidSpongebob", 
                amount = 1, 
                weight = 1, 
                extraData = {
                    Shiny = true
                }
            }, 
            {
                type = "Unit", 
                name = "MorbidSpongebob", 
                amount = 1, 
                weight = 0.5, 
                extraData = {
                    Mega = true
                }
            }, 
            {
                type = "Unit", 
                name = "MorbidSpongebob", 
                amount = 1, 
                weight = 0.25, 
                extraData = {
                    Shiny = true, 
                    Mega = true
                }
            }
        }
    }, 
    Base = {
        Health = 100, 
        StarterGold = 1000
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
            EnemyHealthRate = 25, 
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
            EnemyHealthRate = 50, 
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
            EnemyHealthRate = 715, 
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
            Currency = 800, 
            Experience = 8
        }, 
        [6] = {
            Currency = 800, 
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
            Currency = 800, 
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
            Currency = 800, 
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
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 2, 
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
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 2, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
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
                    PathID = 3, 
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
                    UnitName = "ChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 3, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 8, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    PathID = 2, 
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
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
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
                    DeployRate = 3, 
                    PathID = 3, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.5
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
                    UnitName = "BossAnchovy_Yellow", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 2, 
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
                    PathID = 3, 
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
                    UnitName = "BossSlowAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.5
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
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 2, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 2, 
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
                    DeployRate = 1, 
                    PathID = 3, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 2, 
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
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.75
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.75
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 2, 
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
                    UnitName = "BossArmoredAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.75
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 2, 
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
                    UnitName = "BossArmoredAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.25
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
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
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.75
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.75
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
                    UnitName = "WumboSlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.65
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 10, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.75
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
                    PathID = 3, 
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 7, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "BossArmoredAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 5, 
                    DeployRate = 2, 
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
                    UnitName = "WumboSlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 8, 
                    DeployRate = 2, 
                    PathID = 2, 
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.25
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
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "WumboAnchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleMedium", 
                    UnitCount = 5, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WumboAnchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "PlanktonMedium", 
                    UnitCount = 4, 
                    DeployRate = 1, 
                    PathID = 2, 
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
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
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.85
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 14, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.85
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
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.1
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.1
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 8, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.2
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
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.2
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.25
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
                    UnitName = "BossAnchovy_Yellow", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.2
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSlowAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.25
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
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossAnchovy_Orange", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.3
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.95
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.95
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "BossArmoredAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "BossArmoredAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "WumboSlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.75
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 10, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "WumboAnchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 7, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossArmoredAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "WumboSlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 8, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.5
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
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WumboAnchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleMedium", 
                    UnitCount = 5, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WumboAnchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "PlanktonMedium", 
                    UnitCount = 4, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.75
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 14, 
                    DeployRate = 2, 
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
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.6
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.6
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 8, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
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
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
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
                    DeployRate = 3, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
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
                    UnitName = "BossAnchovy_Yellow", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSlowAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
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
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossAnchovy_Orange", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.05
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.05
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "BossArmoredAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "BossArmoredAnchovy", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.25
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "WumboSlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 10, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.9
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 7, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossArmoredAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.9
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
                    UnitName = "WumboSlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 0.95
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 8, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.9
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
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.9
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
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "WumboAnchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleMedium", 
                    UnitCount = 5, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "WumboAnchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
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
                    UnitName = "PlanktonMedium", 
                    UnitCount = 4, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 5, 
                    DeployRate = 2, 
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
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 5, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 14, 
                    DeployRate = 2, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 2, 
                    DeployRate = 2, 
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
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 2, 
                    DeployRate = 2, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
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
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 8, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
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
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
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
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish2", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 6, 
                    DeployRate = 2, 
                    PathID = 3, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 2, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.75
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }
    }
};