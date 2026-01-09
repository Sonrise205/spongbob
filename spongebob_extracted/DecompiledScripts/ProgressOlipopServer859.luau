local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
v1.OnStart():andThen(function() --[[ Line: 6 ]]
    -- upvalues: v2 (ref), v1 (copy)
    v2 = v1.GetService("OlipopService");
end);
return function(_, v4, v5) --[[ Line: 10 ]]
    -- upvalues: v2 (ref)
    local v6 = v2:Progress(v4, v5);
    return (("Progressed player %*'s Olipop quest by %*. Progression is now %*"):format(v4.Name, v5, v6));
end;