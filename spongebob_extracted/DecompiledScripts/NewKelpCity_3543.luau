return {
    Name = "Nightmare", 
    DisplayName = "Master Difficulty", 
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
    Lighting = "Universal.NightCity", 
    MaxGameSpeed = 3, 
    TripleSpeedUnlocked = true, 
    PathUnlocks = {
        [1] = 0, 
        [2] = 0, 
        [3] = 0, 
        [4] = 1, 
        [5] = 1, 
        [6] = 1
    }, 
    PresetLoadout = {
        {
            UnitName = "GrannyTentacles", 
            ExtraData = {
                Level = 50, 
                Trait = {
                    Name = "Surge", 
                    Tier = 3
                }, 
                Shiny = true, 
                Mega = true
            }
        }, 
        {
            UnitName = "MusclebobBuffpants", 
            ExtraData = {
                Level = 40, 
                Trait = {
                    Name = "Pursuit"
                }
            }
        }, 
        {
            UnitName = "DreamPatrick", 
            ExtraData = {
                Level = 40, 
                Trait = {
                    Name = "Pursuit"
                }
            }
        }, 
        {
            UnitName = "GoofyGoober", 
            ExtraData = {
                Level = 30, 
                Trait = {
                    Name = "Pursuit"
                }, 
                Trait2 = {
                    Name = "Vortex"
                }
            }
        }, 
        {
            UnitName = "BusStation", 
            ExtraData = {
                Level = 30, 
                Trait = {
                    Name = "Pursuit"
                }
            }
        }, 
        {
            UnitName = "HashSlingingSlasher", 
            ExtraData = {
                Level = 25, 
                Trait = {
                    Name = "Pursuit"
                }
            }
        }
    }, 
    Rewards = {
        Nightmare = {
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
                type = "Currency", 
                name = "KelpDollar", 
                amount = 75
            }, 
            {
                type = "Experience", 
                amount = 500
            }
        }
    }, 
    LootRewards = {
        Nightmare = {
            {
                type = "Unit", 
                name = "MorbidSpongebob", 
                amount = 1, 
                weight = 2
            }, 
            {
                type = "Unit", 
                name = "MorbidSpongebob", 
                amount = 1, 
                weight = 1.5, 
                extraData = {
                    Shiny = true
                }
            }, 
            {
                type = "Unit", 
                name = "MorbidSpongebob", 
                amount = 1, 
                weight = 1, 
                extraData = {
                    Mega = true
                }
            }, 
            {
                type = "Unit", 
                name = "MorbidSpongebob", 
                amount = 1, 
                weight = 0.5, 
                extraData = {
                    Shiny = true, 
                    Mega = true
                }
            }
        }
    }, 
    Base = {
        Health = 100, 
        StarterGold = 2500
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
            EnemyHealthRate = 10, 
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
            EnemyHealthRate = 44, 
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
            EnemyHealthRate = 55, 
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
            EnemyHealthRate = 731.28, 
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
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
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
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    PathID = 5, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "PlanktonMedium", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 6, 
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
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
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
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
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
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleLarge", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    DeployRate = 6, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
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
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 5, 
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
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 5, 
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
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
                    UnitName = "NewKelpGangLeader", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1, 
                    IsBoss = true
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 5, 
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 5, 
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
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
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
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 2, 
                    DeployRate = 12, 
                    PathID = 4, 
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 5, 
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
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 0.7, 
                    Health = 2
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
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
                    UnitName = "NewKelpGangLeader", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.3, 
                    IsBoss = true
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 1.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 0.7, 
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
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
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
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 6, 
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
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
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
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 9, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleLarge", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.1
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.2
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.2
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.2
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.3
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
                    UnitName = "NewKelpGangLeader", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.6, 
                    IsBoss = true
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 2, 
                    DeployRate = 12, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.4
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 0.7, 
                    Health = 3.5
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 3.5
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
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
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
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 3.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "NewKelpGangLeader", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3, 
                    IsBoss = true
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 3.6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.6
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 0.7, 
                    Health = 3.6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.6
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
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.7
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
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
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Yellow", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
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
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
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
                    PathID = 5, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
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
                    PathID = 5, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Anchovy_Blue", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
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
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
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
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleLarge", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 2.8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.8
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.9
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ChumControlledFish", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 2, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "ArmoredAnchovy", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SlowAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 3.9
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
                    UnitName = "NewKelpGangLeader", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4, 
                    IsBoss = true
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 4, 
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 5, 
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
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
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
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 2, 
                    DeployRate = 12, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 0.7, 
                    Health = 4
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.2
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
                    UnitName = "NewKelpGangLeader", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2, 
                    IsBoss = true
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 0.7, 
                    Health = 4.2
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
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlatsTheFlounder", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.2
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 4.2
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BossSpeedyAnchovy", 
                    UnitCount = 1, 
                    DeployRate = 4.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1.5, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 2, 
                    DeployRate = 12, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
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
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 1, 
                    DeployRate = 6, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 0.7, 
                    Health = 4.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 4, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.2
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
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 0.7, 
                    Health = 4.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.3
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
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.3
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
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 4.3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonSmall", 
                    UnitCount = 2, 
                    DeployRate = 3, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
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
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Dennis", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 4.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.4
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
                    UnitName = "NewKelpGangLeader", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 4, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.5, 
                    IsBoss = true
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "FlyingDutchman", 
                    UnitCount = 1, 
                    DeployRate = 12, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 5, 
                    Scale = 1.5, 
                    Speed = 1, 
                    Health = 4.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jellyfish2", 
                    UnitCount = 1, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Scale = 1.25, 
                    Speed = 1, 
                    Health = 4.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 3, 
                    PathID = 4, 
                    Scale = 1.25, 
                    Speed = 0.7, 
                    Health = 4.5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "DirtyBubbleSmall", 
                    UnitCount = 1, 
                    DeployRate = 1, 
                    PathID = 6, 
                    Scale = 1, 
                    Speed = 1, 
                    Health = 4.5
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }
    }
};