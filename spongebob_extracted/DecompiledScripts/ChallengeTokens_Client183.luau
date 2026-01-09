local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Packages.BaseObject);
local v3 = setmetatable({}, v2);
v3.ClassName = "GoldLuck_Client";
v3.__index = v3;
v3.TimedEvents = {};
v3.new = function(v4) --[[ Line: 30 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v5 = setmetatable(v2.new(), v3);
    v5.Name = v4.Name;
    v5.StartTime = v4.StartTime;
    v5.Duration = v4.Duration;
    v5.Scope = v4.Scope;
    v5.WorldAssets = v4.WorldAssets;
    v5.WorldContainer = v4.WorldContainer;
    v5.TimedEventsCache = {};
    return v5;
end;
v3.Init = function(_) --[[ Line: 44 ]] --[[ Name: Init ]]

end;
v3.Start = function(_) --[[ Line: 47 ]] --[[ Name: Start ]]

end;
v3.Stop = function(_) --[[ Line: 52 ]] --[[ Name: Stop ]]

end;
v3.Destroy = function(v9) --[[ Line: 56 ]] --[[ Name: Destroy ]]
    -- upvalues: v2 (copy)
    v2.Destroy(v9);
end;
return v3;