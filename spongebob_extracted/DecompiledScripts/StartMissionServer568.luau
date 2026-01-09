local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.Missions);
local v3 = nil;
local v4 = nil;
v1.OnStart():andThen(function() --[[ Line: 9 ]]
    -- upvalues: v3 (ref), v1 (copy), v4 (ref)
    v3 = v1.GetService("DataService");
    v4 = v1.GetService("MissionService");
end);
return function(_, v6, v7, v8, v9) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v4 (ref)
    local l_v2_QuestInfo_0 = v2:GetQuestInfo(v7, v8, v9);
    if not l_v2_QuestInfo_0 then
        return "Invalid Mission";
    else
        v4:StartQuest(v6, v7, v8, v9);
        local l_name_0 = l_v2_QuestInfo_0.name;
        return (("Set player %*'s Mission to %*"):format(v6.Name, l_name_0));
    end;
end;