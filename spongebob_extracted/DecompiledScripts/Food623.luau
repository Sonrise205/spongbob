local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.FoodShared);
local function _(v3) --[[ Line: 17 ]] --[[ Name: AddSpacesToCapitals ]]
    return (v3:gsub("([^%s])(%u)", function(v4, v5) --[[ Line: 18 ]]
        return v4 .. " " .. v5;
    end, 2):gsub("^ ", ""));
end;
local function v11(v7, v8) --[[ Line: 23 ]] --[[ Name: ReconcileFoodData ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.Reconcile(v8, {
        displayName = v7:gsub("([^%s])(%u)", function(v9, v10) --[[ Line: 18 ]]
            return v9 .. " " .. v10;
        end, 2):gsub("^ ", ""), 
        description = "Feed to units for {numXP} XP!", 
        hint = "Used to level up a unit.", 
        rarity = v2:GetRarity(v7) or "Common"
    });
end;
local v12 = {
    ["Chocolate Bar"] = {}, 
    ["Kelp Shake"] = {}, 
    ["Krabby Patty"] = {}, 
    ["Aged Patty"] = {}, 
    ["Pretty Patties"] = {}, 
    ["Fruit Cake"] = {}, 
    ["Heart Acorn"] = {}, 
    ["Chum Bucket"] = {
        displayName = "Bucket of Chum"
    }, 
    ["Krusty Kids Meal"] = {
        icon = "rbxassetid://125407430105560"
    }, 
    JellyPatty = {
        icon = "rbxassetid://104980047176164"
    }, 
    WeenieHutSundae = {
        icon = "rbxassetid://106979361030712", 
        rarity = "Limited", 
        hint = "Used to level up a unit. (Bubble Bowl)"
    }, 
    TubMayo = {
        displayName = "Tub Of Mayonnaise", 
        icon = "rbxassetid://139406702737662", 
        description = "An Instrument? No Patrick, feed to units for {numXP} XP!", 
        hint = "Used to level up a unit. (Bubble Bowl)"
    }, 
    Apple = {
        icon = "rbxassetid://101960788344004"
    }, 
    ["Krusty Krab Pizza"] = {
        icon = "rbxassetid://80452413741545"
    }, 
    ["Glove Candy"] = {
        icon = "rbxassetid://136566312831622"
    }, 
    BloodSausage = {
        icon = "rbxassetid://128492256985923"
    }, 
    CannedBread = {
        icon = "rbxassetid://120865099039570", 
        rarity = "Limited", 
        description = "Wow, they have it! Feed to units for {numXP} XP!"
    }, 
    BoxChocolates2025 = {
        displayName = "Box of Chocolates", 
        icon = "rbxassetid://124168613579309", 
        rarity = "Limited", 
        hint = "Used to level up a unit. (V-DAY 2025)"
    }, 
    HeartCandy2025 = {
        displayName = "Heart Candy", 
        icon = "rbxassetid://91372790749224", 
        hint = "Used to level up a unit. (V-DAY 2025)"
    }, 
    HolographicMeatloaf = {
        icon = "rbxassetid://126093159248037"
    }, 
    JellyfishJelly = {
        icon = "rbxassetid://110739075915725"
    }, 
    SpongePopsicle = {
        displayName = "Sponge Popsicle", 
        icon = "rbxassetid://109585342549144"
    }, 
    CoralCandy = {
        displayName = "Coral Candy", 
        icon = "rbxassetid://98129961960359"
    }, 
    IceCreamCone = {
        displayName = "Ice Cream Cone", 
        icon = "rbxassetid://94532041823119"
    }, 
    SANDwich = {
        displayName = "SANDwich", 
        icon = "rbxassetid://128844593614205", 
        rarity = "Limited"
    }, 
    BranFlakes = {
        displayName = "Bran Flakes", 
        icon = "rbxassetid://82129266113776", 
        rarity = "Limited"
    }, 
    Rare_Olipop = {
        displayName = "Rare OLIPOP", 
        iconSpriteSheet = "OlipopSprites", 
        isAd = true
    }, 
    Epic_Olipop = {
        displayName = "Epic OLIPOP", 
        iconSpriteSheet = "OlipopSprites", 
        isAd = true
    }, 
    Legendary_Olipop = {
        displayName = "Legendary OLIPOP", 
        iconSpriteSheet = "OlipopSprites", 
        isAd = true
    }, 
    Mythic_Olipop = {
        displayName = "Mythic OLIPOP", 
        iconSpriteSheet = "OlipopSprites", 
        isAd = true
    }, 
    Secret_Olipop = {
        displayName = "Secret OLIPOP", 
        iconSpriteSheet = "OlipopSprites", 
        isAd = true
    }, 
    BlueSlop = {
        icon = "rbxassetid://101283733805912"
    }, 
    BroccoliLoaf = {
        displayName = "Baked Broccoli Load", 
        icon = "rbxassetid://139852646810392"
    }, 
    GoogleEyes = {
        displayName = "Google Eyes", 
        icon = "rbxassetid://79575415997225", 
        description = "A bit crunchy, but sinister! Feed to units for {numXP} XP!"
    }, 
    BubblePatty = {
        displayName = "Bubble Patty", 
        icon = "rbxassetid://133833060489551"
    }, 
    NoodlePatty = {
        displayName = "Noodle Patty", 
        icon = "rbxassetid://113005888078509"
    }, 
    KrabbyPlate = {
        displayName = "Krabby Plate", 
        icon = "rbxassetid://113454593695085"
    }, 
    PattyKake = {
        displayName = "Patty Kake", 
        icon = "rbxassetid://139036689045002"
    }, 
    SeahorseRadish = {
        displayName = "Seahorse Radish", 
        icon = "rbxassetid://81112111363031"
    }, 
    PattyFeast = {
        displayName = "Patty Feast", 
        icon = "rbxassetid://137947304575068"
    }, 
    CecilDinner = {
        displayName = "Cecil Dinner", 
        icon = "rbxassetid://121469025412161"
    }, 
    SeanutBrittle = {
        displayName = "Seanut Brittle", 
        icon = "rbxassetid://121231455850429"
    }, 
    KelpJerky = {
        displayName = "Kelp Jerky", 
        icon = "rbxassetid://72691450678342"
    }, 
    JellyCake = {
        displayName = "Jelly Cake", 
        icon = "rbxassetid://123413809569235", 
        rarity = "Legendary"
    }, 
    KrabbyPate = {
        displayName = "Krabby P\195\162t\195\169", 
        icon = "rbxassetid://130792553028461"
    }
};
return v1.Map(v12, function(v13, v14) --[[ Line: 203 ]]
    -- upvalues: v11 (copy)
    return v11(v14, v13);
end);