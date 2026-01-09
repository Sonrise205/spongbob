local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedFirst_0.PlaceIds);
local v4 = nil;
v2.OnStart():andThen(function() --[[ Line: 9 ]]
    -- upvalues: v4 (ref), v2 (copy)
    v4 = v2.GetService("LeaderboardService");
end);
return function(_, v6, v7, v8) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), v4 (ref)
    if v3:IsReleaseBranch() then
        return "You are not allowed to set leaderstats in Release";
    else
        local v9 = v4:SetLeaderstat(v6, v7, v8);
        if v9 then
            return v9;
        else
            return (("Set leaderstat \"%*\" to [%*] for %*"):format(v7, v8, v6));
        end;
    end;
end;