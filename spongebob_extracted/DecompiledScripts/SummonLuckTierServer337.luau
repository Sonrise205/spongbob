local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = #require(l_ReplicatedStorage_0.Shared.Data.Variables).SUMMONING.PROGRESSIVE_LUCK_BOOSTS;
local v3 = nil;
local v4 = nil;
v1.OnStart():andThen(function() --[[ Line: 10 ]]
    -- upvalues: v3 (ref), v1 (copy), v4 (ref)
    v3 = v1.GetService("GameService");
    v4 = v1.GetService("DataService");
end);
return function(_, v6, v7) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v4 (ref)
    if v7 < 1 or v2 < v7 or v7 % 1 > 0 then
        return "Invalid tier number";
    elseif not v4:Set(v6, "ProgressiveSummonLuck", v7):await() then
        return "Failed to set summon luck tier";
    else
        return "Set your summon luck tier to " .. v7;
    end;
end;