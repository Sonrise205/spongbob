local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local function v3(v2) --[[ Line: 24 ]] --[[ Name: ReconcileChestData ]]
    -- upvalues: v1 (copy)
    return v1.Reconcile(v2, {
        description = "Open for crazy rewards!", 
        rarity = "Common", 
        _rngType = "TreasureChest", 
        untradable = true
    });
end;
local v4 = {
    TreasureChest = {
        displayName = "Rare+ Chest", 
        rarity = "Rare", 
        icon = "rbxassetid://88691982201055", 
        isTreasureChest = true
    }, 
    EpicTreasureChest = {
        displayName = "Epic+ Chest", 
        rarity = "Epic", 
        icon = "rbxassetid://80811198035573", 
        isTreasureChest = true
    }, 
    LegendaryTreasureChest = {
        displayName = "Legendary+ Chest", 
        rarity = "Legendary", 
        icon = "rbxassetid://117196775948231", 
        isTreasureChest = true
    }, 
    MythicTreasureChest = {
        displayName = "Mythic+ Chest", 
        rarity = "Mythic", 
        icon = "rbxassetid://71489661172287", 
        isTreasureChest = true
    }, 
    SecretTreasureChest = {
        displayName = "Secret Chest", 
        rarity = "Secret", 
        icon = "rbxassetid://74663680982034", 
        isTreasureChest = true
    }, 
    BoostedSecretChest = {
        displayName = "\240\159\141\128 Boosted Secret Chest", 
        rarity = "Secret", 
        icon = "rbxassetid://119932437078910", 
        isBoosted = true, 
        isTreasureChest = true
    }, 
    ExoticTreasureChest = {
        displayName = "Exotic Chest", 
        rarity = "Exotic", 
        icon = "rbxassetid://93423544560064", 
        isTreasureChest = true
    }, 
    ["Parade Present"] = {
        displayName = "Parade Present", 
        rarity = "Limited", 
        icon = "rbxassetid://110889948646610", 
        hint = "V-DAY 2025", 
        untradable = false, 
        isVDayGift = true, 
        _rngType = "VDayGift"
    }, 
    BubblePopper = {
        displayName = "Bubble Capsule", 
        rarity = "Uncommon", 
        icon = "rbxassetid://99978263430564", 
        isRNGRollItem = true, 
        _rngType = "BubblePopper"
    }, 
    RareBubblePopper = {
        displayName = "Rare+ Bubble Capsule", 
        rarity = "Rare", 
        icon = "rbxassetid://94992417357223", 
        isRNGRollItem = true, 
        _rngType = "BubblePopper"
    }, 
    LegendaryBubblePopper = {
        displayName = "Legendary+ Bubble Capsule", 
        rarity = "Legendary", 
        icon = "rbxassetid://94992417357223", 
        isRNGRollItem = true, 
        _rngType = "BubblePopper"
    }, 
    EpicBubblePopper = {
        displayName = "Epic+ Bubble Capsule", 
        rarity = "Epic", 
        icon = "rbxassetid://94992417357223", 
        isRNGRollItem = true, 
        _rngType = "BubblePopper"
    }, 
    SecretBubblePopper = {
        displayName = "Secret Bubble Capsule", 
        rarity = "Secret", 
        icon = "rbxassetid://94992417357223", 
        isRNGRollItem = true, 
        _rngType = "BubblePopper"
    }, 
    ChallengeGift = {
        displayName = "Challenger Crate", 
        rarity = "Epic", 
        icon = "rbxassetid://140698226511765", 
        isRNGRollItem = true, 
        _rngType = "ChallengeGift"
    }, 
    ChallengeCrate2 = {
        displayName = "Challenger Crate 2.0", 
        rarity = "Epic", 
        icon = "rbxassetid://110708896421665", 
        isRNGRollItem = true, 
        _rngType = "ChallengeCrate2"
    }, 
    EasterEgg = {
        displayName = "Easter Egg", 
        rarity = "Limited", 
        description = "Open for a limited Easter unit!", 
        icon = "rbxassetid://111040489289970", 
        hint = "Easter 2025", 
        isRNGRollItem = true, 
        _rngType = "EasterEgg"
    }, 
    DragonEgg = {
        displayName = "Dragon Capsule", 
        rarity = "Rare", 
        visualRarity = "Limited", 
        description = "Open for a Dunces & Dragons unit!", 
        icon = "rbxassetid://72407402154022", 
        hint = "Dunces & Dragons", 
        isRNGRollItem = true, 
        _rngType = "DragonEgg"
    }, 
    HydraCrate = {
        displayName = "Hydra Crate", 
        rarity = "Rare", 
        visualRarity = "Exotic", 
        description = "Open for different variants of the (Exotic) Mega-Hydra Karen unit!", 
        icon = "rbxassetid://112749276521116", 
        hint = "Dunces & Dragons", 
        isRNGRollItem = true, 
        untradable = false, 
        _rngType = "HydraCrate"
    }, 
    ScoopCapsule = {
        displayName = "Scoop Capsule", 
        rarity = "Epic", 
        icon = "rbxassetid://112081711474711", 
        isRNGRollItem = true, 
        _rngType = "ScoopCapsule"
    }, 
    BoostedScoopCapsule = {
        displayName = "\240\159\141\128 Boosted Scoop Capsule", 
        rarity = "Epic", 
        icon = "rbxassetid://88826824839163", 
        isRNGRollItem = true, 
        isBoosted = true, 
        _rngType = "ScoopCapsule"
    }, 
    SandCrate = {
        displayName = "Sand Crate", 
        rarity = "Legendary", 
        visualRarity = "Exotic", 
        icon = "rbxassetid://138743683858913", 
        isRNGRollItem = true, 
        _rngType = "SandCrate"
    }, 
    RogueCrate = {
        displayName = "Rogue Crate", 
        rarity = "Rare", 
        visualRarity = "Legendary", 
        icon = "rbxassetid://127254632127740", 
        isRNGRollItem = true, 
        _rngType = "RogueCrate"
    }, 
    PetCrate = {
        displayName = "Pet Crate", 
        rarity = "Rare", 
        icon = "rbxassetid://131957765353275", 
        isRNGRollItem = true, 
        isBoosted = false, 
        _rngType = "PetCrate"
    }, 
    PatriciaCrate = {
        displayName = "Mystic Purse", 
        rarity = "Legendary", 
        visualRarity = "Limited", 
        icon = "rbxassetid://87642173807096", 
        isRNGRollItem = true, 
        _rngType = "PatriciaCrate"
    }, 
    KampKrate = {
        displayName = "Kamp Krate", 
        rarity = "Rare", 
        visualRarity = "Limited", 
        icon = "rbxassetid://76597584215913", 
        isRNGRollItem = true, 
        _rngType = "KampKrate"
    }, 
    CyclopsVault = {
        displayName = "Cyclops Vault", 
        rarity = "Exotic", 
        icon = "rbxassetid://133893505047698", 
        isRNGRollItem = true, 
        _rngType = "CyclopsVault"
    }, 
    PrizedEgg = {
        displayName = "Prized Egg", 
        rarity = "Secret", 
        icon = "rbxassetid://139990558939267", 
        isRNGRollItem = true, 
        _rngType = "PrizedEgg"
    }, 
    PioneerCrate = {
        displayName = "Pioneer Crate", 
        rarity = "Limited", 
        icon = "rbxassetid://105828546416592", 
        isRNGRollItem = true, 
        _rngType = "PioneerCrate"
    }, 
    FighterCrate = {
        displayName = "Fighter Crate", 
        rarity = "Limited", 
        icon = "rbxassetid://100852641231186", 
        isRNGRollItem = true, 
        _rngType = "FighterCrate"
    }, 
    KarateKrate = {
        displayName = "Karate Krate", 
        rarity = "Legendary", 
        icon = "rbxassetid://113454593695085", 
        isRNGRollItem = true, 
        _rngType = "KarateKrate"
    }, 
    AdminCrate = {
        displayName = "Admin Crate", 
        rarity = "Limited", 
        icon = "rbxassetid://121496071482099", 
        isRNGRollItem = true, 
        _rngType = "AdminCrate", 
        hint = "Granted during Admin Abuse events"
    }, 
    FeastCrate = {
        displayName = "Feast Crate", 
        rarity = "Legendary", 
        visualRarity = "Limited", 
        icon = "rbxassetid://110910182273009", 
        isRNGRollItem = true, 
        _rngType = "FeastCrate", 
        hint = ""
    }, 
    CoralGift = {
        displayName = "Coral Gift", 
        rarity = "Limited", 
        icon = "rbxassetid://81444887341497", 
        isRNGRollItem = true, 
        _rngType = "CoralGift", 
        hint = ""
    }, 
    SwashbucklerCrate = {
        displayName = "Swashbuckler Crate", 
        rarity = "Limited", 
        icon = "rbxassetid://71524525774295", 
        isRNGRollItem = true, 
        _rngType = "SwashbucklerCrate", 
        hint = ""
    }, 
    CruiseCrate = {
        displayName = "Cruise Crate", 
        rarity = "Rare", 
        visualRarity = "Prismatic", 
        icon = "rbxassetid://90080354172431", 
        isRNGRollItem = true, 
        _rngType = "CruiseCrate", 
        hint = "", 
        tradable = false, 
        disableMultiOpen = true
    }, 
    SnowCrate = {
        displayName = "Snow Crate", 
        rarity = "Rare", 
        visualRarity = "Prismatic", 
        icon = "rbxassetid://121440197884049", 
        isRNGRollItem = true, 
        _rngType = "SnowCrate", 
        hint = "", 
        tradable = false, 
        disableMultiOpen = true
    }, 
    HolidayCrate = {
        displayName = "Holiday Crate", 
        rarity = "Limited", 
        icon = "rbxassetid://77020830101678", 
        isRNGRollItem = true, 
        _rngType = "HolidayCrate", 
        hint = ""
    }
};
return v1.Map(v4, function(v5) --[[ Line: 345 ]]
    -- upvalues: v3 (copy)
    return v3(v5);
end);