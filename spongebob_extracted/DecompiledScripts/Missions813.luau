local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = {
    enabled = true, 
    timeOverride = nil, 
    questlines = {}, 
    util = {}
};
for _, v6 in script:GetChildren() do
    if v6:IsA("ModuleScript") then
        local v7 = tonumber(string.match(v6.Name, "%d+"));
        if v7 and not v4.questlines[v7] then
            v4.questlines[v7] = require(v6);
        end;
    end;
end;
v4.GetQuestlineInfo = function(v8, v9) --[[ Line: 72 ]] --[[ Name: GetQuestlineInfo ]]
    return v8.questlines[v9];
end;
v4.GetBatchInfo = function(v10, v11, v12) --[[ Line: 76 ]] --[[ Name: GetBatchInfo ]]
    local l_v10_QuestlineInfo_0 = v10:GetQuestlineInfo(v11);
    if not l_v10_QuestlineInfo_0 then
        return;
    else
        return l_v10_QuestlineInfo_0.batches[v12];
    end;
end;
v4.GetQuestInfo = function(v14, v15, v16, v17) --[[ Line: 85 ]] --[[ Name: GetQuestInfo ]]
    local l_v14_BatchInfo_0 = v14:GetBatchInfo(v15, v16);
    if not l_v14_BatchInfo_0 then
        return;
    else
        return l_v14_BatchInfo_0.quests[v17];
    end;
end;
v4.GetQuestRewards = function(v19, v20, v21, v22) --[[ Line: 94 ]] --[[ Name: GetQuestRewards ]]
    return v19:GetQuestInfo(v20, v21, v22).rewards;
end;
v4.GetCompletionRewards = function(v23, v24) --[[ Line: 98 ]] --[[ Name: GetCompletionRewards ]]
    local l_v23_QuestlineInfo_0 = v23:GetQuestlineInfo(v24);
    if not l_v23_QuestlineInfo_0 then
        return;
    else
        return l_v23_QuestlineInfo_0.completionRewards;
    end;
end;
v4.GetLatestQuestline = function(v26) --[[ Line: 107 ]] --[[ Name: GetLatestQuestline ]]
    local l_v26_Now_0 = v26:GetNow();
    local v28 = nil;
    for v29, v30 in v26.questlines do
        if v30.start <= l_v26_Now_0 then
            v28 = v29;
        else
            break;
        end;
    end;
    if not v28 then
        return;
    else
        return v26.questlines[v28], v28;
    end;
end;
v4.GetLatestBatch = function(v31) --[[ Line: 126 ]] --[[ Name: GetLatestBatch ]]
    local l_v31_LatestQuestline_0 = v31:GetLatestQuestline();
    if not l_v31_LatestQuestline_0 then
        return;
    else
        local l_v31_Now_0 = v31:GetNow();
        local v34 = nil;
        for v35, v36 in l_v31_LatestQuestline_0.batches do
            if v36.start <= l_v31_Now_0 then
                v34 = v35;
            else
                break;
            end;
        end;
        if not v34 then
            return;
        else
            return l_v31_LatestQuestline_0.batches[v34], v34;
        end;
    end;
end;
v4.GetLatestQuest = function(v37) --[[ Line: 150 ]] --[[ Name: GetLatestQuest ]]
    local l_v37_LatestBatch_0 = v37:GetLatestBatch();
    if not l_v37_LatestBatch_0 then
        return;
    else
        local l_v37_Now_0 = v37:GetNow();
        local v40 = nil;
        for v41, v42 in l_v37_LatestBatch_0.quests do
            if v42.start <= l_v37_Now_0 then
                v40 = v41;
            else
                break;
            end;
        end;
        if not v40 then
            return;
        else
            return l_v37_LatestBatch_0.quests[v40], v40;
        end;
    end;
end;
v4.IsQuestStarted = function(v43, v44, v45, v46) --[[ Line: 174 ]] --[[ Name: IsQuestStarted ]]
    local l_v43_QuestInfo_0 = v43:GetQuestInfo(v44, v45, v46);
    if not l_v43_QuestInfo_0 then
        return false;
    else
        return v43:GetNow() >= l_v43_QuestInfo_0.start;
    end;
end;
v4.IsBatchStarted = function(v48, v49, v50) --[[ Line: 183 ]] --[[ Name: IsBatchStarted ]]
    local l_v48_BatchInfo_0 = v48:GetBatchInfo(v49, v50);
    if not l_v48_BatchInfo_0 then
        return false;
    else
        return v48:GetNow() >= l_v48_BatchInfo_0.start;
    end;
end;
v4.IsBatchActive = function(v52, v53, v54) --[[ Line: 192 ]] --[[ Name: IsBatchActive ]]
    local l_v52_BatchInfo_0 = v52:GetBatchInfo(v53, v54);
    if not l_v52_BatchInfo_0 then
        return false;
    elseif v52:GetNow() < l_v52_BatchInfo_0.start then
        return false;
    else
        return not v52:IsBatchExpired(v53, v54);
    end;
end;
v4.IsBatchExpired = function(v56, v57, v58) --[[ Line: 206 ]] --[[ Name: IsBatchExpired ]]
    local l_v56_BatchInfo_0 = v56:GetBatchInfo(v57, v58);
    if not l_v56_BatchInfo_0 then
        return false;
    else
        return v56:GetNow() >= l_v56_BatchInfo_0.expire;
    end;
end;
v4.IsQuestlineExpired = function(v60, v61) --[[ Line: 217 ]] --[[ Name: IsQuestlineExpired ]]
    local l_v60_QuestlineInfo_0 = v60:GetQuestlineInfo(v61);
    if not l_v60_QuestlineInfo_0 then
        return false;
    else
        local v63 = #l_v60_QuestlineInfo_0.batches;
        if v63 <= 0 then
            return false;
        else
            return v60:IsBatchExpired(v61, v63);
        end;
    end;
end;
v4.GetNow = function(v64) --[[ Line: 231 ]] --[[ Name: GetNow ]]
    return v64.timeOverride or workspace:GetServerTimeNow();
end;
v4.util.IsQuestCompleted = function(v65, v66, v67) --[[ Line: 235 ]] --[[ Name: IsQuestCompleted ]]
    v66 = v66 or v65.batch;
    local v68 = v67 or v65.quest;
    return v65.completion[v65.questline].batches[v66][v68];
end;
v4.util.IsBatchCompleted = function(v69, v70) --[[ Line: 242 ]] --[[ Name: IsBatchCompleted ]]
    -- upvalues: v4 (copy)
    v70 = v70 or v69.batch;
    local v71 = #v4:GetBatchInfo(v69.questline, v70).quests;
    return v69.completion[v69.questline].batches[v70][v71];
end;
v4.util.IsQuestStarted = function(v72) --[[ Line: 251 ]] --[[ Name: IsQuestStarted ]]
    -- upvalues: v4 (copy)
    return v4:IsQuestStarted(v72.questline, v72.batch, v72.quest);
end;
v4.util.GetCompletedQuests = function(v73) --[[ Line: 259 ]] --[[ Name: GetCompletedQuests ]]
    if not v73.questline or not v73.batch then
        return 0;
    elseif v73.questline == 0 then
        return 0;
    else
        local v74 = 0;
        for _, v76 in v73.completion[v73.questline].batches do
            for _, v78 in v76 do
                if v78 then
                    v74 = v74 + 1;
                end;
            end;
        end;
        return v74;
    end;
end;
v4.util.GetProgress = function(v79, v80, v81) --[[ Line: 282 ]] --[[ Name: GetProgress ]]
    v80 = v80 or v79.batch;
    v81 = v81 or v79.quest;
    if not v79.questline or not v80 or not v81 then
        return 0;
    elseif v79.questline == 0 then
        return 0;
    else
        return v79.progress[v79.questline][v80][v81];
    end;
end;
v4.util.GetQuestlineInfo = function(v82) --[[ Line: 297 ]] --[[ Name: GetQuestlineInfo ]]
    -- upvalues: v4 (copy)
    return v4:GetQuestlineInfo(v82.questline);
end;
v4.util.GetQuestInfo = function(v83) --[[ Line: 301 ]] --[[ Name: GetQuestInfo ]]
    -- upvalues: v4 (copy)
    return v4:GetQuestInfo(v83.questline, v83.batch, v83.quest);
end;
v4.util.IsBatchExpired = function(v84) --[[ Line: 305 ]] --[[ Name: IsBatchExpired ]]
    -- upvalues: v4 (copy)
    return v4:IsBatchExpired(v84.questline, v84.batch);
end;
v4.util.IsQuestlineExpired = function(v85) --[[ Line: 309 ]] --[[ Name: IsQuestlineExpired ]]
    -- upvalues: v4 (copy)
    return v4:IsQuestlineExpired(v85.questline);
end;
for _, v87 in v4.questlines do
    for _, v89 in v87.batches do
        if not v89.start then
            v89.start = v87.start;
        end;
        for _, v91 in v89.quests do
            if not v91.start then
                v91.start = v89.start;
            end;
        end;
    end;
end;
if v4.timeOverride then
    v1.Simple(1, function() --[[ Line: 329 ]]
        -- upvalues: v4 (copy)
        local l_v4_0 = v4;
        l_v4_0.timeOverride = l_v4_0.timeOverride + 1;
    end);
end;
return v4;