local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
local v3 = nil;
v1.OnStart():andThen(function() --[[ Line: 7 ]]
    -- upvalues: v2 (ref), v1 (copy), v3 (ref)
    v2 = v1.GetService("InventoryService");
    v3 = v1.GetService("RewardService");
end);
return function(_, v5, v6, v7) --[[ Line: 12 ]]
    -- upvalues: v3 (ref)
    v3:Reward(v5, {
        type = "Inventory", 
        name = v6, 
        amount = v7
    });
    return (("Gave x%* %* to %*"):format(v7, v6, v5));
end;