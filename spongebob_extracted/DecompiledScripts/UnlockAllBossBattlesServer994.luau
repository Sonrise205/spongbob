local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.BossBattleData);
local v3 = nil;
v1.OnStart():andThen(function() --[[ Line: 8 ]]
    -- upvalues: v3 (ref), v1 (copy)
    v3 = v1.GetService("DataService");
end);
return function(_, v5) --[[ Line: 12 ]]
    -- upvalues: v3 (ref), v2 (copy)
    local v6 = v3:Get(v5, "BossClears");
    local v7 = {};
    local function _(v8, v9, v10) --[[ Line: 16 ]] --[[ Name: getDataFromBossAndTier ]]
        -- upvalues: v6 (copy)
        if v6[v8] and v6[v8][v9] then
            return v6[v8][v9][v10];
        elseif v10 == "TotalClears" then
            return 1;
        elseif v10 == "FastestClear" then
            return 900000;
        elseif v10 == "Stars" then
            return 3;
        else
            return;
        end;
    end;
    for _, v13 in v2.Bosses do
        v7[v13.Name] = {};
        for v14, v15 in v13.Tiers do
            local v16 = v7[v13.Name];
            local v17 = tostring(v14);
            local v18 = {};
            local l_Name_0 = v13.Name;
            local l_Tier_0 = v15.Tier;
            v18.TotalClears = if v6[l_Name_0] and v6[l_Name_0][l_Tier_0] then v6[l_Name_0][l_Tier_0].TotalClears else 1;
            l_Name_0 = v13.Name;
            l_Tier_0 = v15.Tier;
            v18.FastestClear = if v6[l_Name_0] and v6[l_Name_0][l_Tier_0] then v6[l_Name_0][l_Tier_0].FastestClear else 900000;
            l_Name_0 = v13.Name;
            l_Tier_0 = v15.Tier;
            v18.Stars = if v6[l_Name_0] and v6[l_Name_0][l_Tier_0] then v6[l_Name_0][l_Tier_0].Stars else 3;
            v16[v17] = v18;
        end;
    end;
    v3:Set(v5, "BossClears", v7);
    return (("Unlocked all boss battles for %*!"):format(v5.Name));
end;