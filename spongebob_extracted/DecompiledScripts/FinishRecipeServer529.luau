local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Shared.Data.CraftingData);
local v3 = nil;
v1.OnStart():andThen(function() --[[ Line: 8 ]]
    -- upvalues: v3 (ref), v1 (copy)
    v3 = v1.GetService("CraftingService");
end);
return function(v4, v5) --[[ Line: 12 ]]
    -- upvalues: v3 (ref)
    v5 = v5 and math.round(v5);
    if v5 < 1 or v5 > 4 then
        return "Slot index must range from 1-4 (4 being all slots)";
    else
        local v6 = {
            v5
        };
        if v5 == 4 then
            v6 = {
                1, 
                2, 
                3
            };
        end;
        local l_Executor_0 = v4.Executor;
        if not v3:InstantFinish(l_Executor_0, v6):await() then
            return "Failed";
        else
            return "Success";
        end;
    end;
end;