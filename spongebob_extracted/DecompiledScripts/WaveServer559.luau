local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
v1.OnStart():andThen(function() --[[ Line: 6 ]]
    -- upvalues: v2 (ref), v1 (copy)
    v2 = v1.GetService("GameService");
end);
return function(_, v4) --[[ Line: 10 ]]
    -- upvalues: v2 (ref)
    if not v2:SetWave(v4, false, true) then
        return "Unable to set wave - game is not running";
    else
        return "Set wave to " .. v4;
    end;
end;