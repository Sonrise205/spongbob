local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local function v3(v2) --[[ Line: 16 ]] --[[ Name: ReconcileCurrencyData ]]
    -- upvalues: v1 (copy)
    return v1.Reconcile(v2, {
        description = "A currency.", 
        rarity = "Common", 
        isCurrency = true
    });
end;
local v4 = {
    Gems = {
        rarity = "Epic", 
        description = "Currency used for summoning units."
    }, 
    Coins = {
        rarity = "Legendary", 
        description = "Currency used for purchasing items from the Merchant & fusing units."
    }, 
    TraitRolls = {
        displayName = "Trait Rerolls", 
        rarity = "Mythic", 
        description = "A bit of King Neptune's power resides in these bottles allowing you to change a unit's trait!"
    }, 
    MagicConch = {
        displayName = "Magic Conch", 
        rarity = "Mythic", 
        description = "Used to summon exclusive units."
    }, 
    PrestigeToken = {
        displayName = "Prestige Token", 
        rarity = "Mythic", 
        description = "Used in the prestige shop."
    }, 
    GoldenSpatula = {
        displayName = "Golden Spatula", 
        rarity = "Mythic", 
        description = "Used in the raids shop."
    }, 
    GoldenTraitRolls = {
        displayName = "Golden Trait Rerolls", 
        rarity = "Mythic", 
        description = "King Neptune's power resides in these bottles allowing you to change a unit's trait!"
    }, 
    Hearts = {
        inactive = true, 
        displayName = "Hearts", 
        rarity = "Limited", 
        description = "Limited currency used in Patrick's Pink Parade, 2025 Valentine's Event!"
    }, 
    Bubbles = {
        inactive = true, 
        displayName = "Bubbles", 
        rarity = "Limited", 
        description = "Limited currency used in the Bubble Bowl Event!"
    }, 
    DriverLicense = {
        displayName = "Driver License", 
        rarity = "Rare", 
        description = "Currency used for buying speedy mounts."
    }, 
    ChallengeToken = {
        displayName = "Challenge Token", 
        rarity = "Legendary", 
        description = "Currency used for the Challenge Shop!"
    }, 
    DragonScales = {
        inactive = true, 
        displayName = "Dragon Scales", 
        rarity = "Limited", 
        description = "Limited currency used in the Raid Shop during the Dunces & Dragons Event!"
    }, 
    SandDollar = {
        displayName = "Sand Dollars", 
        rarity = "Limited", 
        description = "Limited currency used in the Challenge Shop during the Goo Lagoon Event!"
    }, 
    KampKredit = {
        displayName = "Kamp Kredits", 
        rarity = "Limited", 
        description = "Limited currency used in the Kamp Koral Event!"
    }, 
    KelpDollar = {
        displayName = "Kelp Dollars", 
        rarity = "Limited", 
        description = "Limited currency for Prized Eggs in the SBTD x The Takeover Event Shop!"
    }, 
    SoloCreds = {
        displayName = "Solo Creds", 
        rarity = "Limited", 
        description = "Exclusive currency usable only in the Takeover Event Hub!"
    }, 
    KarateCoins = {
        displayName = "Karate Coins", 
        rarity = "Mythic", 
        description = "Exclusive currency usable only in Tower of Karate!"
    }, 
    Swashbucks = {
        displayName = "Swashbucks", 
        rarity = "Limited", 
        description = "Exclusive currency usable only in Search for SquarePants Event!"
    }
};
return v1.Map(v4, function(v5) --[[ Line: 133 ]]
    -- upvalues: v3 (copy)
    return v3(v5);
end);