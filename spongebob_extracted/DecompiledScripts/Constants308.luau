local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
return {
    DAILY_CLEAR_INTERVAL = 57600, 
    ENEMY_HEALTH_BUFF_PER_FLOOR = 1.05, 
    MAX_FLOORS = 100, 
    REQUIRED_ABILITY_CHARGE = 15, 
    TOK_RELEASE_TIME = v1:GetForCTUnix({
        Year = 2025, 
        Month = 10, 
        Day = 31, 
        Hour = 16, 
        Minute = 30
    }), 
    SECTION_NAMES = {
        [1] = "Tower Grounds", 
        [11] = "Inner Halls", 
        [21] = "Sacred Sanctum", 
        [31] = "Grand Gallery", 
        [41] = "Frozen Atrium", 
        [51] = "Court of Elegance", 
        [61] = "Sludgeworks", 
        [71] = "Banquet Hall", 
        [81] = "Apex of Decay", 
        [91] = "Zenith Chamber", 
        [101] = "Endless+"
    }, 
    MinDamage = 0, 
    BaseEnemyHealth = 10000, 
    BaseEnemyDamage = 3, 
    UltimateAttackIndex = 5, 
    FloorEarnings = {
        {
            FloorRange = NumberRange.new(1, 20), 
            Belts = 10, 
            Coins = 5, 
            Swashbucks = 1
        }, 
        {
            FloorRange = NumberRange.new(21, 40), 
            Belts = 20, 
            Coins = 10, 
            Swashbucks = 1
        }, 
        {
            FloorRange = NumberRange.new(41, 60), 
            Belts = 30, 
            Coins = 15, 
            Swashbucks = 1
        }, 
        {
            FloorRange = NumberRange.new(61, 80), 
            Belts = 40, 
            Coins = 20, 
            Swashbucks = 1
        }, 
        {
            FloorRange = NumberRange.new(81, 100), 
            Belts = 50, 
            Coins = 25, 
            Swashbucks = 1
        }, 
        {
            FloorRange = NumberRange.new(101, 200), 
            Belts = 60, 
            Coins = 30, 
            Swashbucks = 1
        }, 
        {
            FloorRange = NumberRange.new(201, 1e999), 
            Belts = 100, 
            Coins = 50, 
            Swashbucks = 1
        }
    }, 
    BeltRanks = {
        {
            Name = "White Belt I", 
            BeltCost = 0
        }, 
        {
            Name = "White Belt II", 
            BeltCost = 100
        }, 
        {
            Name = "White Belt III", 
            BeltCost = 150, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Worn"
                }
            }
        }, 
        {
            Name = "White Belt IV", 
            BeltCost = 200
        }, 
        {
            Name = "White Belt V", 
            BeltCost = 250
        }, 
        {
            Name = "Yellow Belt I", 
            BeltCost = 300, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Strong"
                }
            }
        }, 
        {
            Name = "Yellow Belt II", 
            BeltCost = 350
        }, 
        {
            Name = "Yellow Belt III", 
            BeltCost = 400, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Bubble_KGlove"
                }
            }
        }, 
        {
            Name = "Yellow Belt IV", 
            BeltCost = 500
        }, 
        {
            Name = "Yellow Belt V", 
            BeltCost = 600
        }, 
        {
            Name = "Orange Belt I", 
            BeltCost = 700, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Iron"
                }
            }
        }, 
        {
            Name = "Orange Belt II", 
            BeltCost = 800
        }, 
        {
            Name = "Orange Belt III", 
            BeltCost = 900, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Golden"
                }
            }
        }, 
        {
            Name = "Orange Belt IV", 
            BeltCost = 1000
        }, 
        {
            Name = "Orange Belt V", 
            BeltCost = 1100
        }, 
        {
            Name = "Green Belt I", 
            BeltCost = 1200, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Titanium"
                }
            }
        }, 
        {
            Name = "Green Belt II", 
            BeltCost = 1300
        }, 
        {
            Name = "Green Belt III", 
            BeltCost = 1400, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Storm"
                }
            }
        }, 
        {
            Name = "Green Belt IV", 
            BeltCost = 1500
        }, 
        {
            Name = "Green Belt V", 
            BeltCost = 1600
        }, 
        {
            Name = "Blue Belt I", 
            BeltCost = 2000, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Abyss"
                }
            }
        }, 
        {
            Name = "Blue Belt II", 
            BeltCost = 3000
        }, 
        {
            Name = "Blue Belt III", 
            BeltCost = 5000
        }, 
        {
            Name = "Blue Belt IV", 
            BeltCost = 6000
        }, 
        {
            Name = "Blue Belt V", 
            BeltCost = 7000
        }, 
        {
            Name = "Purple Belt I", 
            BeltCost = 10000, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Molten"
                }
            }
        }, 
        {
            Name = "Purple Belt II", 
            BeltCost = 12000
        }, 
        {
            Name = "Purple Belt III", 
            BeltCost = 14000
        }, 
        {
            Name = "Purple Belt IV", 
            BeltCost = 16000
        }, 
        {
            Name = "Purple Belt V", 
            BeltCost = 18000
        }, 
        {
            Name = "Red Belt I", 
            BeltCost = 24000, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Spirit"
                }
            }
        }, 
        {
            Name = "Red Belt II", 
            BeltCost = 30000
        }, 
        {
            Name = "Red Belt III", 
            BeltCost = 35000
        }, 
        {
            Name = "Red Belt IV", 
            BeltCost = 40000
        }, 
        {
            Name = "Red Belt V", 
            BeltCost = 45000
        }, 
        {
            Name = "Brown Belt I", 
            BeltCost = 50000, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Celestial"
                }
            }
        }, 
        {
            Name = "Brown Belt II", 
            BeltCost = 60000
        }, 
        {
            Name = "Brown Belt III", 
            BeltCost = 70000
        }, 
        {
            Name = "Brown Belt IV", 
            BeltCost = 80000
        }, 
        {
            Name = "Brown Belt V", 
            BeltCost = 90000
        }, 
        {
            Name = "Black Belt I", 
            BeltCost = 100000, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Draconic"
                }
            }
        }, 
        {
            Name = "Black Belt II", 
            BeltCost = 110000
        }, 
        {
            Name = "Black Belt III", 
            BeltCost = 130000
        }, 
        {
            Name = "Black Belt IV", 
            BeltCost = 150000
        }, 
        {
            Name = "Black Belt V", 
            BeltCost = 200000
        }, 
        {
            Name = "King of Karate", 
            BeltCost = 350000, 
            Rewards = {
                {
                    type = "Inventory", 
                    name = "Master"
                }
            }
        }
    }, 
    BeltColors = {
        {
            LevelRange = NumberRange.new(1, 5), 
            Color = Color3.fromRGB(255, 255, 255)
        }, 
        {
            LevelRange = NumberRange.new(6, 10), 
            Color = Color3.fromRGB(255, 229, 51)
        }, 
        {
            LevelRange = NumberRange.new(11, 15), 
            Color = Color3.fromRGB(235, 116, 48)
        }, 
        {
            LevelRange = NumberRange.new(16, 20), 
            Color = Color3.fromRGB(92, 198, 60)
        }, 
        {
            LevelRange = NumberRange.new(21, 25), 
            Color = Color3.fromRGB(77, 117, 246)
        }, 
        {
            LevelRange = NumberRange.new(26, 30), 
            Color = Color3.fromRGB(172, 73, 246)
        }, 
        {
            LevelRange = NumberRange.new(31, 35), 
            Color = Color3.fromRGB(227, 53, 46)
        }, 
        {
            LevelRange = NumberRange.new(36, 40), 
            Color = Color3.fromRGB(104, 67, 20)
        }, 
        {
            LevelRange = NumberRange.new(41, 45), 
            Color = Color3.fromRGB(73, 73, 73)
        }, 
        {
            LevelRange = NumberRange.new(46, 46), 
            Color = Color3.fromRGB(46, 46, 46)
        }
    }, 
    REWARD_BUFFS = {
        Hard = 1.25, 
        Nightmare = 1.5, 
        ["Davy Jones"] = 2
    }, 
    KRATE_COST = 500, 
    DIFFICULTY_MULTIPLIERS = {
        Hard = {
            HealthMult = 2
        }, 
        Nightmare = {
            HealthMult = 4
        }, 
        ["Davy Jones"] = {
            HealthMult = 10
        }
    }
};