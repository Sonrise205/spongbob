local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local function v3(v2) --[[ Line: 19 ]] --[[ Name: ReconcileBoostData ]]
    -- upvalues: v1 (copy)
    return v1.Reconcile(v2, {
        rarity = "Common", 
        hint = "Expires in real time."
    });
end;
local v4 = {
    COINS_60 = {
        displayName = "x2 Coins (60 Min)", 
        rarity = "Legendary", 
        description = "Double Coins for 60 Minutes", 
        isBoost = true
    }, 
    GEMS_60 = {
        displayName = "x2 Gems (60 Min)", 
        rarity = "Legendary", 
        description = "Double Gems for 60 Minutes", 
        isBoost = true
    }, 
    XP_60 = {
        displayName = "x2 XP (60 Min)", 
        rarity = "Legendary", 
        description = "Double XP for 60 Minutes", 
        hint = "Expires in real time. (Player & Unit)", 
        isBoost = true
    }, 
    HEARTS_60 = {
        displayName = "x2 Hearts (60 Min)", 
        rarity = "Limited", 
        description = "Double Hearts for 60 Minutes", 
        hint = "Expires in real time. (V-DAY 2025)", 
        isBoost = true
    }, 
    BUBBLES_60 = {
        displayName = "x2 Bubbles (60 Min)", 
        rarity = "Limited", 
        description = "Double Bubbles for 60 Minutes", 
        hint = "Expires in real time. (Bubble Bowl)", 
        isBoost = true
    }, 
    CHALLENGETOKEN_60 = {
        displayName = "x2 Challenge Tokens (60 Min)", 
        rarity = "Legendary", 
        description = "Double Challenge Tokens for 60 Minutes", 
        isBoost = true
    }, 
    FACTIONS_60 = {
        displayName = "x2 Faction Points (60 Min)", 
        rarity = "Legendary", 
        description = "Double Faction Points for 60 Minutes", 
        isBoost = true
    }, 
    EVENT_CURRENCY_60 = {
        displayName = "x2 Faction Points (60 Min)", 
        rarity = "Limited", 
        description = "Double Faction Points for 60 Minutes", 
        isBoost = true
    }, 
    GOLDENSPATULA_60 = {
        displayName = "x2 Golden Spatulas (60 Min)", 
        rarity = "Limited", 
        description = "Double Golden Spatulas for 60 Minutes", 
        isBoost = true
    }, 
    SANDDOLLAR_60 = {
        displayName = "x2 Sand Dollars (60 Min)", 
        rarity = "Limited", 
        description = "Double Sand Dollars for 60 Minutes", 
        hint = "Used in the Goo Lagoon Event", 
        isBoost = true
    }, 
    AnchorArms_1 = {
        displayName = "Anchor Arms I", 
        rarity = "Legendary", 
        hint = "", 
        iconSpriteSheet = "UnitRelics", 
        iconGradient = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()), 
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 35, 39)), 
                ColorSequenceKeypoint.new(1, Color3.new())
            }), 
            Rotation = 44
        }, 
        isRelic = true, 
        description = "This relic boosts a unit's DMG by 5%! (Only one relic per unit)"
    }, 
    AnchorArms_2 = {
        displayName = "Anchor Arms II", 
        rarity = "Mythic", 
        hint = "", 
        iconSpriteSheet = "UnitRelics", 
        iconGradient = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()), 
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 35, 39)), 
                ColorSequenceKeypoint.new(1, Color3.new())
            }), 
            Rotation = 44
        }, 
        isRelic = true, 
        description = "This relic boosts a unit's DMG by 10%! (Only one relic per unit)"
    }, 
    AnchorArms_3 = {
        displayName = "Anchor Arms III", 
        rarity = "Secret", 
        hint = "", 
        iconSpriteSheet = "UnitRelics", 
        iconGradient = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()), 
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 35, 39)), 
                ColorSequenceKeypoint.new(1, Color3.new())
            }), 
            Rotation = 44
        }, 
        isRelic = true, 
        description = "This relic boosts a unit's DMG by 15%! (Only one relic per unit)"
    }, 
    TurboTartar_1 = {
        displayName = "Turbo Tartar I", 
        rarity = "Legendary", 
        hint = "", 
        iconSpriteSheet = "UnitRelics", 
        iconGradient = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()), 
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(170, 0, 255)), 
                ColorSequenceKeypoint.new(1, Color3.new())
            }), 
            Rotation = 44
        }, 
        isRelic = true, 
        description = "This relic boosts a unit's SPA by 5%! (Only one relic per unit)"
    }, 
    TurboTartar_2 = {
        displayName = "Turbo Tartar II", 
        rarity = "Mythic", 
        hint = "", 
        iconSpriteSheet = "UnitRelics", 
        iconGradient = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()), 
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(170, 0, 255)), 
                ColorSequenceKeypoint.new(1, Color3.new())
            }), 
            Rotation = 44
        }, 
        isRelic = true, 
        description = "This relic boosts a unit's SPA by 10%! (Only one relic per unit)"
    }, 
    TurboTartar_3 = {
        displayName = "Turbo Tartar III", 
        rarity = "Secret", 
        hint = "", 
        iconSpriteSheet = "UnitRelics", 
        iconGradient = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()), 
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(170, 0, 255)), 
                ColorSequenceKeypoint.new(1, Color3.new())
            }), 
            Rotation = 44
        }, 
        isRelic = true, 
        description = "This relic boosts a unit's SPA by 15%! (Only one relic per unit)"
    }, 
    ScopeShell_1 = {
        displayName = "Scope Shell I", 
        rarity = "Legendary", 
        hint = "", 
        iconSpriteSheet = "UnitRelics", 
        iconGradient = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()), 
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 170, 0)), 
                ColorSequenceKeypoint.new(1, Color3.new())
            }), 
            Rotation = 44
        }, 
        isRelic = true, 
        description = "This relic boosts a unit's RNG by 5%! (Only one relic per unit)"
    }, 
    ScopeShell_2 = {
        displayName = "Scope Shell II", 
        rarity = "Mythic", 
        hint = "", 
        iconSpriteSheet = "UnitRelics", 
        iconGradient = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()), 
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 170, 0)), 
                ColorSequenceKeypoint.new(1, Color3.new())
            }), 
            Rotation = 44
        }, 
        isRelic = true, 
        description = "This relic boosts a unit's RNG by 10%! (Only one relic per unit)"
    }, 
    ScopeShell_3 = {
        displayName = "Scope Shell III", 
        rarity = "Secret", 
        hint = "", 
        iconSpriteSheet = "UnitRelics", 
        iconGradient = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()), 
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 170, 0)), 
                ColorSequenceKeypoint.new(1, Color3.new())
            }), 
            Rotation = 44
        }, 
        isRelic = true, 
        description = "This relic boosts a unit's RNG by 15%! (Only one relic per unit)"
    }, 
    PowerPatty = {
        displayName = "Power Patty", 
        rarity = "Exotic", 
        hint = "", 
        iconSpriteSheet = "UnitRelics", 
        iconGradient = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 204, 0)), 
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 68)), 
                ColorSequenceKeypoint.new(1, Color3.fromRGB(149, 0, 255))
            }), 
            Rotation = 44
        }, 
        isRelic = true, 
        description = "This relic boosts ALL STATS of a unit by 25%! (Only one relic per unit)"
    }, 
    LifeguardWhistle = {
        displayName = "Lifeguard Whistle", 
        rarity = "Limited", 
        hint = "", 
        iconSpriteSheet = "UnitRelics", 
        iconGradient = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 238, 0)), 
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 221, 255)), 
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 238, 0))
            }), 
            Rotation = 65
        }, 
        isRelic = true, 
        description = "This relic boosts a unit's stats by: +15% DMG / -10% SPA / +20% RNG (Only one relic per unit)"
    }, 
    ShinyWumboPotion_1 = {
        displayName = "Shiny Wumbo Potion I", 
        icon = "rbxassetid://87314708249714", 
        rarity = "Legendary", 
        hint = "", 
        unitBoost = true, 
        description = "Transforms a unit into its Shiny Wumbo form! (Usable only on Common to Legendary units)", 
        canUseOnRarities = {
            Common = true, 
            Uncommon = true, 
            Rare = true, 
            Epic = true, 
            Legendary = true
        }
    }, 
    ShinyWumboPotion_2 = {
        displayName = "Shiny Wumbo Potion II", 
        icon = "rbxassetid://126342180682403", 
        rarity = "Mythic", 
        hint = "", 
        unitBoost = true, 
        description = "Transforms a unit into its Shiny Wumbo form! (Usable only on Mythic units)", 
        canUseOnRarities = {
            Mythic = true
        }
    }, 
    ShinyWumboPotion_3 = {
        displayName = "Shiny Wumbo Potion III", 
        icon = "rbxassetid://86165885326991", 
        rarity = "Secret", 
        hint = "", 
        unitBoost = true, 
        description = "Transforms a unit into its Shiny Wumbo form! (Usable only on Secret & Limited units)", 
        canUseOnRarities = {
            Secret = true, 
            Limited = true
        }, 
        excludedUnits = {
            OlympianSpongebob = true
        }
    }, 
    SecretFormulaReroll = {
        displayName = "Secret Formula Reroll", 
        icon = "rbxassetid://92912779600729", 
        rarity = "Mythic", 
        hint = "", 
        unitBoost = true, 
        description = "A magical bottle with ocean power beyond King Neptune, instantly changing a unit\226\128\153s trait to Secret Formula!"
    }, 
    NeptunesCrownReroll = {
        displayName = "Neptune's Crown Reroll", 
        icon = "rbxassetid://81884563161019", 
        rarity = "Secret", 
        hint = "", 
        unitBoost = true, 
        description = "A magical bottle of supreme ocean might, instantly granting a unit to wield two traits at once with Neptune\226\128\153s Crown!"
    }
};
return v1.Map(v4, function(v5) --[[ Line: 353 ]]
    -- upvalues: v3 (copy)
    return v3(v5);
end);