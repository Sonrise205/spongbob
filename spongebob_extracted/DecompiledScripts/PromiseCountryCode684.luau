local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_ReplicatedStorage_0.Packages.Promise);
local v5 = {};
l_Players_0.PlayerRemoving:Connect(function(v6) --[[ Line: 10 ]]
    -- upvalues: v5 (copy)
    if v5[v6] then
        v5[v6] = nil;
    end;
end);
return function(v7) --[[ Line: 16 ]]
    -- upvalues: l_RunService_0 (copy), l_Players_0 (copy), v5 (copy), v4 (copy), l_LocalizationService_0 (copy)
    if not v7 and l_RunService_0:IsClient() then
        v7 = l_Players_0.LocalPlayer;
    end;
    if v5[v7] then
        return v4.resolve(v5[v7]);
    else
        local v8 = v4.retryWithDelay(function() --[[ Line: 25 ]]
            -- upvalues: v4 (ref), l_LocalizationService_0 (ref), v7 (ref)
            return v4.try(function() --[[ Line: 26 ]]
                -- upvalues: l_LocalizationService_0 (ref), v7 (ref)
                return l_LocalizationService_0:GetCountryRegionForPlayerAsync(v7);
            end);
        end, 20, 1);
        v8:andThen(function(v9) --[[ Line: 31 ]]
            -- upvalues: v5 (ref), v7 (ref)
            v5[v7] = v9;
        end);
        return v8;
    end;
end;