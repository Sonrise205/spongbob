local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
local v7 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v8 = require(l_ReplicatedFirst_0.PlaceIds);
local _ = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v10 = v8:IsReleaseBranch();
local v11 = v8:IsTestBranch();
local v12 = l_RunService_0:IsStudio();
local v13 = {
    CruiseCrate = {
        expireOn = v5.CHRISTMAS_START - 1
    }, 
    SnowCrate = {
        startOn = v5.CHRISTMAS_START, 
        expireOn = v5.CHRISTMAS_DEAL_ENDS
    }, 
    HolidayCrate = {
        startOn = v5.CHRISTMAS_START, 
        expireOn = v5.CHRISTMAS_DEAL_ENDS
    }
};
return {
    DevProducts = {
        {
            purchaseId = (not not v11 or v12) and 3299743381 or 3301332103, 
            purchaseName = "AdReward_VideoAdsPackProduct", 
            displayName = "[AD REWARD] \226\128\162 Video Ads Pack", 
            purchaseType = "DevProduct", 
            dontDisplayConfirmation = true
        }, 
        {
            purchaseId = 3344652555, 
            purchaseName = "TraitRollsPack1", 
            displayName = "50x Trait Reroll", 
            purchaseData = {
                currency = {
                    name = "TraitRolls", 
                    amount = 50
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344652667, 
            purchaseName = "TraitRollsPack2", 
            displayName = "250x Trait Rerolls", 
            purchaseData = {
                currency = {
                    name = "TraitRolls", 
                    amount = 250
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344652780, 
            purchaseName = "TraitRollsPack3", 
            displayName = "1,000x Trait Rerolls", 
            purchaseData = {
                currency = {
                    name = "TraitRolls", 
                    amount = 1000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2607443195, 
            purchaseName = "TraitRollsPack4", 
            displayName = "100x Trait Rerolls", 
            purchaseData = {
                currency = {
                    name = "TraitRolls", 
                    amount = 100
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344640504, 
            purchaseName = "GemsPack1", 
            displayName = "5,000x Gems", 
            purchaseData = {
                currency = {
                    name = "Gems", 
                    amount = 5000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344651568, 
            purchaseName = "GemsPack2", 
            displayName = "25,000x Gems", 
            purchaseData = {
                currency = {
                    name = "Gems", 
                    amount = 25000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344651691, 
            purchaseName = "GemsPack3", 
            displayName = "100,000x Gems", 
            purchaseData = {
                currency = {
                    name = "Gems", 
                    amount = 100000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344651807, 
            purchaseName = "GemsPack4", 
            displayName = "250,000x Gems", 
            purchaseData = {
                currency = {
                    name = "Gems", 
                    amount = 250000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344651897, 
            purchaseName = "CoinsPack1", 
            displayName = "10,000x Coins", 
            purchaseData = {
                currency = {
                    name = "Coins", 
                    amount = 10000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344652003, 
            purchaseName = "CoinsPack2", 
            displayName = "50,000x Coins", 
            purchaseData = {
                currency = {
                    name = "Coins", 
                    amount = 50000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344652130, 
            purchaseName = "CoinsPack3", 
            displayName = "250,000x Coins", 
            purchaseData = {
                currency = {
                    name = "Coins", 
                    amount = 250000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344652247, 
            purchaseName = "CoinsPack4", 
            displayName = "1,000,000x Coins", 
            purchaseData = {
                currency = {
                    name = "Coins", 
                    amount = 1000000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345948361, 
            purchaseName = "MagicConchPack1", 
            displayName = "10x Magic Conch", 
            purchaseData = {
                currency = {
                    name = "MagicConch", 
                    amount = 10
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345948539, 
            purchaseName = "MagicConchPack2", 
            displayName = "50x Magic Conches", 
            purchaseData = {
                currency = {
                    name = "MagicConch", 
                    amount = 50
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345948660, 
            purchaseName = "MagicConchPack3", 
            displayName = "250x Magic Conches", 
            purchaseData = {
                currency = {
                    name = "MagicConch", 
                    amount = 250
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345948770, 
            purchaseName = "MagicConchPack4", 
            displayName = "1,000x Magic Conches", 
            purchaseData = {
                currency = {
                    name = "MagicConch", 
                    amount = 1000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655250178, 
            purchaseName = "SummonLuck1", 
            displayName = "Summon Luck I", 
            purchaseData = {
                tier = 1
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655250325, 
            purchaseName = "SummonLuck2", 
            displayName = "Summon Luck II", 
            purchaseData = {
                tier = 2
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655250457, 
            purchaseName = "SummonLuck3", 
            displayName = "Summon Luck III", 
            purchaseData = {
                tier = 3
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655250559, 
            purchaseName = "SummonLuck4", 
            displayName = "Summon Luck IV", 
            purchaseData = {
                tier = 4
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655250673, 
            purchaseName = "SummonLuck5", 
            displayName = "Summon Luck V", 
            purchaseData = {
                tier = 5
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655250786, 
            purchaseName = "SummonLuck6", 
            displayName = "Summon Luck VI", 
            purchaseData = {
                tier = 6
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655250896, 
            purchaseName = "SummonLuck7", 
            displayName = "Summon Luck VII", 
            purchaseData = {
                tier = 7
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655251021, 
            purchaseName = "SummonLuck8", 
            displayName = "Summon Luck VIII", 
            purchaseData = {
                tier = 8
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655251156, 
            purchaseName = "SummonLuck9", 
            displayName = "Summon Luck IX", 
            purchaseData = {
                tier = 9
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655251250, 
            purchaseName = "SummonLuck10", 
            displayName = "Summon Luck X", 
            purchaseData = {
                tier = 10
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2676106326, 
            purchaseName = "SummonLuck11", 
            displayName = "Summon Luck XI", 
            purchaseData = {
                tier = 11
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2676106436, 
            purchaseName = "SummonLuck12", 
            displayName = "Summon Luck XII", 
            purchaseData = {
                tier = 12
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2676106514, 
            purchaseName = "SummonLuck13", 
            displayName = "Summon Luck XIII", 
            purchaseData = {
                tier = 13
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655400630, 
            purchaseName = "AddBossTime1", 
            displayName = "+60 Seconds", 
            purchaseData = {
                extraBossTime = true, 
                timeTier = 1
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655400733, 
            purchaseName = "AddBossTime2", 
            displayName = "+60 Seconds (II)", 
            purchaseData = {
                extraBossTime = true, 
                timeTier = 2
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655400832, 
            purchaseName = "AddBossTime3", 
            displayName = "+60 Seconds (III)", 
            purchaseData = {
                extraBossTime = true, 
                timeTier = 3
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655400935, 
            purchaseName = "AddBossTime4", 
            displayName = "+60 Seconds (IV)", 
            purchaseData = {
                extraBossTime = true, 
                timeTier = 4
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2672152051, 
            purchaseName = "AgedPatty", 
            displayName = "1x Aged Patty", 
            purchaseData = {
                inventory = {
                    type = "Food", 
                    name = "Aged Patty", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2672152206, 
            purchaseName = "PrettyPatties", 
            displayName = "1x Pretty Patties", 
            purchaseData = {
                inventory = {
                    type = "Food", 
                    name = "Pretty Patties", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2672152394, 
            purchaseName = "FoodBundle", 
            displayName = "Food Bundle", 
            purchaseData = {
                bundle = {
                    type = "Food", 
                    name = "Food Bundle", 
                    items = {
                        {
                            name = "Aged Patty", 
                            amount = 5
                        }, 
                        {
                            name = "Pretty Patties", 
                            amount = 5
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2607495648, 
            purchaseName = "x2Gems", 
            displayName = "x2 Gems Boost", 
            purchaseData = {
                inventory = {
                    type = "Boosts", 
                    name = "GEMS_60", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655385671, 
            purchaseName = "x2Coins", 
            displayName = "x2 Coins Boost", 
            purchaseData = {
                inventory = {
                    type = "Boosts", 
                    name = "COINS_60", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655385318, 
            purchaseName = "x2XP", 
            displayName = "x2 XP Boost", 
            purchaseData = {
                inventory = {
                    type = "Boosts", 
                    name = "XP_60", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2607698735, 
            purchaseName = "BoostBundle", 
            displayName = "Boosts Bundle", 
            purchaseData = {
                bundle = {
                    type = "Boosts", 
                    name = "Boost Bundle", 
                    items = {
                        {
                            name = "GEMS_60", 
                            amount = 3
                        }, 
                        {
                            name = "COINS_60", 
                            amount = 3
                        }, 
                        {
                            name = "XP_60", 
                            amount = 3
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2651430806, 
            purchaseName = "SeasonSkip1", 
            displayName = "Skip 1 Level", 
            purchaseData = {
                seasonLevelSkip = 1
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2651430935, 
            purchaseName = "SeasonSkip2", 
            displayName = "Skip 10 Levels", 
            purchaseData = {
                seasonLevelSkip = 10
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2607801485, 
            purchaseName = "ChestForeverOffer1", 
            displayName = "Unlimited Pack Tier", 
            purchaseData = {
                unlimitedTier = true, 
                packType = "ChestForeverPack"
            }, 
            dontDisplayConfirmation = true, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2607552297, 
            purchaseName = "ChestForeverOffer2", 
            displayName = "Unlimited Pack Tier", 
            purchaseData = {
                unlimitedTier = true, 
                packType = "ChestForeverPack"
            }, 
            dontDisplayConfirmation = true, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2607632206, 
            purchaseName = "ChestForeverOffer3", 
            displayName = "Unlimited Pack Tier", 
            purchaseData = {
                unlimitedTier = true, 
                packType = "ChestForeverPack"
            }, 
            dontDisplayConfirmation = true, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2607824542, 
            purchaseName = "ChestForeverOffer4", 
            displayName = "Unlimited Pack Tier", 
            purchaseData = {
                unlimitedTier = true, 
                packType = "ChestForeverPack"
            }, 
            dontDisplayConfirmation = true, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2607860540, 
            purchaseName = "ChestForeverOffer5", 
            displayName = "Unlimited Pack Tier", 
            purchaseData = {
                unlimitedTier = true, 
                packType = "ChestForeverPack"
            }, 
            dontDisplayConfirmation = true, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294676444, 
            purchaseName = "ChestForeverOffer6", 
            displayName = "Unlimited Pack Tier", 
            purchaseData = {
                unlimitedTier = true, 
                packType = "ChestForeverPack"
            }, 
            dontDisplayConfirmation = true, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294676492, 
            purchaseName = "ChestForeverOffer7", 
            displayName = "Unlimited Pack Tier", 
            purchaseData = {
                unlimitedTier = true, 
                packType = "ChestForeverPack"
            }, 
            dontDisplayConfirmation = true, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294676560, 
            purchaseName = "ChestForeverOffer8", 
            displayName = "Unlimited Pack Tier", 
            purchaseData = {
                unlimitedTier = true, 
                packType = "ChestForeverPack"
            }, 
            dontDisplayConfirmation = true, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294676630, 
            purchaseName = "ChestForeverOffer9", 
            displayName = "Unlimited Pack Tier", 
            purchaseData = {
                unlimitedTier = true, 
                packType = "ChestForeverPack"
            }, 
            dontDisplayConfirmation = true, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2607882467, 
            purchaseName = "StorageUpgrade", 
            displayName = "+100 Storage Upgrade", 
            purchaseData = {
                storageUpgrade = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294713090, 
            purchaseName = "Open50ChestsGift", 
            displayName = "Open 50 Treasure Chests Gift", 
            purchaseData = {
                giftData = {
                    type = "Open50Chests", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3250097398, 
            purchaseName = "x2ChallengeTokensGift", 
            displayName = "x2 Challenge Tokens Gift", 
            purchaseData = {
                giftData = {
                    type = "x2ChallengeTokens", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655383981, 
            purchaseName = "VIPGift", 
            displayName = "VIP Gift", 
            purchaseData = {
                giftData = {
                    type = "VIP", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2607663758, 
            purchaseName = "UltraVIPGift", 
            displayName = "Ultra VIP Gift", 
            purchaseData = {
                giftData = {
                    type = "UltraVIP", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655384095, 
            purchaseName = "x2SpeedGift", 
            displayName = "2x Speed Gift", 
            purchaseData = {
                giftData = {
                    type = "GameSpeed", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655384202, 
            purchaseName = "DisplayUnitsGift", 
            displayName = "Display All Units Gift", 
            purchaseData = {
                giftData = {
                    type = "DisplayUnits", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2607225670, 
            purchaseName = "SeasonPassGift", 
            displayName = "Season Pass Gift", 
            purchaseData = {
                giftData = {
                    type = "SeasonPass", 
                    amount = 1, 
                    premiumTierSkips = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655384409, 
            purchaseName = "ShinyHunterGift", 
            displayName = "Shiny Hunter Gift", 
            purchaseData = {
                giftData = {
                    type = "ShinyHunter", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655385504, 
            purchaseName = "WumboHunterGift", 
            displayName = "Wumbo Hunter Gift", 
            purchaseData = {
                giftData = {
                    type = "WumboHunter", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655384901, 
            purchaseName = "TraitHunterGift", 
            displayName = "Trait Hunter Gift", 
            purchaseData = {
                giftData = {
                    type = "TraitHunter", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655385002, 
            purchaseName = "UltraShinyHunterGift", 
            displayName = "Ultra Shiny Hunter Gift", 
            purchaseData = {
                giftData = {
                    type = "UltraShinyHunter", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655385100, 
            purchaseName = "UltraWumboHunterGift", 
            displayName = "Ultra Wumbo Hunter Gift", 
            purchaseData = {
                giftData = {
                    type = "UltraWumboHunter", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2672146751, 
            purchaseName = "UltraTraitHunterGift", 
            displayName = "Ultra Trait Hunter Gift", 
            purchaseData = {
                giftData = {
                    type = "UltraTraitHunter", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2706970528, 
            purchaseName = "5xGameSpeedGift", 
            displayName = "5x Game Speed Gift", 
            purchaseData = {
                giftData = {
                    type = "5xGameSpeed", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3380282689, 
            purchaseName = "7xGameSpeedGift", 
            displayName = "7x Game Speed Gift", 
            purchaseData = {
                giftData = {
                    type = "7xGameSpeed", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2706970822, 
            purchaseName = "x2LevelingGift", 
            displayName = "x2 Leveling Gift", 
            purchaseData = {
                giftData = {
                    type = "x2Leveling", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2706973600, 
            purchaseName = "x2GoldenSpatulaGift", 
            displayName = "x2 Golden Spatula Gift", 
            purchaseData = {
                giftData = {
                    type = "x2GoldenSpatula", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2686739708, 
            purchaseName = "SecretHunterGift", 
            displayName = "Secret Hunter Gift", 
            purchaseData = {
                giftData = {
                    type = "SecretHunter", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2686739901, 
            purchaseName = "UltraSecretHunterGift", 
            displayName = "Ultra Secret Hunter Gift", 
            purchaseData = {
                giftData = {
                    type = "UltraSecretHunter", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345962567, 
            purchaseName = "MagicConchPack1Gift", 
            displayName = "Magic Conch Gift", 
            purchaseData = {
                giftData = {
                    type = "MagicConchPack1", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345962659, 
            purchaseName = "MagicConchPack2Gift", 
            displayName = "Magic Conch Gift", 
            purchaseData = {
                giftData = {
                    type = "MagicConchPack2", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345962751, 
            purchaseName = "MagicConchPack3Gift", 
            displayName = "Magic Conch Gift", 
            purchaseData = {
                giftData = {
                    type = "MagicConchPack3", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345962899, 
            purchaseName = "MagicConchPack4Gift", 
            displayName = "Magic Conch Gift", 
            purchaseData = {
                giftData = {
                    type = "MagicConchPack4", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345958603, 
            purchaseName = "TraitRollsPack1Gift", 
            displayName = "Trait Rerolls Gift", 
            purchaseData = {
                giftData = {
                    type = "TraitRollsPack1", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345958688, 
            purchaseName = "TraitRollsPack2Gift", 
            displayName = "Trait Rerolls Gift", 
            purchaseData = {
                giftData = {
                    type = "TraitRollsPack2", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345958793, 
            purchaseName = "TraitRollsPack3Gift", 
            displayName = "Trait Rerolls Gift", 
            purchaseData = {
                giftData = {
                    type = "TraitRollsPack3", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2835762310, 
            purchaseName = "TraitRollsPack4Gift", 
            displayName = "Trait Rerolls Gift", 
            purchaseData = {
                giftData = {
                    type = "TraitRollsPack4", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345955002, 
            purchaseName = "GemsPack1Gift", 
            displayName = "Gems Gift", 
            purchaseData = {
                giftData = {
                    type = "GemsPack1", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345955178, 
            purchaseName = "GemsPack2Gift", 
            displayName = "Gems Gift", 
            purchaseData = {
                giftData = {
                    type = "GemsPack2", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345955298, 
            purchaseName = "GemsPack3Gift", 
            displayName = "Gems Gift", 
            purchaseData = {
                giftData = {
                    type = "GemsPack3", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345955471, 
            purchaseName = "GemsPack4Gift", 
            displayName = "Gems Gift", 
            purchaseData = {
                giftData = {
                    type = "GemsPack4", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345957367, 
            purchaseName = "CoinsPack1Gift", 
            displayName = "Coins Gift", 
            purchaseData = {
                giftData = {
                    type = "CoinsPack1", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345957501, 
            purchaseName = "CoinsPack2Gift", 
            displayName = "Coins Gift", 
            purchaseData = {
                giftData = {
                    type = "CoinsPack2", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345957652, 
            purchaseName = "CoinsPack3Gift", 
            displayName = "Coins Gift", 
            purchaseData = {
                giftData = {
                    type = "CoinsPack3", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345957773, 
            purchaseName = "CoinsPack4Gift", 
            displayName = "Coins Gift", 
            purchaseData = {
                giftData = {
                    type = "CoinsPack4", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273212228, 
            purchaseName = "StorageUpgradeGift", 
            displayName = "+100 Unit Storage Gift", 
            purchaseData = {
                giftData = {
                    type = "StorageUpgrade", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345960426, 
            purchaseName = "GoldenSpatulaPack1Gift", 
            displayName = "", 
            purchaseData = {
                giftData = {
                    type = "GoldenSpatulaPack1", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345960516, 
            purchaseName = "GoldenSpatulaPack2Gift", 
            displayName = "Golden Spatulas Gift", 
            purchaseData = {
                giftData = {
                    type = "GoldenSpatulaPack2", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345960607, 
            purchaseName = "GoldenSpatulaPack3Gift", 
            displayName = "Golden Spatulas Gift", 
            purchaseData = {
                giftData = {
                    type = "GoldenSpatulaPack3", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345960709, 
            purchaseName = "GoldenSpatulaPack4Gift", 
            displayName = "Golden Spatulas Gift", 
            purchaseData = {
                giftData = {
                    type = "GoldenSpatulaPack4", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3231221663, 
            purchaseName = "TreasureHunterGift", 
            displayName = "Treasure Hunter Gift", 
            purchaseData = {
                giftData = {
                    type = "TreasureHunter", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3231221802, 
            purchaseName = "UltraTreasureHunterGift", 
            displayName = "Ultra Treasure Hunter Gift", 
            purchaseData = {
                giftData = {
                    type = "UltraTreasureHunter", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3237919545, 
            purchaseName = "MythicTreasure1Gift", 
            displayName = "Mythic Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "MythicTreasurePack1", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3237919644, 
            purchaseName = "MythicTreasure2Gift", 
            displayName = "Mythic+ Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "MythicTreasurePack2", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3237919752, 
            purchaseName = "MythicTreasure3Gift", 
            displayName = "Mythic+ Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "MythicTreasurePack3", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3237922490, 
            purchaseName = "TreasurePack1Gift", 
            displayName = "Rare+ Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "TreasurePack1", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3237922593, 
            purchaseName = "TreasurePack2Gift", 
            displayName = "Rare+ Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "TreasurePack2", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3237922695, 
            purchaseName = "TreasurePack3Gift", 
            displayName = "Rare+ Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "TreasurePack3", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3237922808, 
            purchaseName = "TreasurePack4Gift", 
            displayName = "Rare+ Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "TreasurePack4", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3237917755, 
            purchaseName = "SecretChestOffer1Gift", 
            displayName = "Secret Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "SecretChestOffer1", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3238172148, 
            purchaseName = "SecretChestOffer2Gift", 
            displayName = "Secret Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "SecretChestOffer2", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3238172984, 
            purchaseName = "SecretChestOffer3Gift", 
            displayName = "Secret Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "SecretChestOffer3", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3238173365, 
            purchaseName = "SecretChestOffer4Gift", 
            displayName = "Secret Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "SecretChestOffer4", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3238173627, 
            purchaseName = "SecretChestOffer5Gift", 
            displayName = "Secret Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "SecretChestOffer5", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694423613, 
            purchaseName = "TreasurePack1", 
            displayName = "1x Treasure Chest", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "TreasureChest", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694423754, 
            purchaseName = "TreasurePack2", 
            displayName = "5x Treasure Chests", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "TreasureChest", 
                    amount = 5
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694423926, 
            purchaseName = "TreasurePack3", 
            displayName = "25x Treasure Chests", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "TreasureChest", 
                    amount = 25
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694424055, 
            purchaseName = "TreasurePack4", 
            displayName = "100x Treasure Chests", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "TreasureChest", 
                    amount = 100
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694432411, 
            purchaseName = "TreasureOffer1", 
            displayName = "TO1", 
            purchaseData = {
                dailyTreasureTier = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694432510, 
            purchaseName = "TreasureOffer2", 
            displayName = "TO2", 
            purchaseData = {
                dailyTreasureTier = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694432713, 
            purchaseName = "TreasureOffer3", 
            displayName = "TO3", 
            purchaseData = {
                dailyTreasureTier = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694432987, 
            purchaseName = "TreasureOffer4", 
            displayName = "TO4", 
            purchaseData = {
                dailyTreasureTier = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694433143, 
            purchaseName = "TreasureOffer5", 
            displayName = "TO5", 
            purchaseData = {
                dailyTreasureTier = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694433269, 
            purchaseName = "TreasureOffer6", 
            displayName = "TO6", 
            purchaseData = {
                dailyTreasureTier = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694433386, 
            purchaseName = "TreasureOffer7", 
            displayName = "TO7", 
            purchaseData = {
                dailyTreasureTier = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694433515, 
            purchaseName = "TreasureOffer8", 
            displayName = "TO8", 
            purchaseData = {
                dailyTreasureTier = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694433650, 
            purchaseName = "TreasureOffer9", 
            displayName = "TO9", 
            purchaseData = {
                dailyTreasureTier = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694433830, 
            purchaseName = "TreasureOffer10", 
            displayName = "TO10", 
            purchaseData = {
                dailyTreasureTier = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2694968606, 
            purchaseName = "MythicChestBundle1", 
            displayName = "Mythic Chest Bundle", 
            purchaseData = {
                mythicTreasureBundle = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2701137823, 
            purchaseName = "MythicTreasure1", 
            displayName = "1x Mythic Chest", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "MythicTreasureChest", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2701138049, 
            purchaseName = "MythicTreasure2", 
            displayName = "3x Mythic Chests", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "MythicTreasureChest", 
                    amount = 3
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2701138189, 
            purchaseName = "MythicTreasure3", 
            displayName = "10x Mythic Chests", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "MythicTreasureChest", 
                    amount = 10
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344653336, 
            purchaseName = "GoldenSpatulaPack1", 
            displayName = "2,500x Golden Spatulas", 
            purchaseData = {
                currency = {
                    name = "GoldenSpatula", 
                    amount = 2500
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344653441, 
            purchaseName = "GoldenSpatulaPack2", 
            displayName = "10,000x Golden Spatulas", 
            purchaseData = {
                currency = {
                    name = "GoldenSpatula", 
                    amount = 10000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344653559, 
            purchaseName = "GoldenSpatulaPack3", 
            displayName = "50,000x Golden Spatulas", 
            purchaseData = {
                currency = {
                    name = "GoldenSpatula", 
                    amount = 50000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344653655, 
            purchaseName = "GoldenSpatulaPack4", 
            displayName = "250,000x Golden Spatulas", 
            purchaseData = {
                currency = {
                    name = "GoldenSpatula", 
                    amount = 250000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2736420756, 
            purchaseName = "PremiumSeasonPassBundle", 
            displayName = ("Season %* Bundle"):format(v5.SEASON), 
            seasonBundle = {
                GamePass = v5.SEASON_PASS_NAME, 
                TierSkips = 25, 
                _dataKey = "_purchasedSeasonPassBundle"
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344652920, 
            purchaseName = "GoldTraitRollsPack1", 
            displayName = "50x Golden Trait Reroll", 
            purchaseData = {
                currency = {
                    name = "GoldenTraitRolls", 
                    amount = 50
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344653084, 
            purchaseName = "GoldTraitRollsPack2", 
            displayName = "250x Golden Trait Rerolls", 
            purchaseData = {
                currency = {
                    name = "GoldenTraitRolls", 
                    amount = 250
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3344653188, 
            purchaseName = "GoldTraitRollsPack3", 
            displayName = "1,000x Golden Trait Rerolls", 
            purchaseData = {
                currency = {
                    name = "GoldenTraitRolls", 
                    amount = 1000
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2837692837, 
            purchaseName = "GoldTraitRollsPack4", 
            displayName = "25x Golden Trait Rerolls", 
            purchaseData = {
                currency = {
                    name = "GoldenTraitRolls", 
                    amount = 25
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345959635, 
            purchaseName = "GoldTraitRollsPack1Gift", 
            displayName = "Golden Trait Reroll Gift", 
            purchaseData = {
                giftData = {
                    type = "GoldTraitRollsPack1", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345959793, 
            purchaseName = "GoldTraitRollsPack2Gift", 
            displayName = "Golden Trait Reroll Gift", 
            purchaseData = {
                giftData = {
                    type = "GoldTraitRollsPack2", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3345959889, 
            purchaseName = "GoldTraitRollsPack3Gift", 
            displayName = "Golden Trait Reroll Gift", 
            purchaseData = {
                giftData = {
                    type = "GoldTraitRollsPack3", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2837693006, 
            purchaseName = "GoldTraitRollsPack4Gift", 
            displayName = "Golden Trait Reroll Gift", 
            purchaseData = {
                giftData = {
                    type = "GoldTraitRollsPack4", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2880608188, 
            purchaseName = "EventFoodPack1", 
            displayName = "1x Weenie Hut Sundae", 
            purchaseData = {
                inventory = {
                    type = "Food", 
                    name = "WeenieHutSundae", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2880616322, 
            purchaseName = "EventFoodPack2", 
            displayName = "5x Weenie Hut Sundaes", 
            purchaseData = {
                inventory = {
                    type = "Food", 
                    name = "WeenieHutSundae", 
                    amount = 5
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2880623366, 
            purchaseName = "EventFoodPack3", 
            displayName = "25x Weenie Hut Sundaes", 
            purchaseData = {
                inventory = {
                    type = "Food", 
                    name = "WeenieHutSundae", 
                    amount = 25
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2917975082, 
            purchaseName = "x2EventCurrencyBoost1", 
            displayName = ("1x %* Boost"):format(v6.Currency), 
            purchaseData = {
                inventory = {
                    type = "Boosts", 
                    name = v5.BOOST_NAMES[v6.Currency], 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2917990275, 
            purchaseName = "x2EventCurrencyBoost2", 
            displayName = ("5x %* Boost"):format(v6.Currency), 
            purchaseData = {
                inventory = {
                    type = "Boosts", 
                    name = v5.BOOST_NAMES[v6.Currency], 
                    amount = 5
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3336954532, 
            purchaseName = "SecretChest", 
            displayName = "Secret Chest", 
            purchaseData = {
                inventory = {
                    name = "SecretTreasureChest", 
                    amount = 1
                }
            }
        }, 
        {
            purchaseId = 3336955088, 
            purchaseName = "SecretChestGift", 
            displayName = "Secret Chest Gift", 
            purchaseData = {
                giftData = {
                    type = "SecretChestOffer1", 
                    amount = 1
                }
            }
        }, 
        {
            purchaseId = 3336957178, 
            purchaseName = "ExoticChest", 
            displayName = "Exotic Chest", 
            purchaseData = {
                inventory = {
                    name = "ExoticTreasureChest", 
                    amount = 1
                }
            }
        }, 
        {
            purchaseId = 3336957577, 
            purchaseName = "ExoticChestGift", 
            displayName = "Exotic Chest Gift", 
            purchaseData = {
                giftData = {
                    type = "ExoticChest", 
                    amount = 1
                }
            }
        }, 
        {
            purchaseId = 3336957996, 
            purchaseName = "OPChestBundle", 
            displayName = "OP Chest Bundle", 
            purchaseData = {
                bundle = {
                    type = "OPChestBundle", 
                    name = "OP Chest Bundle", 
                    maxPurchases = 3, 
                    items = {
                        {
                            type = "Inventory", 
                            name = "ExoticTreasureChest", 
                            amount = 2
                        }, 
                        {
                            type = "Inventory", 
                            name = "SecretTreasureChest", 
                            amount = 2
                        }, 
                        {
                            type = "Inventory", 
                            name = "MythicTreasureChest", 
                            amount = 50
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3336955982, 
            purchaseName = "PottyTheParrot", 
            displayName = "Potty The Parrot", 
            purchaseData = {
                pet = {
                    name = "PottyTheParrot", 
                    amount = 1
                }
            }
        }, 
        {
            purchaseId = 3231939300, 
            purchaseName = "SecretChestOffer1", 
            displayName = "Secret Chest Offer 1", 
            purchaseData = {
                secretChestOffer = 1
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3231939437, 
            purchaseName = "SecretChestOffer2", 
            displayName = "Secret Chest Offer 2", 
            purchaseData = {
                secretChestOffer = 2
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3231939584, 
            purchaseName = "SecretChestOffer3", 
            displayName = "Secret Chest Offer 3", 
            purchaseData = {
                secretChestOffer = 3
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3231939737, 
            purchaseName = "SecretChestOffer4", 
            displayName = "Secret Chest Offer 4", 
            purchaseData = {
                secretChestOffer = 4
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3231939897, 
            purchaseName = "SecretChestOffer5", 
            displayName = "Secret Chest Offer 5", 
            purchaseData = {
                secretChestOffer = 5
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3237906184, 
            purchaseName = "StarterPack", 
            displayName = "Starter Pack", 
            purchaseData = {
                bundle = {
                    type = "StarterPack", 
                    name = "Starter Pack", 
                    oneTimePurchase = true, 
                    items = {
                        {
                            type = "Currency", 
                            name = "Gems", 
                            amount = 1000
                        }, 
                        {
                            type = "Currency", 
                            name = "MagicConch", 
                            amount = 5
                        }, 
                        {
                            type = "Currency", 
                            name = "TraitRolls", 
                            amount = 10
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3237906321, 
            purchaseName = "ElitePack", 
            displayName = "Elite Bundle", 
            purchaseData = {
                bundle = {
                    type = "EliteBundle", 
                    name = "Elite Bundle", 
                    oneTimePurchase = true, 
                    items = {
                        {
                            type = "Inventory", 
                            name = "SecretTreasureChest", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "MythicTreasureChest", 
                            amount = 3
                        }, 
                        {
                            type = "Inventory", 
                            name = "TreasureChest", 
                            amount = 10
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3249421362, 
            purchaseName = "StarterChallengeBundle", 
            displayName = "Starter Challenge Bundle", 
            purchaseData = {
                bundle = {
                    type = "StarterChallengeBundle", 
                    name = "Starter Challenge Bundle", 
                    oneTimePurchase = true, 
                    items = {
                        {
                            type = "Inventory", 
                            name = "ChallengeGift", 
                            amount = 1
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3249421450, 
            purchaseName = "EliteChallengeBundle", 
            displayName = "Elite Challenge Bundle", 
            purchaseData = {
                bundle = {
                    type = "EliteChallengeBundle", 
                    name = "Elite Challenge Bundle", 
                    oneTimePurchase = true, 
                    items = {
                        {
                            type = "Inventory", 
                            name = "ChallengeGift", 
                            amount = 3
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3249428896, 
            purchaseName = "x2ChallengeTokensBoost", 
            displayName = "x2 Challenge Tokens", 
            purchaseData = {
                inventory = {
                    type = "Boosts", 
                    name = "CHALLENGETOKEN_60", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3244737653, 
            purchaseName = "PattyWagon", 
            displayName = "Patty Wagon", 
            purchaseData = {
                inventory = {
                    type = "Mounts", 
                    name = "PattyWagon", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3244740271, 
            purchaseName = "PattyWagonGift", 
            displayName = "Patty Wagon Gift", 
            purchaseData = {
                giftData = {
                    type = "PattyWagon", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2880452112, 
            purchaseName = "ChallengeCrateOffer1", 
            displayName = "Challenger Crate Offer 1", 
            purchaseData = {
                challengeCrateOffer = 1
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3147927017, 
            purchaseName = "ChallengeCrateOffer2", 
            displayName = "Challenger Crate Offer 2 ", 
            purchaseData = {
                challengeCrateOffer = 2
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2880475222, 
            purchaseName = "ChallengeCrateOffer3", 
            displayName = "Challenger Crate Offer 3", 
            purchaseData = {
                challengeCrateOffer = 3
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2880466771, 
            purchaseName = "ChallengeCrateOffer4", 
            displayName = "Challenger Crate Offer 4", 
            purchaseData = {
                challengeCrateOffer = 4
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2736861810, 
            purchaseName = "ChallengeCrateOffer5", 
            displayName = "Challenger Crate Offer 5", 
            purchaseData = {
                challengeCrateOffer = 5
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2922105121, 
            purchaseName = "ChallengeCrateOffer6", 
            displayName = "Challenger Crate Offer 6", 
            purchaseData = {
                challengeCrateOffer = 6
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3250886963, 
            purchaseName = "ChallengeCrateOffer7", 
            displayName = "Challenger Crate Offer 7", 
            purchaseData = {
                challengeCrateOffer = 7
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3255503424, 
            purchaseName = "FactionChange", 
            displayName = "Faction Change", 
            purchaseData = {
                isFactionChange = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3257362179, 
            purchaseName = "x2FactionPointsGlobal", 
            displayName = "x2 Faction Points (6 HOURS GLOBAL)", 
            purchaseData = {
                isGlobalFactionBoost = true, 
                duration = 21600
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3257366772, 
            purchaseName = "x2FactionPoints", 
            displayName = "x2 Faction Points Boost", 
            purchaseData = {
                inventory = {
                    type = "Boosts", 
                    name = "FACTIONS_60", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3256780684, 
            purchaseName = "StarterPack2", 
            displayName = "Starter Pack 2.0", 
            purchaseData = {
                bundle = {
                    type = "StarterPack2", 
                    name = "Starter Pack2", 
                    oneTimePurchase = true, 
                    items = {
                        {
                            type = "Inventory", 
                            name = "MythicTreasureChest", 
                            amount = 2
                        }, 
                        {
                            type = "Inventory", 
                            name = "ChallengeGift", 
                            amount = 2
                        }, 
                        {
                            type = "Currency", 
                            name = "GoldenTraitRolls", 
                            amount = 3
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3256781462, 
            purchaseName = "ElitePack2", 
            displayName = "Elite Bundle 2.0", 
            purchaseData = {
                bundle = {
                    type = "EliteBundle2", 
                    name = "Elite Bundle2", 
                    oneTimePurchase = true, 
                    items = {
                        {
                            type = "Inventory", 
                            name = "GIFT_5xGameSpeed", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "SecretTreasureChest", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "MythicTreasureChest", 
                            amount = 5
                        }, 
                        {
                            type = "Inventory", 
                            name = "EpicTreasureChest", 
                            amount = 15
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3268871212, 
            purchaseName = "ElitePack3", 
            displayName = "Elite Bundle 3.0", 
            purchaseData = {
                bundle = {
                    type = "EliteBundle3", 
                    name = "Elite Bundle 3.0", 
                    oneTimePurchase = true, 
                    items = {
                        {
                            type = "Inventory", 
                            name = "GIFT_5xGameSpeed", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "SecretTreasureChest", 
                            amount = 3
                        }, 
                        {
                            type = "Inventory", 
                            name = "MythicTreasureChest", 
                            amount = 10
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3268871362, 
            purchaseName = "StarterPack3", 
            displayName = "Starter Bundle 3.0", 
            purchaseData = {
                bundle = {
                    type = "StarterBundle3", 
                    name = "Starter Bundle 3.0", 
                    oneTimePurchase = true, 
                    items = {
                        {
                            type = "Inventory", 
                            name = "MythicTreasureChest", 
                            amount = 5
                        }, 
                        {
                            type = "Inventory", 
                            name = "ChallengeGift", 
                            amount = 5
                        }, 
                        {
                            type = "Currency", 
                            name = "GoldenTraitRolls", 
                            amount = 10
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3268871068, 
            purchaseName = "TraderBundle", 
            displayName = "Trader Bundle", 
            purchaseData = {
                bundle = {
                    type = "TraderBundle", 
                    name = "Trader Bundle", 
                    maxPurchases = 3, 
                    items = {
                        {
                            type = "Inventory", 
                            name = "GIFT_UltraTreasureHunter", 
                            amount = 2
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_5xGameSpeed", 
                            amount = 2
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_UltraVIP", 
                            amount = 2
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_SecretChestOffer1", 
                            amount = 2
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 2655401614, 
            purchaseName = "AllInOneBundle", 
            displayName = "All-In-1 Bundle", 
            purchaseData = {
                bundle = {
                    type = "AllInOneBundle", 
                    name = "All-In-1 Bundle", 
                    maxPurchases = 3, 
                    items = {
                        {
                            type = "Inventory", 
                            name = "GIFT_VIP", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_UltraVIP", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_GameSpeed", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_SeasonPass", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_ShinyHunter", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_WumboHunter", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_TraitHunter", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_UltraShinyHunter", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_UltraWumboHunter", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_UltraTraitHunter", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_5xGameSpeed", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_x2Leveling", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_x2GoldenSpatula", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_SecretHunter", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_UltraSecretHunter", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_TreasureHunter", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_UltraTreasureHunter", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_x2ChallengeTokens", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_2xFoodDrops", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "GIFT_4xFoodDrops", 
                            amount = 1
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3401309294, 
            purchaseName = "ExoticBundle", 
            displayName = "Exotic Bundle", 
            purchaseData = {
                bundle = {
                    type = "ExoticBundle", 
                    name = "Exotic Bundle", 
                    items = {
                        {
                            type = "Inventory", 
                            name = "GIFT_7xGameSpeed", 
                            amount = 1
                        }, 
                        {
                            type = "Inventory", 
                            name = "ExoticTreasureChest", 
                            amount = 3
                        }, 
                        {
                            type = "Inventory", 
                            name = "SecretTreasureChest", 
                            amount = 10
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3256793443, 
            purchaseName = "KrustyKrabPizza1", 
            displayName = "1x Krusty Krab Pizza", 
            purchaseData = {
                inventory = {
                    type = "Food", 
                    name = "Krusty Krab Pizza", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3256793598, 
            purchaseName = "KrustyKrabPizza2", 
            displayName = "5x Krusty Krab Pizza", 
            purchaseData = {
                inventory = {
                    type = "Food", 
                    name = "Krusty Krab Pizza", 
                    amount = 5
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3256793772, 
            purchaseName = "KrustyKrabPizza3", 
            displayName = "25x Krusty Krab Pizza", 
            purchaseData = {
                inventory = {
                    type = "Food", 
                    name = "Krusty Krab Pizza", 
                    amount = 25
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273241568, 
            purchaseName = "GemProgressionPack1", 
            displayName = "Gems Pack Offer 1", 
            purchaseData = {
                gemProgressionOffer = 1
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273241992, 
            purchaseName = "GemProgressionPack2", 
            displayName = "Gems Pack Offer 2", 
            purchaseData = {
                gemProgressionOffer = 2
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273242079, 
            purchaseName = "GemProgressionPack3", 
            displayName = "Gems Pack Offer 3", 
            purchaseData = {
                gemProgressionOffer = 3
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273242174, 
            purchaseName = "GemProgressionPack4", 
            displayName = "Gems Pack Offer 4", 
            purchaseData = {
                gemProgressionOffer = 4
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273242293, 
            purchaseName = "GemProgressionPack5", 
            displayName = "Gems Pack Offer 5", 
            purchaseData = {
                gemProgressionOffer = 5
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273242425, 
            purchaseName = "GemProgressionPack6", 
            displayName = "Gems Pack Offer 6", 
            purchaseData = {
                gemProgressionOffer = 6
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273242546, 
            purchaseName = "GemProgressionPack7", 
            displayName = "Gems Pack Offer 7", 
            purchaseData = {
                gemProgressionOffer = 7
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273264977, 
            purchaseName = "GemProgressionPack1Gift", 
            displayName = "Gems Gift", 
            purchaseData = {
                giftData = {
                    type = "GemProgressionPack1", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273265059, 
            purchaseName = "GemProgressionPack2Gift", 
            displayName = "Gems Gift", 
            purchaseData = {
                giftData = {
                    type = "GemProgressionPack2", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273265115, 
            purchaseName = "GemProgressionPack3Gift", 
            displayName = "Gems Gift", 
            purchaseData = {
                giftData = {
                    type = "GemProgressionPack3", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273265201, 
            purchaseName = "GemProgressionPack4Gift", 
            displayName = "Gems Gift", 
            purchaseData = {
                giftData = {
                    type = "GemProgressionPack4", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273265288, 
            purchaseName = "GemProgressionPack5Gift", 
            displayName = "Gems Gift", 
            purchaseData = {
                giftData = {
                    type = "GemProgressionPack5", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273265369, 
            purchaseName = "GemProgressionPack6Gift", 
            displayName = "Gems Gift", 
            purchaseData = {
                giftData = {
                    type = "GemProgressionPack6", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3273265426, 
            purchaseName = "GemProgressionPack7Gift", 
            displayName = "Gems Gift", 
            purchaseData = {
                giftData = {
                    type = "GemProgressionPack7", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = v10 and 3281512980 or 3285324226, 
            purchaseName = "2xFoodDropsGift", 
            displayName = "2x Food Drops Gift", 
            purchaseData = {
                giftData = {
                    type = "2xFoodDrops", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = v10 and 3281513079 or 3285324169, 
            purchaseName = "4xFoodDropsGift", 
            displayName = "4x Food Drops Gift", 
            purchaseData = {
                giftData = {
                    type = "4xFoodDrops", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3281534002, 
            purchaseName = "x2EventCurrency", 
            displayName = "x2 Event Currency", 
            purchaseData = {
                eventCurrencyBoost = true, 
                boostName = v6.CurrencyBoostName
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3282603592, 
            purchaseName = "DNDPack1", 
            displayName = "Dragon Crate Offer 1", 
            purchaseData = {
                dndPackOffer = 1
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3282603779, 
            purchaseName = "DNDPack2", 
            displayName = "Dragon Crate Offer 2", 
            purchaseData = {
                dndPackOffer = 2
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3282603864, 
            purchaseName = "DNDPack3", 
            displayName = "Dragon Crate Offer 3", 
            purchaseData = {
                dndPackOffer = 3
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3282604014, 
            purchaseName = "DNDPack4", 
            displayName = "Dragon Crate Offer 4", 
            purchaseData = {
                dndPackOffer = 4
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3282604128, 
            purchaseName = "DNDPack5", 
            displayName = "Dragon Crate Offer 5", 
            purchaseData = {
                dndPackOffer = 5
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3282604206, 
            purchaseName = "DNDPack6", 
            displayName = "Dragon Crate Offer 6", 
            purchaseData = {
                dndPackOffer = 6
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3282604395, 
            purchaseName = "DNDPack7", 
            displayName = "Dragon Crate Offer 7", 
            purchaseData = {
                dndPackOffer = 7
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3282604481, 
            purchaseName = "DNDPack8", 
            displayName = "Dragon Crate Offer 8", 
            purchaseData = {
                dndPackOffer = 8
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3282692421, 
            purchaseName = "NeptuneTrident", 
            displayName = "Neptune's Trident", 
            purchaseData = {
                inventory = {
                    type = "Mounts", 
                    name = "NeptuneTrident", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3286370997, 
            purchaseName = "HydraCrate1", 
            displayName = "1x Hydra Crate", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "HydraCrate", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3286371072, 
            purchaseName = "HydraCrate2", 
            displayName = "3x Hydra Crates", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "HydraCrate", 
                    amount = 3
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3286371172, 
            purchaseName = "HydraCrate3", 
            displayName = "5x Hydra Crates", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "HydraCrate", 
                    amount = 5
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294081258, 
            purchaseName = "BoostedSecretChestOffer1", 
            displayName = "Boosted Secret Chest Offer 1", 
            purchaseData = {
                boostedSecretChestOffer = 1
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294081366, 
            purchaseName = "BoostedSecretChestOffer2", 
            displayName = "Boosted Secret Chest Offer 2", 
            purchaseData = {
                boostedSecretChestOffer = 2
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294081471, 
            purchaseName = "BoostedSecretChestOffer3", 
            displayName = "Boosted Secret Chest Offer 3", 
            purchaseData = {
                boostedSecretChestOffer = 3
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294081618, 
            purchaseName = "BoostedSecretChestOffer4", 
            displayName = "Boosted Secret Chest Offer 4", 
            purchaseData = {
                boostedSecretChestOffer = 4
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294081715, 
            purchaseName = "BoostedSecretChestOffer5", 
            displayName = "Boosted Secret Chest Offer 5", 
            purchaseData = {
                boostedSecretChestOffer = 5
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294081914, 
            purchaseName = "BoostedSecretChestOffer6", 
            displayName = "Boosted Secret Chest Offer 6", 
            purchaseData = {
                boostedSecretChestOffer = 6
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294082685, 
            purchaseName = "BoostedSecretChestOffer1Gift", 
            displayName = "Boosted Secret Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "BoostedSecretChestOffer1", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294082909, 
            purchaseName = "BoostedSecretChestOffer2Gift", 
            displayName = "Boosted Secret Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "BoostedSecretChestOffer2", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294083099, 
            purchaseName = "BoostedSecretChestOffer3Gift", 
            displayName = "Boosted Secret Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "BoostedSecretChestOffer3", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294083222, 
            purchaseName = "BoostedSecretChestOffer4Gift", 
            displayName = "Boosted Secret Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "BoostedSecretChestOffer4", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294083336, 
            purchaseName = "BoostedSecretChestOffer5Gift", 
            displayName = "Boosted Secret Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "BoostedSecretChestOffer5", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3294083433, 
            purchaseName = "BoostedSecretChestOffer6Gift", 
            displayName = "Boosted Secret Treasure Gift", 
            purchaseData = {
                giftData = {
                    type = "BoostedSecretChestOffer6", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3300717654, 
            purchaseName = "MerchantRefresh", 
            displayName = "Merchant Stock Refresh", 
            purchaseData = {
                merchantRefresh = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3304582935, 
            purchaseName = "MysteryMarketRefresh", 
            displayName = "Mystery Market Refresh", 
            dontDisplayConfirmation = true, 
            purchaseData = {
                mysteryMarketRefresh = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3305310362, 
            purchaseName = "MysteryMarketMaterial", 
            displayName = "Mystery Market Material", 
            dontDisplayConfirmation = true, 
            purchaseData = {
                mysteryMarketMaterial = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306325924, 
            purchaseName = "InstantCraft1", 
            displayName = "Instant Craft", 
            purchaseData = {
                instantCraft = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306326005, 
            purchaseName = "InstantCraft2", 
            displayName = "Instant Craft", 
            purchaseData = {
                instantCraft = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306326066, 
            purchaseName = "InstantCraft3", 
            displayName = "Instant Craft", 
            purchaseData = {
                instantCraft = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306326207, 
            purchaseName = "InstantCraft4", 
            displayName = "Instant Craft", 
            purchaseData = {
                instantCraft = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306326283, 
            purchaseName = "InstantCraft5", 
            displayName = "Instant Craft", 
            purchaseData = {
                instantCraft = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306326367, 
            purchaseName = "InstantCraft6", 
            displayName = "Instant Craft", 
            purchaseData = {
                instantCraft = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306326442, 
            purchaseName = "InstantCraft7", 
            displayName = "Instant Craft", 
            purchaseData = {
                instantCraft = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306326500, 
            purchaseName = "InstantCraft8", 
            displayName = "Instant Craft", 
            purchaseData = {
                instantCraft = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306326583, 
            purchaseName = "InstantCraft9", 
            displayName = "Instant Craft", 
            purchaseData = {
                instantCraft = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306326647, 
            purchaseName = "InstantCraft10", 
            displayName = "Instant Craft", 
            purchaseData = {
                instantCraft = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306534670, 
            purchaseName = "Krew+1", 
            displayName = "Krew+ 1 Month", 
            purchaseData = {
                krewPlusMonths = 1
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306534771, 
            purchaseName = "Krew+12", 
            displayName = "Krew+ 12 Months", 
            purchaseData = {
                krewPlusMonths = 12
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306559709, 
            purchaseName = "Krew+1Gift", 
            displayName = "Krew+ 1 Month Gift", 
            purchaseData = {
                giftData = {
                    type = "Krew+1", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3306559747, 
            purchaseName = "Krew+12Gift", 
            displayName = "Krew+ 12 Months Gift", 
            purchaseData = {
                giftData = {
                    type = "Krew+12", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3309672990, 
            purchaseName = "ScoopCapsuleOffer1", 
            displayName = "x1 Scoop Capsule", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "ScoopCapsule", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3309673116, 
            purchaseName = "ScoopCapsuleOffer2", 
            displayName = "x3 Scoop Capsule", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "ScoopCapsule", 
                    amount = 3
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3309673210, 
            purchaseName = "ScoopCapsuleOffer3", 
            displayName = "x5 Scoop Capsule", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "ScoopCapsule", 
                    amount = 5
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3317604719, 
            purchaseName = "SandCrate1", 
            displayName = "x1 Sand Crate", 
            purchaseData = {
                tier = 1, 
                reward = {
                    type = "Inventory", 
                    name = "SandCrate", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3317605624, 
            purchaseName = "SandCrate2", 
            displayName = "x3 Sand Crates", 
            purchaseData = {
                tier = 2, 
                reward = {
                    type = "Inventory", 
                    name = "SandCrate", 
                    amount = 3
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3317605804, 
            purchaseName = "SandCrate3", 
            displayName = "x5 Sand Crates", 
            purchaseData = {
                tier = 3, 
                reward = {
                    type = "Inventory", 
                    name = "SandCrate", 
                    amount = 5
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3317606029, 
            purchaseName = "SandCrate4", 
            displayName = "x10 Sand Crates", 
            purchaseData = {
                tier = 4, 
                reward = {
                    type = "Inventory", 
                    name = "SandCrate", 
                    amount = 10
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3317606227, 
            purchaseName = "SandCrate5", 
            displayName = "x25 Sand Crates", 
            purchaseData = {
                tier = 5, 
                reward = {
                    type = "Inventory", 
                    name = "SandCrate", 
                    amount = 25
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3317606368, 
            purchaseName = "SandCrate6", 
            displayName = "x50 Sand Crates", 
            purchaseData = {
                tier = 6, 
                reward = {
                    type = "Inventory", 
                    name = "SandCrate", 
                    amount = 50
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3317606521, 
            purchaseName = "SandCrate7", 
            displayName = "x100 Sand Crates", 
            purchaseData = {
                tier = 7, 
                reward = {
                    type = "Inventory", 
                    name = "SandCrate", 
                    amount = 100
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3311200451, 
            purchaseName = "AddPetSlot", 
            displayName = "+1 Pet Slot", 
            purchaseData = {
                petSlot = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3337790098, 
            purchaseName = "AddPetSlotGift", 
            displayName = "+1 Pet Slot Gift", 
            purchaseData = {
                giftData = {
                    type = "PetSlot", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3370882279, 
            purchaseName = "PatriciaCrate1", 
            displayName = "x1 Mystic Purse", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "PatriciaCrate", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3370882389, 
            purchaseName = "PatriciaCrate2", 
            displayName = "x3 Mystic Purse", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "PatriciaCrate", 
                    amount = 3
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3370882470, 
            purchaseName = "PatriciaCrate3", 
            displayName = "x10 Mystic Purse", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "PatriciaCrate", 
                    amount = 10
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3380079899, 
            purchaseName = "KampKreditsPack1", 
            displayName = "150x Kamp Kredits", 
            purchaseData = {
                currency = {
                    name = "KampKredit", 
                    amount = 150
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3380080386, 
            purchaseName = "KampKreditsPack2", 
            displayName = "500x Kamp Kredits", 
            purchaseData = {
                currency = {
                    name = "KampKredit", 
                    amount = 500
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3380080605, 
            purchaseName = "KampKreditsPack3", 
            displayName = "1,500x Kamp Kredits", 
            purchaseData = {
                currency = {
                    name = "KampKredit", 
                    amount = 1500
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3380079540, 
            purchaseName = "BlueSlopPack1", 
            displayName = "3x Blue Slop", 
            purchaseData = {
                inventory = {
                    type = "Food", 
                    name = "BlueSlop", 
                    amount = 3
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3380079330, 
            purchaseName = "BlueSlopPack2", 
            displayName = "15x Blue Slop", 
            purchaseData = {
                inventory = {
                    type = "Food", 
                    name = "BlueSlop", 
                    amount = 15
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3380079137, 
            purchaseName = "BlueSlopPack3", 
            displayName = "50x Blue Slop", 
            purchaseData = {
                inventory = {
                    type = "Food", 
                    name = "BlueSlop", 
                    amount = 50
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3380078686, 
            purchaseName = "DorudonMount", 
            displayName = "Dorudon Mount", 
            purchaseData = {
                inventory = {
                    type = "Mount", 
                    name = "Dorudon", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3391631918, 
            purchaseName = "CyclopsVault1", 
            displayName = "x1 Cyclops Vault", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "CyclopsVault", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3391632081, 
            purchaseName = "CyclopsVault2", 
            displayName = "x3 Cyclops Vault", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "CyclopsVault", 
                    amount = 3
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3391632180, 
            purchaseName = "CyclopsVault3", 
            displayName = "x10 Cyclops Vault", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "CyclopsVault", 
                    amount = 10
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3401135064, 
            purchaseName = "PrizedEgg1", 
            displayName = "x1 Prized Egg", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "PrizedEgg", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3401135171, 
            purchaseName = "PrizedEgg2", 
            displayName = "x3 Prized Egg", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "PrizedEgg", 
                    amount = 3
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3401135312, 
            purchaseName = "PrizedEgg3", 
            displayName = "x10 Prized Egg", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "PrizedEgg", 
                    amount = 10
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3401253952, 
            purchaseName = "OPBundleOffer", 
            displayName = "OP Bundle", 
            purchaseData = {
                bundle = {
                    type = "OPBundleOffer", 
                    name = "OP Bundle", 
                    oneTimePurchase = true, 
                    items = {
                        {
                            type = "Currency", 
                            name = "Coins", 
                            amount = 50000
                        }, 
                        {
                            type = "Currency", 
                            name = "Gems", 
                            amount = 5000
                        }, 
                        {
                            type = "UniqueBehavior", 
                            callback = function(v14) --[[ Line: 3633 ]] --[[ Name: callback ]]
                                -- upvalues: v3 (copy)
                                local v15 = v3.GetService("DataService");
                                if v15:Get(v14, "ProgressiveSummonLuck") >= 3 then
                                    return;
                                else
                                    v15:Set(v14, "ProgressiveSummonLuck", 3);
                                    return;
                                end;
                            end
                        }, 
                        {
                            type = "UniqueBehavior", 
                            callback = function(v16) --[[ Line: 3646 ]] --[[ Name: callback ]]
                                -- upvalues: v3 (copy)
                                local v17 = v3.GetService("DataService");
                                v17:Set(v16, "MaxUnits", v17:Get(v16, "MaxUnits") + 100);
                            end
                        }
                    }
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3414031382, 
            purchaseName = "2xCraftingMaterialsGift", 
            displayName = "2x Crafting Materials Gift", 
            purchaseData = {
                giftData = {
                    type = "x2CraftingMaterials", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3414031540, 
            purchaseName = "4xCraftingMaterialsGift", 
            displayName = "4x Crafting Materials Gift", 
            purchaseData = {
                giftData = {
                    type = "x4CraftingMaterials", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3414031809, 
            purchaseName = "InstantCraftGift", 
            displayName = "Instant Craft Gift", 
            purchaseData = {
                giftData = {
                    type = "InstantCraft", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3425561280, 
            purchaseName = "PioneerCrate1", 
            displayName = "1x Pioneer Crate", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "PioneerCrate", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3425561356, 
            purchaseName = "PioneerCrate2", 
            displayName = "3x Pioneer Crate", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "PioneerCrate", 
                    amount = 3
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3425561461, 
            purchaseName = "PioneerCrate3", 
            displayName = "10x Pioneer Crate", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "PioneerCrate", 
                    amount = 10
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3425561519, 
            purchaseName = "FighterCrate1", 
            displayName = "1x Fighter Crate", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "FighterCrate", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3425561601, 
            purchaseName = "FighterCrate2", 
            displayName = "3x Fighter Crate", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "FighterCrate", 
                    amount = 3
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3425561666, 
            purchaseName = "FighterCrate3", 
            displayName = "10x Fighter Crate", 
            purchaseData = {
                inventory = {
                    type = "Chests", 
                    name = "FighterCrate", 
                    amount = 10
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3443623982, 
            purchaseName = "2xKarateCoinsGift", 
            displayName = "x2 Karate Coins Gift", 
            purchaseData = {
                giftData = {
                    type = "2xKarateCoins", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3443624083, 
            purchaseName = "4xKarateCoinsGift", 
            displayName = "x4 Karate Coins Gift", 
            purchaseData = {
                giftData = {
                    type = "4xKarateCoins", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3443623683, 
            purchaseName = "2xBeltsGift", 
            displayName = "x2 Belts XP Gift", 
            purchaseData = {
                giftData = {
                    type = "2xBelts", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3443623814, 
            purchaseName = "4xBeltsGift", 
            displayName = "x4 Belts XP Gift", 
            purchaseData = {
                giftData = {
                    type = "4xBelts", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3443627528, 
            purchaseName = "AnchorArms", 
            displayName = "Anchor Arms", 
            purchaseData = {
                inventory = {
                    type = "KarateGloves", 
                    name = "AnchorArms", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3443628665, 
            purchaseName = "GlitchedGloves", 
            displayName = "Glitched Karate Gloves", 
            purchaseData = {
                inventory = {
                    type = "KarateGloves", 
                    name = "Glitched", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3458454915, 
            purchaseName = "FeastCrate1", 
            displayName = "x1 Feast Crate", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "FeastCrate", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3458455398, 
            purchaseName = "FeastCrate2", 
            displayName = "x3 Feast Crates", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "FeastCrate", 
                    amount = 3
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3458455509, 
            purchaseName = "FeastCrate3", 
            displayName = "x10 Feast Crates", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "FeastCrate", 
                    amount = 10
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3475951488, 
            purchaseName = "SwashbucklerCrate1", 
            displayName = "x1 Swashbuckler Crate", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "SwashbucklerCrate", 
                    amount = 1
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3475951532, 
            purchaseName = "SwashbucklerCrate2", 
            displayName = "x5 Swashbuckler Crates", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "SwashbucklerCrate", 
                    amount = 5
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3475951564, 
            purchaseName = "SwashbucklerCrate3", 
            displayName = "x25 Swashbuckler Crates", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "SwashbucklerCrate", 
                    amount = 25
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3477060929, 
            purchaseName = "SwashbucklerCrate4", 
            displayName = "x100 Swashbuckler Crates", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "SwashbucklerCrate", 
                    amount = 100
                }
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3483191219, 
            purchaseName = "SpongebobSanta", 
            displayName = "Spongebob Santa", 
            purchaseData = {
                unitName = "SpongebobSanta", 
                isLimitedUnit = true
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3483560168, 
            purchaseName = "CruiseCrate1", 
            displayName = "x1 Cruise Crate", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "CruiseCrate", 
                    amount = 1
                }, 
                expireOn = v13.CruiseCrate.expireOn
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3483560381, 
            purchaseName = "CruiseCrate2", 
            displayName = "x3 Cruise Crates", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "CruiseCrate", 
                    amount = 3
                }, 
                expireOn = v13.CruiseCrate.expireOn
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3483560564, 
            purchaseName = "CruiseCrate3", 
            displayName = "x5 Cruise Crates", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "CruiseCrate", 
                    amount = 5
                }, 
                expireOn = v13.CruiseCrate.expireOn
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3483571704, 
            purchaseName = "LeSpatulaPet", 
            displayName = "Le Spatula", 
            purchaseData = {
                pet = {
                    name = "LeSpatula", 
                    amount = 1
                }
            }
        }, 
        {
            purchaseId = 3483777803, 
            purchaseName = "LeSpatulaPet_ShinyWumbo", 
            displayName = "Shiny Wumbo Le Spatula", 
            purchaseData = {
                pet = {
                    name = "LeSpatula", 
                    extraData = {
                        Shiny = true, 
                        Wumbo = true
                    }, 
                    amount = 1
                }
            }
        }, 
        {
            purchaseId = 3483565109, 
            purchaseName = "SnowCrate1", 
            displayName = "x1 Snow Crate", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "SnowCrate", 
                    amount = 1
                }, 
                startOn = v13.SnowCrate.startOn, 
                expireOn = v13.SnowCrate.expireOn
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3483565323, 
            purchaseName = "SnowCrate2", 
            displayName = "x3 Snow Crates", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "SnowCrate", 
                    amount = 3
                }, 
                startOn = v13.SnowCrate.startOn, 
                expireOn = v13.SnowCrate.expireOn
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3483565480, 
            purchaseName = "SnowCrate3", 
            displayName = "x5 Snow Crates", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "SnowCrate", 
                    amount = 5
                }, 
                startOn = v13.SnowCrate.startOn, 
                expireOn = v13.SnowCrate.expireOn
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3483583682, 
            purchaseName = "HolidayCrate1", 
            displayName = "x1 Holiday Crate", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "HolidayCrate", 
                    amount = 1
                }, 
                startOn = v13.HolidayCrate.startOn, 
                expireOn = v13.HolidayCrate.expireOn
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3483583826, 
            purchaseName = "HolidayCrate2", 
            displayName = "x5 Holiday Crates", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "HolidayCrate", 
                    amount = 5
                }, 
                startOn = v13.HolidayCrate.startOn, 
                expireOn = v13.HolidayCrate.expireOn
            }, 
            purchaseType = "DevProduct"
        }, 
        {
            purchaseId = 3483583972, 
            purchaseName = "HolidayCrate3", 
            displayName = "x10 Holiday Crates", 
            purchaseData = {
                inventory = {
                    type = "Inventory", 
                    name = "HolidayCrate", 
                    amount = 10
                }, 
                startOn = v13.HolidayCrate.startOn, 
                expireOn = v13.HolidayCrate.expireOn
            }, 
            purchaseType = "DevProduct"
        }
    }, 
    Gamepasses = {
        {
            purchaseId = 985605505, 
            purchaseName = "TraitHunter", 
            displayName = "Trait Hunter", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1007243494, 
            purchaseName = "UltraTraitHunter", 
            displayName = "Ultra Trait Hunter", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 954862900, 
            purchaseName = "GameSpeed", 
            displayName = "3x Game Speed", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 954580243, 
            purchaseName = "VIP", 
            displayName = "VIP", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1007727471, 
            purchaseName = "UltraVIP", 
            displayName = "Ultra VIP", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1007661481, 
            purchaseName = "ShinyHunter", 
            displayName = "Shiny Hunter", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1007827437, 
            purchaseName = "UltraShinyHunter", 
            displayName = "Ultra Shiny Hunter", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1007607369, 
            purchaseName = "WumboHunter", 
            displayName = "Wumbo Hunter", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1007543454, 
            purchaseName = "UltraWumboHunter", 
            displayName = "Ultra Wumbo Hunter", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1007695519, 
            purchaseName = "DisplayUnits", 
            displayName = "Display All Units", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1610004704, 
            purchaseName = "PremiumSeasonPass", 
            displayName = ("Premium Season %* Pass"):format((v7:NumberToWord(v5.SEASON, true))), 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1017802059, 
            purchaseName = "SecretHunter", 
            displayName = "Secret Hunter", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1017692014, 
            purchaseName = "UltraSecretHunter", 
            displayName = "Ultra Secret Hunter", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1038941300, 
            purchaseName = "x2Leveling", 
            displayName = "x2 Leveling", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1038801526, 
            purchaseName = "x4Leveling", 
            displayName = "x4 Leveling", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1040612436, 
            purchaseName = "x2GoldenSpatula", 
            displayName = "", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1040969916, 
            purchaseName = "5xGameSpeed", 
            displayName = "5x Game Speed", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1041049770, 
            purchaseName = "x2Bubbles", 
            displayName = "x2 Bubbles", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1091426579, 
            purchaseName = "TreasureHunter", 
            displayName = "Treasure Hunter", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1091254708, 
            purchaseName = "UltraTreasureHunter", 
            displayName = "Ultra Treasure Hunter", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1128192575, 
            purchaseName = "x2ChallengeTokens", 
            displayName = "x2 Challenge Tokens", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1204473156, 
            purchaseName = "2xFoodDrops", 
            displayName = "2x Food Drops", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1206423681, 
            purchaseName = "4xFoodDrops", 
            displayName = "4x Food Drops", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1156118734, 
            purchaseName = "Open50Chests", 
            displayName = "Open 50 Treasure Chests", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 13600173502, 
            purchaseName = "MarketplaceLicense", 
            displayName = "Marketplace License", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1263988853, 
            purchaseName = "EventBoost", 
            displayName = "2x Sand Dollars (Event)", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1417215051, 
            purchaseName = "x2KampKredits", 
            displayName = "2x Kamp Kredits (Event)", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1417640940, 
            purchaseName = "7xGameSpeed", 
            displayName = "7x Game Speed", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1485750339, 
            purchaseName = "2xCraftingMaterials", 
            displayName = "2x Crafting Materials", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1485306459, 
            purchaseName = "4xCraftingMaterials", 
            displayName = "4x Crafting Materials", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1484684613, 
            purchaseName = "InstantCraft", 
            displayName = "Instant Craft", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1552112180, 
            purchaseName = "4xBelts", 
            displayName = "x4 Belts", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1554983820, 
            purchaseName = "2xBelts", 
            displayName = "x2 Belts", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1555861559, 
            purchaseName = "4xKarateCoins", 
            displayName = "x4 Karate Coins", 
            purchaseType = "Gamepass"
        }, 
        {
            purchaseId = 1555421673, 
            purchaseName = "2xKarateCoins", 
            displayName = "x2 Karate Coins", 
            purchaseType = "Gamepass"
        }
    }, 
    Subscriptions = {
        {
            purchaseId = "EXP-5397272972461080926", 
            purchaseName = "KrustyKrew", 
            purchaseType = "Subscription"
        }
    }
};