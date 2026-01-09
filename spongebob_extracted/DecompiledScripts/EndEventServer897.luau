local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
v1.OnStart():andThen(function() --[[ Line: 6 ]]
    -- upvalues: v2 (ref), v1 (copy)
    v2 = v1.GetService("EventService");
end);
return function(_) --[[ Line: 10 ]]
    -- upvalues: v2 (ref)
    if not v2:EndEvent() then
        return "Unable to end event - event is not active";
    else
        return "Event ended successfully";
    end;
end;