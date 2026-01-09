local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.GlovesData);
local function v4(v3) --[[ Line: 18 ]] --[[ Name: ReconcileGloveData ]]
    -- upvalues: v1 (copy)
    return v1.Reconcile(v3, {
        rarity = "Common", 
        hint = "Used in Tower of Karate", 
        isKarateGlove = true, 
        untradable = true
    });
end;
local v5 = {
    Default = {
        displayName = "Training Gloves", 
        rarity = "Common", 
        icon = "rbxassetid://76133214155979", 
        description = ""
    }, 
    Abyss = {
        displayName = "Abyss Gloves", 
        rarity = "Legendary", 
        icon = "rbxassetid://122483805060645", 
        description = ""
    }, 
    Bubble_KGlove = {
        displayName = "Bubble Gloves", 
        rarity = "Rare", 
        icon = "rbxassetid://112488279348626", 
        description = ""
    }, 
    Celestial = {
        displayName = "Celestial Gloves", 
        rarity = "Secret", 
        icon = "rbxassetid://95625721315120", 
        description = ""
    }, 
    Draconic = {
        displayName = "Draconic Gloves", 
        rarity = "Secret", 
        icon = "rbxassetid://70755604472500", 
        description = ""
    }, 
    Golden = {
        displayName = "Golden Gloves", 
        rarity = "Epic", 
        icon = "rbxassetid://76564516099175", 
        description = ""
    }, 
    Iron = {
        displayName = "Iron Gloves", 
        rarity = "Rare", 
        icon = "rbxassetid://133879835921646", 
        description = ""
    }, 
    Master = {
        displayName = "Master Gloves", 
        rarity = "Exotic", 
        icon = "rbxassetid://74472787996067", 
        description = ""
    }, 
    Molten = {
        displayName = "Molten Gloves", 
        rarity = "Mythic", 
        icon = "rbxassetid://99734734827557", 
        description = ""
    }, 
    Spirit = {
        displayName = "Spirit Gloves", 
        rarity = "Mythic", 
        icon = "rbxassetid://119990663219748", 
        description = ""
    }, 
    Storm = {
        displayName = "Storm Gloves", 
        rarity = "Legendary", 
        icon = "rbxassetid://107457709585509", 
        description = ""
    }, 
    Strong = {
        displayName = "Strong Gloves", 
        rarity = "Rare", 
        icon = "rbxassetid://88238217913562", 
        description = ""
    }, 
    Titanium = {
        displayName = "Titanium Gloves", 
        rarity = "Epic", 
        icon = "rbxassetid://103726393276132", 
        description = ""
    }, 
    Worn = {
        displayName = "Worn Gloves", 
        rarity = "Rare", 
        icon = "rbxassetid://71845212592535", 
        description = ""
    }, 
    AnchorArms = {
        displayName = "Anchor Arms", 
        rarity = "Mythic", 
        icon = "rbxassetid://89817781844373", 
        description = "", 
        untradable = false
    }, 
    Glitched = {
        displayName = "Glitched Gloves", 
        rarity = "Secret", 
        icon = "rbxassetid://135170122400867", 
        description = "", 
        untradable = false
    }
};
for v6, v7 in v5 do
    local v8 = v2.getGloveData(v6);
    v7.description = ("Boosts melee power by %*x, scaling with your unit\226\128\153s damage."):format(v8 and v8.DamageMult or 1);
end;
return v1.Map(v5, function(v9) --[[ Line: 134 ]]
    -- upvalues: v4 (copy)
    return v4(v9);
end);