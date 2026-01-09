local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
local v3 = nil;
v1.OnStart():andThen(function() --[[ Line: 7 ]]
    -- upvalues: v2 (ref), v1 (copy), v3 (ref)
    v2 = v1.GetService("DataService");
    v3 = v1.GetService("LeaderboardService");
end);
return function(_, v5, v6, v7) --[[ Line: 12 ]]
    -- upvalues: v2 (ref), v3 (ref)
    local v8 = v2:Get(v5, "PlayerStats");
    if not v8 then
        return "Failed to get player stats";
    else
        v8.Prestige = v6;
        v8.Level = v7;
        v8.Experience = 0;
        if not v2:Set(v5, "PlayerStats", v8):await() then
            return "Failed to set player stats";
        else
            v3:SetLeaderstat(v5, "PlayerLevel.AllTime", v7);
            return (("Set player %*'s prestige to %* and level to %*"):format(v5.Name, v6, v7));
        end;
    end;
end;