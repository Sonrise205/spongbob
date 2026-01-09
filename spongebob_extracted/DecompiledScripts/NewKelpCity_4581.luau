return {
    Name = "Davy Jones", 
    DisplayName = "Extreme Difficulty", 
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
    Lighting = "NewKelpCity.BurningCity", 
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
            UnitName = "Planktonamor", 
            ExtraData = {
                Level = 80, 
                Trait = {
                    Name = "SecretFormula"
                }, 
                Trait2 = {
                    Name = "Sidekick"
                }, 
                Stars = 3, 
                Shiny = true
            }
        }, 
        {
            UnitName = "DarkKnight", 
            ExtraData = {
                Level = 70, 
                Trait = {
                    Name = "SecretFormula"
                }, 
                Stars = 2, 
                Trait2 = {
                    Name = "Sidekick"
                }, 
                Shiny = true
            }
        }, 
        {
            UnitName = "MermaidMan", 
            ExtraData = {
                Level = 50, 
                Trait = {
                    Name = "Pursuit"
                }
            }
        }, 
        {
            UnitName = "GGRockSpongebob", 
            ExtraData = {
                Level = 50, 
                Trait = {
                    Name = "Pursuit"
                }
            }
        }, 
        {
            UnitName = "SquidasaurusRex", 
            ExtraData = {
                Level = 25, 
                Trait = {
                    Name = "Pursuit"
                }
            }
        }, 
        {
            UnitName = "PatrickSandRobot", 
            ExtraData = {
                Level = 20, 
                Trait = {
                    Name = "Pursuit"
                }
            }
        }
    }, 
    Rewards = {
        ["Davy Jones"] = {
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
                type = "Currency", 
                name = "KelpDollar", 
                amount = 100
            }, 
            {
                type = "Experience", 
                amount = 700
            }
        }
    }, 
    LootRewards = {
        ["Davy Jones"] = {
            {
                type = "Unit", 
                name = "MorbidSpongebob", 
                amount = 1, 
                weight = 3
            }, 
            {
                type = "Unit", 
                name = "MorbidSpongebob", 
                amount = 1, 
                weight = 2.5, 
                extraData = {
                    Shiny = true
                }
            }, 
            {
                type = "Unit", 
                name = "MorbidSpongebob", 
                amount = 1, 
                weight = 1.5, 
                extraData = {
                    Mega = true
                }
            }, 
            {
                type = "Unit", 
                name = "MorbidSpongebob", 
                amount = 1, 
                weight = 1, 
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
            EnemySpeedRate = 0.85, 
            EnemyHealthRate = 60, 
            ExperiencePointsModifier = 1.1, 
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
            Currency = 1200, 
            Experience = 16
        }, 
        [11] = {
            Currency = 1200, 
            Experience = 24
        }, 
        [12] = {
            Currency = 1200, 
            Experience = 24
        }, 
        [13] = {
            Currency = 1200, 
            Experience = 24
        }, 
        [14] = {
            Currency = 1200, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 1
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
                    PathID = 4, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "SandCreature", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 1.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 1.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 1.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 1.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 1
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 1.4
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
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 1.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 1.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 1.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 1.1, 
                    Speed = 0.55, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 1.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 2.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 2.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 2
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
                    PathID = 4, 
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
                    PathID = 4, 
                    Health = 2.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 2.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 1.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 2.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 1.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 2.4
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
                    PathID = 5, 
                    Health = 2.8
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
                    PathID = 4, 
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
                    UnitName = "Tiff", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 4, 
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
                    PathID = 5, 
                    Health = 3.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 3.1
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 3.1
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
                    PathID = 5, 
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 3.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 4, 
                    Health = 3.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 3.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 1.7
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
                    PathID = 4, 
                    Health = 3.4
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
                    PathID = 5, 
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
                    UnitName = "Jojo", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Health = 3.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 1.1, 
                    Speed = 0.75, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Health = 2.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 3.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 2.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 3.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 3.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 6, 
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 3.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 4
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
                    PathID = 6, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    UnitName = "Jojo", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 5, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SeaBear", 
                    UnitCount = 2, 
                    DeployRate = 7, 
                    PathID = 6, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 3.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 6, 
                    Health = 4.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
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
                    PathID = 4, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 4.6
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
                    PathID = 6, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 5, 
                    Health = 4.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 3.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 7, 
                    PathID = 5, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    PathID = 5, 
                    Health = 4.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Health = 4.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 4, 
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
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 1.1, 
                    Speed = 0.75, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 3
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 6, 
                    Health = 4.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 5
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
                    PathID = 4, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 5, 
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
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5
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
                    PathID = 4, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SandCreature", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
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
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.2
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
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 5.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.2
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 4.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.2
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 1.1, 
                    Speed = 0.55, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 3.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 5.2
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
                    PathID = 4, 
                    Health = 5.3
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
                    PathID = 4, 
                    Health = 5.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 5.3
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.3
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
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.4
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
                    PathID = 5, 
                    Health = 5.4
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
                    PathID = 4, 
                    Health = 5.4
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
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 4, 
                    Health = 5.4
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
                    PathID = 5, 
                    Health = 5.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.4
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
                    PathID = 5, 
                    Health = 5.4
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 4, 
                    Health = 5.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.4
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.4
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
                    PathID = 4, 
                    Health = 5.4
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
                    PathID = 5, 
                    Health = 5.4
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
                    PathID = 4, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 1.1, 
                    Speed = 0.75, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Health = 3.75
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Health = 5.5
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 10
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.5
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
                    PathID = 6, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.5
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
                    PathID = 5, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 6, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 5.5
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
                    PathID = 4, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 5.6
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
                    PathID = 6, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 5, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Health = 5.6
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 7, 
                    PathID = 5, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Health = 5.6
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
                    PathID = 5, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 4, 
                    Health = 5.6
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
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 1.1, 
                    Speed = 0.75, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 4
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 6, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 5.6
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
                    PathID = 4, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 5.6
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.6
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
                    PathID = 4, 
                    Health = 5.6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.6
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
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
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
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.7
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
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
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
                    UnitName = "NewKelpThug3", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 1.1, 
                    Speed = 0.55, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 4.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 5.7
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
                    PathID = 4, 
                    Health = 5.7
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
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
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
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.7
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
                    PathID = 5, 
                    Health = 5.7
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
                    PathID = 4, 
                    Health = 5.7
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
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 4, 
                    Health = 5.7
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
                    PathID = 5, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
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
                    PathID = 5, 
                    Health = 5.7
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
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 4, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.7
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.7
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
                    PathID = 4, 
                    Health = 5.7
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
                    PathID = 5, 
                    Health = 5.7
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
                    PathID = 4, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 1.1, 
                    Speed = 0.75, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Health = 4.75
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Health = 5.8
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.8
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
                    PathID = 6, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.8
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
                    PathID = 5, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 6, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 5.8
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
                    PathID = 4, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SeaBear", 
                    UnitCount = 2, 
                    DeployRate = 7, 
                    PathID = 4, 
                    Health = 5.8
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
                    PathID = 6, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 5, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Health = 5.8
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 7, 
                    PathID = 5, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Health = 5.8
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
                    PathID = 5, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Health = 5.8
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 4, 
                    Health = 5.8
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
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 1.1, 
                    Speed = 0.75, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 5
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 6, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 5.9
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
                    PathID = 4, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 5.9
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 4, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 8
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.9
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
                    PathID = 6, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "PlanktonMedium", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.9
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
                    PathID = 5, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SeaBear", 
                    UnitCount = 2, 
                    DeployRate = 7, 
                    PathID = 6, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 3, 
                    DeployRate = 2, 
                    PathID = 6, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 5.9
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
                    PathID = 4, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "BigJellyfish1", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 5.9
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
                    PathID = 6, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug2", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 5, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 5.9
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 1, 
                    DeployRate = 0, 
                    PathID = 6, 
                    Health = 5.9
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
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 3, 
                    DeployRate = 7, 
                    PathID = 5, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 5
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 4, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Jojo", 
                    UnitCount = 3, 
                    DeployRate = 5, 
                    PathID = 4, 
                    Health = 6
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
                    PathID = 5, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 7
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish3", 
                    UnitCount = 5, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 6
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 4, 
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
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpGangLeader", 
                    IsBoss = true, 
                    UnitCount = 1, 
                    Scale = 1.1, 
                    Speed = 0.75, 
                    DeployRate = 0, 
                    PathID = 5, 
                    Health = 5.5
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpMuscularThug", 
                    UnitCount = 2, 
                    DeployRate = 5, 
                    PathID = 6, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 2
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "Tiff", 
                    UnitCount = 4, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 6
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
                    PathID = 4, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 3
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug1", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 5, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "SkeletonFish2", 
                    UnitCount = 4, 
                    DeployRate = 1.5, 
                    PathID = 6, 
                    Health = 6
                }, 
                {
                    Type = "Interval", 
                    Duration = 4
                }, 
                {
                    Type = "EnemySpawn", 
                    UnitName = "NewKelpThug3", 
                    UnitCount = 2, 
                    DeployRate = 2, 
                    PathID = 5, 
                    Health = 6
                }, 
                {
                    Type = "WaveEnd"
                }
            }
        }
    }
};