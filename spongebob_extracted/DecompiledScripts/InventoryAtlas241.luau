local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local l_Icons_0 = require(script.Parent:WaitForChild("Icons"));
local v49 = {
    All = {}, 
    EasterShard = {}, 
    Misc = {
        SeasonXP = {
            displayName = "Season XP", 
            rarity = "Mythic", 
            description = "Experience for the current season pass.", 
            hint = "Used to progress in the season.", 
            seasonXPItem = true
        }, 
        PoF = {
            displayName = "Power of Friendship", 
            rarity = "Limited", 
            description = "Increases your friendship with Bemmy Buddy!"
        }, 
        Stardom = {
            displayName = "Stardom", 
            rarity = "Limited", 
            description = "Unlock Variants of Turf Wars unit"
        }, 
        BeltXP = {
            displayName = "Belt XP", 
            rarity = "Epic", 
            description = "XP used to advance your Karate Rank and unlock greater strength."
        }
    }, 
    Faction = {
        FactionPoint = {
            displayName = "Faction Point", 
            icon = "rbxassetid://118222657274172", 
            rarity = "Epic", 
            description = "Points you've contributed to your faction. Can be used in the Faction clubhouse shop as milestones unlock!"
        }
    }, 
    IsCurrency = function(v3, v4) --[[ Line: 43 ]] --[[ Name: IsCurrency ]]
        return v3.Currency[v4] ~= nil;
    end, 
    GetByDisplayName = function(v5, v6) --[[ Line: 47 ]] --[[ Name: GetByDisplayName ]]
        -- upvalues: v1 (copy)
        return v1.Find(v5.All, function(v7) --[[ Line: 48 ]]
            -- upvalues: v6 (copy)
            return v7.displayName == v6;
        end);
    end, 
    GetByCategory = function(v8, v9) --[[ Line: 53 ]] --[[ Name: GetByCategory ]]
        return v8[v9];
    end, 
    GetByItemName = function(v10, v11) --[[ Line: 57 ]] --[[ Name: GetByItemName ]]
        return v10.All[v11];
    end, 
    IsFood = function(v12, v13) --[[ Line: 61 ]] --[[ Name: IsFood ]]
        return v12.Food[v13] ~= nil;
    end, 
    IsGamePassGift = function(v14, v15) --[[ Line: 65 ]] --[[ Name: IsGamePassGift ]]
        local v16 = v14.Gifts[v15];
        if not v16 then
            return false;
        else
            return v16.giftType and v16.giftType == "GamePass";
        end;
    end, 
    IsFakeGamePassGift = function(v17, v18) --[[ Line: 74 ]] --[[ Name: IsFakeGamePassGift ]]
        local v19 = v17.Gifts[v18];
        if not v19 then
            return false;
        else
            return v19.giftType and v19.giftType == "FakeGamePass";
        end;
    end, 
    IsCurrencyGift = function(v20, v21) --[[ Line: 84 ]] --[[ Name: IsCurrencyGift ]]
        local v22 = v20.Gifts[v21];
        if not v22 then
            return false;
        else
            return v22.giftType and v22.giftType == "Currency";
        end;
    end, 
    IsItemGift = function(v23, v24) --[[ Line: 93 ]] --[[ Name: IsItemGift ]]
        local v25 = v23.Gifts[v24];
        if not v25 then
            return false;
        else
            return v25.giftType and v25.giftType == "Item";
        end;
    end, 
    IsMountGift = function(v26, v27) --[[ Line: 102 ]] --[[ Name: IsMountGift ]]
        local v28 = v26.Gifts[v27];
        if not v28 then
            return false;
        else
            return v28.giftType and v28.giftType == "Mount";
        end;
    end, 
    IsDevProductGift = function(v29, v30) --[[ Line: 111 ]] --[[ Name: IsDevProductGift ]]
        local v31 = v29.Gifts[v30];
        if not v31 then
            return false;
        else
            return v31.giftType and v31.giftType == "DevProducts";
        end;
    end, 
    IsGiftItem = function(v32, v33) --[[ Line: 121 ]] --[[ Name: IsGiftItem ]]
        local v34 = v32.Gifts[v33];
        if not v34 then
            return false;
        else
            return v34.giftType ~= nil, v34.giftType;
        end;
    end, 
    IsMount = function(v35, v36) --[[ Line: 130 ]] --[[ Name: IsMount ]]
        return v35.Mounts[v36] ~= nil;
    end, 
    IsRNGItem = function(v37, v38) --[[ Line: 134 ]] --[[ Name: IsRNGItem ]]
        local v39 = v37.Chests[v38];
        if not v39 then
            return false;
        else
            return v39._rngType ~= nil;
        end;
    end, 
    IsTradeable = function(v40, v41) --[[ Line: 143 ]] --[[ Name: IsTradeable ]]
        local l_v40_ByItemName_0 = v40:GetByItemName(v41);
        if not l_v40_ByItemName_0 then
            return false;
        else
            return not l_v40_ByItemName_0.untradable;
        end;
    end, 
    GetDisplayName = function(v43, v44) --[[ Line: 152 ]] --[[ Name: GetDisplayName ]]
        local l_v43_ByItemName_0 = v43:GetByItemName(v44);
        if not l_v43_ByItemName_0 then
            return v44;
        else
            return l_v43_ByItemName_0.displayName or l_v43_ByItemName_0.DisplayName or v44;
        end;
    end, 
    GetIcon = function(v46, v47) --[[ Line: 161 ]] --[[ Name: GetIcon ]]
        local l_v46_ByItemName_0 = v46:GetByItemName(v47);
        if not l_v46_ByItemName_0 then
            return "";
        else
            return l_v46_ByItemName_0.icon or l_v46_ByItemName_0.Icon or "";
        end;
    end
};
for _, v51 in script:GetChildren() do
    if v51:IsA("ModuleScript") then
        v49[v51.Name] = require(v51);
    end;
end;
v49.CraftingMaterials = require(l_ReplicatedStorage_0.Shared.Data.CraftingData).Categories.CraftingMaterials;
for v52, v53 in v49 do
    if typeof(v53) == "table" and v52 ~= "All" then
        for v54, v55 in v53 do
            v55.icon = v55.icon or l_Icons_0.Inventory[v54] or l_Icons_0.Currency[v54];
            v55.category = v52;
            v49.All[v54] = v55;
            if v55.icon or not v55.iconSpriteSheet then

            end;
        end;
    end;
end;
return v49;