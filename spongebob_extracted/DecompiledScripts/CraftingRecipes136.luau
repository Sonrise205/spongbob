local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = l_RunService_0:IsServer();
local _ = l_RunService_0:IsClient();
local function v9(_, v8) --[[ Line: 16 ]] --[[ Name: ReconcileRecipeData ]]
    -- upvalues: v2 (copy)
    return v2.Reconcile(v8, {
        description = "A recipe for crafting an item.", 
        hint = "Used for crafting."
    });
end;
local v10 = {
    JellyfishJelly = {
        displayName = "Jellyfish Jelly", 
        timeToCraft = 180, 
        category = "Unit Food", 
        item = {
            type = "Inventory", 
            name = "JellyfishJelly"
        }, 
        materials = {
            JellyTendrils = 6
        }
    }, 
    SpongePopsicle = {
        displayName = "Sponge Popsicle", 
        timeToCraft = 300, 
        category = "Unit Food", 
        item = {
            type = "Inventory", 
            name = "SpongePopsicle"
        }, 
        materials = {
            MoldySponge = 10
        }
    }, 
    HolographicMeatloaf = {
        displayName = "Holographic Meatloaf", 
        timeToCraft = 600, 
        category = "Unit Food", 
        item = {
            type = "Inventory", 
            name = "HolographicMeatloaf"
        }, 
        materials = {
            CorrodedCircuit = 15, 
            EVILCore = 1
        }
    }, 
    AnchorArms_1 = {
        order = 1, 
        displayName = "Anchor Arms I", 
        timeToCraft = 3600, 
        category = "Unit Booster", 
        item = {
            type = "Inventory", 
            name = "AnchorArms_1"
        }, 
        materials = {
            GoldenPattyBun = 10, 
            HeroEmblem = 2, 
            SuperheroTape = 1, 
            PattyTokens = 1
        }
    }, 
    AnchorArms_2 = {
        order = 2, 
        displayName = "Anchor Arms II", 
        timeToCraft = 10800, 
        category = "Unit Booster", 
        item = {
            type = "Inventory", 
            name = "AnchorArms_2"
        }, 
        materials = {
            AnchorArms_1 = 2, 
            TidalThread = 2, 
            SpectralBarnacles = 1
        }
    }, 
    AnchorArms_3 = {
        order = 3, 
        displayName = "Anchor Arms III", 
        timeToCraft = 21600, 
        category = "Unit Booster", 
        item = {
            type = "Inventory", 
            name = "AnchorArms_3"
        }, 
        materials = {
            AnchorArms_2 = 2, 
            SecretSauce = 2, 
            GoofyGooberSyrup = 1
        }
    }, 
    TurboTartar_1 = {
        order = 4, 
        displayName = "Turbo Tartar I", 
        timeToCraft = 3600, 
        category = "Unit Booster", 
        item = {
            type = "Inventory", 
            name = "TurboTartar_1"
        }, 
        materials = {
            FrozenCoral = 10, 
            BubbleResin = 2, 
            BubbleDiskette = 1, 
            SeaCrystal = 1
        }
    }, 
    TurboTartar_2 = {
        order = 5, 
        displayName = "Turbo Tartar II", 
        timeToCraft = 10800, 
        category = "Unit Booster", 
        item = {
            type = "Inventory", 
            name = "TurboTartar_2"
        }, 
        materials = {
            TurboTartar_1 = 2, 
            BioJellyCache = 2, 
            AncientSponge = 1
        }
    }, 
    TurboTartar_3 = {
        order = 6, 
        displayName = "Turbo Tartar III", 
        timeToCraft = 21600, 
        category = "Unit Booster", 
        item = {
            type = "Inventory", 
            name = "TurboTartar_3"
        }, 
        materials = {
            TurboTartar_2 = 2, 
            MysteryPatty = 2, 
            EVILCore = 1
        }
    }, 
    ScopeShell_1 = {
        order = 7, 
        displayName = "Scope Shell I", 
        timeToCraft = 3600, 
        category = "Unit Booster", 
        item = {
            type = "Inventory", 
            name = "ScopeShell_1"
        }, 
        materials = {
            SpectralRope = 10, 
            BurntScroll = 2, 
            SeaCrystal = 1, 
            AncientSponge = 1
        }
    }, 
    ScopeShell_2 = {
        order = 8, 
        displayName = "Scope Shell II", 
        timeToCraft = 10800, 
        category = "Unit Booster", 
        item = {
            type = "Inventory", 
            name = "ScopeShell_2"
        }, 
        materials = {
            ScopeShell_1 = 2, 
            PattyTokens = 2, 
            SpectralBarnacles = 1
        }
    }, 
    ScopeShell_3 = {
        order = 9, 
        displayName = "Scope Shell III", 
        timeToCraft = 21600, 
        category = "Unit Booster", 
        item = {
            type = "Inventory", 
            name = "ScopeShell_3"
        }, 
        materials = {
            ScopeShell_2 = 2, 
            BioJellyCache = 2, 
            MysteryPatty = 1
        }
    }, 
    PowerPatty = {
        order = 10, 
        displayName = "Power Patty", 
        timeToCraft = 43200, 
        category = "Unit Booster", 
        item = {
            type = "Inventory", 
            name = "PowerPatty"
        }, 
        materials = {
            AnchorArms_3 = 1, 
            TurboTartar_3 = 1, 
            ScopeShell_3 = 1, 
            SecretSauce = 5
        }
    }, 
    BikiniBottomBus = {
        displayName = "Bikini Bottom Bus", 
        timeToCraft = 7200, 
        category = "Mount", 
        item = {
            type = "Inventory", 
            name = "BikiniBottomBus"
        }, 
        materials = {
            AcornAlloy = 10, 
            EchoShards = 10, 
            ScratchedLicensePlate = 3, 
            HeroEmblem = 2, 
            BioJellyCache = 1, 
            TidalThread = 1
        }
    }, 
    FlyingDutchmanShip = {
        displayName = "Flying Dutchman Ship", 
        timeToCraft = 3600, 
        category = "Mount", 
        item = {
            type = "Inventory", 
            name = "FlyingDutchmanShip"
        }, 
        materials = {
            SpectralRope = 5, 
            ScratchedLicensePlate = 3, 
            TreasureMap = 1, 
            TheHuntToken = 1, 
            Barnacle = 1, 
            SpectralBarnacles = 2, 
            SeaCrystal = 2
        }
    }, 
    BreakfastMonster = {
        displayName = "Breakfast Monster", 
        timeToCraft = 86400, 
        category = "Unit", 
        item = {
            type = "Unit", 
            name = "BreakfastMonster"
        }, 
        materials = {
            GreasyNapkin = 15, 
            AcornAlloy = 15, 
            GoldenPattyBun = 10, 
            FrozenCoral = 10, 
            BubbleResin = 5, 
            GoofyGooberSyrup = 5, 
            MysteryPatty = 5, 
            SecretSauce = 5
        }
    }, 
    Nosferatu = {
        displayName = "Nosferatu", 
        timeToCraft = 172800, 
        category = "Unit", 
        item = {
            type = "Unit", 
            name = "Nosferatu"
        }, 
        materials = {
            SpectralRope = 25, 
            HeroEmblem = 10, 
            BurntScroll = 10, 
            BubbleResin = 10, 
            EVILCore = 15, 
            SuperheroTape = 10, 
            BubbleDiskette = 10, 
            AncientSponge = 15
        }
    }, 
    StorageSpace_100 = {
        order = 1, 
        displayName = "+100 Storage Space", 
        timeToCraft = 3600, 
        category = "Gamepass / Progression", 
        item = {
            type = "Inventory", 
            name = "GIFT_StorageUpgrade"
        }, 
        materials = {
            JellyTendrils = 10, 
            FrozenCoral = 5, 
            BubbleResin = 3, 
            TidalThread = 1
        }, 
        description = "Gift yourself or a friend this upgrade!"
    }, 
    OpenTreasureChest_10 = {
        order = 2, 
        displayName = "Open 10 Treasure Chests", 
        timeToCraft = 3600, 
        category = "Gamepass / Progression", 
        item = {
            type = "Inventory", 
            name = "GIFT_Open10Chests"
        }, 
        materials = {
            CorrodedCircuit = 15, 
            BurntScroll = 5, 
            SecretSauce = 2
        }, 
        description = "Open Treasure Chests faster! Gift yourself or a friend this upgrade!"
    }, 
    ShinyHunter = {
        order = 3, 
        displayName = "Shiny Hunter", 
        timeToCraft = 7200, 
        category = "Gamepass / Progression", 
        item = {
            type = "Inventory", 
            name = "GIFT_ShinyHunter"
        }, 
        materials = {
            EchoShards = 10, 
            GoldenPattyBun = 6, 
            BubbleResin = 3, 
            AncientSponge = 2, 
            GoofyGooberSyrup = 1
        }, 
        description = "Epic Boost to summoning Shiny Units! Gift yourself or a friend this gamepass!"
    }, 
    WumboHunter = {
        order = 4, 
        displayName = "Wumbo Hunter", 
        timeToCraft = 14400, 
        category = "Gamepass / Progression", 
        item = {
            type = "Inventory", 
            name = "GIFT_WumboHunter"
        }, 
        materials = {
            JellyTendrils = 10, 
            HeroEmblem = 3, 
            BurntScroll = 3, 
            SpectralBarnacles = 2, 
            SuperheroTape = 2, 
            BubbleDiskette = 2
        }, 
        description = "Epic Boost to summoning Wumbo Units! Gift yourself or a friend this gamepass!"
    }, 
    GoldTraitReroll = {
        order = 1, 
        displayName = "Gold Trait Reroll", 
        timeToCraft = 300, 
        category = "Resource", 
        item = {
            type = "Currency", 
            name = "GoldenTraitRolls"
        }, 
        materials = {
            GoldenPattyBun = 3, 
            SecretSauce = 1
        }
    }, 
    MagicConch = {
        order = 2, 
        displayName = "Magic Conch", 
        timeToCraft = 600, 
        category = "Resource", 
        item = {
            type = "Currency", 
            name = "MagicConch"
        }, 
        materials = {
            ScratchedLicensePlate = 3, 
            EVILCore = 1, 
            MysteryPatty = 1
        }
    }, 
    EpicTreasureChest = {
        order = 3, 
        displayName = "Epic Treasure Chest", 
        timeToCraft = 60, 
        category = "Resource", 
        item = {
            type = "Inventory", 
            name = "EpicTreasureChest"
        }, 
        materials = {
            TreasureChest = 10
        }
    }, 
    LegendaryTreasureChest = {
        order = 4, 
        displayName = "Legendary Treasure Chest", 
        timeToCraft = 300, 
        category = "Resource", 
        item = {
            type = "Inventory", 
            name = "LegendaryTreasureChest"
        }, 
        materials = {
            EpicTreasureChest = 10
        }
    }, 
    MythicTreasureChest = {
        order = 5, 
        displayName = "Mythic Treasure Chest", 
        timeToCraft = 600, 
        category = "Resource", 
        item = {
            type = "Inventory", 
            name = "MythicTreasureChest"
        }, 
        materials = {
            LegendaryTreasureChest = 10
        }
    }, 
    ChallengeToken_60 = {
        order = 3, 
        displayName = "2x Challenge Tokens (60 Min)", 
        timeToCraft = 300, 
        category = "Boost", 
        item = {
            type = "Inventory", 
            name = "CHALLENGETOKEN_60"
        }, 
        materials = {
            FrozenCoral = 5, 
            SpectralRope = 5
        }
    }, 
    FactionPoints_60 = {
        order = 4, 
        displayName = "2x Faction Points (60 Min)", 
        timeToCraft = 300, 
        offsale = true, 
        category = "Boost", 
        item = {
            type = "Inventory", 
            name = "FACTIONS_60"
        }, 
        materials = {
            AcornAlloy = 8, 
            GreasyNapkin = 8
        }
    }, 
    GEMS_60 = {
        order = 1, 
        displayName = "2x Gems (60 Min)", 
        timeToCraft = 300, 
        category = "Boost", 
        item = {
            type = "Inventory", 
            name = "GEMS_60"
        }, 
        materials = {
            MoldySponge = 5, 
            JellyTendrils = 5
        }
    }, 
    COINS_60 = {
        order = 2, 
        displayName = "2x Coins (60 Min)", 
        timeToCraft = 300, 
        category = "Boost", 
        item = {
            type = "Inventory", 
            name = "COINS_60"
        }, 
        materials = {
            GreasyNapkin = 5, 
            CorrodedCircuit = 5
        }
    }, 
    XP_60 = {
        order = 5, 
        displayName = "2x XP (60 Min)", 
        timeToCraft = 300, 
        category = "Boost", 
        item = {
            type = "Inventory", 
            name = "XP_60"
        }, 
        materials = {
            AcornAlloy = 5, 
            EchoShards = 5
        }
    }, 
    ShinyAura = {
        order = 1, 
        displayName = "Shiny Aura", 
        timeToCraft = 86400, 
        category = "Special", 
        item = {
            type = "Inventory", 
            name = "ShinyAura"
        }, 
        materials = {
            EchoShards = 15, 
            JellyTendrils = 15, 
            SpectralRope = 5, 
            BubbleResin = 3, 
            BioJellyCache = 2, 
            BubbleDiskette = 2
        }, 
        description = "A glowing rainbow that sparkles with imagination. Used to craft the Shiny Wumbo Potion!"
    }, 
    WumboBelt = {
        order = 2, 
        displayName = "Wumbo Belt", 
        timeToCraft = 172800, 
        category = "Special", 
        item = {
            type = "Inventory", 
            name = "WumboBelt"
        }, 
        materials = {
            AcornAlloy = 15, 
            ScratchedLicensePlate = 10, 
            HeroEmblem = 5, 
            SecretSauce = 3, 
            PattyTokens = 3, 
            MysteryPatty = 3
        }, 
        description = "A stretchy belt rumored to make anything wumbo-sized! Used to craft the Shiny Wumbo Potion!"
    }, 
    ShinyWumboPotion = {
        order = 3, 
        displayName = "Shiny Wumbo Potion", 
        timeToCraft = 259200, 
        category = "Special", 
        description = "(94%) Tier I: Usable only on Common to Legendary units\n(5.98%) Tier II: Usable only on Mythic units\n(0.02%) Tier III: Usable only on Secret & Limited units", 
        hint = "Transforms a unit into its Shiny Wumbo form!", 
        rngItem = {
            {
                type = "Inventory", 
                name = "ShinyWumboPotion_1", 
                weight = 94
            }, 
            {
                type = "Inventory", 
                name = "ShinyWumboPotion_2", 
                weight = 5.98
            }, 
            {
                type = "Inventory", 
                name = "ShinyWumboPotion_3", 
                weight = 0.02
            }
        }, 
        materials = {
            ShinyAura = 1, 
            WumboBelt = 1, 
            TidalThread = 5, 
            SuperheroTape = 5, 
            EVILCore = 5, 
            AncientSponge = 5
        }
    }, 
    SecretFormula = {
        order = 4, 
        displayName = "Secret Formula Reroll", 
        timeToCraft = 43200, 
        category = "Special", 
        item = {
            type = "Inventory", 
            name = "SecretFormulaReroll"
        }, 
        materials = {
            TraitRolls = 200, 
            Gems = 2500, 
            Coins = 5000, 
            MysteryPatty = 10
        }, 
        description = "A magical bottle with ocean power beyond King Neptune, instantly changing a unit\226\128\153s trait to Secret Formula!"
    }, 
    NeptunesCrown = {
        order = 5, 
        displayName = "Neptune's Crown Reroll", 
        timeToCraft = 172800, 
        category = "Special", 
        item = {
            type = "Inventory", 
            name = "NeptunesCrownReroll"
        }, 
        materials = {
            TraitRolls = 2500, 
            Gems = 25000, 
            Coins = 50000, 
            SpectralBarnacles = 25
        }, 
        description = "A magical bottle of supreme ocean might, instantly granting a unit to wield two traits at once with Neptune\226\128\153s Crown!"
    }, 
    SandCrate = {
        displayName = "x1 Sand Crate", 
        timeToCraft = 1800, 
        event = "GooLagoon", 
        category = "Event", 
        item = {
            type = "Inventory", 
            name = "SandCrate"
        }, 
        materials = {
            SuperGoo = 7
        }
    }, 
    CoralCandy = {
        displayName = "Coral Candy", 
        timeToCraft = 420, 
        category = "Unit Food", 
        item = {
            type = "Inventory", 
            name = "CoralCandy"
        }, 
        materials = {
            SuperGoo = 5
        }
    }, 
    BoostedScoopCapsule = {
        displayName = "\240\159\141\128 Boosted Scoop Capsule", 
        timeToCraft = 900, 
        event = "GooLagoon", 
        category = "Event", 
        item = {
            type = "Inventory", 
            name = "BoostedScoopCapsule"
        }, 
        materials = {
            ScoopCapsule = 3
        }
    }, 
    FlyingIceCreamTruck = {
        displayName = "Flying Ice Cream Truck", 
        timeToCraft = 14400, 
        event = "GooLagoon", 
        category = "Event", 
        item = {
            type = "Inventory", 
            name = "FlyingIceCreamTruck"
        }, 
        materials = {
            SuperGoo = 15, 
            TidalThread = 5, 
            SeaCrystal = 5, 
            SpectralBarnacles = 5
        }
    }, 
    LifeguardWhistle = {
        displayName = "Lifeguard Whistle Relic", 
        timeToCraft = 43200, 
        event = "GooLagoon", 
        category = "Event", 
        item = {
            type = "Inventory", 
            name = "LifeguardWhistle"
        }, 
        materials = {
            SuperGoo = 25, 
            BubbleResin = 5, 
            BubbleDiskette = 3, 
            SecretSauce = 3
        }
    }
};
return v2.Map(v10, function(v11, v12) --[[ Line: 800 ]]
    -- upvalues: v9 (copy)
    return v9(v12, v11);
end);