local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v3 = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v4 = {
    Description = {
        DevProducts = "Gift yourself or a friend this upgrade!", 
        GamePass = "Gift yourself or a friend this gamepass!", 
        Currency = "Gift yourself or a friend this currency!", 
        Item = "Gift yourself or a friend this treasure!", 
        Mount = "Gift yourself or a friend this mount!", 
        ["Krew+"] = "Gift yourself or a friend this Krew+ subscription!"
    }, 
    Hint = {
        DevProducts = "Upgrade Gift", 
        GamePass = "Gamepass Gift", 
        Currency = "Currency Gift", 
        Item = "Treasure Gift", 
        Mount = "Mount Gift", 
        ["Krew+"] = "Krew+ Gift"
    }
};
local function v7(v5) --[[ Line: 42 ]] --[[ Name: ReconcileGiftData ]]
    -- upvalues: v1 (copy), v4 (copy)
    local l_giftType_0 = v5.giftType;
    assert(v5.giftType, "'giftType' must be provided in the config.");
    v5.displayName = "(\240\159\142\129) " .. v5.displayName;
    return v1.Reconcile(v5, {
        description = v4.Description[l_giftType_0], 
        hint = v4.Hint[l_giftType_0], 
        rarity = "Common", 
        icon = ""
    });
end;
local v8 = {
    GIFT_VIP = {
        displayName = "VIP", 
        rarity = "Mythic", 
        gamepassName = "VIP", 
        icon = "rbxassetid://135352073029894", 
        giftType = "GamePass"
    }, 
    GIFT_UltraVIP = {
        displayName = "Ultra VIP", 
        rarity = "Mythic", 
        gamepassName = "UltraVIP", 
        icon = "rbxassetid://85181024799773", 
        giftType = "GamePass"
    }, 
    GIFT_GameSpeed = {
        displayName = "3x Game Speed", 
        icon = "rbxassetid://115427231747883", 
        rarity = "Mythic", 
        gamepassName = "GameSpeed", 
        giftType = "GamePass"
    }, 
    GIFT_DisplayUnits = {
        displayName = "Display All Units", 
        icon = "rbxassetid://75651450391680", 
        rarity = "Mythic", 
        gamepassName = "DisplayUnits", 
        giftType = "GamePass"
    }, 
    GIFT_SeasonPass = {
        displayName = "Premium Season Pass", 
        icon = "rbxassetid://70990547147972", 
        rarity = "Mythic", 
        gamepassName = v2.SEASON_PASS_NAME, 
        giftType = "GamePass"
    }, 
    GIFT_ShinyHunter = {
        displayName = "Shiny Hunter", 
        icon = "rbxassetid://105585000537371", 
        rarity = "Mythic", 
        gamepassName = "ShinyHunter", 
        giftType = "GamePass"
    }, 
    GIFT_WumboHunter = {
        displayName = "Wumbo Hunter", 
        icon = "rbxassetid://129241241767538", 
        rarity = "Mythic", 
        gamepassName = "WumboHunter", 
        giftType = "GamePass"
    }, 
    GIFT_TraitHunter = {
        displayName = "Trait Hunter", 
        icon = "rbxassetid://77007782302170", 
        rarity = "Mythic", 
        gamepassName = "TraitHunter", 
        giftType = "GamePass"
    }, 
    GIFT_UltraShinyHunter = {
        displayName = "Ultra Shiny Hunter", 
        icon = "rbxassetid://135231563492997", 
        rarity = "Mythic", 
        gamepassName = "UltraShinyHunter", 
        giftType = "GamePass"
    }, 
    GIFT_UltraWumboHunter = {
        displayName = "Ultra Wumbo Hunter", 
        icon = "rbxassetid://97555027791869", 
        rarity = "Mythic", 
        gamepassName = "UltraWumboHunter", 
        giftType = "GamePass"
    }, 
    GIFT_UltraTraitHunter = {
        displayName = "Ultra Trait Hunter", 
        icon = "rbxassetid://105700515661970", 
        rarity = "Mythic", 
        gamepassName = "UltraTraitHunter", 
        giftType = "GamePass"
    }, 
    GIFT_5xGameSpeed = {
        displayName = "5x Game Speed", 
        icon = "rbxassetid://103586988856842", 
        rarity = "Mythic", 
        gamepassName = "5xGameSpeed", 
        giftType = "GamePass"
    }, 
    GIFT_x2Leveling = {
        displayName = "x2 Player XP", 
        icon = "rbxassetid://128392557412859", 
        rarity = "Mythic", 
        gamepassName = "x2Leveling", 
        giftType = "GamePass"
    }, 
    GIFT_x2GoldenSpatula = {
        displayName = "x2 Golden Spatula", 
        icon = "rbxassetid://94560433959252", 
        rarity = "Mythic", 
        gamepassName = "x2GoldenSpatula", 
        giftType = "GamePass"
    }, 
    GIFT_SecretHunter = {
        displayName = "Secret Hunter", 
        icon = "rbxassetid://139612561631378", 
        rarity = "Mythic", 
        gamepassName = "SecretHunter", 
        giftType = "GamePass"
    }, 
    GIFT_UltraSecretHunter = {
        displayName = "Ultra Secret Hunter", 
        icon = "rbxassetid://109747133966211", 
        rarity = "Mythic", 
        gamepassName = "UltraSecretHunter", 
        giftType = "GamePass"
    }, 
    GIFT_MagicConchPack1 = {
        displayName = "Magic Conch Pack", 
        icon = "rbxassetid://111684532160348", 
        rarity = "Mythic", 
        currencyPackName = "MagicConchPack1", 
        giftType = "Currency"
    }, 
    GIFT_MagicConchPack2 = {
        displayName = "Magic Conch Pack", 
        icon = "rbxassetid://111684532160348", 
        rarity = "Mythic", 
        currencyPackName = "MagicConchPack2", 
        giftType = "Currency"
    }, 
    GIFT_MagicConchPack3 = {
        displayName = "Magic Conch Pack", 
        icon = "rbxassetid://111684532160348", 
        rarity = "Mythic", 
        currencyPackName = "MagicConchPack3", 
        giftType = "Currency"
    }, 
    GIFT_MagicConchPack4 = {
        displayName = "Magic Conch Pack", 
        icon = "rbxassetid://111684532160348", 
        rarity = "Mythic", 
        currencyPackName = "MagicConchPack4", 
        giftType = "Currency"
    }, 
    GIFT_TraitRollsPack1 = {
        displayName = "Trait Rerolls Pack", 
        icon = "rbxassetid://73544897028996", 
        rarity = "Mythic", 
        currencyPackName = "TraitRollsPack1", 
        giftType = "Currency"
    }, 
    GIFT_TraitRollsPack2 = {
        displayName = "Trait Rerolls Pack", 
        icon = "rbxassetid://73544897028996", 
        rarity = "Mythic", 
        currencyPackName = "TraitRollsPack2", 
        giftType = "Currency"
    }, 
    GIFT_TraitRollsPack3 = {
        displayName = "Trait Rerolls Pack", 
        icon = "rbxassetid://73544897028996", 
        rarity = "Mythic", 
        currencyPackName = "TraitRollsPack3", 
        giftType = "Currency"
    }, 
    GIFT_TraitRollsPack4 = {
        displayName = "Trait Rerolls Pack", 
        icon = "rbxassetid://73544897028996", 
        rarity = "Mythic", 
        currencyPackName = "TraitRollsPack4", 
        giftType = "Currency"
    }, 
    GIFT_GemsPack1 = {
        displayName = "Gems Pack", 
        icon = "rbxassetid://116508364707879", 
        rarity = "Mythic", 
        currencyPackName = "GemsPack1", 
        giftType = "Currency"
    }, 
    GIFT_GemsPack2 = {
        displayName = "Gems Pack", 
        icon = "rbxassetid://116508364707879", 
        rarity = "Mythic", 
        currencyPackName = "GemsPack2", 
        giftType = "Currency"
    }, 
    GIFT_GemsPack3 = {
        displayName = "Gems Pack", 
        icon = "rbxassetid://116508364707879", 
        rarity = "Mythic", 
        currencyPackName = "GemsPack3", 
        giftType = "Currency"
    }, 
    GIFT_GemsPack4 = {
        displayName = "Gems Pack", 
        icon = "rbxassetid://116508364707879", 
        rarity = "Mythic", 
        currencyPackName = "GemsPack4", 
        giftType = "Currency"
    }, 
    GIFT_CoinsPack1 = {
        displayName = "Coins Pack", 
        icon = "rbxassetid://140687449667704", 
        rarity = "Mythic", 
        currencyPackName = "CoinsPack1", 
        giftType = "Currency"
    }, 
    GIFT_CoinsPack2 = {
        displayName = "Coins Pack", 
        icon = "rbxassetid://140687449667704", 
        rarity = "Mythic", 
        currencyPackName = "CoinsPack2", 
        giftType = "Currency"
    }, 
    GIFT_CoinsPack3 = {
        displayName = "Coins Pack", 
        icon = "rbxassetid://140687449667704", 
        rarity = "Mythic", 
        currencyPackName = "CoinsPack3", 
        giftType = "Currency"
    }, 
    GIFT_CoinsPack4 = {
        displayName = "Coins Pack", 
        icon = "rbxassetid://140687449667704", 
        rarity = "Mythic", 
        currencyPackName = "CoinsPack4", 
        giftType = "Currency"
    }, 
    GIFT_GoldenSpatulaPack1 = {
        displayName = "Golden Spatulas Pack", 
        icon = v3.Currency.GoldenSpatula, 
        rarity = "Mythic", 
        currencyPackName = "GoldenSpatulaPack1", 
        giftType = "Currency"
    }, 
    GIFT_GoldenSpatulaPack2 = {
        displayName = "Golden Spatulas Pack", 
        icon = v3.Currency.GoldenSpatula, 
        rarity = "Mythic", 
        currencyPackName = "GoldenSpatulaPack2", 
        giftType = "Currency"
    }, 
    GIFT_GoldenSpatulaPack3 = {
        displayName = "Golden Spatulas Pack", 
        icon = v3.Currency.GoldenSpatula, 
        rarity = "Mythic", 
        currencyPackName = "GoldenSpatulaPack3", 
        giftType = "Currency"
    }, 
    GIFT_GoldenSpatulaPack4 = {
        displayName = "Golden Spatulas Pack", 
        icon = v3.Currency.GoldenSpatula, 
        rarity = "Mythic", 
        currencyPackName = "GoldenSpatulaPack4", 
        giftType = "Currency"
    }, 
    GIFT_GoldTraitRollsPack1 = {
        displayName = "Golden Trait Rerolls Pack", 
        icon = v3.Currency.GoldenTraitRolls, 
        rarity = "Mythic", 
        currencyPackName = "GoldTraitRollsPack1", 
        giftType = "Currency"
    }, 
    GIFT_GoldTraitRollsPack2 = {
        displayName = "Golden Trait Rerolls Pack", 
        icon = v3.Currency.GoldenTraitRolls, 
        rarity = "Mythic", 
        currencyPackName = "GoldTraitRollsPack2", 
        giftType = "Currency"
    }, 
    GIFT_GoldTraitRollsPack3 = {
        displayName = "Golden Trait Rerolls Pack", 
        icon = v3.Currency.GoldenTraitRolls, 
        rarity = "Mythic", 
        currencyPackName = "GoldTraitRollsPack3", 
        giftType = "Currency"
    }, 
    GIFT_GoldTraitRollsPack4 = {
        displayName = "Golden Trait Rerolls Pack", 
        icon = v3.Currency.GoldenTraitRolls, 
        rarity = "Mythic", 
        currencyPackName = "GoldTraitRollsPack4", 
        giftType = "Currency"
    }, 
    GIFT_TreasureHunter = {
        displayName = "Treasure Hunter", 
        icon = "rbxassetid://122394013012517", 
        rarity = "Mythic", 
        gamepassName = "TreasureHunter", 
        giftType = "GamePass"
    }, 
    GIFT_UltraTreasureHunter = {
        displayName = "Ultra Treasure Hunter", 
        icon = "rbxassetid://100541889013102", 
        rarity = "Mythic", 
        gamepassName = "UltraTreasureHunter", 
        giftType = "GamePass"
    }, 
    GIFT_MythicTreasurePack1 = {
        displayName = "1x Mythic+ Chest", 
        icon = "rbxassetid://71489661172287", 
        rarity = "Mythic", 
        items = {
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 1
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_MythicTreasurePack2 = {
        displayName = "3x Mythic+ Chests", 
        icon = "rbxassetid://71489661172287", 
        rarity = "Mythic", 
        items = {
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 3
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_MythicTreasurePack3 = {
        displayName = "10x Mythic+ Chests", 
        icon = "rbxassetid://71489661172287", 
        rarity = "Mythic", 
        items = {
            {
                type = "Inventory", 
                name = "MythicTreasureChest", 
                amount = 10
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_TreasurePack1 = {
        displayName = "1x Rare+ Chest", 
        icon = "rbxassetid://88691982201055", 
        rarity = "Rare", 
        items = {
            {
                type = "Inventory", 
                name = "TreasureChest", 
                amount = 1
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_TreasurePack2 = {
        displayName = "5x Rare+ Chests", 
        icon = "rbxassetid://88691982201055", 
        rarity = "Rare", 
        items = {
            {
                type = "Inventory", 
                name = "TreasureChest", 
                amount = 5
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_TreasurePack3 = {
        displayName = "25x Rare+ Chests", 
        icon = "rbxassetid://88691982201055", 
        rarity = "Rare", 
        items = {
            {
                type = "Inventory", 
                name = "TreasureChest", 
                amount = 25
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_TreasurePack4 = {
        displayName = "100x Rare+ Chests", 
        icon = "rbxassetid://88691982201055", 
        rarity = "Rare", 
        items = {
            {
                type = "Inventory", 
                name = "TreasureChest", 
                amount = 100
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_SecretChestOffer1 = {
        displayName = "Secret Chest", 
        icon = "rbxassetid://74663680982034", 
        rarity = "Secret", 
        items = {
            {
                type = "Inventory", 
                name = "SecretTreasureChest", 
                amount = 1
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_SecretChestOffer2 = {
        displayName = "3x Secret Chest", 
        icon = "rbxassetid://74663680982034", 
        rarity = "Secret", 
        items = {
            {
                type = "Inventory", 
                name = "SecretTreasureChest", 
                amount = 3
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_SecretChestOffer3 = {
        displayName = "5x Secret Chest", 
        icon = "rbxassetid://74663680982034", 
        rarity = "Secret", 
        items = {
            {
                type = "Inventory", 
                name = "SecretTreasureChest", 
                amount = 5
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_SecretChestOffer4 = {
        displayName = "10x Secret Chest", 
        icon = "rbxassetid://74663680982034", 
        rarity = "Secret", 
        items = {
            {
                type = "Inventory", 
                name = "SecretTreasureChest", 
                amount = 10
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_SecretChestOffer5 = {
        displayName = "25x Secret Chest", 
        icon = "rbxassetid://74663680982034", 
        rarity = "Secret", 
        items = {
            {
                type = "Inventory", 
                name = "SecretTreasureChest", 
                amount = 25
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_PattyWagon = {
        displayName = "Patty Wagon", 
        icon = "rbxassetid://72532311185930", 
        rarity = "Legendary", 
        mount = "PattyWagon", 
        giftType = "Mount"
    }, 
    GIFT_x2ChallengeTokens = {
        displayName = "x2 Challenge Tokens", 
        icon = "rbxassetid://77244751634039", 
        rarity = "Mythic", 
        gamepassName = "x2ChallengeTokens", 
        giftType = "GamePass"
    }, 
    GIFT_StorageUpgrade = {
        displayName = "+100 Unit Storage", 
        icon = "rbxassetid://88320375720248", 
        rarity = "Mythic", 
        devProductName = "StorageUpgrade", 
        giftType = "DevProducts"
    }, 
    GIFT_GemProgressionPack1 = {
        displayName = "1,000 Gems", 
        icon = "rbxassetid://116508364707879", 
        rarity = "Epic", 
        items = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 1000
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_GemProgressionPack2 = {
        displayName = "2,000 Gems", 
        icon = "rbxassetid://116508364707879", 
        rarity = "Epic", 
        items = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 2000
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_GemProgressionPack3 = {
        displayName = "5,000 Gems", 
        icon = "rbxassetid://116508364707879", 
        rarity = "Epic", 
        items = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 5000
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_GemProgressionPack4 = {
        displayName = "10,000 Gems", 
        icon = "rbxassetid://116508364707879", 
        rarity = "Epic", 
        items = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 10000
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_GemProgressionPack5 = {
        displayName = "25,000 Gems", 
        icon = "rbxassetid://116508364707879", 
        rarity = "Epic", 
        items = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 25000
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_GemProgressionPack6 = {
        displayName = "50,000 Gems", 
        icon = "rbxassetid://116508364707879", 
        rarity = "Epic", 
        items = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 50000
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_GemProgressionPack7 = {
        displayName = "100,000 Gems", 
        icon = "rbxassetid://116508364707879", 
        rarity = "Epic", 
        items = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 100000
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_2xFoodDrops = {
        displayName = "2x Food Drops", 
        icon = "rbxassetid://117772464007401", 
        rarity = "Mythic", 
        gamepassName = "2xFoodDrops", 
        giftType = "GamePass"
    }, 
    GIFT_4xFoodDrops = {
        displayName = "4x Food Drops", 
        icon = "rbxassetid://119442039408442", 
        rarity = "Mythic", 
        gamepassName = "4xFoodDrops", 
        giftType = "GamePass"
    }, 
    GIFT_Open50Chests = {
        displayName = "Open 50 Chests", 
        icon = "rbxassetid://104939775356360", 
        rarity = "Mythic", 
        gamepassName = "Open50Chests", 
        giftType = "GamePass"
    }, 
    GIFT_Open10Chests = {
        displayName = "Open 10 Chests", 
        description = "Open Treasure Chests faster! Gift yourself or a friend this upgrade!", 
        icon = "rbxassetid://80590994922881", 
        rarity = "Mythic", 
        gamepassName = "Open10Chests", 
        giftType = "FakeGamePass"
    }, 
    GIFT_BoostedSecretChestOffer1 = {
        displayName = "1x Boosted Secret Chest", 
        icon = "rbxassetid://119932437078910", 
        rarity = "Secret", 
        items = {
            {
                type = "Inventory", 
                name = "BoostedSecretChest", 
                amount = 1
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_BoostedSecretChestOffer2 = {
        displayName = "3x Boosted Secret Chest", 
        icon = "rbxassetid://119932437078910", 
        rarity = "Secret", 
        items = {
            {
                type = "Inventory", 
                name = "BoostedSecretChest", 
                amount = 3
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_BoostedSecretChestOffer3 = {
        displayName = "5x Boosted Secret Chest", 
        icon = "rbxassetid://119932437078910", 
        rarity = "Secret", 
        items = {
            {
                type = "Inventory", 
                name = "BoostedSecretChest", 
                amount = 5
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_BoostedSecretChestOffer4 = {
        displayName = "10x Boosted Secret Chest", 
        icon = "rbxassetid://119932437078910", 
        rarity = "Secret", 
        items = {
            {
                type = "Inventory", 
                name = "BoostedSecretChest", 
                amount = 10
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_BoostedSecretChestOffer5 = {
        displayName = "20x Boosted Secret Chest", 
        icon = "rbxassetid://119932437078910", 
        rarity = "Secret", 
        items = {
            {
                type = "Inventory", 
                name = "BoostedSecretChest", 
                amount = 20
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_BoostedSecretChestOffer6 = {
        displayName = "50x Boosted Secret Chest", 
        icon = "rbxassetid://119932437078910", 
        rarity = "Secret", 
        items = {
            {
                type = "Inventory", 
                name = "BoostedSecretChest", 
                amount = 50
            }
        }, 
        giftType = "Item"
    }, 
    ["GIFT_Krew+1"] = {
        displayName = "Krew+ 1 Month", 
        icon = "rbxassetid://73985666022797", 
        rarity = "Secret", 
        months = 1, 
        giftType = "Krew+"
    }, 
    ["GIFT_Krew+12"] = {
        displayName = "Krew+ 12 Months", 
        icon = "rbxassetid://84928601527972", 
        rarity = "Secret", 
        months = 12, 
        giftType = "Krew+"
    }, 
    GIFT_ExoticChest = {
        displayName = "Exotic Chest", 
        icon = "rbxassetid://93423544560064", 
        rarity = "Exotic", 
        items = {
            {
                type = "Inventory", 
                name = "ExoticTreasureChest", 
                amount = 1
            }
        }, 
        giftType = "Item"
    }, 
    GIFT_PetSlot = {
        displayName = "+1 Pet Equip", 
        icon = "rbxassetid://137826975219859", 
        rarity = "Mythic", 
        giftType = "PetSlot"
    }, 
    GIFT_7xGameSpeed = {
        displayName = "7x Game Speed", 
        icon = "rbxassetid://129788286972343", 
        rarity = "Mythic", 
        gamepassName = "7xGameSpeed", 
        giftType = "GamePass"
    }, 
    GIFT_x2CraftingMaterials = {
        displayName = "x2 Crafting Materials", 
        icon = "rbxassetid://75171854408986", 
        rarity = "Mythic", 
        gamepassName = "2xCraftingMaterials", 
        giftType = "GamePass"
    }, 
    GIFT_x4CraftingMaterials = {
        displayName = "x4 Crafting Materials", 
        icon = "rbxassetid://129502778393585", 
        rarity = "Mythic", 
        gamepassName = "4xCraftingMaterials", 
        giftType = "GamePass"
    }, 
    GIFT_InstantCraft = {
        displayName = "InstantCraft", 
        icon = "rbxassetid://94474949284422", 
        rarity = "Mythic", 
        gamepassName = "InstantCraft", 
        giftType = "GamePass"
    }, 
    GIFT_2xKarateCoins = {
        displayName = "KarateCoins", 
        icon = "rbxassetid://136462678700020", 
        rarity = "Mythic", 
        gamepassName = "2xKarateCoins", 
        giftType = "GamePass"
    }, 
    GIFT_4xKarateCoins = {
        displayName = "KarateCoins", 
        icon = "rbxassetid://104169193379025", 
        rarity = "Mythic", 
        gamepassName = "4xKarateCoins", 
        giftType = "GamePass"
    }, 
    GIFT_2xBelts = {
        displayName = "Karate Belts", 
        icon = "rbxassetid://139324909434991", 
        rarity = "Mythic", 
        gamepassName = "2xBelts", 
        giftType = "GamePass"
    }, 
    GIFT_4xBelts = {
        displayName = "Karate Belts", 
        icon = "rbxassetid://71880929098337", 
        rarity = "Mythic", 
        gamepassName = "4xBelts", 
        giftType = "GamePass"
    }
};
return v1.Map(v8, function(v9) --[[ Line: 750 ]]
    -- upvalues: v7 (copy)
    return v7(v9);
end);