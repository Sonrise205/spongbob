local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local _ = game:GetService("RunService");
local v3 = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local _ = require(l_ReplicatedFirst_0.PlaceIds);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
local v6 = {
    LOADOUT_LEVELS = {
        [1] = 1, 
        [2] = 1, 
        [3] = 1, 
        [4] = 5, 
        [5] = 10, 
        [6] = 25
    }, 
    PLAYER_IMAGE_URL = "rbxthumb://type=AvatarHeadShot&id=%d&w=180&h=180", 
    MAX_STORAGE_UPGRADE = 10, 
    FIRST_CLEAR_REWARDS = {
        Normal = {
            type = "Currency", 
            name = "Gems", 
            amount = 70
        }, 
        Hard = {
            type = "Currency", 
            name = "Gems", 
            amount = 100
        }, 
        Nightmare = {
            type = "Currency", 
            name = "Gems", 
            amount = 120
        }, 
        ["Davy Jones"] = {
            type = "Currency", 
            name = "Gems", 
            amount = 150
        }
    }, 
    MINTING = {
        RARITIES = {
            Exotic = true, 
            Prismatic = true
        }, 
        TYPES = {
            Units = true, 
            Pets = true
        }, 
        UNITS = {
            BunkerBoys = true, 
            RedbeardKrabs = true
        }, 
        PETS = {}
    }, 
    MARKETPLACE = {
        MAX_SLOTS = 24
    }, 
    INFLUENCER_IDS = {
        650455751, 
        5005243973, 
        193016059, 
        121567432, 
        3454510208, 
        2817516344, 
        113006766, 
        478515580, 
        142335175, 
        3072683698, 
        5639016840, 
        2349806440, 
        1514415740, 
        4361441445, 
        3302796302, 
        3659086809, 
        918312661, 
        779900081, 
        4712380173, 
        19256410, 
        3826201069, 
        2893983381, 
        448711692, 
        707412972, 
        264465850, 
        53776651, 
        2766167618
    }, 
    MOD_IDS = {
        122436262, 
        5253902128, 
        154747729, 
        585705573, 
        20156359, 
        1472901147, 
        1914069651
    }, 
    TRADING = {
        DEBOUNCE = 0.15, 
        ATTRIBUTE = "Trading", 
        MAX_USER_ID_HISTORY = 2000, 
        LEVEL_REQUIREMENT = 15, 
        NOTIFICATION_TIME = 5, 
        READY_RESET_TIME = 3, 
        CONFIRM_TIME = 5, 
        MAX_STACK = 200, 
        SETTINGS = {
            [1] = "All", 
            [2] = "Friends", 
            [3] = "Disabled"
        }, 
        CHAT = {
            WARNINGS = {
                SAFETY = "This is a private chat. Report any inappropriate behavior with the Roblox Menu.", 
                FAILURE = "Failed to send message", 
                DEBOUNCE = "Please wait before sending another message"
            }, 
            DEBOUNCE = 0.5, 
            MAX_MESSAGE_LENGTH = 200, 
            MAX_MESSAGE_COUNT = 50, 
            COLORS = {
                SYSTEM = Color3.fromRGB(253, 255, 128), 
                SELF = Color3.fromRGB(158, 207, 229), 
                OTHER = Color3.new(1, 1, 1)
            }
        }
    }, 
    PARTIES = {
        PARTY_BOOSTS = {
            [2] = 0.1, 
            [3] = 0.25, 
            [4] = 0.5
        }, 
        MAX_PARTY_SIZE = 4
    }, 
    CUTSCENES = {
        DURATIONS = {
            MermalairPathCutscene = 7, 
            BubbleBowlPathCutscene = 10, 
            ShipPathCutscene = 4, 
            ["MiddleAgesCutscene_2-3"] = 10, 
            MiddleAgesCutscene_4 = 13, 
            ["MiddleAgesCutscene_5-6"] = 10, 
            BossBattleIntro = 1.5
        }
    }, 
    IN_GAME = {
        CUTSCENE_DELAY = 1, 
        RANGE_VISUAL_REDUCTION = 1, 
        AUTO_START = 30, 
        SKIP_TIMEOUT = 60, 
        SPEED_OPTIONS = {
            [1] = 1, 
            [2] = 2.5, 
            [3] = 3, 
            [4] = 5, 
            [5] = 7
        }, 
        ENDLESS_DIFFICULTY_INCREASE = 1.2, 
        CONDITIONS = {
            JellyfishJam = {
                icon = "rbxassetid://79631344091845", 
                richDescription = "<font color=\"#53ff2c\">-10% SPA</font> while in radius of a unit with <font color=\"#ff23ff\">Jellyfish Jam</font>!", 
                plainDescription = "-10% SPA while in radius of a unit with Jellyfish Jam!", 
                colors = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#ffaff0")), 
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#ff23ff"))
                })
            }, 
            Dizzy = {
                icon = "rbxassetid://105119693636734", 
                richDescription = "", 
                plainDescription = "", 
                colors = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#ffe500")), 
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#ff9100"))
                })
            }, 
            Dry = {
                icon = "rbxassetid://117193141278927", 
                richDescription = "<font color=\"#ff2c30\">-50% ALL STATS </font>while outside of <font color=\"#2bfbff\">Water</font>", 
                plainDescription = "-50% ALL STATS while outside of Water", 
                colors = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#ffd830")), 
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#b44c0a"))
                })
            }, 
            Cold = {
                icon = "rbxassetid://139668679174944", 
                richDescription = "<font color=\"#ff2c30\">-50% ALL STATS </font>while outside of <font color=\"#ffa71a\">Warmth</font>", 
                plainDescription = "-50% ALL STATS while outside of Warmth", 
                colors = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#b1f6ff")), 
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#07b9d1"))
                })
            }, 
            Tough = {
                icon = "rbxassetid://99963394161585", 
                richDescription = "Enemies are <font color=\"#ff2c30\">+~modifier~% tougher</font> and have extra defense to takedown.", 
                plainDescription = "+~modifier~% tougher enemies", 
                colors = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#8dc3e6")), 
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#434754"))
                })
            }, 
            Speedy = {
                icon = "rbxassetid://76734054102531", 
                richDescription = "Enemies are <font color=\"#ff2c30\">+~modifier~% faster.</font>", 
                plainDescription = "+~modifier~% faster enemies", 
                colors = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#30e6ff")), 
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#0a3fb4"))
                })
            }, 
            Drained = {
                icon = "rbxassetid://130060634327655", 
                richDescription = "Units have their traits' effects <font color=\"#ff2c30\">reduced by 50%</font>", 
                plainDescription = "Units have their traits' effects reduced by 50%", 
                colors = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#fff130")), 
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#b4750a"))
                })
            }, 
            Hardcore = {
                icon = "rbxassetid://91625225077910", 
                richDescription = "Survive to the end without taking any damage", 
                plainDescription = "Survive to the end without taking any damage", 
                colors = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#ff4646")), 
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#740c0c"))
                })
            }, 
            Reverse = {
                icon = "rbxassetid://71345013238816", 
                richDescription = "Course is flipped. The end is now the beginning and vice versa", 
                plainDescription = "Course is flipped. The end is now the beginning and vice versa", 
                colors = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#ca67ff")), 
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#4c1c76"))
                })
            }, 
            Pennypinch = {
                icon = "rbxassetid://130291166458746", 
                richDescription = "All sources of Gold Income are <font color=\"#ff2c30\">reduced by 50%</font>", 
                plainDescription = "All sources of Gold Income are reduced by 50%%", 
                colors = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHex("#9eff00")), 
                    ColorSequenceKeypoint.new(1, Color3.fromHex("#00622a"))
                })
            }
        }
    }, 
    ROGUELIKE = {
        DIFFICULTY_INCREASE = 1.05, 
        MAX_WAVES = 300, 
        MAX_AURA = 13, 
        LOADOUT_RESTRICTIONS = {
            {
                rarities = {
                    "Exotic", 
                    "Secret"
                }, 
                max = 1, 
                message = "You can only have <amount> Exotic or Secret units in your loadout!"
            }, 
            {
                rarities = {
                    "Mythic", 
                    "Limited"
                }, 
                max = 2, 
                message = "You can only have <amount> Mythic or Limited units in your loadout!"
            }
        }, 
        TOWER_STAT_MODIFIERS = {
            "Damage", 
            "Range", 
            "Cooldown"
        }, 
        PER_WAVE_REWARDS = {
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 50
            }, 
            {
                type = "Experience", 
                amount = 100
            }
        }, 
        MODIFIER_TEXT_MAP = {
            TowerStat = {
                Damage = "<amount>% DMG", 
                Range = "<amount>% RNG", 
                Cooldown = "<amount>% SPA"
            }, 
            EnemyStat = {
                Health = "<amount>% ENEMY HP", 
                Speed = "<amount>% ENEMY SPEED"
            }, 
            GoldIncome = "<amount>% GOLD", 
            UpgradeCost = "<amount>%\nUPGRADE COST", 
            BossStat = {
                Health = "<amount>% BOSS HP", 
                Speed = "<amount>% BOSS SPEED"
            }, 
            LoadoutLock = "-<unsignedAmount> RANDOM\nLOADOUT SLOT", 
            BaseHealth = "<unsignedAmount> BASE HP", 
            Aura = "<amount> AURA", 
            Takedown = {
                Gold = "Takedowns\n<amount>% GOLD"
            }, 
            WaveGold = "Wave Bonus\n<amount>% GOLD", 
            BurnCurse = "BURN\n<unsignedAmount> CURSE CARD(S)", 
            Blank = ""
        }, 
        CURSE_CARD_CHANCES = {
            [1] = 25, 
            [2] = 10, 
            [3] = 10, 
            [4] = 5
        }, 
        MILESTONE_REWARDS = {
            {
                wave = 15, 
                crateChances = {
                    25
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 250
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 500
                    }
                }
            }, 
            {
                wave = 30, 
                crateChances = {
                    50
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 500
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 1000
                    }
                }
            }, 
            {
                wave = 45, 
                crateChances = {
                    75
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 750
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 1500
                    }
                }
            }, 
            {
                wave = 60, 
                crateChances = {
                    100
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 1000
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 2000
                    }
                }
            }, 
            {
                wave = 75, 
                crateChances = {
                    100, 
                    25
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 1250
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 2500
                    }
                }
            }, 
            {
                wave = 90, 
                crateChances = {
                    100, 
                    50
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 1500
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 3000
                    }
                }
            }, 
            {
                wave = 105, 
                crateChances = {
                    100, 
                    75
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 1750
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 3500
                    }
                }
            }, 
            {
                wave = 120, 
                crateChances = {
                    100, 
                    100
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 2000
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 4000
                    }
                }
            }, 
            {
                wave = 135, 
                crateChances = {
                    100, 
                    100, 
                    20
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 2250
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 4500
                    }
                }
            }, 
            {
                wave = 150, 
                crateChances = {
                    100, 
                    100, 
                    40
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 2500
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 5000
                    }
                }
            }, 
            {
                wave = 165, 
                crateChances = {
                    100, 
                    100, 
                    60
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 2750
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 5500
                    }
                }
            }, 
            {
                wave = 180, 
                crateChances = {
                    100, 
                    100, 
                    80
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 3000
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 6000
                    }
                }
            }, 
            {
                wave = 195, 
                crateChances = {
                    100, 
                    100, 
                    100
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 3250
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 6500
                    }
                }
            }, 
            {
                wave = 210, 
                crateChances = {
                    100, 
                    100, 
                    100, 
                    10
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 3500
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 7000
                    }
                }
            }, 
            {
                wave = 225, 
                crateChances = {
                    100, 
                    100, 
                    100, 
                    20
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 3750
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 7500
                    }
                }
            }, 
            {
                wave = 240, 
                crateChances = {
                    100, 
                    100, 
                    100, 
                    30
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 4000
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 8000
                    }
                }
            }, 
            {
                wave = 255, 
                crateChances = {
                    100, 
                    100, 
                    100, 
                    50
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 4250
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 8500
                    }
                }
            }, 
            {
                wave = 270, 
                crateChances = {
                    100, 
                    100, 
                    100, 
                    75
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 4500
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 9000
                    }
                }
            }, 
            {
                wave = 285, 
                crateChances = {
                    100, 
                    100, 
                    100, 
                    100
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 4750
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 9500
                    }
                }
            }, 
            {
                wave = 300, 
                crateChances = {
                    100, 
                    100, 
                    100, 
                    100, 
                    100
                }, 
                oneTimeRewards = {
                    {
                        type = "Inventory", 
                        name = "ManRayHotRod", 
                        amount = 1
                    }
                }, 
                rewards = {
                    {
                        type = "Currency", 
                        name = "Gems", 
                        amount = 5000
                    }, 
                    {
                        type = "Currency", 
                        name = "Coins", 
                        amount = 10000
                    }
                }
            }
        }
    }, 
    REWARD_TYPE_EXCLUSIONS = {
        "Experience"
    }, 
    QUEUE = {
        MAX_PLAYERS = 4, 
        MAX_SELECTION_TIME = 45, 
        MAX_START_TIME = {
            Story = 60, 
            Endless = 60, 
            Challenge = 10, 
            Raid = 10, 
            Event = 10, 
            BossBattle = 10, 
            Roguelike = 5, 
            TowerOfKarate = 15
        }, 
        KICKING_ENABLED = true, 
        ENDLESS_DIFFICULTY = 2
    }, 
    AFK = {
        REWARD_INTERVAL = 300, 
        REWARD_INTERVAL_ULTRA_VIP = 180, 
        AUTO_TELEPORT = 840, 
        REFRESH_TIME = 600, 
        VIP_BOOST = 20
    }, 
    VIP_BOOSTS = {
        AFK = 0.2, 
        VIP_XP = 0.1, 
        ULTRA_VIP_XP = 0.15
    }, 
    ANIMATIONS = {
        MAX_LOAD_TIME = 3
    }, 
    TWEENABLE = {
        number = true, 
        CFrame = true, 
        Vector2 = true, 
        Vector2int16 = true, 
        Vector3 = true, 
        Color3 = true, 
        UDim2 = true
    }, 
    UNITS = {
        TEAM_NAME_MAX_CHARS = 28, 
        UNIT_TEMPLATE = {
            Level = 1, 
            Experience = 0, 
            Stars = 0, 
            Shiny = false, 
            Mega = false, 
            _logged = true
        }
    }, 
    TOWERS = {
        TAG = "Tower", 
        RANGE_VIEWER_OFFSET = 0.4, 
        MAX_PLACEMENT_HEIGHT_OFFSET = 1, 
        MEGA_SCALE = 1.65, 
        SUMMON_VFX_SCALE = 0.6, 
        SELL_VFX_EMIT_COUNT = 10, 
        POOF_VFX_EMIT_COUNT = 50, 
        SUMMON_VFX_EMIT_COUNT = 8, 
        PRIORITIES = {
            "FirstInRange", 
            "LastInRange", 
            "Boss", 
            "Fastest", 
            "Strongest"
        }, 
        VFX_SETTINGS = {
            [1] = "Enabled", 
            [2] = "Disabled"
        }, 
        ATTACK_TYPES = {
            [1] = "Full", 
            [2] = "Splash", 
            [3] = "Pierce", 
            [4] = "Line", 
            [5] = "Single", 
            [6] = "Resource", 
            [7] = "Spawn"
        }, 
        ATTACK_TYPE_INDICES = {
            Full = 1, 
            Splash = 2, 
            Pierce = 3, 
            Line = 4, 
            Single = 5, 
            Resource = 6, 
            Spawn = 7
        }, 
        ATTACK_TYPE_VFX_LEGEND = {
            Pierce = "Beam", 
            Line = "Beam", 
            Single = "Beam", 
            Splash = "Splash"
        }, 
        ATTACK_TYPE_ICONS = {
            Full = "rbxassetid://93517851885453", 
            Splash = "rbxassetid://103448521875232", 
            Pierce = "rbxassetid://73938109934960", 
            Line = "rbxassetid://129903892917809", 
            Single = "rbxassetid://83429326080423", 
            Resource = "rbxassetid://123408058910054", 
            Spawn = "rbxassetid://82024499726169"
        }, 
        EFFECT_ICONS = {
            Slow = "rbxassetid://103326155180564", 
            Sleep = "rbxassetid://135596411476681", 
            Burn = "rbxassetid://81632522088124", 
            Shock = "rbxassetid://71374662849406", 
            Frostbite = "rbxassetid://87411598232976", 
            Poison = "rbxassetid://114238296551587"
        }, 
        EFFECT_DESCRIPTIONS = {
            Slow = "Briefly reduces enemy movement speed", 
            Sleep = "Heavily slows enemies, dulling their reactions", 
            Burn = "Ignites enemies, dealing fire damage over time", 
            Shock = "Shocks enemies", 
            Frostbite = "Chills enemies with frost damage and a slowing effect", 
            Poison = "Infects enemies with poison, dealing damage and slowing them"
        }, 
        EFFECT_COLORS = {
            Slow = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHex("#d367ff")), 
                ColorSequenceKeypoint.new(1, Color3.fromHex("#5c4594"))
            }), 
            Sleep = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHex("#3032ff")), 
                ColorSequenceKeypoint.new(1, Color3.fromHex("#8d0ab4"))
            }), 
            Burn = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHex("#ff9330")), 
                ColorSequenceKeypoint.new(1, Color3.fromHex("#b41a0a"))
            }), 
            Shock = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHex("#fff130")), 
                ColorSequenceKeypoint.new(1, Color3.fromHex("#75bd00"))
            }), 
            Frostbite = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHex("#a8ffff")), 
                ColorSequenceKeypoint.new(0.5, Color3.fromHex("#00afb4")), 
                ColorSequenceKeypoint.new(1, Color3.fromHex("#00324e"))
            }), 
            Poison = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHex("#cdff27")), 
                ColorSequenceKeypoint.new(1, Color3.fromHex("#005e17"))
            })
        }
    }, 
    BOOST_NAMES = {
        Coins = "COINS_60", 
        Gems = "GEMS_60", 
        XP = "XP_60", 
        Hearts = "HEARTS_60", 
        Bubbles = "BUBBLES_60", 
        ChallengeToken = "CHALLENGETOKEN_60", 
        FactionPoints = "FACTIONS_60", 
        GoldenSpatula = "GOLDENSPATULA_60", 
        SandDollar = "SANDDOLLAR_60"
    }
};
if v5.Currency and v5.CurrencyBoostName then
    v6.BOOST_NAMES[v5.Currency] = v5.CurrencyBoostName;
end;
v6.DIFFICULTY_NAMES = {
    [1] = "Normal", 
    [2] = "Hard", 
    [3] = "Nightmare", 
    [4] = "Davy Jones"
};
v6.DIFFICULTY_INDEX = {
    Normal = 1, 
    Hard = 2, 
    Nightmare = 3, 
    ["Davy Jones"] = 4
};
v6.RARITIES_FROM_INDEX = {
    [1] = "Common", 
    [2] = "Uncommon", 
    [3] = "Rare", 
    [4] = "Epic", 
    [5] = "Legendary", 
    [6] = "Mythic", 
    [7] = "Secret", 
    [8] = "Exotic", 
    [9] = "Prismatic"
};
v6.RARITIES_FROM_NAME = {
    Common = 1, 
    Uncommon = 2, 
    Rare = 3, 
    Epic = 4, 
    Legendary = 5, 
    Mythic = 6, 
    Limited = 6, 
    Secret = 7, 
    Exotic = 8, 
    Prismatic = 9
};
v6.RARITIES_FROM_INDEX_RNG = {
    [1] = "Common", 
    [2] = "Uncommon", 
    [3] = "Rare", 
    [4] = "Epic", 
    [5] = "Legendary", 
    [6] = "Mythic", 
    [7] = "Limited", 
    [8] = "Secret", 
    [9] = "Exotic", 
    [10] = "Prismatic"
};
v6.RARITIES_FROM_NAME_RNG = {
    Common = 1, 
    Uncommon = 2, 
    Rare = 3, 
    Epic = 4, 
    Legendary = 5, 
    Mythic = 6, 
    Limited = 7, 
    Secret = 8, 
    Exotic = 9, 
    Prismatic = 10
};
v6.ZONES = {
    DARK_ZONE_ATTRIBUTE = "InDark"
};
v6.MOUNTS = {
    DEBOUNCE = 0.5, 
    ATTRIBUTE = "Mounted", 
    TAG = "Mount", 
    PC_KEYBIND = Enum.KeyCode.Tab, 
    GAMEPAD_KEYBIND = Enum.KeyCode.ButtonY
};
v6.SUMMONING = {
    FORCE_SHINY = false, 
    FORCE_MEGA = false, 
    MAX_PITY = {
        Standard = {
            Legendary = 200, 
            Mythic = 400
        }, 
        Exclusive = {
            Legendary = 200, 
            Mythic = 400
        }, 
        Boosted = {
            Legendary = 100, 
            Mythic = 200
        }
    }, 
    TRAIT_PITY = {
        TraitRolls = 10000, 
        GoldenTraitRolls = 5000
    }, 
    MYTHIC_BANNER_WEIGHT_BOOST = 2, 
    GAMEPASS_SHINY_MEGA_BOOSTS = {
        ShinyHunter = {
            shiny = 50, 
            mega = 0
        }, 
        UltraShinyHunter = {
            shiny = 150, 
            mega = 0
        }, 
        WumboHunter = {
            shiny = 0, 
            mega = 50
        }, 
        UltraWumboHunter = {
            shiny = 0, 
            mega = 150
        }
    }, 
    PROGRESSIVE_LUCK_BOOSTS = {
        [1] = {
            Uncommon = 1, 
            Rare = 1, 
            Epic = 1, 
            Legendary = 1, 
            Mythic = 1
        }, 
        [2] = {
            Uncommon = 2.5, 
            Rare = 2.5, 
            Epic = 2.5, 
            Legendary = 2.5, 
            Mythic = 2.5
        }, 
        [3] = {
            Uncommon = 3.25, 
            Rare = 3.25, 
            Epic = 3.25, 
            Legendary = 3.25, 
            Mythic = 3.25
        }, 
        [4] = {
            Uncommon = 4, 
            Rare = 4, 
            Epic = 4, 
            Legendary = 4, 
            Mythic = 4
        }, 
        [5] = {
            Rare = 6, 
            Epic = 6, 
            Legendary = 6, 
            Mythic = 6
        }, 
        [6] = {
            Rare = 7, 
            Epic = 7, 
            Legendary = 7, 
            Mythic = 7
        }, 
        [7] = {
            Rare = 8, 
            Epic = 8, 
            Legendary = 9, 
            Mythic = 9
        }, 
        [8] = {
            Rare = 9, 
            Epic = 9, 
            Legendary = 10, 
            Mythic = 10
        }, 
        [9] = {
            Rare = 10, 
            Epic = 10, 
            Legendary = 11, 
            Mythic = 11
        }, 
        [10] = {
            Rare = 11, 
            Epic = 11, 
            Legendary = 13, 
            Mythic = 13
        }, 
        [11] = {
            Rare = 12, 
            Epic = 12, 
            Legendary = 14, 
            Mythic = 14
        }, 
        [12] = {
            Rare = 13, 
            Epic = 13, 
            Legendary = 15, 
            Mythic = 15
        }, 
        [13] = {
            Rare = 15, 
            Epic = 15, 
            Legendary = 20, 
            Mythic = 25
        }
    }
};
v6.MAX_SAND_CRATES_PRODUCT_TIER = 7;
v6.STARTER_UNITS = {
    "Patrick", 
    "Spongebob", 
    "Squidward"
};
v6.STARTER_TEAMS = {
    [1] = {
        "Spongebob", 
        "BarnacleBoyPatrick", 
        "Pearl"
    }, 
    [2] = {
        "Squidward", 
        "BarnacleBoyPatrick", 
        "Pearl"
    }
};
v6.MAX_UNIT_LEVEL = 50;
v6.MAX_LEVEL_PER_STAR = 10;
v6.UNIT_SELL_PRICES = {
    Common = 15, 
    Uncommon = 25, 
    Rare = 45, 
    Epic = 85, 
    Legendary = 165, 
    Mythic = 325, 
    Secret = 750, 
    Exotic = 1500, 
    Prismatic = 2000
};
v6.SHINY_MEGA_BOOSTS = {
    Shiny = 5, 
    Mega = 10, 
    ShinyMega = 15
};
v6.STAR_BOOSTS = {
    [1] = 5, 
    [2] = 10, 
    [3] = 15, 
    [4] = 20, 
    [5] = 25
};
v6.FUSION = {
    NEEDED = 5, 
    MAX_STARS = 5, 
    COSTS = {
        Common = 1500, 
        Uncommon = 2500, 
        Rare = 3500, 
        Epic = 5000, 
        Legendary = 7500, 
        Mythic = 10000, 
        Limited = 10000, 
        Secret = 15000, 
        Exotic = 20000, 
        Prismatic = 50000
    }, 
    PET_COSTS = {
        Common = 9999999, 
        Uncommon = 9999999, 
        Rare = 2500, 
        Epic = 5000, 
        Legendary = 10000, 
        Mythic = 15000, 
        Limited = 15000, 
        Secret = 25000, 
        Exotic = 35000, 
        Prismatic = 50000
    }
};
v6.SLOW_TRAIT_EFFECT_DURATION = 3;
v6.TOWER_LEVEL_PLAYER_EXP_GAIN = 50;
v6.PLAYER_XP_REQUIREMENTS = {
    [1] = 100, 
    [2] = 150, 
    [3] = 200, 
    [4] = 250, 
    [5] = 350, 
    [6] = 500, 
    [7] = 650, 
    [8] = 700, 
    [9] = 850, 
    [10] = 1044, 
    [11] = 1670, 
    [12] = 1680, 
    [13] = 1689, 
    [14] = 1698, 
    [15] = 1708, 
    [16] = 1718, 
    [17] = 1726, 
    [18] = 1737, 
    [19] = 1746, 
    [20] = 1755, 
    [21] = 1766, 
    [22] = 1774, 
    [23] = 1785, 
    [24] = 1794, 
    [25] = 1804, 
    [26] = 1814, 
    [27] = 1823, 
    [28] = 1834, 
    [29] = 1843, 
    [30] = 1854, 
    [31] = 1863, 
    [32] = 1873, 
    [33] = 1883, 
    [34] = 1893, 
    [35] = 1902, 
    [36] = 1914, 
    [37] = 1922, 
    [38] = 1934, 
    [39] = 1943, 
    [40] = 1953, 
    [41] = 1964, 
    [42] = 1974, 
    [43] = 1984, 
    [44] = 1994, 
    [45] = 2005, 
    [46] = 2014, 
    [47] = 2026, 
    [48] = 2035, 
    [49] = 2046, 
    [50] = 2056, 
    [51] = 2066, 
    [52] = 2078, 
    [53] = 2087, 
    [54] = 2098, 
    [55] = 2109, 
    [56] = 2119, 
    [57] = 2130, 
    [58] = 2140, 
    [59] = 2151, 
    [60] = 2162, 
    [61] = 2172, 
    [62] = 2183, 
    [63] = 2194, 
    [64] = 2205, 
    [65] = 2215, 
    [66] = 2226, 
    [67] = 2237, 
    [68] = 2248, 
    [69] = 2258, 
    [70] = 2270, 
    [71] = 2281, 
    [72] = 2292, 
    [73] = 2302, 
    [74] = 2314, 
    [75] = 2325, 
    [76] = 2335, 
    [77] = 2347, 
    [78] = 2358, 
    [79] = 2370, 
    [80] = 2380, 
    [81] = 2391, 
    [82] = 2403, 
    [83] = 2414, 
    [84] = 2426, 
    [85] = 2437, 
    [86] = 2448, 
    [87] = 2459, 
    [88] = 2471, 
    [89] = 2482, 
    [90] = 2494, 
    [91] = 2506, 
    [92] = 2517, 
    [93] = 2528, 
    [94] = 2539, 
    [95] = 2552, 
    [96] = 2562, 
    [97] = 2574, 
    [98] = 2586, 
    [99] = 2598, 
    [100] = 2610
};
v6.PLAYER_XP_REWARDS = {
    WORLD_ACHIEVEMENT = 100, 
    UNIT_ACHIEVEMENT = 150, 
    FUSION_ACHIEVEMENT = 250, 
    TOWER_LEVEL = 50
};
v6.PLAYER_SEASON_XP_REWARDS = {
    WORLD_ACHIEVEMENT = 100, 
    UNIT_ACHIEVEMENT = 150, 
    FUSION_ACHIEVEMENT = 250, 
    TOWER_LEVEL = 50, 
    Story = {
        Normal = 100, 
        Hard = 150, 
        Nightmare = 250, 
        ["Davy Jones"] = 350
    }, 
    Raid = {
        Hard = 250, 
        Nightmare = 500, 
        ["Davy Jones"] = 600
    }
};
v6.PRESTIGE = {
    MAX_PRESTIGE = 10, 
    BASE_MAX_LEVEL = 100, 
    FINAL_MAX_LEVEL = 1000, 
    XP_MULTIPLIERS = {
        [1] = 1.25, 
        [2] = 1.35, 
        [3] = 1.5, 
        [4] = 1.75, 
        [5] = 2, 
        [6] = 2.25, 
        [7] = 2.5, 
        [8] = 2.75, 
        [9] = 3, 
        [10] = 4
    }, 
    TITLES = {
        [0] = "NO PRESTIGE", 
        [1] = "PRESTIGE I", 
        [2] = "PRESTIGE II", 
        [3] = "PRESTIGE III", 
        [4] = "PRESTIGE IV", 
        [5] = "PRESTIGE V", 
        [6] = "PRESTIGE VI", 
        [7] = "PRESTIGE VII", 
        [8] = "PRESTIGE VIII", 
        [9] = "PRESTIGE IX", 
        [10] = "PRESTIGE X", 
        Master = "PRESTIGE MASTER"
    }
};
v6.SEASON_PASS = {
    MAX_LEVEL = 50
};
v6.CHAPTER_COINS_REWARDS = {
    Raid = {
        Hard = 500, 
        Nightmare = 750, 
        ["Davy Jones"] = 850
    }
};
v6.CHAPTER_FACTION_POINT_REWARDS = {
    Story = {
        Normal = 1, 
        Hard = 3, 
        Nightmare = 5, 
        ["Davy Jones"] = 7
    }, 
    Raid = {
        Hard = 10, 
        Nightmare = 15, 
        ["Davy Jones"] = 20
    }
};
v6.DEFAULT_MAX_UNITS = 100;
v6.LEVEL_LOCK_FEATURES = {
    Codes = 10
};
v6.SEASON = 12;
v6.SEASON_PASS_NAME = "PremiumSeasonPass";
v6.TRAIT_REROLL_COSTS = {
    Unlocked = 1, 
    Locked = 3
};
v6.TRAIT_REROLL_CURRENCIES = {
    "TraitRolls", 
    "GoldenTraitRolls"
};
v6.MAX_SUMMON_AMOUNT = 50;
v6.VDAY_PRESENT_INFO = {
    type = "Inventory", 
    name = "Parade Present", 
    amount = 1, 
    cost = {
        currency = "Hearts", 
        amount = 250
    }
};
v6.DAILY_LOGIN = {
    RESET_HOURS = 16
};
v6.SEA_RHINO_DROP_CHANCES = {
    Story = {
        Normal = 0.25, 
        Shiny = 0.125, 
        Wumbo = 0.075, 
        ShinyWumbo = 0.025
    }, 
    Challenge = {
        Normal = 0.5, 
        Shiny = 0.25, 
        Wumbo = 0.125, 
        ShinyWumbo = 0.075
    }, 
    Raid = {
        Normal = 1, 
        Shiny = 0.5, 
        Wumbo = 0.25, 
        ShinyWumbo = 0.125
    }
};
v6.CHALLENGES = {
    REQUIRED_LEVEL = 10, 
    REWARDS = {
        Hard = {
            {
                type = "Currency", 
                name = "Swashbucks", 
                amount = 12
            }, 
            {
                type = "Currency", 
                name = "ChallengeToken", 
                amount = 15
            }, 
            {
                type = "Currency", 
                name = "DriverLicense", 
                amount = 3
            }, 
            {
                type = "Currency", 
                name = "Gems", 
                amount = 125
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 150
            }, 
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 250
            }, 
            {
                type = "Experience", 
                amount = 400
            }
        }, 
        Nightmare = {
            {
                type = "Currency", 
                name = "Swashbucks", 
                amount = 15
            }, 
            {
                type = "Currency", 
                name = "ChallengeToken", 
                amount = 25
            }, 
            {
                type = "Currency", 
                name = "DriverLicense", 
                amount = 5
            }, 
            {
                type = "Currency", 
                name = "Gems", 
                amount = 175
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 250
            }, 
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 350
            }, 
            {
                type = "Experience", 
                amount = 600
            }
        }, 
        ["Davy Jones"] = {
            {
                type = "Currency", 
                name = "Swashbucks", 
                amount = 18
            }, 
            {
                type = "Currency", 
                name = "ChallengeToken", 
                amount = 50
            }, 
            {
                type = "Currency", 
                name = "DriverLicense", 
                amount = 8
            }, 
            {
                type = "Currency", 
                name = "Gems", 
                amount = 250
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 400
            }, 
            {
                type = "SeasonXP", 
                name = "SeasonXP", 
                amount = 500
            }, 
            {
                type = "Experience", 
                amount = 750
            }
        }
    }, 
    CONDITIONS = {
        Hard = {
            amount = 1, 
            conditions = {
                {
                    name = "Tough", 
                    tier = 1
                }, 
                {
                    name = "Speedy", 
                    tier = 1
                }, 
                {
                    name = "Hardcore"
                }, 
                {
                    name = "Drained"
                }, 
                {
                    name = "Pennypinch"
                }, 
                {
                    name = "Reverse"
                }
            }
        }, 
        Nightmare = {
            amount = 2, 
            conditions = {
                {
                    name = "Tough", 
                    tier = 2
                }, 
                {
                    name = "Speedy", 
                    tier = 2
                }, 
                {
                    name = "Hardcore"
                }, 
                {
                    name = "Drained"
                }, 
                {
                    name = "Pennypinch"
                }, 
                {
                    name = "Reverse"
                }
            }
        }, 
        ["Davy Jones"] = {
            amount = 3, 
            conditions = {
                {
                    name = "Tough", 
                    tier = 3
                }, 
                {
                    name = "Speedy", 
                    tier = 3
                }, 
                {
                    name = "Hardcore"
                }, 
                {
                    name = "Drained"
                }, 
                {
                    name = "Pennypinch"
                }, 
                {
                    name = "Reverse"
                }
            }
        }
    }
};
v6.LIMIT_ACCESS_TO_RANKS = false;
v6.WHITELISTED_RANKS = {
    "Fry Cooks", 
    "Managers", 
    "Health Inspectors"
};
v6.WHITELISTED_USER_IDS = {
    1072746337, 
    8551749906
};
v6.LEADERBOARDS = {
    VERSION = "LIVE-1", 
    PLAYER_VERSION = "DEV-13", 
    MAX_RANKS = 100, 
    TEST_UPDATE_INTERVAL = 10, 
    UPDATE_INTERVAL = 300, 
    WINNING_PLACEMENTS = {
        1, 
        2, 
        3, 
        6, 
        10, 
        100
    }, 
    PLACEMENTS_MAP = {
        ["1"] = 3, 
        ["2"] = 3
    }, 
    PLACEMENT_PRIZES = {
        ["3"] = {
            type = "Unit", 
            name = "OlympianSpongebob", 
            amount = 1, 
            extraData = {
                Shiny = true, 
                Mega = true
            }, 
            noDisplay = true
        }, 
        ["6"] = {
            type = "Unit", 
            name = "OlympianSpongebob", 
            amount = 1, 
            extraData = {
                Mega = true
            }, 
            noDisplay = true
        }, 
        ["10"] = {
            type = "Unit", 
            name = "OlympianSpongebob", 
            amount = 1, 
            extraData = {
                Shiny = true
            }, 
            noDisplay = true
        }, 
        ["100"] = {
            type = "Unit", 
            name = "OlympianSpongebob", 
            amount = 1, 
            noDisplay = true
        }
    }
};
v6.FACTIONS = {
    FACTION_NAMES = {
        [1] = "Goofy Goobers", 
        [2] = "Jellyspotters", 
        [3] = "Band Geeks"
    }, 
    FACTION_IMAGES = {
        [1] = "rbxassetid://117348420478487", 
        [2] = "rbxassetid://93865541749368", 
        [3] = "rbxassetid://133359575524833"
    }, 
    BANNER_IMAGES = {
        [1] = "rbxassetid://77421723215714", 
        [2] = "rbxassetid://72921433712858", 
        [3] = "rbxassetid://140590748341008"
    }, 
    FACTION_COLORS = {
        [1] = Color3.fromHex("#f39c12"), 
        [2] = Color3.fromRGB(226, 49, 71), 
        [3] = Color3.fromRGB(56, 230, 215)
    }, 
    FACTION_PERKS = {
        [1] = {
            {
                type = "Inventory", 
                name = "YellowUnicycle", 
                amount = 1
            }
        }, 
        [2] = {
            {
                type = "Inventory", 
                name = "PinkUnicycle", 
                amount = 1
            }
        }, 
        [3] = {
            {
                type = "Inventory", 
                name = "BlueUnicycle", 
                amount = 1
            }
        }
    }, 
    PLAYER = {
        RequiredPoints = 1500
    }, 
    SHOP_MILESTONES = {
        {
            pointsNeeded = 250000, 
            cost = 10, 
            item = {
                type = "Inventory", 
                name = "Aged Patty", 
                amount = 3, 
                displayName = "{amount}x Aged Patties"
            }, 
            maxStock = -1
        }, 
        {
            pointsNeeded = 500000, 
            cost = 50, 
            item = {
                type = "Currency", 
                name = "TraitRolls", 
                amount = 1, 
                displayName = "Trait Reroll"
            }, 
            maxStock = 100
        }, 
        {
            pointsNeeded = 1000000, 
            cost = 100, 
            item = {
                type = "Currency", 
                name = "MagicConch", 
                amount = 1, 
                displayName = "Magic Conch"
            }, 
            maxStock = 50
        }, 
        {
            pointsNeeded = 5000000, 
            cost = 150, 
            item = {
                type = "Inventory", 
                name = "LegendaryTreasureChest", 
                amount = 1, 
                displayName = "Legendary+ Chest"
            }, 
            maxStock = 25
        }, 
        {
            pointsNeeded = 25000000, 
            cost = 200, 
            item = {
                type = "Inventory", 
                name = "FACTIONS_60", 
                amount = 1, 
                displayName = "x2 Faction Points"
            }, 
            maxStock = 10
        }, 
        {
            pointsNeeded = 50000000, 
            cost = 250, 
            item = {
                type = "Currency", 
                name = "GoldenTraitRolls", 
                amount = 1, 
                displayName = "Golden Trait Reroll"
            }, 
            maxStock = 15
        }, 
        {
            pointsNeeded = 75000000, 
            cost = 300, 
            item = {
                type = "Inventory", 
                name = "ChallengeGift", 
                amount = 1, 
                displayName = "Challenge Crate"
            }, 
            maxStock = 10
        }, 
        {
            pointsNeeded = 150000000, 
            cost = 350, 
            item = {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 1, 
                displayName = "Mythic+ Chest"
            }, 
            maxStock = 10
        }, 
        {
            pointsNeeded = 250000000, 
            cost = 1000, 
            items = {
                [1] = {
                    type = "Inventory", 
                    name = "Krusty Krab Pizza", 
                    amount = 1, 
                    displayName = "Krusty Krab Pizza"
                }, 
                [2] = {
                    type = "Inventory", 
                    name = "Krusty Krab Pizza", 
                    amount = 1, 
                    displayName = "Krusty Krab Pizza"
                }, 
                [3] = {
                    type = "Inventory", 
                    name = "Krusty Krab Pizza", 
                    amount = 1, 
                    displayName = "Krusty Krab Pizza"
                }
            }, 
            maxStock = 2
        }, 
        {
            pointsNeeded = 500000000, 
            cost = 2500, 
            item = {
                type = "Inventory", 
                name = "SecretTreasureChest", 
                amount = 1, 
                displayName = "Secret Chest"
            }, 
            maxStock = 5
        }
    }, 
    GRAND_PRIZES = {
        ["4"] = {
            [1] = {
                {
                    type = "Inventory", 
                    name = "#1BubbleBlower", 
                    amount = 1
                }, 
                {
                    type = "Inventory", 
                    name = "MythicTreasureChest", 
                    amount = 5
                }, 
                {
                    type = "Inventory", 
                    name = "ChallengeGift", 
                    amount = 3
                }, 
                {
                    type = "Currency", 
                    name = "GoldenTraitRolls", 
                    amount = 10
                }, 
                {
                    type = "Currency", 
                    name = "MagicConch", 
                    amount = 25
                }
            }, 
            [2] = {
                {
                    type = "Inventory", 
                    name = "MythicTreasureChest", 
                    amount = 3
                }, 
                {
                    type = "Inventory", 
                    name = "ChallengeGift", 
                    amount = 2
                }, 
                {
                    type = "Currency", 
                    name = "GoldenTraitRolls", 
                    amount = 7
                }, 
                {
                    type = "Currency", 
                    name = "MagicConch", 
                    amount = 15
                }
            }, 
            [3] = {
                {
                    type = "Inventory", 
                    name = "MythicTreasureChest", 
                    amount = 2
                }, 
                {
                    type = "Inventory", 
                    name = "ChallengeGift", 
                    amount = 1
                }, 
                {
                    type = "Currency", 
                    name = "GoldenTraitRolls", 
                    amount = 5
                }, 
                {
                    type = "Currency", 
                    name = "MagicConch", 
                    amount = 10
                }
            }
        }, 
        ["5"] = {
            [1] = {
                {
                    type = "Inventory", 
                    name = "GooLagoonSurfboard", 
                    amount = 1
                }, 
                {
                    type = "Inventory", 
                    name = "LegendaryTreasureChest", 
                    amount = 5
                }, 
                {
                    type = "Inventory", 
                    name = "ChallengeGift", 
                    amount = 3
                }, 
                {
                    type = "Currency", 
                    name = "GoldenTraitRolls", 
                    amount = 10
                }, 
                {
                    type = "Currency", 
                    name = "MagicConch", 
                    amount = 25
                }
            }, 
            [2] = {
                {
                    type = "Inventory", 
                    name = "LegendaryTreasureChest", 
                    amount = 3
                }, 
                {
                    type = "Inventory", 
                    name = "ChallengeGift", 
                    amount = 2
                }, 
                {
                    type = "Currency", 
                    name = "GoldenTraitRolls", 
                    amount = 7
                }, 
                {
                    type = "Currency", 
                    name = "MagicConch", 
                    amount = 15
                }
            }, 
            [3] = {
                {
                    type = "Inventory", 
                    name = "LegendaryTreasureChest", 
                    amount = 2
                }, 
                {
                    type = "Inventory", 
                    name = "ChallengeGift", 
                    amount = 1
                }, 
                {
                    type = "Currency", 
                    name = "GoldenTraitRolls", 
                    amount = 5
                }, 
                {
                    type = "Currency", 
                    name = "MagicConch", 
                    amount = 10
                }
            }
        }, 
        ["6"] = {
            [1] = {
                {
                    type = "Inventory", 
                    name = "LegendaryTreasureChest", 
                    amount = 5
                }, 
                {
                    type = "Inventory", 
                    name = "ChallengeGift", 
                    amount = 3
                }, 
                {
                    type = "Currency", 
                    name = "GoldenTraitRolls", 
                    amount = 10
                }, 
                {
                    type = "Currency", 
                    name = "MagicConch", 
                    amount = 25
                }
            }, 
            [2] = {
                {
                    type = "Inventory", 
                    name = "LegendaryTreasureChest", 
                    amount = 3
                }, 
                {
                    type = "Inventory", 
                    name = "ChallengeGift", 
                    amount = 2
                }, 
                {
                    type = "Currency", 
                    name = "GoldenTraitRolls", 
                    amount = 7
                }, 
                {
                    type = "Currency", 
                    name = "MagicConch", 
                    amount = 15
                }
            }, 
            [3] = {
                {
                    type = "Inventory", 
                    name = "LegendaryTreasureChest", 
                    amount = 2
                }, 
                {
                    type = "Inventory", 
                    name = "ChallengeGift", 
                    amount = 1
                }, 
                {
                    type = "Currency", 
                    name = "GoldenTraitRolls", 
                    amount = 5
                }, 
                {
                    type = "Currency", 
                    name = "MagicConch", 
                    amount = 10
                }
            }
        }
    }
};
v6.KREW_PLUS = {
    DATA_KEY = "KrewPlus", 
    REWARDS = {
        {
            monthsRequired = 3, 
            reward = {
                type = "Unit", 
                name = "CuddleEHugs", 
                amount = 1
            }
        }, 
        {
            monthsRequired = 6, 
            reward = {
                type = "Inventory", 
                name = "AirPlankton", 
                amount = 1
            }
        }, 
        {
            monthsRequired = 9, 
            reward = {
                type = "Inventory", 
                name = "GIFT_SecretChestOffer1", 
                amount = 10
            }
        }, 
        {
            monthsRequired = 12, 
            reward = {
                type = "Unit", 
                name = "BunkerBoys", 
                amount = 1
            }
        }
    }
};
v6.EXPONENTIAL_BACKOFF = {
    DEFAULT_MAX_RETRIES = 20, 
    DEFAULT_BASE_DELAY = 2, 
    DEFAULT_MAX_DELAY = 60, 
    DEFAULT_JITTER = NumberRange.new(1, 5)
};
v6.ON_JOIN_UI = {
    "DeveloperGift", 
    "MessagePrompt", 
    "FactionWinnings", 
    "Daily Rewards", 
    "OPBundleOffer", 
    "TowerOfKarateInstructions"
};
v6.EGG_SHARDS = {
    ConchStreet = "Shard1", 
    JellyfishFields = "Shard2", 
    KrustyKrab = "Shard3", 
    ChumBucket = "Shard4", 
    SandysTreedome = "Shard5", 
    Challenge = "Shard6", 
    Raid = "Shard7"
};
v6.EGG_SHARD_DROPS = {
    ConchStreet = 33, 
    JellyfishFields = 33, 
    KrustyKrab = 33, 
    ChumBucket = 33, 
    SandysTreedome = 33, 
    Challenge = 33, 
    Raid = 50
};
v6.EGG_SHARD_MAX_PITY = {
    Shard1 = 4, 
    Shard2 = 4, 
    Shard3 = 4, 
    Shard4 = 4, 
    Shard5 = 4, 
    Shard6 = 4, 
    Shard7 = 3
};
v6.ROCK_BOTTOM_LIMITED_MOUNT_EXPIRATION = v3:GetForCTUnix({
    year = 2025, 
    month = 4, 
    day = 28, 
    hour = 23, 
    minute = 59
});
v6.BOSS_BATTLE = {
    CAMERA_HEIGHT_OFFSET = 5, 
    TOWER_OFFSET_FROM_BOSS = 15, 
    TOWER_SPAWN_INTERVAL = 0.25, 
    TOWER_SPACING = 10, 
    REQUIRED_LEVEL = 15, 
    BOSS_SCALES = {
        [1] = 3, 
        [2] = 4, 
        [3] = 5, 
        [4] = 6, 
        [5] = 7
    }
};
v6.NPE = {
    FINISHED_STAGE = 7
};
v6.LevelRequirements = {
    _DEFAULT = 1, 
    Raid = 25, 
    Challenge = 10, 
    BossBattles = 50, 
    Roguelike = 50, 
    Extra = 1, 
    TowerOfKarate = 1
};
v6.UnavailableGameModes = {};
v6.BEMMY = {
    UNIT_NAME = "BemmyBuddy", 
    DATA_KEY = "BemmyData", 
    EVENT_NAME = "BemmyEvent", 
    POF_EARNINGS = {
        Story = {
            Normal = 25, 
            Hard = 30, 
            Nightmare = 35, 
            ["Davy Jones"] = 50
        }, 
        Challenge = {
            Hard = 60, 
            Nightmare = 70, 
            ["Davy Jones"] = 80
        }, 
        Raid = {
            Hard = 125, 
            Nightmare = 150, 
            ["Davy Jones"] = 200
        }, 
        BossBattle = {
            [1] = 5, 
            [2] = 5, 
            [3] = 5, 
            [4] = 15, 
            [5] = 15, 
            [6] = 15, 
            [7] = 15, 
            [8] = 15, 
            [9] = 15, 
            [10] = 15, 
            [11] = 25, 
            [12] = 25, 
            [13] = 25, 
            [14] = 25, 
            [15] = 25, 
            [16] = 25
        }
    }, 
    LEVEL_REQUIREMENTS = {
        {
            10, 
            180
        }, 
        {
            25, 
            360
        }, 
        {
            50, 
            540
        }, 
        {
            100, 
            720
        }
    }, 
    MILESTONES = {
        [25] = {
            type = "Unit", 
            name = "BemmyBuddy", 
            amount = 1, 
            noDisplay = true
        }, 
        [50] = {
            type = "Unit", 
            name = "BemmyBuddy", 
            amount = 1, 
            extraData = {
                Shiny = true, 
                Mega = true
            }, 
            noDisplay = true
        }, 
        [100] = {
            type = "Unit", 
            name = "BemmyBuddy", 
            amount = 1, 
            extraData = {
                Shiny = true, 
                Mega = true, 
                Stars = 5, 
                Trait = {
                    Name = "Strike", 
                    Tier = 1
                }, 
                Trait2 = {
                    Name = "Reach", 
                    Tier = 1
                }
            }, 
            noDisplay = true
        }
    }
};
v6.TURF_WARS = {
    STANDINGS_UPDATE_RATE = 30, 
    DATA_KEY = "SpongebobVsPatrick", 
    STANDINGS_KEY = "SpongebobVsPatrickStandings", 
    EVENT_NAME = "TurfWars", 
    UNIT_NAMES = {
        Spongebob = "DuelSpongebob", 
        Patrick = "BuffPatrick"
    }, 
    TEAM_COLORS = {
        Spongebob = Color3.fromRGB(255, 238, 0), 
        Patrick = Color3.fromRGB(255, 84, 226)
    }, 
    GRAND_PRIZE = {
        type = "Pet", 
        name = "MrStinky", 
        amount = 1
    }, 
    STARDOM_EARNINGS = {
        Story = {
            Normal = 10, 
            Hard = 15, 
            Nightmare = 25, 
            ["Davy Jones"] = 35
        }, 
        Challenge = {
            Hard = 20, 
            Nightmare = 30, 
            ["Davy Jones"] = 40
        }, 
        Raid = {
            Hard = 75, 
            Nightmare = 150, 
            ["Davy Jones"] = 250
        }, 
        Endless = {
            Hard = 15
        }, 
        BossBattle = {
            [1] = 5, 
            [2] = 5, 
            [3] = 5, 
            [4] = 5, 
            [5] = 5, 
            [6] = 5, 
            [7] = 5, 
            [8] = 5, 
            [9] = 5, 
            [10] = 5, 
            [11] = 5, 
            [12] = 5, 
            [13] = 5, 
            [14] = 5, 
            [15] = 5, 
            [16] = 5
        }, 
        Roguelike = {
            Normal = 10, 
            Hard = 15, 
            Nightmare = 25, 
            ["Davy Jones"] = 35
        }
    }, 
    STARDOM_REWARDS = {
        Spongebob = {
            {
                amount = 7500, 
                reward = {
                    type = "Unit", 
                    name = "DuelSpongebob", 
                    amount = 1, 
                    extraData = {
                        Shiny = true
                    }, 
                    noDisplay = true
                }
            }, 
            {
                amount = 15000, 
                reward = {
                    type = "Unit", 
                    name = "DuelSpongebob", 
                    amount = 1, 
                    extraData = {
                        Mega = true
                    }, 
                    noDisplay = true
                }
            }, 
            {
                amount = 25000, 
                reward = {
                    type = "Unit", 
                    name = "DuelSpongebob", 
                    amount = 1, 
                    extraData = {
                        Shiny = true, 
                        Mega = true
                    }, 
                    noDisplay = true
                }
            }, 
            {
                amount = 50000, 
                reward = {
                    type = "Unit", 
                    name = "DuelSpongebob", 
                    amount = 1, 
                    extraData = {
                        Shiny = true, 
                        Mega = true, 
                        Stars = 5
                    }, 
                    noDisplay = true
                }
            }
        }, 
        Patrick = {
            {
                amount = 7500, 
                reward = {
                    type = "Unit", 
                    name = "BuffPatrick", 
                    amount = 1, 
                    extraData = {
                        Shiny = true
                    }, 
                    noDisplay = true
                }
            }, 
            {
                amount = 15000, 
                reward = {
                    type = "Unit", 
                    name = "BuffPatrick", 
                    amount = 1, 
                    extraData = {
                        Mega = true
                    }, 
                    noDisplay = true
                }
            }, 
            {
                amount = 25000, 
                reward = {
                    type = "Unit", 
                    name = "BuffPatrick", 
                    amount = 1, 
                    extraData = {
                        Shiny = true, 
                        Mega = true
                    }, 
                    noDisplay = true
                }
            }, 
            {
                amount = 50000, 
                reward = {
                    type = "Unit", 
                    name = "BuffPatrick", 
                    amount = 1, 
                    extraData = {
                        Shiny = true, 
                        Mega = true, 
                        Stars = 5
                    }, 
                    noDisplay = true
                }
            }
        }
    }
};
v6.OLIPOP = {
    DATA_KEY = "OlipopEvent", 
    EVENT_NAME = "OlipopEvent"
};
v6.UNIT_ALIAS_LOOKUP = {
    Spongebob = {
        Quickster = true, 
        MusclebobBuffpants = true, 
        RippedPantsBob = true, 
        DirtyDan = true, 
        BunkerBoys = true, 
        Spongehenge = true
    }, 
    Patrick = {
        ElasticWaistband = true, 
        SecretAgentStar = true, 
        PinheadLarry = true, 
        BunkerBoys = true, 
        SoaringStarfish = true
    }, 
    MrKrabs = {
        RedbeardKrabs = true, 
        KingKrabs = true
    }, 
    Sandy = {
        DarkKnight = true, 
        MissAppear = true
    }, 
    Squidward = {
        SquidlyTentacles = true, 
        CaptainMagma = true, 
        SquidasaurusRex = true
    }
};
v6.FAKE_GAMEPASSES = {
    Open10Chests = true
};
v6.LOADOUT_KEYS = {
    "Loadout", 
    "RoguelikeLoadout"
};
v6.PETS = {
    MAX_SLOTS = 3, 
    MAX_PURCHASED_SLOTS = 2
};
v6.UNIT_INDEX_MILESTONES = {
    Normal = {
        {
            required = 25, 
            reward = {
                type = "Currency", 
                name = "TraitRolls", 
                amount = 100
            }
        }, 
        {
            required = 50, 
            reward = {
                type = "Currency", 
                name = "Gems", 
                amount = 5000
            }
        }, 
        {
            required = 75, 
            reward = {
                type = "Currency", 
                name = "Coins", 
                amount = 50000
            }
        }, 
        {
            required = 100, 
            reward = {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 50
            }
        }, 
        {
            required = 125, 
            reward = {
                type = "Inventory", 
                name = "SecretTreasureChest", 
                amount = 5
            }
        }
    }, 
    Variant = {
        {
            required = 100, 
            reward = {
                type = "Currency", 
                name = "GoldenTraitRolls", 
                amount = 50
            }
        }, 
        {
            required = 200, 
            reward = {
                type = "Currency", 
                name = "Gems", 
                amount = 10000
            }
        }, 
        {
            required = 300, 
            reward = {
                type = "Currency", 
                name = "Coins", 
                amount = 100000
            }
        }, 
        {
            required = 400, 
            reward = {
                type = "Inventory", 
                name = "ShinyWumboPotion_1", 
                amount = 1
            }
        }, 
        {
            required = 500, 
            reward = {
                type = "Unit", 
                name = "Invincibubble", 
                amount = 1, 
                noDisplay = true
            }
        }
    }
};
v6.KAMP_KORAL_START = v3:GetForCTUnix({
    Year = 2025, 
    Month = 8, 
    Day = 22, 
    Hour = 16, 
    Minute = 45
});
v6.KAMP_KORAL_END = v5.EVENT_END.UnixTimestamp;
v6.KAMP_KORAL_SHOP = {
    [1] = {
        type = "Inventory", 
        name = "KampKrate", 
        amount = 1, 
        cost = {
            currency = "KampKredit", 
            amount = 150
        }
    }, 
    [2] = {
        type = "Inventory", 
        name = "Dorudon", 
        amount = 1, 
        cost = {
            currency = "KampKredit", 
            amount = 5000
        }
    }, 
    [3] = {
        type = "Inventory", 
        name = "JellyfishNet", 
        amount = 1, 
        cost = {
            currency = "KampKredit", 
            amount = 250
        }
    }, 
    [4] = {
        type = "Inventory", 
        name = "AcornSubmersible", 
        amount = 1, 
        cost = {
            currency = "KampKredit", 
            amount = 1000
        }
    }
};
v6.OP_BUNDLE_OFFER = {
    EXPIRATION = 28800, 
    PURCHASE_NAME = "OPBundleOffer"
};
v6.DefaultEntityDyingDuration = 3.5;
v6.MaxInteractionDistance = 32;
v6.ENTITY_DROP_LIFETIME = 30;
v6.CHRISTMAS_TREE_LIGHTUP_PROPS = {
    year = 2025, 
    month = 12, 
    day = 3, 
    hour = 18, 
    minute = 0
};
v6.CHRISTMAS_START = v3:GetForCTUnix({
    year = 2025, 
    month = 12, 
    day = 24, 
    hour = 8
});
v6.CHRISTMAS_DEAL_ENDS = v3:GetForCTUnix({
    year = 2025, 
    month = 12, 
    day = 31, 
    hour = 23, 
    minute = 59
});
v6.CHRISTMAS_TREE_LIGHTUP = v3:GetForCTUnix(v6.CHRISTMAS_TREE_LIGHTUP_PROPS);
v6.CHRISTMAS_END = v3:GetForCTUnix({
    year = 2025, 
    month = 12, 
    day = 24, 
    hour = 23, 
    minute = 59
});
v6.SBB_LAUNCH_COUNTDOWN_PROPS = {
    year = 2025, 
    month = 12, 
    day = 3, 
    hour = 16, 
    minute = 30
};
v6.SBB_QUEST_HOUR = 15;
v6.SBB_LAUNCH_TIME = v3:GetForCTUnix(v6.SBB_LAUNCH_COUNTDOWN_PROPS);
v6.FREE_CRATE = "CoralGift";
v6.FREE_CRATE_TIME = 3600;
v6.FREE_CRATES = {
    {
        id = "CoralGift", 
        start = v6.CHRISTMAS_TREE_LIGHTUP, 
        expire = v6.CHRISTMAS_END, 
        secondsPerCrate = 3600
    }, 
    {
        id = "HolidayCrate", 
        start = v6.CHRISTMAS_START, 
        expire = v6.CHRISTMAS_DEAL_ENDS, 
        secondsPerCrate = 1800
    }
};
v6.FREE_CRATE_START_TIME = v6.CHRISTMAS_TREE_LIGHTUP;
v6.FREE_CRATE_EXPIRE_TIME = v6.CHRISTMAS_END;
return v6;