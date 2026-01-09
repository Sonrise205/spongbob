local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local function v3(v2) --[[ Line: 20 ]] --[[ Name: ReconcileKeyItemData ]]
    -- upvalues: v1 (copy)
    return v1.Reconcile(v2, {
        description = "", 
        rarity = "Common", 
        hint = "A key item."
    });
end;
local v4 = {
    TheHuntToken = {
        displayName = "The Hunt Token", 
        icon = "rbxassetid://76317458198142", 
        rarity = "Limited", 
        description = "An ancient token passed down to great heroes of Bikini Bottom, it glows blue for those with true spirit. No longer obtainable.", 
        hint = "Key Item in The Hunt: Mega Edition", 
        canOnlyHaveOne = true, 
        noUse = true
    }, 
    Barnacle = {
        displayName = "Mega Token", 
        icon = "rbxassetid://103091822925922", 
        rarity = "Limited", 
        description = "An ancient token hidden in an uncharted cave, it glows white for those destined to rise to the top. No longer obtainable.", 
        hint = "Key Item in The Hunt: Mega Edition", 
        canOnlyHaveOne = true, 
        noUse = true
    }, 
    TreasureMap = {
        displayName = "Treasure Map", 
        icon = "rbxassetid://72624255649825", 
        rarity = "Limited", 
        description = "Found near buried treasure on the outskirts of Bikini Bottom, it has clues drawn on it as well. No longer obtainable.", 
        hint = "Key Item in The Hunt: Mega Edition", 
        isMap = true, 
        untradable = true
    }, 
    SabotageSchematic = {
        displayName = "Sabotage Schematic", 
        icon = "rbxassetid://133501273298843", 
        rarity = "Limited", 
        description = "Greasy blueprints full of terrible ideas.", 
        hint = "Key Item in Operation: Krabby Kode", 
        untradable = true, 
        noUse = true
    }, 
    LostGadget = {
        displayName = "Lost Gadget", 
        icon = "rbxassetid://110892563461920", 
        rarity = "Limited", 
        description = "Rusty tools from the Mermalair. Some beep, some bite.", 
        hint = "Key Item in Operation: Krabby Kode", 
        untradable = true, 
        noUse = true
    }, 
    AudioTape = {
        displayName = "Audio Tape", 
        icon = "rbxassetid://82894205960887", 
        rarity = "Limited", 
        description = "Old cassettes with static, secrets, and maybe snack talk.", 
        hint = "Key Item in Operation: Krabby Kode", 
        untradable = true, 
        noUse = true
    }, 
    ControlModule = {
        displayName = "Control Module", 
        icon = "rbxassetid://125423836329141", 
        rarity = "Limited", 
        description = "Remotes for mind control or marching bands.", 
        hint = "Key Item in Operation: Krabby Kode", 
        untradable = true, 
        noUse = true
    }, 
    CorruptedDataChips = {
        displayName = "Corrupted Data Chips", 
        icon = "rbxassetid://126001030657411", 
        rarity = "Limited", 
        description = "Crumb-covered chips that glitch\226\128\148and jam.", 
        hint = "Key Item in Operation: Krabby Kode", 
        untradable = true, 
        noUse = true
    }, 
    FlickeringLantern = {
        displayName = "Flickering Lantern", 
        icon = "rbxassetid://122542863387010", 
        rarity = "Limited", 
        description = "Lanterns that glow near danger", 
        hint = "Key Item in Operation: Krabby Kode", 
        untradable = true, 
        noUse = true
    }, 
    MysteryCondiment = {
        displayName = "Mystery Condiment", 
        icon = "rbxassetid://77174697579798", 
        rarity = "Limited", 
        description = "Weird sauces with weirder names. Might be alive.", 
        hint = "Key Item in Operation: Krabby Kode", 
        untradable = true, 
        noUse = true
    }, 
    SecretRecipeBlueprints = {
        displayName = "Secret Recipe Blueprints", 
        icon = "rbxassetid://108308054251995", 
        rarity = "Limited", 
        description = "Top-secret food plans\226\128\148equal parts genius and disaster.", 
        hint = "Key Item in Operation: Krabby Kode", 
        untradable = true, 
        noUse = true
    }, 
    ShadowRelic = {
        displayName = "Shadow Relic", 
        icon = "rbxassetid://133151383722432", 
        rarity = "Limited", 
        description = "Haunted trinkets from the Dutchman's stash. Handle with garlic.", 
        hint = "Key Item in Operation: Krabby Kode", 
        untradable = true, 
        noUse = true
    }, 
    SignalDisruptor = {
        displayName = "Signal Disruptor", 
        icon = "rbxassetid://126085435462129", 
        rarity = "Limited", 
        description = "Spiky tech that messes with signals\226\128\166 and soup.", 
        hint = "Key Item in Operation: Krabby Kode", 
        untradable = true, 
        noUse = true
    }, 
    UtilityBeltComponents = {
        displayName = "Utility Belt Components", 
        icon = "rbxassetid://127834937001392", 
        rarity = "Limited", 
        description = "Random gear from a villain's closet. Totally \"safe.\"", 
        hint = "Key Item in Operation: Krabby Kode", 
        untradable = true, 
        noUse = true
    }, 
    Shard1 = {
        displayName = "Sponge Shard", 
        icon = "rbxassetid://100281326851625", 
        rarity = "Limited", 
        description = "Egg shard found in Conch Street.", 
        canOnlyHaveOne = true, 
        noUse = true, 
        untradable = true
    }, 
    Shard2 = {
        displayName = "Star Shard", 
        icon = "rbxassetid://103272696465931", 
        rarity = "Limited", 
        description = "Egg shard found in Jellyfish Fields.", 
        canOnlyHaveOne = true, 
        noUse = true, 
        untradable = true
    }, 
    Shard3 = {
        displayName = "Crab Shard", 
        icon = "rbxassetid://70402116135344", 
        rarity = "Limited", 
        description = "Egg shard found in the Krusty Krab.", 
        canOnlyHaveOne = true, 
        noUse = true, 
        untradable = true
    }, 
    Shard4 = {
        displayName = "Plankton Shard", 
        icon = "rbxassetid://73051870901875", 
        rarity = "Limited", 
        description = "Egg shard found in the Chum Bucket.", 
        canOnlyHaveOne = true, 
        noUse = true, 
        untradable = true
    }, 
    Shard5 = {
        displayName = "Squirrel Shard", 
        icon = "rbxassetid://130707605441870", 
        rarity = "Limited", 
        description = "Egg shard found in Sandy's Treedome.", 
        canOnlyHaveOne = true, 
        noUse = true, 
        untradable = true
    }, 
    Shard6 = {
        displayName = "Squid Shard", 
        icon = "rbxassetid://81689986889994", 
        rarity = "Limited", 
        description = "Egg shard found in Challenges.", 
        canOnlyHaveOne = true, 
        noUse = true, 
        untradable = true
    }, 
    Shard7 = {
        displayName = "Snail Shard", 
        icon = "rbxassetid://87267996953857", 
        rarity = "Limited", 
        description = "Egg shard found in Raids.", 
        canOnlyHaveOne = true, 
        noUse = true, 
        untradable = true
    }, 
    JellyCoreFragments = {
        displayName = "Jelly Core Fragment", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    BuzzingAntennas = {
        displayName = "Buzzing Antennas", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        description = "", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    VenomSac = {
        displayName = "Venom Sac", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    CrackedCymbals = {
        displayName = "Cracked Cymbals", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    AmpBuzzCoil = {
        displayName = "Amp Buzz Coil", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    PossessedMusicSheet = {
        displayName = "Possessed Music Sheet", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    MalfunctioningSteeringWheel = {
        displayName = "Malfunctioning Steering Wheel", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    SmokedSignalFlare = {
        displayName = "Smoked Signal Flare", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    FakeLicense = {
        displayName = "Falsified Boating License", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    FlickeringLightbulbs = {
        displayName = "Flickering Lightbulbs", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    GlitchedSignposts = {
        displayName = "Glitched Signposts", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    HijackedElevatorChips = {
        displayName = "Hijacked Elevator Chips", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    PossessedScrews = {
        displayName = "Possessed Screws", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    EctoplasmicRopes = {
        displayName = "Ectoplasmic Ropes", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    AncientPirateBlueprints = {
        displayName = "Ancient Pirate Blueprints", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    CorruptedCondimentPackets = {
        displayName = "Corrupted Condiment Packets", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    SuspiciousOrderSlips = {
        displayName = "Suspicious Order Slips", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    LivingGreaseBlobs = {
        displayName = "Living Grease Blobs", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    CorruptedMusicNotes = {
        displayName = "Corrupted Music Notes", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    InfectedMicrophones = {
        displayName = "Infected Microphones", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    OverloadedBassCoils = {
        displayName = "Overloaded Bass Coils", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    MutatedAcorns = {
        displayName = "Mutated Acorns", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    MalfunctioningLabEquipment = {
        displayName = "Malfunctioning Lab Equipment", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    FracturedDomePanels = {
        displayName = "Fractured Dome Panels", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    TaintedChumSamples = {
        displayName = "Tainted Chum Samples", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    StolenRobotControlChips = {
        displayName = "Stolen Robot Control Chips", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    ArchivedChumBlueprints = {
        displayName = "Archived Chum Blueprints", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    BrokenHeroRelics = {
        displayName = "Broken Hero Relics", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    DamagedAICores = {
        displayName = "Damaged AI Cores", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    EVILTransmissionNodes = {
        displayName = "E.V.I.L. Transmission Nodes", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    HackedSecurityCards = {
        displayName = "Hacked Security Cards", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    EncryptedVaultBlueprints = {
        displayName = "Encrypted Vault Blueprints", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    VaultControlPanel = {
        displayName = "Vault Control Panel", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    CitadelAccessCrystals = {
        displayName = "Citadel Access Crystals", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    BarnacleManJournals = {
        displayName = "Barnacle Man Journals", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    PowerCores = {
        displayName = "Power Cores", 
        iconSpriteSheet = "OperationEvil", 
        rarity = "Limited", 
        hint = "Key Item in Operation: E.V.I.L", 
        untradable = true, 
        noUse = true
    }, 
    OlipopRelic1 = {
        displayName = "OLIPOP Story Relic", 
        iconSpriteSheet = "OlipopSprites", 
        rarity = "Exotic", 
        untradable = true, 
        noUse = true, 
        canOnlyHaveOne = true, 
        hint = "Earned by completing the OLIPOP Story questline. (1/5)"
    }, 
    OlipopRelic2 = {
        displayName = "OLIPOP Challenge Relic", 
        iconSpriteSheet = "OlipopSprites", 
        rarity = "Exotic", 
        untradable = true, 
        noUse = true, 
        canOnlyHaveOne = true, 
        hint = "Earned by completing the OLIPOP Challenge questline. (2/5)"
    }, 
    OlipopRelic3 = {
        displayName = "OLIPOP Raid Relic", 
        iconSpriteSheet = "OlipopSprites", 
        rarity = "Exotic", 
        untradable = true, 
        noUse = true, 
        canOnlyHaveOne = true, 
        hint = "Earned by completing the OLIPOP Raid questline. (3/5)"
    }, 
    OlipopRelic4 = {
        displayName = "OLIPOP Boss Battle Relic", 
        iconSpriteSheet = "OlipopSprites", 
        rarity = "Exotic", 
        untradable = true, 
        noUse = true, 
        canOnlyHaveOne = true, 
        hint = "Earned by completing the OLIPOP Boss Battle questline. (4/5)"
    }, 
    OlipopRelic5 = {
        displayName = "OLIPOP Rogue Relic", 
        iconSpriteSheet = "OlipopSprites", 
        rarity = "Exotic", 
        untradable = true, 
        noUse = true, 
        canOnlyHaveOne = true, 
        hint = "Earned by completing the OLIPOP Rogue questline. (5/5)"
    }, 
    BreadRelic1 = {
        displayName = "BREAD Story Relic", 
        icon = "rbxassetid://132226969416686", 
        rarity = "Exotic", 
        untradable = true, 
        noUse = true, 
        canOnlyHaveOne = true, 
        hint = "Earned by completing the BREAD Story questline. (1/5)"
    }, 
    BreadRelic2 = {
        displayName = "BREAD Challenge Relic", 
        icon = "rbxassetid://132226969416686", 
        rarity = "Exotic", 
        untradable = true, 
        noUse = true, 
        canOnlyHaveOne = true, 
        hint = "Earned by completing the BREAD Challenge questline. (2/5)"
    }, 
    BreadRelic3 = {
        displayName = "BREAD Raid Relic", 
        icon = "rbxassetid://132226969416686", 
        rarity = "Exotic", 
        untradable = true, 
        noUse = true, 
        canOnlyHaveOne = true, 
        hint = "Earned by completing the BREAD Raid questline. (3/5)"
    }, 
    BreadRelic4 = {
        displayName = "BREAD Boss Battle Relic", 
        icon = "rbxassetid://132226969416686", 
        rarity = "Exotic", 
        untradable = true, 
        noUse = true, 
        canOnlyHaveOne = true, 
        hint = "Earned by completing the BREAD Boss Battle questline. (4/5)"
    }, 
    BreadRelic5 = {
        displayName = "BREAD Rogue Relic", 
        icon = "rbxassetid://132226969416686", 
        rarity = "Exotic", 
        untradable = true, 
        noUse = true, 
        canOnlyHaveOne = true, 
        hint = "Earned by completing the BREAD Rogue questline. (5/5)"
    }
};
return v1.Map(v4, function(v5) --[[ Line: 658 ]]
    -- upvalues: v3 (copy)
    return v3(v5);
end);