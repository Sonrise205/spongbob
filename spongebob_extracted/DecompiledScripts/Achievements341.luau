local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = {
    _achievements = {}
};
for _, v4 in script:GetChildren() do
    v2._achievements[v4.Name] = require(v4);
end;
v2.GetDisplayName = function(_, v6, v7) --[[ Line: 12 ]] --[[ Name: GetDisplayName ]]
    -- upvalues: v2 (copy)
    if not v2._achievements[v6] or not v2._achievements[v6][v7] then
        return;
    else
        return v2._achievements[v6][v7]._displayName;
    end;
end;
v2.GetAchievements = function(_, v9, v10, v11) --[[ Line: 20 ]] --[[ Name: GetAchievements ]]
    -- upvalues: v2 (copy), v1 (copy)
    if v9 and v10 then
        if not v2._achievements[v9] or not v2._achievements[v9][v10] then
            return;
        else
            return v1.Filter(v2._achievements[v9][v10], function(v12, v13) --[[ Line: 26 ]]
                -- upvalues: v11 (copy)
                if v13 == "_order" or v13 == "_displayName" or v13 == "FullCompletionRewards" then
                    return false;
                elseif v11 and v12.Infinite then
                    return false;
                elseif v12.Disabled or v12.Inactive then
                    return false;
                else
                    return true;
                end;
            end);
        end;
    elseif v9 then
        return v1.Filter(v2._achievements[v9], function(v14, v15) --[[ Line: 42 ]]
            -- upvalues: v11 (copy)
            if v15 == "_order" or v15 == "_displayName" or v15 == "FullCompletionRewards" then
                return false;
            elseif v11 and v14.Infinite then
                return false;
            elseif v14.Disabled or v14.Inactive then
                return false;
            else
                return true;
            end;
        end);
    else
        return v1.Filter(v2._achievements, function(v16, v17) --[[ Line: 59 ]]
            if v17 == "_order" or v17 == "_displayName" or v17 == "FullCompletionRewards" then
                return false;
            elseif v16.Disabled or v16.Inactive then
                return false;
            else
                return true;
            end;
        end);
    end;
end;
v2.GetAchievementByName = function(v18, v19, v20, v21) --[[ Line: 72 ]] --[[ Name: GetAchievementByName ]]
    -- upvalues: v1 (copy)
    local l_v18_Achievements_0 = v18:GetAchievements(v19, v20);
    if not l_v18_Achievements_0 then
        return;
    else
        return v1.Find(l_v18_Achievements_0, function(v23) --[[ Line: 79 ]]
            -- upvalues: v21 (copy)
            return v23.Name == v21;
        end);
    end;
end;
v2.GetTotalAchievements = function(v24, v25, v26) --[[ Line: 84 ]] --[[ Name: GetTotalAchievements ]]
    local l_v24_Achievements_0 = v24:GetAchievements(v25, v26);
    return l_v24_Achievements_0 and #l_v24_Achievements_0 or 0;
end;
v2.GetRewards = function(v28, v29, v30, v31) --[[ Line: 89 ]] --[[ Name: GetRewards ]]
    -- upvalues: v1 (copy)
    local l_v28_Achievements_0 = v28:GetAchievements(v29, v30);
    if not l_v28_Achievements_0 then
        return;
    else
        local v34 = v1.Find(l_v28_Achievements_0, function(v33) --[[ Line: 96 ]]
            -- upvalues: v31 (copy)
            return v33.Name == v31;
        end);
        return v34 and v34.Rewards;
    end;
end;
v2.GetMainReward = function(_, v36, v37) --[[ Line: 103 ]] --[[ Name: GetMainReward ]]
    -- upvalues: v2 (copy)
    return v2._achievements[v36][v37].FullCompletionRewards;
end;
return v2;