local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
local v3 = nil;
v1.OnStart():andThen(function() --[[ Line: 7 ]]
    -- upvalues: v2 (ref), v1 (copy), v3 (ref)
    v2 = v1.GetService("StatsService");
    v3 = v1.GetService("SeasonPassService");
end);
return function(_, v5, v6, v7) --[[ Line: 12 ]]
    -- upvalues: v3 (ref), v2 (ref)
    v7 = tonumber(v7) or 0;
    if string.lower(v6) == "seasonxp" then
        v3:AddXP(v5, v7);
    else
        v2:AddExperience(v5, v7, true);
    end;
    return (("Gave %* %* to %*"):format(v7, v6, v5.Name));
end;