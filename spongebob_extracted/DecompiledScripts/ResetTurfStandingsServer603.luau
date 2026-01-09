local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
local v3 = nil;
v1.OnStart():andThen(function() --[[ Line: 7 ]]
    -- upvalues: v2 (ref), v1 (copy), v3 (ref)
    v2 = v1.GetService("DataService");
    v3 = v1.GetService("TurfWarsService");
end);
return function(_, _) --[[ Line: 12 ]]
    -- upvalues: v3 (ref)
    if not v3:ResetStandings():await() then
        return "Failed to reset Turf Wars standings";
    else
        return "Reset Turf Wars standings";
    end;
end;