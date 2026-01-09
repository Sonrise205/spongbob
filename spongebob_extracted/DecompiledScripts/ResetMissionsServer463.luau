local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Missions);
local v3 = nil;
local v4 = nil;
v1.OnStart():andThen(function() --[[ Line: 9 ]]
    -- upvalues: v3 (ref), v1 (copy), v4 (ref)
    v3 = v1.GetService("DataService");
    v4 = v1.GetService("MissionService");
end);
return function(_, v6) --[[ Line: 14 ]]
    -- upvalues: v4 (ref)
    v4:ResetMissions(v6);
    return (("Reset player %*'s Missions data"):format(v6.Name));
end;