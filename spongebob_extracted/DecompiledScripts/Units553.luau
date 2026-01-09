local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v3 = require(script.TemplateAchievement);
local v4 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v5 = {
    Fusions = require(script.Fusions)
};
v5.Fusions._displayName = "Fusion Fizz";
local v6 = {
    Common = "I", 
    Uncommon = "II", 
    Rare = "III", 
    Epic = "IV", 
    Legendary = "V", 
    Mythic = "VI", 
    Limited = "VII", 
    Secret = "VIII", 
    Exotic = "IX"
};
for _, v8 in script:GetChildren() do
    if v8.Name ~= "TemplateAchievement" and v8.Name ~= "Fusions" then
        v5[v8.Name] = require(v8);
    end;
end;
local v9 = table.clone(v2.RARITIES_FROM_INDEX);
table.insert(v9, "Limited");
for v10, v11 in v9 do
    local v12 = v5[v11] or v1.Copy(v3, true);
    v12._order = v10 + 1;
    v12._displayName = ("Tidal Defenders %*: %*"):format(v6[v11], v11);
    for v13 = 1, #v12 do
        local v14 = v12[v13];
        local v15 = v4:CommaNumber(v14.RequiredValue or 0);
        if v14.Description then
            v14.Description = string.gsub(v12[v13].Description, "{requiredValue}", v15);
            v14.Description = string.gsub(v12[v13].Description, "{rarityName}", v11);
        end;
    end;
    v5[v11] = v12;
end;
for v16, v17 in v5 do
    for v18 = 1, #v17 do
        local v19 = v17[v18];
        if v19 and v19.Rewards then
            local v20 = v16 == "Fusions" and "FUSION_ACHIEVEMENT" or "UNIT_ACHIEVEMENT";
            local v21 = v2.PLAYER_XP_REWARDS[v20];
            local v22 = v2.PLAYER_SEASON_XP_REWARDS[v20];
            if v21 then
                table.insert(v19.Rewards, {
                    type = "Experience", 
                    amount = v21
                });
            end;
            if v22 then
                table.insert(v19.Rewards, {
                    type = "SeasonXP", 
                    name = "SeasonXP", 
                    amount = v22
                });
            end;
        end;
    end;
end;
return v5;