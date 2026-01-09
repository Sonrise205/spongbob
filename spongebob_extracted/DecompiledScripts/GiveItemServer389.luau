local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
v1.OnStart():andThen(function() --[[ Line: 6 ]]
    -- upvalues: v2 (ref), v1 (copy)
    v2 = v1.GetService("InventoryService");
end);
return function(_, v4, v5, v6) --[[ Line: 10 ]]
    -- upvalues: v2 (ref)
    v2:AddItem(v4, v5, v6);
    return (("Gave x%* %* to %*"):format(v6, v5, v4));
end;