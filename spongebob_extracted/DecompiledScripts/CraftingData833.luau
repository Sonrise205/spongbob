local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local l_Icons_0 = require(script.Parent:WaitForChild("Icons"));
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v16 = {
    Categories = {
        All = {}, 
        CraftingRecipes = {}, 
        CraftingMaterials = {}, 
        MysteryMarketMaterials = {}, 
        RecipesPerCategory = {}
    }, 
    Config = {
        DATA_KEY = "Crafting", 
        MAX_QUEUES = 3, 
        MYSTERY_MARKET_REFRESH_COOLDOWN = 600, 
        BASIC_MATERIAL_DROP_CHANCES = {
            Story = 100, 
            Challenge = 100, 
            Raid = 100
        }, 
        BASIC_MATERIAL_LOCATIONS = {
            ConchStreet = {
                MoldySponge = 1
            }, 
            JellyfishFields = {
                JellyTendrils = 1
            }, 
            KrustyKrab = {
                GreasyNapkin = 1
            }, 
            ChumBucket = {
                CorrodedCircuit = 1
            }, 
            SandysTreedome = {
                AcornAlloy = 1
            }, 
            RockBottom = {
                EchoShards = 1
            }, 
            BoatingSchool = {
                ScratchedLicensePlate = 1
            }, 
            FlyingDutchmanShip = {
                SpectralRope = 1
            }, 
            ConchStreetSnow = {
                FrozenCoral = 1
            }, 
            PattyVault = {
                GoldenPattyBun = 1
            }, 
            Mermalair = {
                HeroEmblem = 1
            }, 
            MiddleAges = {
                BurntScroll = 1
            }, 
            BubbleBowl = {
                BubbleResin = 1
            }
        }, 
        INSTANT_TIME_PRODUCTS = {
            [900] = "InstantCraft1", 
            [1800] = "InstantCraft2", 
            [3600] = "InstantCraft3", 
            [7200] = "InstantCraft4", 
            [14400] = "InstantCraft5", 
            [28800] = "InstantCraft6", 
            [43200] = "InstantCraft7", 
            [86400] = "InstantCraft8", 
            [172800] = "InstantCraft9", 
            [259200] = "InstantCraft10"
        }, 
        CATEGORY_ORDERS = {
            Event = 1, 
            ["Unit Food"] = 2, 
            ["Unit Booster"] = 3, 
            Unit = 4, 
            Mount = 5, 
            ["Gamepass / Progression"] = 6, 
            Resource = 7, 
            Boost = 8, 
            Special = 9
        }
    }, 
    GetRecipeReward = function(v4, v5) --[[ Line: 103 ]] --[[ Name: GetRecipeReward ]]
        local l_v4_RecipeData_0 = v4:GetRecipeData(v5);
        return l_v4_RecipeData_0 and l_v4_RecipeData_0.item;
    end, 
    GetRecipeData = function(v7, v8) --[[ Line: 108 ]] --[[ Name: GetRecipeData ]]
        return v7.Categories.CraftingRecipes[v8];
    end, 
    GetMaterialData = function(v9, v10) --[[ Line: 112 ]] --[[ Name: GetMaterialData ]]
        return v9.Categories.CraftingMaterials[v10];
    end, 
    GetMysteryMarketMaterials = function(v11) --[[ Line: 116 ]] --[[ Name: GetMysteryMarketMaterials ]]
        return v11.Categories.MysteryMarketMaterials;
    end, 
    GetRecipesInCategory = function(v12, v13) --[[ Line: 120 ]] --[[ Name: GetRecipesInCategory ]]
        return v12.Categories.RecipesPerCategory[v13];
    end, 
    GetRecipesCategories = function(v14) --[[ Line: 124 ]] --[[ Name: GetRecipesCategories ]]
        -- upvalues: v1 (copy)
        return v1.Values(v14.Categories.RecipesPerCategory);
    end, 
    GetRecipeCategoryNames = function(v15) --[[ Line: 128 ]] --[[ Name: GetRecipeCategoryNames ]]
        -- upvalues: v1 (copy)
        return v1.Keys(v15.Categories);
    end
};
for _, v18 in script:GetChildren() do
    if v18:IsA("ModuleScript") then
        v16.Categories[v18.Name] = require(v18);
    end;
end;
local v19 = {};
for v20, v21 in v16.Categories.CraftingMaterials do
    if v21.isMysteryMarketMaterial then
        v19[v20] = v21;
    end;
end;
v16.Categories.MysteryMarketMaterials = v19;
v19 = {};
for v22, v23 in v16.Categories.CraftingRecipes do
    local v24 = v23.category or "Uncategorized";
    if not v19[v24] then
        v19[v24] = {};
    end;
    v19[v24][v22] = v23;
end;
v16.Categories.RecipesPerCategory = v19;
for v25, v26 in v16.Categories do
    if typeof(v26) == "table" and v25 ~= "All" then
        for v27, v28 in v26 do
            v28.icon = v28.icon or l_Icons_0.Inventory[v27] or l_Icons_0.Currency[v27];
            v28.category = v25;
            v16.Categories.All[v27] = v28;
            if v28.icon or not v28.iconSpriteSheet then

            end;
        end;
    end;
end;
return v16;