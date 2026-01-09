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
return function(_, v6, v7) --[[ Line: 14 ]]
    -- upvalues: v4 (ref)
    local v8 = v4:Progress(v6, v7, true);
    return (("Progressed player %*'s Mission by %*. Progression is now %*"):format(v6.Name, v7, v8));
end;