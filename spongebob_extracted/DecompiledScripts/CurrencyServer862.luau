local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
local v3 = nil;
local v4 = nil;
v1.OnStart():andThen(function() --[[ Line: 8 ]]
    -- upvalues: v2 (ref), v1 (copy), v3 (ref), v4 (ref)
    v2 = v1.GetService("CurrencyService");
    v3 = v1.GetService("GameService");
    v4 = v1.GetService("FactionService");
end);
return function(_, v6, v7, v8) --[[ Line: 14 ]]
    -- upvalues: v3 (ref), v4 (ref), v2 (ref)
    v8 = tonumber(v8) or 0;
    local _ = false;
    if not if string.lower(v7) == "gold" then v3:IncrementGold(v6, v8, true) or false else if string.lower(v7) == "factionpoint" then v4:AddPoints(v6, v8):await() else v2:Increment(v6, v7, v8):await() then
        return (("Failed to give %* %* to %*!"):format(v8, v7, v6.Name));
    else
        return (("Gave %* %* to %*"):format(v8, v7, v6.Name));
    end;
end;