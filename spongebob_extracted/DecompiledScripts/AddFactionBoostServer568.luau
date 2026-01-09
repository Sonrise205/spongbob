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
return function(_, v6, v7) --[[ Line: 14 ]]
    -- upvalues: v4 (ref)
    v7 = tonumber(v7) or 0;
    local v8 = 0;
    if v6 == "Goofy Goobers" then
        v8 = 1;
    elseif v6 == "Jellyspotters" then
        v8 = 2;
    elseif v6 == "Band Geeks" then
        v8 = 3;
    end;
    if not v8 or v8 == 0 then
        return (("Failed to find faction: %*"):format(v6));
    else
        local v9 = math.round(v7 * 3600);
        if not v4:AddGlobalBoostTime(v8, v9, nil, true) then
            return (("Failed to give %* a %* hour(s) boost. Please try again."):format(v6, v7));
        else
            return (("Successfully gave a %* hour(s) Faction Boost to %*!"):format(v7, v6));
        end;
    end;
end;