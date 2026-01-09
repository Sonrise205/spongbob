local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_GroupService_0 = game:GetService("GroupService");
local v3 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = {};
local v6 = {};
l_Players_0.PlayerRemoving:Connect(function(v7) --[[ Line: 18 ]]
    -- upvalues: v5 (copy)
    if v5[v7.UserId] then
        v5[v7.UserId] = nil;
    end;
end);
task.spawn(function() --[[ Line: 25 ]]
    -- upvalues: v5 (copy)
    while task.wait(1) do
        local v8 = os.clock();
        for v9, v10 in v5 do
            if v8 - v10.timestamp > 60 then
                v5[v9] = nil;
            end;
        end;
    end;
end);
local function v15(v11, v12, v13) --[[ Line: 37 ]] --[[ Name: getGroups ]]
    -- upvalues: v5 (copy), v3 (copy), l_GroupService_0 (copy)
    if v5[v11.UserId] then
        return v3.resolve(v5[v11.UserId].groups);
    else
        return v3.retryWithDelay(function() --[[ Line: 42 ]]
            -- upvalues: v3 (ref), l_GroupService_0 (ref), v11 (copy)
            return v3.try(function() --[[ Line: 43 ]]
                -- upvalues: l_GroupService_0 (ref), v11 (ref)
                return l_GroupService_0:GetGroupsAsync(v11.UserId);
            end);
        end, v12 or 5, v13 or 1):tap(function(v14) --[[ Line: 47 ]]
            -- upvalues: v5 (ref), v11 (copy)
            v5[v11.UserId] = {
                groups = v14, 
                timestamp = os.clock()
            };
        end);
    end;
end;
v6.GetGroups = function(v16, v17, v18) --[[ Line: 55 ]] --[[ Name: GetGroups ]]
    -- upvalues: v15 (copy)
    return v15(v16, v17, v18);
end;
v6.IsInGroup = function(v19, v20, v21, v22) --[[ Line: 59 ]] --[[ Name: IsInGroup ]]
    -- upvalues: v15 (copy)
    return v15(v19, v21, v22):andThen(function(v23) --[[ Line: 60 ]]
        -- upvalues: v20 (copy)
        for _, v25 in v23 do
            if v25.Id == v20 then
                return true;
            end;
        end;
        return false;
    end);
end;
return v6;