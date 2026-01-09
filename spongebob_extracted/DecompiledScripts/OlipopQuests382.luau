local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v3 = {};
for _, v5 in script:GetChildren() do
    if v5:IsA("ModuleScript") and v5.Name ~= "TemplateQuests" then
        v3[v5.Name] = require(v5);
    end;
end;
local v6 = {
    GRAND_PRIZES = {
        {
            type = "Unit", 
            name = "PrehistoricGary", 
            extraData = {}, 
            amount = 1
        }, 
        {
            type = "Inventory", 
            name = "HauntedBoat", 
            amount = 1
        }
    }, 
    TOTAL_QUESTS = 0
};
for _, v8 in v3 do
    v6.TOTAL_QUESTS = v6.TOTAL_QUESTS + #v8;
end;
v6.util = {
    GetQuestlineName = function(v9, v10) --[[ Line: 53 ]] --[[ Name: GetQuestlineName ]]
        return (("OlipopQuestline%*"):format(v10 or v9.questline or 1));
    end, 
    GetQuestInfo = function(v11, v12, v13) --[[ Line: 57 ]] --[[ Name: GetQuestInfo ]]
        -- upvalues: v6 (copy), v3 (copy)
        v12 = v12 or v11.quest;
        local v14 = v13 or v11.questline;
        return v3[v6.util.GetQuestlineName(v11, v14)][v12];
    end, 
    GetQuestRewards = function(v15, v16, v17) --[[ Line: 66 ]] --[[ Name: GetQuestRewards ]]
        -- upvalues: v6 (copy)
        return v6.util.GetQuestInfo(v15, v16, v17).rewards;
    end, 
    GetQuests = function(v18, v19) --[[ Line: 71 ]] --[[ Name: GetQuests ]]
        -- upvalues: v6 (copy), v3 (copy)
        return v3[v6.util.GetQuestlineName(v18, v19)];
    end, 
    GetAllQuests = function() --[[ Line: 76 ]] --[[ Name: GetAllQuests ]]
        -- upvalues: v3 (copy)
        return v3;
    end, 
    IsQuestCompleted = function(v20, v21, v22) --[[ Line: 80 ]] --[[ Name: IsQuestCompleted ]]
        v21 = v21 or v20.quest;
        local v23 = v22 or v20.questline;
        if not v23 or v23 < 1 then
            return false;
        elseif not v20.completion[v23] then
            return false;
        else
            return v20.completion[v23][v21] or false;
        end;
    end, 
    IsQuestFinished = function(v24, v25, v26) --[[ Line: 98 ]] --[[ Name: IsQuestFinished ]]
        -- upvalues: v6 (copy)
        v25 = v25 or v24.quest;
        local v27 = v6.util.GetQuestInfo(v24, v25);
        local v28 = v26 or v24.questline;
        if not v28 or v28 < 1 then
            return false;
        elseif not v24.progress[v28] or not v24.progress[v28][v25] then
            return false;
        else
            return v24.progress[v28][v25] == v27.required;
        end;
    end, 
    GetCompletedQuests = function(v29) --[[ Line: 116 ]] --[[ Name: GetCompletedQuests ]]
        return v29.completion[v29.questline] and #v29.completion[v29.questline] or 0;
    end, 
    GetProgress = function(v30, v31, v32) --[[ Line: 120 ]] --[[ Name: GetProgress ]]
        v31 = v31 or v30.quest;
        local v33 = v32 or v30.questline;
        if not v33 or v33 < 1 then
            return 0;
        elseif not v30.progress[v33] then
            return 0;
        else
            return v30.progress[v33][v31] or 0;
        end;
    end, 
    AreAllCompleted = function(v34) --[[ Line: 137 ]] --[[ Name: AreAllCompleted ]]
        if not v34 then
            return false;
        elseif v34.questline < 5 then
            return false;
        else
            return v34.completion[5] and v34.completion[5][5] == true;
        end;
    end
};
return v6;