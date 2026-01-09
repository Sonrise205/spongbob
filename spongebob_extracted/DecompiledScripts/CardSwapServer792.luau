local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
v1.OnStart():andThen(function() --[[ Line: 6 ]]
    -- upvalues: v2 (ref), v1 (copy)
    v2 = v1.GetService("GameService");
end);
return function() --[[ Line: 10 ]]
    -- upvalues: v2 (ref)
    local l_accumulatedWave_0 = v2.accumulatedWave;
    v2:SetWave(math.ceil((l_accumulatedWave_0 + 1) / 15) * 15);
    return "Success";
end;