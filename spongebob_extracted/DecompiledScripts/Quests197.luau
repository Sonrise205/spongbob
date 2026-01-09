local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = {
    _quests = {}, 
    _disabledQuests = {}
};
for _, v4 in script:GetChildren() do
    local v5 = require(v4);
    if v5.Disabled or v5.Inactive then
        v2._disabledQuests[v4.Name] = table.freeze(v5);
    else
        v2._quests[v4.Name] = table.freeze(v5);
    end;
end;
v2.GetQuests = function(_, v7, v8) --[[ Line: 20 ]] --[[ Name: GetQuests ]]
    -- upvalues: v2 (copy)
    local v9 = "_quests";
    if v8 == true then
        v9 = "_disabledQuests";
    end;
    if v7 then
        return v2[v9][v7];
    else
        return v2[v9];
    end;
end;
v2.GetQuestByName = function(v10, v11, v12) --[[ Line: 35 ]] --[[ Name: GetQuestByName ]]
    -- upvalues: v1 (copy)
    local l_v10_Quests_0 = v10:GetQuests(v11);
    if not l_v10_Quests_0 then
        return;
    else
        return v1.Find(l_v10_Quests_0, function(v14) --[[ Line: 42 ]]
            -- upvalues: v12 (copy)
            local v15 = false;
            if typeof(v14) == "table" then
                v15 = v14.Name and v14.Name == v12;
            end;
            return v15;
        end);
    end;
end;
return v2;