local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = nil;
v1.OnStart():andThen(function() --[[ Line: 7 ]]
    -- upvalues: v3 (ref), v1 (copy)
    v3 = v1.GetService("GlobalEventService");
end);
return function(_, v5) --[[ Line: 11 ]]
    -- upvalues: v3 (ref)
    if v5 == "Start" then
        v3:StartEvent("IceSpiceEvent");
        return;
    else
        if v5 == "Stop" then
            v3:StopEvent("IceSpiceEvent");
        end;
        return;
    end;
end;