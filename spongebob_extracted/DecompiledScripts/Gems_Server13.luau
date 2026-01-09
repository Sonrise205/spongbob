local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("HttpService");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = require(l_ReplicatedStorage_0.Packages.BaseObject);
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = setmetatable({}, v3);
v5.ClassName = "GoldLuck_Server";
v5.__index = v5;
v5.TimedEvents = {};
v5.new = function(v6) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v5 (copy)
    local v7 = setmetatable(v3.new(), v5);
    v7.Name = v6.Name;
    v7.StartTime = v6.StartTime;
    v7.Duration = v6.Duration;
    v7.Scope = v6.Scope;
    v7.WorldAssets = v6.WorldAssets;
    v7.WorldContainer = v6.WorldContainer;
    v7.Multiplier = v6.ExtraData and v6.ExtraData.Multiplier or 2;
    v7.TimedEventsCache = {};
    return v7;
end;
v5.Init = function(_) --[[ Line: 39 ]] --[[ Name: Init ]]

end;
v5.Start = function(v9) --[[ Line: 42 ]] --[[ Name: Start ]]
    -- upvalues: v4 (copy)
    v4.GetService("BoostsService"):AddAdminBoost("Gems", v9.Multiplier, v9.StartTime, v9.Duration);
end;
v5.Increment = function(v10) --[[ Line: 47 ]] --[[ Name: Increment ]]
    -- upvalues: v4 (copy)
    v4.GetService("BoostsService"):AddAdminBoost("Gems", v10.Multiplier, v10.StartTime, v10.Duration);
end;
v5.ChangeMultiplier = function(v11) --[[ Line: 52 ]] --[[ Name: ChangeMultiplier ]]
    -- upvalues: v4 (copy)
    v4.GetService("BoostsService"):OverrideMultiplier("Gems", v11.Multiplier);
end;
v5.Stop = function(_) --[[ Line: 58 ]] --[[ Name: Stop ]]
    -- upvalues: v4 (copy)
    v4.GetService("BoostsService"):StopAdminBoost("Gems");
end;
v5.Destroy = function(v13) --[[ Line: 63 ]] --[[ Name: Destroy ]]
    -- upvalues: v3 (copy)
    v3.Destroy(v13);
end;
return v5;