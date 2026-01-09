local l_Players_0 = game:GetService("Players");
local l_PolicyService_0 = game:GetService("PolicyService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_ReplicatedStorage_0.Packages.Promise);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v6 = {};
l_Players_0.PlayerRemoving:Connect(function(v7) --[[ Line: 11 ]]
    -- upvalues: v6 (copy)
    if v6[v7] then
        v6[v7] = nil;
    end;
end);
return function(v8) --[[ Line: 17 ]]
    -- upvalues: l_RunService_0 (copy), l_Players_0 (copy), v6 (copy), v4 (copy), l_PolicyService_0 (copy), v5 (copy)
    if not v8 and l_RunService_0:IsClient() then
        v8 = l_Players_0.LocalPlayer;
    end;
    if v6[v8] then
        return v4.resolve(v6[v8]);
    else
        local v9 = v4.retryWithDelay(function() --[[ Line: 26 ]]
            -- upvalues: v4 (ref), l_PolicyService_0 (ref), v8 (ref)
            return v4.try(function() --[[ Line: 27 ]]
                -- upvalues: l_PolicyService_0 (ref), v8 (ref)
                return l_PolicyService_0:GetPolicyInfoForPlayerAsync(v8);
            end);
        end, 20, 1);
        v9:andThen(function(v10) --[[ Line: 32 ]]
            -- upvalues: v6 (ref), v8 (ref), v5 (ref)
            v6[v8] = v5.Copy(v10, true);
        end);
        return v9;
    end;
end;