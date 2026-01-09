local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v6 = l_RunService_0:IsServer() or l_RunService_0:IsStudio();
local v7 = {};
l_Players_0.PlayerRemoving:Connect(function(v8) --[[ Line: 27 ]]
    -- upvalues: v7 (copy)
    if v7[v8.UserId] then
        v7[v8.UserId] = nil;
    end;
    for _, v10 in v7 do
        if v10[v8.UserId] then
            v10[v8.UserId] = nil;
        end;
    end;
end);
return function(v11, v12, v13, v14) --[[ Line: 41 ]]
    -- upvalues: v7 (copy), v6 (copy), v3 (copy), v5 (copy)
    local v15 = os.clock();
    local v16 = v7[v11.UserId];
    local v17 = v16 and v16[v12.UserId];
    if v17 then
        if v6 or v15 - v17.timestamp <= 60 then
            return v3.resolve(v17.friend);
        else
            v16[v12.UserId] = nil;
        end;
    end;
    return v3.retryWithDelay(function() --[[ Line: 53 ]]
        -- upvalues: v3 (ref), v11 (copy), v12 (copy)
        return v3.try(function() --[[ Line: 54 ]]
            -- upvalues: v11 (ref), v12 (ref)
            return v11:IsFriendsWith(v12.UserId);
        end);
    end, v13 or 10, v14 or 1):tap(function(v18) --[[ Line: 58 ]]
        -- upvalues: v16 (ref), v7 (ref), v11 (copy), v12 (copy)
        if not v16 then
            v16 = {};
            v7[v11.UserId] = v16;
        end;
        v16[v12.UserId] = {
            friend = v18, 
            timestamp = os.clock()
        };
    end):catch(function() --[[ Line: 69 ]]
        -- upvalues: v5 (ref), v11 (copy), v12 (copy)
        v5:Warn("Failed to check friendship between", v11, "and", v12);
        return false;
    end);
end;