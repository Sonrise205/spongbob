local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = nil;
v1.OnStart():andThen(function() --[[ Line: 7 ]]
    -- upvalues: v3 (ref), v1 (copy)
    v3 = v1.GetService("GlobalEventService");
end);
return function(_, v5, v6, v7) --[[ Line: 11 ]]
    -- upvalues: v3 (ref)
    v7 = v7 or 1;
    if v5 == "Start" then
        v3:StartEvent("ChallengeTokens", v7 * 60, {
            Multiplier = v6
        });
        return;
    elseif v5 == "Stop" then
        v3:StopEvent("ChallengeTokens");
        return;
    elseif v5 == "Increment" then
        v3:IncrementEvent("ChallengeTokens", v7 * 60);
        return;
    else
        if v5 == "ChangeMultiplier" then
            v3:ChangeMultiplier("ChallengeTokens", v6);
        end;
        return;
    end;
end;