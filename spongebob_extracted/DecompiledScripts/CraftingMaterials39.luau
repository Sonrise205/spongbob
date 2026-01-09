local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local function v5(_, v4) --[[ Line: 10 ]] --[[ Name: ReconcileMaterialData ]]
    -- upvalues: v1 (copy)
    return v1.Reconcile(v4, {
        description = "A crafting material!", 
        rarity = "Common", 
        hint = "Used for crafting.", 
        iconSpriteSheet = "CraftingMaterials", 
        noUse = true
    });
end;
local v6 = {
    MoldySponge = {
        displayName = "Moldy Sponge", 
        description = "A decaying sponge remnant found scattered around the front lawns of Conch Street.", 
        rarity = "Epic", 
        earnType = "Story"
    }, 
    JellyTendrils = {
        displayName = "Jelly Tendrils", 
        description = "Electrified strands left behind by wild jellyfish deep within Jellyfish Fields.", 
        rarity = "Epic", 
        earnType = "Story"
    }, 
    GreasyNapkin = {
        displayName = "Greasy Napkin", 
        description = "Soaked in secret sauce and fryer oil, this napkin was crumpled beneath a booth at the Krusty Krab.", 
        rarity = "Epic", 
        earnType = "Story"
    }, 
    CorrodedCircuit = {
        displayName = "Corroded Circuit", 
        description = "A rusted piece of tech tossed out behind the Chum Bucket.", 
        rarity = "Epic", 
        earnType = "Story"
    }, 
    AcornAlloy = {
        displayName = "Acorn Alloy", 
        description = "A dense alloy forged from acorn metals inside Sandy\226\128\153s Treedome.", 
        rarity = "Epic", 
        earnType = "Story"
    }, 
    EchoShards = {
        displayName = "Echo Shards", 
        description = "These jagged, humming fragments can only be found echoing in the depths of Rock Bottom.", 
        rarity = "Epic", 
        earnType = "Story"
    }, 
    ScratchedLicensePlate = {
        displayName = "Scratched License Plate", 
        description = "Dented and worn, this plate was recovered from the crash course at Mrs. Puff's Boating School.", 
        rarity = "Legendary", 
        earnType = "Challenge"
    }, 
    SpectralRope = {
        displayName = "Spectral Rope", 
        description = "A haunted coil once tied to ghostly sails aboard the Flying Dutchman's Ship.", 
        rarity = "Legendary", 
        earnType = "Challenge"
    }, 
    FrozenCoral = {
        displayName = "Frozen Coral", 
        description = "Magically frosted coral that only blooms during winter on Conch Street Christmas.", 
        rarity = "Legendary", 
        earnType = "Challenge"
    }, 
    GoldenPattyBun = {
        displayName = "Golden Patty Bun", 
        description = "A shining top bun preserved in the sealed depths of the Patty Vault.", 
        rarity = "Legendary", 
        earnType = "Challenge"
    }, 
    HeroEmblem = {
        displayName = "Hero Emblem", 
        description = "A worn badge of honor once displayed proudly in the Mermalair.", 
        rarity = "Mythic", 
        earnType = "Raid"
    }, 
    BurntScroll = {
        displayName = "Burnt Scroll", 
        description = "A scorched relic containing forgotten quests, found smoldering in Dunces and Dragons.", 
        rarity = "Mythic", 
        earnType = "Raid"
    }, 
    BubbleResin = {
        displayName = "Bubble Resin", 
        description = "Hardened bubble residue scraped from the shining floor of the Bubble Bowl.", 
        rarity = "Mythic", 
        earnType = "Raid"
    }, 
    BioJellyCache = {
        displayName = "Bio-Jelly Cache", 
        description = "A sealed capsule storing bio-energy from jellyfish, traded only within the Mystery Market.", 
        rarity = "Secret", 
        isMysteryMarketMaterial = true, 
        price = 500
    }, 
    AncientSponge = {
        displayName = "Ancient Sponge", 
        description = "A fossilized sponge shard sold as a rare collectible inside the Mystery Market.", 
        rarity = "Secret", 
        isMysteryMarketMaterial = true, 
        price = 500
    }, 
    SecretSauce = {
        displayName = "Secret Sauce", 
        description = "A highly classified flavor vial locked behind the condiment counter in the Mystery Market.", 
        rarity = "Secret", 
        isMysteryMarketMaterial = true, 
        price = 500
    }, 
    EVILCore = {
        displayName = "E.V.I.L Core", 
        description = "A glowing sphere of villainous energy discreetly exchanged in the Mystery Market.", 
        rarity = "Secret", 
        isMysteryMarketMaterial = true, 
        price = 500
    }, 
    SeaCrystal = {
        displayName = "Sea Crystal", 
        description = "A sparkling marine gem pulled from hidden stockpiles in the Mystery Market.", 
        rarity = "Secret", 
        isMysteryMarketMaterial = true, 
        price = 500
    }, 
    GoofyGooberSyrup = {
        displayName = "Goofy Goober Syrup", 
        description = "A sticky bottle of sweetness that sings on occasion, found only in the Mystery Market.", 
        rarity = "Secret", 
        isMysteryMarketMaterial = true, 
        price = 500
    }, 
    SuperheroTape = {
        displayName = "Superhero Tape", 
        description = "Torn footage reels of classic heroics, sold in back bins at the Mystery Market.", 
        rarity = "Secret", 
        isMysteryMarketMaterial = true, 
        price = 500
    }, 
    BubbleDiskette = {
        displayName = "Bubble Diskette", 
        description = "Outdated bubble-tech software still circulating in booths inside the Mystery Market.", 
        rarity = "Secret", 
        isMysteryMarketMaterial = true, 
        price = 500
    }, 
    MysteryPatty = {
        displayName = "Mystery Patty", 
        description = "A patty that glows unnaturally, bought under the table at the Mystery Market.", 
        rarity = "Secret", 
        isMysteryMarketMaterial = true, 
        price = 500
    }, 
    TidalThread = {
        displayName = "Tidal Thread", 
        description = "Ocean-soaked thread, delicately woven and spun for sale in the Mystery Market.", 
        rarity = "Secret", 
        isMysteryMarketMaterial = true, 
        price = 500
    }, 
    SpectralBarnacles = {
        displayName = "Spectral Barnacles", 
        description = "Ghostly barnacles jarred and traded at secret stalls in the Mystery Market.", 
        rarity = "Secret", 
        isMysteryMarketMaterial = true, 
        price = 500
    }, 
    PattyTokens = {
        displayName = "Patty Tokens", 
        description = "Retired fast-food currency used for rare deals throughout the Mystery Market.", 
        rarity = "Secret", 
        isMysteryMarketMaterial = true, 
        price = 500
    }, 
    WumboBelt = {
        displayName = "Wumbo Belt", 
        description = "A stretchy belt rumored to make anything wumbo-sized! Used to craft the Shiny Wumbo Potion!", 
        rarity = "Mythic", 
        icon = "rbxassetid://126949928424352"
    }, 
    ShinyAura = {
        displayName = "Shiny Aura", 
        description = "A glowing rainbow that sparkles with imagination. Used to craft the Shiny Wumbo Potion!", 
        rarity = "Legendary", 
        icon = "rbxassetid://136013821457350"
    }, 
    SuperGoo = {
        displayName = "Super Goo", 
        description = "A stretchy, bouncy gel collected from the sun-soaked shores of Goo Lagoon.", 
        rarity = "Legendary", 
        earnType = "Challenge"
    }
};
return v1.Map(v6, function(v7, v8) --[[ Line: 237 ]]
    -- upvalues: v5 (copy)
    return v5(v8, v7);
end);