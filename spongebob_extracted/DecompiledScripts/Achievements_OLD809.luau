local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = {
    _achievements = {}
};
for _, v4 in script:GetChildren() do
    v2._achievements[v4.Name] = require(v4);
end;
v2.GetAchievements = function(_, v6, v7, v8) --[[ Line: 12 ]] --[[ Name: GetAchievements ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v6 and v7 then
        return v1.Filter(v2._achievements[v6][v7], function(v9, v10) --[[ Line: 14 ]]
            -- upvalues: v8 (copy)
            if v10 == "_order" or v10 == "_displayName" or v10 == "FullCompletionRewards" then
                return false;
            elseif v8 and v9.Infinite then
                return false;
            elseif v9.Disabled or v9.Inactive then
                return false;
            else
                return true;
            end;
        end);
    elseif v6 then
        return v1.Filter(v2._achievements[v6], function(v11, v12) --[[ Line: 30 ]]
            -- upvalues: v8 (copy)
            if v12 == "_order" or v12 == "_displayName" or v12 == "FullCompletionRewards" then
                return false;
            elseif v8 and v11.Infinite then
                return false;
            elseif v11.Disabled or v11.Inactive then
                return false;
            else
                return true;
            end;
        end);
    else
        return v1.Filter(v2._achievements, function(v13, v14) --[[ Line: 47 ]]
            if v14 == "_order" or v14 == "_displayName" or v14 == "FullCompletionRewards" then
                return false;
            elseif v13.Disabled or v13.Inactive then
                return false;
            else
                return true;
            end;
        end);
    end;
end;
v2.GetAchievementByName = function(v15, v16, v17, v18) --[[ Line: 60 ]] --[[ Name: GetAchievementByName ]]
    -- upvalues: v1 (copy)
    local l_v15_Achievements_0 = v15:GetAchievements(v16, v17);
    if not l_v15_Achievements_0 then
        return;
    else
        return v1.Find(l_v15_Achievements_0, function(v20) --[[ Line: 67 ]]
            -- upvalues: v18 (copy)
            return v20.Name == v18;
        end);
    end;
end;
v2.GetTotalAchievements = function(v21, v22, v23) --[[ Line: 72 ]] --[[ Name: GetTotalAchievements ]]
    local l_v21_Achievements_0 = v21:GetAchievements(v22, v23);
    return l_v21_Achievements_0 and #l_v21_Achievements_0 or 0;
end;
v2.GetRewards = function(v25, v26, v27, v28) --[[ Line: 77 ]] --[[ Name: GetRewards ]]
    -- upvalues: v1 (copy)
    local l_v25_Achievements_0 = v25:GetAchievements(v26, v27);
    if not l_v25_Achievements_0 then
        return;
    else
        local v31 = v1.Find(l_v25_Achievements_0, function(v30) --[[ Line: 84 ]]
            -- upvalues: v28 (copy)
            return v30.Name == v28;
        end);
        return v31 and v31.Rewards;
    end;
end;
v2.GetMainReward = function(_, v33, v34) --[[ Line: 91 ]] --[[ Name: GetMainReward ]]
    -- upvalues: v2 (copy)
    return v2._achievements[v33][v34].FullCompletionRewards;
end;
return v2;