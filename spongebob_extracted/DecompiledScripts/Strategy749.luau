return {
    SnailMail = {
        displayName = "Snail Mail", 
        aura = 3, 
        image = "rbxassetid://92669059196387", 
        buffs = {
            {
                type = "EnemyStat", 
                name = "Speed", 
                amount = -25
            }
        }, 
        nerfs = {
            {
                type = "TowerStat", 
                name = "Damage", 
                amount = -15
            }
        }
    }, 
    SquilliamsBlessing = {
        displayName = "Squilliams Blessing", 
        aura = 3, 
        image = "rbxassetid://73516521507675", 
        buffs = {
            {
                type = "TowerStat", 
                name = "Damage", 
                amount = 20
            }, 
            {
                type = "TowerStat", 
                name = "Range", 
                amount = 20
            }
        }, 
        nerfs = {
            {
                type = "GoldIncome", 
                amount = -50
            }, 
            {
                type = "EnemyStat", 
                name = "Speed", 
                amount = 25
            }
        }
    }, 
    WennieHutJr = {
        displayName = "Wennie Hut Jr.", 
        aura = 3, 
        image = "rbxassetid://86531326472358", 
        buffs = {
            {
                type = "EnemyStat", 
                name = "Health", 
                amount = -50
            }
        }, 
        nerfs = {
            {
                type = "TowerStat", 
                name = "Range", 
                amount = -50
            }
        }
    }, 
    LagSwitch = {
        displayName = "Lag Switch", 
        aura = 5, 
        image = "rbxassetid://136630016406732", 
        buffs = {
            {
                type = "TowerStat", 
                name = "Damage", 
                amount = 50
            }
        }, 
        nerfs = {
            {
                type = "EnemyStat", 
                name = "Speed", 
                amount = 100
            }
        }
    }, 
    LeakyBubbleWand = {
        displayName = "Leaky Bubble Wand", 
        aura = 5, 
        image = "rbxassetid://140517637212814", 
        buffs = {
            {
                type = "TowerStat", 
                unitTypeInclusion = "Splash", 
                name = "Range", 
                amount = 100
            }
        }, 
        nerfs = {
            {
                type = "TowerStat", 
                unitTypeExclusion = "Splash", 
                name = "Cooldown", 
                amount = 25
            }
        }
    }, 
    MermaidMansMagnifier = {
        displayName = "Mermaid Man's Magnifier", 
        aura = 5, 
        image = "rbxassetid://121837540518885", 
        buffs = {
            {
                type = "TowerStat", 
                unitTypeInclusion = "Line", 
                name = "Damage", 
                amount = 100
            }
        }, 
        nerfs = {
            {
                type = "TowerStat", 
                unitTypeExclusion = "Line", 
                name = "Cooldown", 
                amount = 200
            }
        }
    }, 
    SquidwardsPrecisionTools = {
        displayName = "Squidward's Precision Tools", 
        aura = 5, 
        image = "rbxassetid://97529034516492", 
        buffs = {
            {
                type = "TowerStat", 
                unitTypeInclusion = "Single", 
                name = "Damage", 
                amount = 100
            }
        }, 
        nerfs = {
            {
                type = "TowerStat", 
                unitTypeExclusion = "Single", 
                name = "Cooldown", 
                amount = 50
            }
        }
    }, 
    SandysTexanOverclock = {
        displayName = "Sandy's Texan Overclock", 
        aura = 5, 
        image = "rbxassetid://107808939083643", 
        buffs = {
            {
                type = "TowerStat", 
                unitTypeInclusion = "Full", 
                name = "Range", 
                amount = 50
            }
        }, 
        nerfs = {
            {
                type = "EnemyStat", 
                name = "Speed", 
                amount = 25
            }
        }
    }, 
    PlanktonsPrototypePulse = {
        displayName = "Plankton's Prototype Pulse", 
        aura = 5, 
        image = "rbxassetid://99915935169793", 
        buffs = {
            {
                type = "TowerStat", 
                unitTypeInclusion = "Pierce", 
                name = "Cooldown", 
                amount = -50
            }
        }, 
        nerfs = {
            {
                type = "EnemyStat", 
                name = "Health", 
                amount = 25
            }
        }
    }, 
    BASEiclyDoneFor = {
        displayName = "BASEicly Done For", 
        aura = 7, 
        image = "rbxassetid://88990730279997", 
        buffs = {
            {
                type = "TowerStat", 
                name = "Range", 
                amount = 100
            }
        }, 
        nerfs = {
            {
                type = "BaseHealth", 
                amount = 1
            }
        }
    }, 
    CurseBGone = {
        displayName = "Curse-B-Gone", 
        aura = 13, 
        image = "rbxassetid://102526360118915", 
        buffs = {
            {
                type = "BurnCurse", 
                amount = 1
            }
        }, 
        nerfs = {
            {
                type = "Blank", 
                amount = 1
            }
        }
    }
};