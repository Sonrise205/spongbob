local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local l_Traits_0 = l_ReplicatedStorage_0.GUI.Traits;
local l_Icons_0 = l_Traits_0.Icons;
local l_Titles_0 = l_Traits_0.Titles;
local v5 = {
    TierWeights = {
        [1] = 8.75, 
        [2] = 8, 
        [3] = 7
    }, 
    Traits = {
        Strike = {
            weight = 23.75, 
            tiers = {
                {
                    damage = 5
                }, 
                {
                    damage = 15
                }, 
                {
                    damage = 25
                }
            }
        }, 
        Reach = {
            weight = 23.75, 
            tiers = {
                {
                    range = 5
                }, 
                {
                    range = 15
                }, 
                {
                    range = 25
                }
            }
        }, 
        Surge = {
            weight = 23.75, 
            tiers = {
                {
                    cooldown = 5
                }, 
                {
                    cooldown = 15
                }, 
                {
                    cooldown = 25
                }
            }
        }, 
        Scholar = {
            weight = 10.4, 
            boosts = {
                xp = 50
            }
        }, 
        Pursuit = {
            weight = 6, 
            goldenWeight = 33, 
            boosts = {
                range = 35
            }
        }, 
        Wealth = {
            weight = 4, 
            boosts = {
                upgradeCost = 35
            }
        }, 
        Vortex = {
            weight = 1, 
            goldenWeight = 8, 
            boosts = {
                cooldown = 50
            }
        }, 
        SecretFormula = {
            displayName = "Secret Formula", 
            weight = 0.25, 
            goldenWeight = 1.5, 
            boosts = {
                damage = 50, 
                range = 50, 
                cooldown = 50
            }
        }, 
        Sidekick = {
            weight = 0.75, 
            goldenWeight = 5.5, 
            boosts = {
                extraMaxUnits = 1
            }
        }, 
        SeaBear = {
            displayName = "Sea Bear", 
            weight = 2, 
            goldenWeight = 21.45, 
            boosts = {
                damage = 150, 
                range = -40, 
                cooldown = -50
            }
        }, 
        JellyfishJam = {
            displayName = "Jellyfish Jam", 
            weight = 5, 
            goldenWeight = 30, 
            boosts = {
                totemBoosts = {
                    cooldown = 25
                }
            }
        }, 
        Scurvy = {
            weight = 0.25, 
            goldenWeight = 0.5, 
            boosts = {
                damage = -50, 
                range = -75, 
                cooldown = -100
            }
        }, 
        NeptunesCrown = {
            displayName = "Neptune's Crown", 
            weight = 0.01, 
            goldenWeight = 0.05, 
            basicTierExclusions = {
                1, 
                2
            }
        }
    }
};
local v6 = {};
for v7, v8 in v5.TierWeights do
    v6[v7] = {
        weight = v8
    };
end;
v5.TierWeights = v6;
v5.GetTraits = function(v9, v10) --[[ Line: 134 ]] --[[ Name: GetTraits ]]
    -- upvalues: v1 (copy)
    if not v10 or v10 ~= "GoldenTraitRolls" then
        return v9.Traits;
    else
        local v11 = {};
        for v12, v13 in v9.Traits do
            if v13.goldenWeight then
                local v14 = v1.Copy(v13, true);
                v14.weight = v13.goldenWeight;
                v14.goldenWeight = nil;
                v11[v12] = v14;
            end;
        end;
        return v11;
    end;
end;
v5.GetTierWeights = function(v15) --[[ Line: 155 ]] --[[ Name: GetTierWeights ]]
    return v15.TierWeights;
end;
v5.GetWeight = function(v16, v17, v18) --[[ Line: 159 ]] --[[ Name: GetWeight ]]
    return v16.Traits[v17][v18 == "GoldenTraitRolls" and "goldenWeight" or "weight"];
end;
v5.GetTraitInfo = function(v19, v20) --[[ Line: 163 ]] --[[ Name: GetTraitInfo ]]
    return v19.Traits[v20];
end;
v5.HasTiers = function(v21, v22) --[[ Line: 167 ]] --[[ Name: HasTiers ]]
    local l_v21_TraitInfo_0 = v21:GetTraitInfo(v22);
    if not l_v21_TraitInfo_0 then
        return false;
    else
        return l_v21_TraitInfo_0.tiers ~= nil;
    end;
end;
v5.GetTraitBoosts = function(v24, v25, v26) --[[ Line: 176 ]] --[[ Name: GetTraitBoosts ]]
    local v27 = v24.Traits[v25];
    if v26 and v27.tiers then
        return v27.tiers[v26];
    else
        return v27.boosts;
    end;
end;
v5.GetTraitDisplayName = function(v28, v29) --[[ Line: 185 ]] --[[ Name: GetTraitDisplayName ]]
    return v28.Traits[v29].displayName or v29;
end;
v5.GetTraitIconTemplate = function(_, v31) --[[ Line: 189 ]] --[[ Name: GetTraitIconTemplate ]]
    -- upvalues: l_Icons_0 (copy)
    return l_Icons_0:FindFirstChild(v31);
end;
v5.CreateTraitIcon = function(v32, v33, v34) --[[ Line: 193 ]] --[[ Name: CreateTraitIcon ]]
    local l_v32_TraitIconTemplate_0 = v32:GetTraitIconTemplate(v33);
    if not l_v32_TraitIconTemplate_0 then
        return;
    else
        l_v32_TraitIconTemplate_0 = l_v32_TraitIconTemplate_0:Clone();
        l_v32_TraitIconTemplate_0.Size = UDim2.fromScale(0.8, 0.8);
        l_v32_TraitIconTemplate_0.AnchorPoint = Vector2.new(0.5, 0.5);
        l_v32_TraitIconTemplate_0.Position = UDim2.fromScale(0.5, 0.5);
        if v34 then
            l_v32_TraitIconTemplate_0.Parent = v34;
        end;
        return l_v32_TraitIconTemplate_0;
    end;
end;
v5.GetTraitTitle = function(_, v37) --[[ Line: 211 ]] --[[ Name: GetTraitTitle ]]
    -- upvalues: l_Titles_0 (copy)
    return l_Titles_0:FindFirstChild(v37);
end;
return v5;