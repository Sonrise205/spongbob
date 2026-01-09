local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v3 = require(script.PrologueQuests);
local v4 = require(script.SpongebobQuests);
local v5 = require(script.PatrickQuests);
local v6 = {
    TOTAL_PROLOGUE_QUESTS = #v3, 
    TOTAL_QUESTS = #v2.Extend(v3, v4)
};
v6.util = {
    GetQuestInfo = function(v7, v8) --[[ Line: 30 ]] --[[ Name: GetQuestInfo ]]
        -- upvalues: v6 (copy), v4 (copy), v5 (copy), v3 (copy)
        v8 = v8 or v7.quest;
        if v6.TOTAL_PROLOGUE_QUESTS < v8 and v7.team ~= false then
            v8 = v8 - v6.TOTAL_PROLOGUE_QUESTS;
        end;
        if v7.team == "Spongebob" then
            return v4[v8];
        elseif v7.team == "Patrick" then
            return v5[v8];
        else
            return v3[v8];
        end;
    end, 
    GetQuestRewards = function(v9, v10) --[[ Line: 46 ]] --[[ Name: GetQuestRewards ]]
        -- upvalues: v6 (copy)
        return v6.util.GetQuestInfo(v9, v10).rewards;
    end, 
    GetQuests = function(v11) --[[ Line: 52 ]] --[[ Name: GetQuests ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (copy)
        if v11.team == "Spongebob" then
            return v4;
        elseif v11.team == "Patrick" then
            return v5;
        else
            return v3;
        end;
    end, 
    IsQuestCompleted = function(v12, v13) --[[ Line: 62 ]] --[[ Name: IsQuestCompleted ]]
        local v14 = v13 or v12.quest;
        return v12.completion[v14] or false;
    end, 
    IsQuestFinished = function(v15, v16) --[[ Line: 68 ]] --[[ Name: IsQuestFinished ]]
        -- upvalues: v6 (copy)
        v16 = v16 or v15.quest;
        local v17 = v6.util.GetQuestInfo(v15, v16);
        return v15.progress[v16] == v17.required;
    end, 
    GetCompletedQuests = function(v18) --[[ Line: 75 ]] --[[ Name: GetCompletedQuests ]]
        return #v18.completion;
    end, 
    GetProgress = function(v19, v20) --[[ Line: 79 ]] --[[ Name: GetProgress ]]
        local v21 = v20 or v19.quest;
        return v19.progress[v21] or 0;
    end
};
return v6;