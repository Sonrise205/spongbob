local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
v1.OnStart():andThen(function() --[[ Line: 6 ]]
    -- upvalues: v2 (ref), v1 (copy)
    v2 = v1.GetService("RewardService");
end);
return function(_, v4, v5, v6) --[[ Line: 10 ]]
    -- upvalues: v2 (ref)
    local v7 = {
        {
            type = "Inventory", 
            name = v5, 
            amount = v6
        }
    };
    v2:Reward(v4, v7, "DevCommand");
    return (("Gave x%* %*'s to %*"):format(v6, v5, v4));
end;