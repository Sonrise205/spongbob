local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
v1.OnStart():andThen(function() --[[ Line: 6 ]]
    -- upvalues: v2 (ref), v1 (copy)
    v2 = v1.GetService("KrustyKrewService");
end);
return function(_, v4, v5) --[[ Line: 10 ]]
    -- upvalues: v2 (ref)
    if not v2:AddMonths(v4, v5) then
        return (("Failed to give Krew+ months to %*"):format(v4));
    else
        return (("Gave x%* Krew+ months to %*"):format(v5, v4));
    end;
end;